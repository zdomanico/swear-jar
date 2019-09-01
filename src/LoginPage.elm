module LoginPage exposing (..)

import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import String exposing (String)
import Types exposing (User)


loginBody model =
    case model.user of
        Nothing ->
            [ div [ class "login-page-container" ]
                [ div []
                    [ input [ type_ "text", value model.username, placeholder "Username", onInput UpdateUsernameField ] [] ]
                , div [] [ input [ type_ "password", value model.password, placeholder "Password", onInput UpdatePasswordField ] [] ]
                , button [ onClick (validate model.username model.password) ] [ text "Login" ]
                ]
            ]

        Just user ->
            []


validate : String -> String -> Message
validate username password =
    if (username == "root") && (password == "password") then
        Login

    else
        FailedLogin
