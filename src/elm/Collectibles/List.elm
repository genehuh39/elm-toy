module Collectibles.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Models exposing (Collectible)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)
import Routing exposing (collectiblePath)


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
        [ table [ class "collapse ba br2 b--black-10 fl w-100 pa2" ]
            [ thead []
                [ tr [ class "striped--light-gray" ]
                    [ th [] [ text "Id" ]
                    , th [] [ text "Manufacturer" ]
                    , th [] [ text "Series" ]
                    , th [] [ text "Name" ]
                    , th [] []
                    ]
                ]
            , tbody [] (List.map collectibleRow collectibles)
            ]
        ]


collectibleRow : Collectible -> Html Msg
collectibleRow collectible =
    tr [ class "striped--light-gray" ]
        [ td [ class "pv2 ph3" ] [ text collectible.id ]
        , td [ class "pv2 ph3" ] [ text collectible.manufacturer ]
        , td [ class "pv2 ph3" ] [ text collectible.series ]
        , td [ class "pv2 ph3" ] [ text collectible.name ]
        , td [ class "pv2 ph3" ] [ editBtn collectible ]
        ]


editBtn : Collectible -> Html.Html Msg
editBtn collectible =
    let
        path =
            collectiblePath collectible.id
    in
        a
            [ class "btn regular"
            , href path
            ]
            [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]
