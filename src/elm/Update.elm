module Update exposing (..)

import Msgs exposing (Msg)


-- Temp code


type alias Model =
    { name : String
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.UpdateRecord ->
            ( { model | name = "test" }, Cmd.none )
