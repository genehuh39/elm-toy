module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { collectibles : WebData (List Collectible)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { collectibles = RemoteData.Loading
    , route = route
    }


type alias CollectibleId =
    String


type alias Collectible =
    { id : CollectibleId
    , manufacturer : String
    , series : String
    , name : String
    , description : String
    , listPrice : Float
    }


type Route
    = CollectiblesRoute
    | CollectibleRoute CollectibleId
    | NotFoundRoute
