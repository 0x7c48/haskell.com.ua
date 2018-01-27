module Types exposing (..)

import Navigation exposing (Location)


type Msg
    = NewUrl String
    | OnLocationChange Location
    | SendToJs String


type Route
    = Home
    | About
    | PostShow String
    | NotFound


initialModel : Route -> Model
initialModel route =
    { route = route
    }


type alias Model =
    { route : Route
    }
