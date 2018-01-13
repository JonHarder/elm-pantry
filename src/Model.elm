module Model exposing (..)


import Element.Input as Input


type Resource
    = Recipe
    | Ingredient


toResource : String -> Maybe Resource
toResource r =
    case r of
        "Recipe" -> Just Recipe
        "Ingredient" -> Just Ingredient
        _ -> Nothing


type alias Model msg =
    { resourceId : Int
    , resourceName : String
    , resourceType : Resource
    , selection : Input.SelectWith Resource msg
    }
