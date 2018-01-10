module Main exposing (..)


-- System libraries
import Html exposing (Html, button, div, input, program, option, select, sub, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

-- User libraries
import Commands
import Model exposing (..)
import Msgs exposing (Msg, Msg(..))


-----------------------------------------
init : (Model, Cmd Msg)
init = let model = { resourceId = 1
                   , resourceName = ""
                   , resourceType = Recipe
                   }
       in (model, Commands.getResource model.resourceType model.resourceId)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SetId idStr ->
            case String.toInt idStr of
                Ok id ->
                    ({model | resourceId = id}, Cmd.none)
                Err _ ->
                    (model, Cmd.none)

        SetResource resource ->
            case resource of
                "recipe" ->
                    ({model | resourceType = Recipe}, Cmd.none)
                "ingredient" ->
                    ({model | resourceType = Ingredient}, Cmd.none)
                _ ->
                    (model, Cmd.none)

        GetResource resource ->
            (model, Commands.getResource resource model.resourceId)

        GotResource (Ok name) ->
            ({model | resourceName = name}, Cmd.none)

        GotResource (Err _) ->
            (model, Cmd.none)


resourceOption : Resource -> Html Msg
resourceOption resource =
    case resource of
        Recipe -> option [value "recipe"] [text "Recipe"]
        Ingredient -> option [value "ingredient"] [text "Ingredient"]


view : Model -> Html Msg
view model =
    div [] [
         div [] [
              select [ onInput SetResource ] (List.map resourceOption [Recipe, Ingredient])
             ],
         div [] [
              text <| "Recipe id: " ++ toString model.resourceId
             ],
         div [] [
              text <| "Recipe: " ++ model.resourceName
             ],
         div [] [
              input [ placeholder "id", onInput SetId ] []
             , button [ onClick (GetResource model.resourceType) ]
                  [ text "Get Recipe" ]
             ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


main : Program Never Model Msg
main = program {
         init = init
       , update = update
       , view = view
       , subscriptions = subscriptions
       }
