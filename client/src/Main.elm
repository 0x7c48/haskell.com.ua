module Main exposing (..)

import Navigation
import Types
import Route
import Update
import View


main =
    Navigation.program Types.OnLocationChange
        { init = Update.init
        , update = Update.update
        , subscriptions = Update.subscriptions
        , view = View.view
        }
