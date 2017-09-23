module Collectibles.List exposing (..)

import Html exposing (..)
import Models exposing (Collectible)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


view : WebData (List Collectible) -> Html Msg
view response =
    div []
        [ maybeList response
        ]


maybeList : WebData (List Collectible) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success collectibles ->
            list collectibles

        RemoteData.Failure error ->
            text (toString error)


list : List Collectible -> Html Msg
list collectibles =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Manufacturer" ]
                    , th [] [ text "Series" ]
                    , th [] [ text "Name" ]
                    ]
                ]
            , tbody [] (List.map collectibleRow collectibles)
            ]
        ]


collectibleRow : Collectible -> Html Msg
collectibleRow collectible =
    tr []
        [ td [] [ text collectible.id ]
        , td [] [ text collectible.manufacturer ]
        , td [] [ text collectible.series ]
        , td [] [ text collectible.name ]
        ]
