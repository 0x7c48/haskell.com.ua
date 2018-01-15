module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(NewUrl), Route)
import Page.Home as Home
import Page.Menu as Menu
import Page.Footer as Footer


-- onClick (NewUrl "/contact")


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

                Types.PostShow postid ->
                    text ("Render the post with id: " ++ toString postid)

                Types.NotFound ->
                    text ("NotFound")
    in
        div [] [ content ]
