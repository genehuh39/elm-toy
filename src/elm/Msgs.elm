module Msgs exposing (..)

import Http
import Models exposing (Collectible)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchCollectibles (WebData (List Collectible))
    | OnLocationChange Location
