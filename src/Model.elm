module Model exposing (..)


type Resource
    = Recipe
    | Ingredient


type alias Model =
    { recipeId : Int
    , recipeName : String
    }
