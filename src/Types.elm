module Types exposing (Group, Guid, Target, Transaction, TransactionRequest, User, rootUser)

import Time


type alias Guid =
    { id : String
    }


type alias User =
    { username : String
    , id : Guid
    }


rootUser : User
rootUser =
    User "root" (Guid "null")


type alias Group =
    { guid : Guid
    , name : String
    , users : List User
    , admins : List User
    , transactions : List Transaction
    , transactionRequests : List TransactionRequest
    , targets : List Target
    }



-- represents a completed transaction


type alias Transaction =
    { guid : Guid
    , user : User
    , amount : Float
    , note : String
    , time : Time.Posix
    }



-- Transaction requested but not yet confirmed


type alias TransactionRequest =
    { sourceUser : User
    , targetUser : User
    , amount : Float
    , note : String
    , status : Bool
    , time : Time.Posix
    }


type alias Target =
    { amount : Float
    , description : String
    }
