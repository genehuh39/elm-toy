module Main exposing (..)

import Commands exposing (fetchCollectibles)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)
import Navigation exposing (Location)
import Routing


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchCollectibles )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
