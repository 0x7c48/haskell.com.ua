module Common.Footer exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(NewUrl))


render : Model -> Html Msg
render model =
    div []
        [ section [ class "hero is-dark", id "newsletter" ]
            [ div [ class "hero-body" ]
                [ div [ class "container" ]
                    [ div [ class "columns is-vcentered" ]
                        [ div [ class "column has-text-centered" ]
                            [ p [ class "subtitle" ]
                                [ text "© 2017-2018 haskell.com.ua" ]
                            , a [ href "http://elm-lang.org/" ]
                                [ text "Front end built with elm" ]
                            ]
                        ]
                    ]
                ]
            ]
        , br [] []
        ]
