module Model exposing (..)


type Resource
    = Recipe
    | Ingredient


toResource : String -> Maybe Resource
toResource r =
    case r of
        "Recipe" -> Just Recipe
        "Ingredient" -> Just Ingredient
        _ -> Nothing


type alias Model =
    { resourceId : Int
    , resourceName : String
    , resourceType : Resource
    }
