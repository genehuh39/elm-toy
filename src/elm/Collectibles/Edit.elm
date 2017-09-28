module Collectibles.Edit exposing (..)

import Html exposing (..)
import Models exposing (Collectible)
import Msgs exposing (Msg)
import Routing exposing (collectiblesPath)


view : Collectible -> Html.Html Msg
view model =
    div []
        [ text "Form" ]


form : Collectible -> Html.Html Msg
form collectible =
    div []
        [ h1 [] [ text collectible.manufacturer ] ]
