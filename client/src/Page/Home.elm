module Page.Home exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Json.Encode exposing (string)
import Types exposing (Model, Msg(NewUrl))


render =
    div []
        [ section
            [ class "hero is-link is-medium is-bold"
            , attribute "style" "background-color:#574e92;background-image:url(background-size:100%;width:100%;height:100%;left:0px;"
            ]
            [ div [ class "hero-body" ]
                [ div [ class "container is-mobile" ]
                    [ div [ class "columns" ]
                        [ div [ class "column is-12" ]
                            [ p [ class "title has-text-centered" ]
                                [ text "Haskell group in Ukraine, Kyiv and around the world." ]
                            , br [] []
                            , p [ class "subtitle has-text-centered" ]
                                [ text "Ukraine Haskellers interact, talk and collaborate."
                                , text "We are building community, place to learn, to teach, to ask questions, and to find contributors and collaborators."
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , br [] []
        , section [ class "hero is-light" ]
            [ div [ class "hero-body" ]
                [ div [ class "container" ]
                    [ h2 [ class "subtitle" ]
                        [ text "If you have any suggestions or ideas, please contact us." ]
                    , a [ class "bd-envelope-button button is-medium has-addons is-right", href "/instagram", target "_blank" ]
                        [ span [ class "icon" ]
                            [ i [ class "fa fa-envelope" ]
                                []
                            ]
                        , a [ href "mailto:systemdef.com@gmail.com?subject=haskell.com.ua" ]
                            [ text "Send email" ]
                        ]
                    ]
                ]
            ]
        , section [ class "section" ]
            [ div [ class "container is-mobile" ]
                [ div [ class "columns is-multiline is-centered" ]
                    [ div [ class "column is-half" ]
                        [ div [ class "card box" ]
                            [ div [ class "card-image" ]
                                [ figure [ class "image is-64x64" ]
                                    [ img [ alt "Placeholder image", src "https://wiki.haskell.org/wikistatic/haskellwiki_logo.png" ]
                                        []
                                    ]
                                ]
                            , div [ class "card-content" ]
                                [ div [ class "media" ]
                                    [ div [ class "media-content" ]
                                        [ p [ class "title is-4" ]
                                            [ text "Haskell" ]
                                        ]
                                    ]
                                , div [ class "content" ]
                                    [ text " is a computer programming language. In particular, it is a polymorphically statically typed, lazy, purely functional language, quite different from most other programming languages. The language is named for Haskell Brooks Curry, whose work in mathematical logic serves as a foundation for functional languages. Haskell is based on the lambda calculus, hence the lambda we use as a logo."
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "column is-half" ]
                        [ div [ class "card box" ]
                            [ div [ class "card-image" ]
                                [ figure [ class "image is-64x64" ]
                                    [ img [ alt "Placeholder image", src "https://wiki.haskell.org/wikistatic/haskellwiki_logo.png" ]
                                        []
                                    ]
                                ]
                            , div [ class "card-content" ]
                                [ div [ class "media" ]
                                    [ div [ class "media-content" ]
                                        [ p [ class "title is-4" ]
                                            [ text "Haskell" ]
                                        ]
                                    ]
                                , div [ class "content" ]
                                    [ text "is an advanced purely-functional programming language. An open-source product of more than twenty years of cutting-edge research, it allows rapid development of robust, concise, correct software. With strong support for integration with other languages, built-in concurrency and parallelism, debuggers, profilers, rich libraries and an active community, Haskell makes it easier to produce flexible, maintainable, high-quality software."
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , section [ class "section" ]
            [ div [ class "content is-mobile is-large" ]
                [ h1 [] [ text "Posts" ]
                , hr [] []
                , postTitle "Halive - hot code loading"
                ]
            ]
        , br [] []
        , br [] []
        , br [] []
        , br [] []
        , hr [] []
        ]


postTitle : String -> Html Msg
postTitle title =
    a
        [ class "navbar-item"
        , onClick
            (NewUrl <|
                String.append "/post/" <|
                    String.join "-" <|
                        List.filter (\s -> s /= "" && s /= "-") <|
                            String.split " " title
            )
        , onClick <| Types.SendToJs title
        ]
        [ img
            [ alt "Haskell halive - hot code loading"
            , attribute "height" "28"
            , src "https://www.haskell.org/static/img/haskell-logo.svg"
            ]
            []
        , span [ property "innerHTML" ("&nbsp;" |> String.repeat 3 |> string) ]
            [ text <| ">>= " ++ title ++ "" ++ " >>= Read it" ]
        ]
