module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (CollectibleId, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map CollectiblesRoute top

        --, map CollectibleRoute (s "collectible" </> string)
        , map CollectiblesRoute (s "collectibles")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


collectiblesPath : String
collectiblesPath =
    "#collectibles"


collectiblePath : CollectibleId -> String
collectiblePath id =
    "#collectibles/" ++ id
