module View exposing (view)


import Html exposing (Html)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Input as Input

import Style exposing (..)
import Style.Color as Color
import Color exposing (..)
import Style.Font as Font


import Model exposing (..)
import Msgs exposing (..)


type MyStyles
    = Title
    | Select
    | Red
    | Green
    | Basic
    | None


stylesheet : Style.StyleSheet MyStyles variation
stylesheet =
    Style.styleSheet
        [ style None
              []
        , style Title
              [ Color.background blue
              , Color.text white
              , Font.size 60
              ]
        , style Basic
              [ Color.background grey
              , Color.text black
              , Font.size 25
              , Font.italic
              ]
        , style Red
              [ Color.background red
              , Color.text black
              ]
        , style Green
              [ Color.background green
              , Color.text blue
              ]
        , style Select
              [ 
              ]
        ]


-- resourceOption : Resource -> Html Msg
-- resourceOption resource =
--     option [value <| toString resource] [text <| toString resource]

resourceDropDown model =
    Input.select Select []
        { label = Input.labelAbove <| text "Resource"
        , with = model.selection
        , max = 5
        , options = []
        , menu =
            Input.menu None
                []
                (List.map (\r -> Input.choice r (text (toString r))) [Recipe, Ingredient])
        }


view : Model Msg -> Html Msg
view model =
    Element.viewport stylesheet <|
        column None []
            [ row Title [center, padding 30]
                  [ text "Pantry"
                  ],
              row Basic [center]
                  [ column None [center, width (percent 50), padding 15]
                      [ text "Current Resource: "
                      , text (toString (Input.selected model.selection))
                      ]
                  , column None [center, width (percent 50), padding 15]
                      [ Input.text None []
                            { onChange = SetId
                            , value = ""
                            , label = Input.labelLeft (text "Resource ID ")
                            , options = []
                            }
                      ]
                  ],
              row None [ center, width (percent 25) ]
                  [ resourceDropDown model
                  ]
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

