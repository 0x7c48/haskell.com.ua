module Update exposing (..)

import Debug
import Navigation exposing (Location)
import Types exposing (Model, Msg)
import Route exposing (parseLocation)
import Ports exposing (setTitle, updateAnalytics)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        ( Types.initialModel currentRoute, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Types.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        Types.NewUrl url ->
            ( model, Cmd.batch [Navigation.newUrl url, updateAnalytics url] )

        Types.SendToJs title ->
            (model, setTitle title)
