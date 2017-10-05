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
    div [ class "pa4 black-80" ]
        [ div [ class "mt3" ] [ label [ class "db fw6 lh-copy f6" ] [ text " Manufacturer " ], input [ type_ "text", placeholder "manufacturer", value collectible.manufacturer, class "pa2 input-reset ba bg-transparent hover-bg-black hover-white w-100" ] [] ]
        , div [ class "mt3" ] [ label [ class "db fw6 lh-copy f6" ] [ text " Series " ], input [ type_ "text", placeholder "series", value collectible.series, class "pa2 input-reset ba bg-transparent hover-bg-black hover-white w-100" ] [] ]
        , div [ class "mt3" ] [ label [ class "db fw6 lh-copy f6" ] [ text " Name " ], input [ type_ "text", placeholder "name", value collectible.name, class "pa2 input-reset ba bg-transparent hover-bg-black hover-white w-100" ] [] ]
        , div [ class "mt3" ] [ label [ class "db fw6 lh-copy f6" ] [ text "List Price $" ], input [ type_ "text", placeholder "list price", value (toString collectible.listPrice), class "pa2 input-reset ba bg-transparent hover-bg-black hover-white w-100" ] [] ]
        ]
