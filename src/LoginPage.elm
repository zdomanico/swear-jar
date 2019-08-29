module LoginPage exposing (..)

import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


loginBody model =
    [ div []
        [ input [ type_ "text", placeholder "Username" ] [] ]
    , div [] [ input [ type_ "password", placeholder "Password" ] [] ]
    , button [] [ text "Login" ]
    ]
