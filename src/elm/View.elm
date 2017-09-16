module View exposing (..)

import Html exposing (Html, div, h1, text)
import Msgs exposing (Msg)


--Temp code


type alias Model =
    { name : String
    }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Collectible Database" ]
        ]
