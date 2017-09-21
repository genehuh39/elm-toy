module View exposing (..)

import Html exposing (Html, div, h1, text)
import Models exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Collectible Database" ]
        ]
