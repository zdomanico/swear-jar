module GroupPage exposing (..)

import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Types exposing (Group, Guid, User)



--groupBody : model -> Group -> List (Html msg)


exGroup =
    { guid = Guid "1234"
    , name = "That's What She Said."
    , users = [ User "jim" (Guid "1"), User "pam" (Guid "2"), User "michael" (Guid "3"), User "dwight" (Guid "4") ]
    , admins = [ User "jim" (Guid "1") ]
    , transactions = []
    , targets = []
    }


list_usernames users =
    "Group Members: " ++ String.join ", " (List.map (\u -> u.username) users)


list_admins admins =
    "Group Admins: " ++ String.join ", " (List.map (\a -> a.username) admins)



--request_transaction model users =


groupBody model group =
    [ div [ class "title", id "group_name" ] [ text ("Group Name: " ++ group.name) ]
    , div [ class "usernames", id "group_members" ] [ text (list_usernames group.users) ]
    , div [ class "usernames", id "group_admins" ] [ text (list_admins group.admins) ]
    , div [] [ input [ type_ "text", placeholder "username" ] [] ]
    , div [] [ input [ type_ "password", placeholder "password" ] [] ]
    , button [] [ text "Login" ]
    ]
