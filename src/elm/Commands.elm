module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (CollectibleId, Collectible)
import RemoteData


fetchCollectibles : Cmd Msg
fetchCollectibles =
    Http.get fetchCollectiblesUrl collectiblesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchCollectibles


fetchCollectiblesUrl : String
fetchCollectiblesUrl =
    "http://localhost:4000/collectibles"


collectiblesDecoder : Decode.Decoder (List Collectible)
collectiblesDecoder =
    Decode.list collectibleDecoder


collectibleDecoder : Decode.Decoder Collectible
collectibleDecoder =
    decode Collectible
        |> required "id" Decode.string
        |> required "manufacturer" Decode.string
        |> required "series" Decode.string
        |> required "name" Decode.string
        |> required "description" Decode.string
        |> required "listPrice" Decode.float
