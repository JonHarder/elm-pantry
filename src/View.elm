module View exposing (view)


import Html exposing (Html, button, input, option, text, div, select)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)


import Model exposing (..)
import Msgs exposing (..)


resourceOption : Resource -> Html Msg
resourceOption resource =
    option [value <| toString resource] [text <| toString resource]


view : Model -> Html Msg
view model =
    div [] [
         div [] [
              select [ onInput SetResource ] (List.map resourceOption [Recipe, Ingredient])
             ],
         div [] [
              text <| toString model.resourceType ++ " id: " ++ toString model.resourceId
             ],
         div [] [
              text <| toString model.resourceType ++ ": " ++ model.resourceName
             ],
         div [] [
              input [ placeholder "id", onInput SetId ] []
             , button [ onClick (GetResource model.resourceType) ]
                  [ text <| "Get " ++ toString model.resourceType ] 
             ]
        ]

