module Messages exposing (..)


type Message
    = AddMoneyModal
    | RequestMoneyModal
    | DoNothing
    | Login
    | FailedLogin
    | UpdateUsernameField String
    | UpdatePasswordField String
