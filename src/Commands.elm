module Commands exposing (getResource)


import Http
import Json.Decode exposing (Decoder, field, list, string)

import Msgs exposing (Msg(GotResource))
import Model exposing (..)


api : String
api = "http://localhost:4000/"


requestBuilder : Resource -> Int -> String
requestBuilder resource id =
    let r = case resource of
                Recipe -> "recipes"
                Ingredient -> "ingredients"
    in api ++ r ++ "/" ++ toString id


getResource : Resource -> Int -> Cmd Msg
getResource resource id =
    let request = Http.get (requestBuilder resource id) recipe
    in Http.send GotResource request


recipe : Decoder String
recipe = field "name" string
