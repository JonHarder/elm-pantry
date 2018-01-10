module Model exposing (..)


type Resource
    = Recipe
    | Ingredient


type alias Model =
    { resourceId : Int
    , resourceName : String
    , resourceType : Resource
    }
