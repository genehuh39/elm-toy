module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, CollectibleId)
import Models exposing (Model)
import Msgs exposing (Msg)
import Collectibles.List
import RemoteData


page : Model -> Html Msg
page model =
    case model.route of
        Models.CollectiblesRoute ->
            Collectibles.List.view model.collectibles

        Models.NotFoundRoute ->
            notFoundView


view : Model -> Html Msg
view model =
    div []
        [ page model ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
