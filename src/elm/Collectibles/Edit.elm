module Collectibles.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Collectible)
import Msgs exposing (Msg)
import Routing exposing (collectiblesPath)
import Html.Events exposing (onInput)


view : Collectible -> Html.Html Msg
view model =
    div []
        [ text "Form"
        , form model
        ]


form : Collectible -> Html.Html Msg
form collectible =
    div []
        [ div [] [ label [] [ text " Manufacturer " ], input [ type_ "text", placeholder "manufacturer", value collectible.manufacturer ] [] ]
        , div [] [ label [] [ text " Series " ], input [ type_ "text", placeholder "series", value collectible.series ] [] ]
        , div [] [ label [] [ text " Name " ], input [ type_ "text", placeholder "name", value collectible.name ] [] ]
        , div [] [ label [] [ text "List Price $" ], input [ type_ "text", placeholder "list price", value (toString collectible.listPrice) ] [] ]
        ]
