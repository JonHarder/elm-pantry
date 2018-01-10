module Main exposing (..)


-- System libraries
import Html exposing (Html, button, div, input, program, sub, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

-- User libraries
import Commands
import Model exposing (..)
import Msgs exposing (Msg, Msg(..))


-----------------------------------------
init : (Model, Cmd Msg)
init = let model = Model 1 ""
       in (model, Commands.getResource Recipe model.recipeId)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SetId idStr ->
            case String.toInt idStr of
                Ok id ->
                    ({model | recipeId = id}, Cmd.none)
                Err _ ->
                    (model, Cmd.none)

        GetResource resource ->
            (model, Commands.getResource resource model.recipeId)

        GotResource (Ok name) ->
            ({model | recipeName = name}, Cmd.none)

        GotResource (Err _) ->
            (model, Cmd.none)


view : Model -> Html Msg
view model =
    div [] [
         div [] [
              text <| "Recipe id: " ++ toString model.recipeId
             ],
         div [] [
              text <| "Recipe: " ++ model.recipeName
             ],
         div [] [
              input [ placeholder "id", onInput SetId ] []
             , button [ onClick (GetResource Recipe) ]
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
