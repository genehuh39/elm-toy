module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
    { items : WebData (List Collectible)
    , route : Route
    }

initialModel : Route -> Model
initialModel route =
    { items = RemoteData.Loading
    , route = route
    }

type alias CollectibleId =
    String

type alias Collectible =
    { id : CollectibleId
    , name : String
    , description: String
    , listPrice: Int
    }

type Route
    = CollectiblesRoute
    | CollectibleRoute CollectibleId
    | NotFoundRoute