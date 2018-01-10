module Model exposing (..)


type Resource
    = Recipe
    | Ingredient


type alias Model =
    { recipe : String
    }
