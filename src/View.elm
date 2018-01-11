module View exposing (view)


import Html exposing (Html)

import Element exposing (..)
import Element.Attributes exposing (..)

import Style exposing (..)
import Style.Color as Color
import Color exposing (..)


import Model exposing (..)
import Msgs exposing (..)


type MyStyles
    = Title


stylesheet =
    Style.styleSheet
        [ style Title
              [ Color.background blue
              , Color.text white
              ]
        ]


-- resourceOption : Resource -> Html Msg
-- resourceOption resource =
--     option [value <| toString resource] [text <| toString resource]


view : Model -> Html Msg
view model =
    Element.layout stylesheet <|
        row Title [spacing 10, padding 10, fill]
            [ el Title [] (text "hello style")
            , el Title [] (text "foo bar")
            ]
    -- div [] [
    --      div [] [
    --           select [ onInput SetResource ] (List.map resourceOption [Recipe, Ingredient])
    --          ],
    --      div [] [
    --           text <| toString model.resourceType ++ " id: " ++ toString model.resourceId
    --          ],
    --      div [] [
    --           text <| toString model.resourceType ++ ": " ++ model.resourceName
    --          ],
    --      div [] [
    --           input [ placeholder "id", onInput SetId ] []
    --          , button [ onClick (GetResource model.resourceType) ]
    --               [ text <| "Get " ++ toString model.resourceType ] 
    --          ]
    --     ]

