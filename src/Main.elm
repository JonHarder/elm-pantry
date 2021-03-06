module Main exposing (..)


-- System libraries
import Html exposing (Html, button, div, input, program, option, select, sub, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

-- User libraries
import Commands
import Model exposing (..)
import Msgs exposing (Msg, Msg(..))
import View exposing (view)
import Update exposing (update)


-----------------------------------------
init : (Model, Cmd Msg)
init = let model = { resourceId = 1
                   , resourceName = ""
                   , resourceType = Recipe
                   }
       in (model, Commands.getResource model.resourceType model.resourceId)



subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


main : Program Never Model Msg
main = program {
         init = init
       , update = update
       , view = view
       , subscriptions = subscriptions
       }
