module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Types exposing (Model, Msg(NewUrl), Route)
import Common.Menu as Menu
import Common.Footer as Footer
import Page.Home as Home
import Page.Halive as Halive


{-| Main view, render all html
-}
view : Model -> Html Msg
view model =
    section []
        [ div [ class "container is-fluid" ]
            [ Menu.render model
            , page model
            , Footer.render model
            ]
        ]


page : Model -> Html Msg
page model =
    let
        content =
            case model.route of
                Types.Home ->
                    Home.render

                Types.About ->
                    text "about"

                Types.PostShow slug ->
                    Halive.render slug

                Types.NotFound ->
                    text ("NotFound")
    in
        div [] [ content ]
