module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import GroupPage
import Html exposing (Html, button, div, node, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List exposing (concat)
import LoginPage
import Messages exposing (..)
import Types exposing (Group, User, rootUser)
import Url exposing (Url)


type alias Msg =
    {}


main : Program () Model Message
main =
    Browser.application { init = init, onUrlChange = urlChange, onUrlRequest = urlRequested, subscriptions = subscriptions, update = update, view = view }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Message )
init flags url key =
    ( Model Nothing Nothing "" "" False, Cmd.none )


urlChange url =
    Messages.DoNothing


urlRequested request =
    Messages.DoNothing


type alias Model =
    { user : Maybe User
    , group : Maybe Group
    , username : String
    , password : String
    , failedLogin : Bool
    }


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        AddMoneyModal ->
            ( model, Cmd.none )

        RequestMoneyModal ->
            ( model, Cmd.none )

        DoNothing ->
            ( model, Cmd.none )

        Login ->
            ( { model | user = Just rootUser, group = Just GroupPage.exGroup }, Cmd.none )

        FailedLogin ->
            ( { model | failedLogin = True }, Cmd.none )

        UpdateUsernameField a ->
            ( { model | username = a }, Cmd.none )

        UpdatePasswordField a ->
            ( { model | password = a }, Cmd.none )


view : Model -> Browser.Document Message
view model =
    { title = "Swearjar"
    , body =
        concat
            [ LoginPage.loginBody model
            , [ div [ style "height" "100px" ] [] ]
            , GroupPage.groupBody model
            ]
    }


onUrlChange url =
    0


onUrlRequest request =
    0


subscriptions _ =
    Sub.none
