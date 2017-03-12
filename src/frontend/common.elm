module Common exposing (..)


type alias Person =
    { location : String
    , name : String
    , age : Int
    , livingLocation : String
    }


type alias Job =
    { companies : List String
    , role : String
    , location : String
    , duration : Int
    }


person :
    { location : String
    , name : String
    , age : Int
    , livingLocation : String
    }
person =
    { name = "Srini"
    , location = "Tirukovilur"
    , age = 34
    , livingLocation = "Bangalore"
    }


jobs : List Job
jobs =
    [ { companies = [ "Shalom Infotech" ]
      , role = "Programmer"
      , location = "Trichy"
      , duration = 2
      }
    , { companies = [ "Shriram Chits", "Efunds", "Capgemini", "Oracle" ]
      , role = "Programmer Lead"
      , location = "Chennai"
      , duration = 7
      }
    , { companies = [ "Oracle" ]
      , role = "Tech Lead"
      , location = "Bangalore"
      , duration = 2
      }
    ]


hobbies : List String
hobbies =
    [ "youtube", "programming", "robotics" ]
