module Page.Halive exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Json.Encode exposing (string)
import Markdown as Markdown
import Types


render slug =
    section [ class "section" ]
        [ div [ class "content is-medium" ]
            [ h1 []
                [ slug
                    |> String.split "-"
                    |> String.join " "
                    |> text
                ]
            , p []
                [ h2 []
                    [ a [ href "https://github.com/lukexi/halive" ]
                        [ text "Project repo halive" ]
                    ]
                ]
            , p []
                [ text "If you have errors on Mac OS looks like this "
                , code [] [ text "halive: /usr/local/Cellar/ghc/8.2.2/lib/ghc-8.2.2/package.conf.d/package.cache: GHC.PackageDb.readPackageDb: inappropriate type (Not a valid Unicode code point!)" ]
                , text "Do this:"
                , ul []
                    [ li []
                        [ text "Uninstall haskell"
                        , Markdown.toHtml [] markdownStackRm
                        ]
                    , li []
                        [ text "Install halive"
                        , Markdown.toHtml [] markdownStack
                        ]
                    ]
                , img
                    [ alt "Haskell halive - hot code loading"
                    , attribute "height" "28"
                    , src "/client/assets/img/halive.png"
                    ]
                    []
                , h3 [] [ text "elm hot code loading" ]
                , ul []
                    [ li []
                        [ p []
                            [ a [ href "https://github.com/architectcodes/elm-live" ]
                                [ text "elm-live" ]
                            , p []
                                [text "I write something like this in my Makefile"]
                            ]
                        ]
                    , Markdown.toHtml [] markdownMake
                    ]
                ]
            ]
        ]


markdownStackRm =
    """
```bash
rm -rf ~/.stack ~/.ghc ~/.cabal
rm -rf ~/.local/bin/
brew rm cabal-install
brew rm ghc
brew rm haskell-platform
brew rm haskell-stack
brew uninstall --force haskell-stack
brew cask uninstall haskell-platform
```
"""


markdownStack =
    """
```bash
brew install haskell-stack
stack upgrade
stack update
git clone https://github.com/lukexi/halive.git
brew install sdl2
stack unpack halive
cd halive-0.1.3
stack build --test --no-run-tests
halive demo/Main.hs
```
"""


markdownMake =
    """
```make
cd $(FE_ROOT) &&
elm-live $(FE_SRC)/Main.elm
   --output=main.js
   --host=localhost
   --port=8000
   --pushstate```
"""
