module Main exposing (..)

import Models exposing (Model, initialModel)
import Html exposing (..)

type alias Model =
    { name: String
    }

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "Collectible Database"]
        ]

type Msg
    = UpdateRecord String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateRecord newName ->
         ( { model | name = newName }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

main : Program Never Model Msg
main =
    Html.program
        { init = ({ name = "default" }, Cmd.none)
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }