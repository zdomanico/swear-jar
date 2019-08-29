module LoginPage exposing (..)

import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (String)
import Types exposing (User)


loginBody model =
    case model.user of
        Nothing ->
            [ div [ class "login-page-container" ]
                [ div []
                    [ input [ type_ "text", placeholder "Username" ] [] ]
                , div [] [ input [ type_ "password", placeholder "Password" ] [] ]
                , button [] [ text "Login" ]
                ]
            ]

        Just user ->
            []
