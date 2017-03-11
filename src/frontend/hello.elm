module Main exposing (..)

import Html exposing (text)


type alias Person =
    { location : String
    , name : String
    , age : Int
    , livingLocation : String
    }


hobbies : List String
hobbies =
    [ "youtube", "programming", "robotics" ]


type alias Job =
    { companies : List String
    , role : String
    , location : String
    , duration : Int
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


politely :
    String
    -> String
politely arg =
    "Hello, "
        ++ arg


getNameAndLocation :
    String
    -> String
    -> String
getNameAndLocation name location =
    "My Name is "
        ++ name
        ++ " ! from "
        ++ location


welcome :
    String
    -> String
welcome =
    politely
        << (getNameAndLocation person.name)


getAge : String -> String
getAge data =
    data
        ++ " and my age is "
        ++ toString (.age person)


renderLivingLocation : Person -> String
renderLivingLocation person =
    " And I am living in " ++ person.livingLocation


jobLocations : List Job -> List String
jobLocations jobs =
    List.map (\job -> job.location) jobs


getCompanies : String -> List Job -> Maybe Job
getCompanies location jobs =
    List.foldl
        (\job memo ->
            case memo of
                Just _ ->
                    memo

                Nothing ->
                    if job.location == location then
                        Just job
                    else
                        Nothing
        )
        Nothing
        jobs


main : Html.Html String
main =
    text <|
        getAge <|
            welcome (.location person)
                ++ renderLivingLocation person
                ++ " my hobbies are "
                ++ toString hobbies
                ++ " and my job locations are "
                ++ toString (jobLocations jobs)
                ++ " List of companies worked in Chennai : "
                ++ toString (getCompanies "Chennai" jobs)
