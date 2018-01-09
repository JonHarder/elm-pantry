module Commands exposing (getResource)


import Http
import Json.Decode exposing (Decoder, field, list, string)

import Msgs exposing (Msg(GotResource))


getResource : String -> Cmd Msg
getResource resource =
    let request = Http.get ("http://localhost:4000/" ++ resource ++ "/1")
                  recipe 
    in Http.send GotResource request


recipe : Decoder String
recipe = field "name" string
