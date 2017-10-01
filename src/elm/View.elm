module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, CollectibleId)
import Models exposing (Model)
import Msgs exposing (Msg)
import Collectibles.List
import Collectibles.Edit
import RemoteData


page : Model -> Html Msg
page model =
    case model.route of
        Models.CollectiblesRoute ->
            Collectibles.List.view model.collectibles

        Models.CollectibleRoute id ->
            collectibleEditPage model id

        Models.NotFoundRoute ->
            notFoundView


view : Model -> Html Msg
view model =
    div []
        [ page model ]


collectibleEditPage : Model -> CollectibleId -> Html Msg
collectibleEditPage model collectibleId =
    case model.collectibles of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success collectibles ->
            let
                maybeCollectible =
                    collectibles
                        |> List.filter (\collectible -> collectible.id == collectibleId)
                        |> List.head
            in
                case maybeCollectible of
                    Just collectible ->
                        Collectibles.Edit.view collectible

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Collectible not found"
        ]
