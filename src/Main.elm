module Main exposing (..)

import Browser
import GroupPage
import Html exposing (Html, button, div, node, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List exposing (concat)
import LoginPage


type alias Model =
    {}


type alias Msg =
    {}


main : Program () Model (Cmd msg)
main =
    Browser.application { init = init, onUrlChange = urlChange, onUrlRequest = urlRequested, subscriptions = subscriptions, update = update, view = view }


init flags url key =
    ( Model, Cmd.none )


urlChange url =
    Cmd.none


urlRequested request =
    Cmd.none


update msg model =
    ( model, Cmd.none )


view model =
    { title = "Swearjar"
    , body =
        concat
            [ style1
            , LoginPage.loginBody model
            , [ div [ style "height" "100px" ] [] ]
            , GroupPage.groupBody model GroupPage.exGroup
            ]
    }


style1 =
    [ node "link" [ rel "stylesheet", href "styles.css" ] [] ]


onUrlChange url =
    0


onUrlRequest request =
    0


subscriptions _ =
    Sub.none
