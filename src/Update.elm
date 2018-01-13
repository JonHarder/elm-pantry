module Update exposing (update)

import Commands exposing (getResource)
import Model exposing (..)
import Msgs exposing (..)

import Element.Input as Input

getResourceForModel : Model Msg -> Cmd Msg
getResourceForModel model =
    Commands.getResource model.resourceType model.resourceId


update : Msg -> Model Msg -> (Model Msg, Cmd Msg)
update msg model =
    case msg of
        SetId idStr ->
            let id = Result.withDefault model.resourceId (String.toInt idStr)
            in ({model | resourceId = id}, Cmd.none)

        SetResource resource ->
            ({model | selection = Input.updateSelection resource model.selection }, Cmd.none)

        GetResource resource ->
            (model, Commands.getResource resource model.resourceId)

        GotResource (Ok name) ->
            ({model | resourceName = name}, Cmd.none)

        GotResource (Err _) ->
            (model, Cmd.none)
