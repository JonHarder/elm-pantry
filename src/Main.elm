module Main exposing (..)


-- System libraries
import Html exposing (Html, div, program, sub, text)

-- User libraries
import Commands
import Msgs exposing (Msg, Msg(..))


-- Model
type alias Model =
    { recipe : String
    }


-----------------------------------------
init : (Model, Cmd Msg)
init = (Model "", Commands.getResource "recipes")


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GetResource resource ->
            (model, Commands.getResource resource)

        GotResource (Ok name) ->
            ({model | recipe = name}, Cmd.none)

        GotResource (Err _) ->
            (model, Cmd.none)


view : Model -> Html Msg
view model =
    div [] [
         text <| "Recipe: " ++ model.recipe
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
