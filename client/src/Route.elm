module Route exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (Parser, parsePath, map, oneOf, s, (</>), int)
import Types


matchers : Parser (Types.Route -> a) a
matchers =
    oneOf
        [ map Types.Home (s "")
        , map Types.Home (s "haskell.com.ua")
        , map Types.Home (s "home")
        , map Types.About (s "about")
        , map Types.About (s "tech")
        , map Types.About (s "elm")
--        , map Types.About (s "python")
--        , map Types.About (s "django")
--        , map Types.About (s "clojure")
--        , map Types.About (s "clojurescript")
--        , map Types.About (s "flask")
        , map Types.PostShow (s "post" </> UrlParser.string)
        ]


parseLocation : Location -> Types.Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            Types.NotFound


routeToString : Types.Route -> String
routeToString route =
    case route of
        Types.Home ->
            "home"

        Types.About ->
            "about"

        Types.PostShow slug ->
            "post " ++ toString slug

        Types.NotFound ->
            ""
