module Types exposing (..)

import Navigation exposing (Location)


type Msg
    = NewUrl String
    | OnLocationChange Location


type Route
    = Home
    | About
    | PostShow Int
    | NotFound


initialModel : Route -> Model
initialModel route =
    { route = route
    }


type alias Model =
    { route : Route
    }
