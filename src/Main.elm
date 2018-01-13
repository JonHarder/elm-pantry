module Main exposing (..)


-- System libraries
import Html exposing (program)

import Element.Input as Input

-- User libraries
import Commands
import Model exposing (..)
import Msgs exposing (Msg, Msg(..))
import View exposing (view)
import Update exposing (update)


-----------------------------------------
init : (Model Msg, Cmd Msg)
init = let model = { resourceId = 1
                   , resourceName = ""
                   , resourceType = Recipe
                   , selection = Input.autocomplete Nothing SetResource
                   }
       in (model, Commands.getResource model.resourceType model.resourceId)



subscriptions : Model Msg -> Sub Msg
subscriptions model = Sub.none


main : Program Never (Model Msg) Msg
main = program {
         init = init
       , update = update
       , view = view
       , subscriptions = subscriptions
       }
