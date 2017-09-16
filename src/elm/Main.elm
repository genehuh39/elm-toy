module Main exposing (..)

import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import View exposing (view)
import Html exposing (..)


-- Temp code


type alias Model =
    { name : String
    }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Collectible Database" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.UpdateRecord ->
            ( { model | name = "test" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = ( { name = "default" }, Cmd.none )
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
