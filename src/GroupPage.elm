module GroupPage exposing (..)

import Html exposing (Html, button, div, input, progress, text)
import Html.Attributes exposing (class, id, style, value)
import Html.Events exposing (onClick)
import List exposing (concat, map, maximum, sum)
import Maybe exposing (withDefault)
import String exposing (fromFloat)
import Time
import Types exposing (Group, Guid, Target, Transaction, User)



--groupBody : model -> Group -> List (Html msg)


exGroup =
    { guid = Guid "1234"
    , name = "That's What She Said."
    , users = [ User "jim" (Guid "1"), User "pam" (Guid "2"), User "michael" (Guid "3"), User "dwight" (Guid "4") ]
    , admins = [ User "jim" (Guid "1") ]
    , transactions =
        [ Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        , Transaction (Guid "1") (User "jim" (Guid "1")) 25 "Put money in thy purse" (Time.millisToPosix 0)
        ]
    , targets = [ Target 10 "small target", Target 100 "big target", Target 50 "medium target" ]
    }


list_usernames users =
    "Group Members: " ++ String.join ", " (List.map (\u -> u.username) users)


list_admins admins =
    "Group Admins: " ++ String.join ", " (List.map (\a -> a.username) admins)



--request_transaction model users =


funds : Group -> Float
funds g =
    sum (map (\x -> x.amount) g.transactions)


maxTarget : Group -> Float
maxTarget g =
    withDefault 0 (maximum (map (\x -> x.amount) g.targets))


targetToDiv : Float -> Target -> Html msg
targetToDiv maxtarget target =
    div [ style "bottom" (String.fromFloat (100 * target.amount / maxtarget) ++ "%"), class "progress-bar-ticks" ] [ text target.description ]


targetDivs : Group -> List (Html msg)
targetDivs g =
    map (targetToDiv (maxTarget g)) g.targets


constructGradient : Float -> String
constructGradient f =
    "linear-gradient(to top,#0000aaff " ++ String.fromFloat f ++ "%, #ffffff00 " ++ String.fromFloat f ++ "%)"


transactionDiv : Transaction -> Html msg
transactionDiv t =
    div [ style "margin" "10px" ]
        [ text (t.user.username ++ " added " ++ String.fromFloat t.amount ++ " to the jar.")
        , div [ style "font-style" "italic" ] [ text t.note ]
        ]


transactionScroll : List Transaction -> Html msg
transactionScroll t =
    div [ class "scroll", style "max-height" "100px" ] (map transactionDiv t)


groupBody model group =
    [ div [ class "title", id "group_name" ] [ text ("Group Name: " ++ group.name) ]
    , div [ class "usernames", id "group_members" ] [ text (list_usernames group.users) ]
    , div [ class "usernames", id "group_admins" ] [ text (list_admins group.admins) ]
    , transactionScroll group.transactions
    , div [ id "progress-bar-div", style "height" "200px", style "max-width" "100px", style "margin" "auto", style "margin-top" "30px" ]
        [ div [ style "background-image" (constructGradient (100 * (funds group / maxTarget group))), class "progress-bar", style "margin-top" "auto" ] (targetDivs group) ]
    ]
