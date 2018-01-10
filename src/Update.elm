module Update exposing (update)

import Commands exposing (getResource)
import Model exposing (..)
import Msgs exposing (..)


getResourceForModel : Model -> Cmd Msg
getResourceForModel model =
    Commands.getResource model.resourceType model.resourceId


updateModelWithResource : Model -> String -> Model
updateModelWithResource model resource =
    let resource_ = case toResource resource of
                        Just r -> r
                        Nothing -> model.resourceType
    in {model | resourceType = resource_}


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SetId idStr ->
            let id = Result.withDefault model.resourceId (String.toInt idStr)
            in ({model | resourceId = id}, Cmd.none)

        SetResource resource ->
            let newModel = updateModelWithResource model resource
                command = getResourceForModel newModel
            in (newModel, command)

        GetResource resource ->
            (model, Commands.getResource resource model.resourceId)

        GotResource (Ok name) ->
            ({model | resourceName = name}, Cmd.none)

        GotResource (Err _) ->
            (model, Cmd.none)
