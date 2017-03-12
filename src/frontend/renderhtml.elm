module RenderHTMl exposing (..)

import Common exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (..)
import String.Extra exposing (pluralize)


type Msg
    = ShowName


model =
    { showName = False }


update msg model_ =
    case msg of
        ShowName ->
            { model_ | showName = True }


view model_ =
    div []
        [ h1 [] [ text "My Name" ]
        , button [ onClick ShowName ] [ text "Show My Name" ]
        , if model_.showName then
            text person.name
          else
            text ""
        ]


render : thing -> Html.Html msg
render thing =
    text <| toString <| thing


renderJob job =
    li []
        [ render ("Location: " ++ job.location)
        , text (pluralize "Company: " "Companies: " (List.length job.companies))
        , render <| job.companies
        , text " Duration in Years: "
        , render <| job.duration
        ]


renderJobs : List Job -> Html.Html msg
renderJobs jobs =
    div [ style [ ( "padding", "1em" ) ] ]
        [ h1 [] [ text "My Jobs" ]
        , ul [] (List.map renderJob jobs)
        ]


main =
    renderJobs jobs



{- beginnerProgram
   { model = model
   , view = view
   , update = update
   }
-}
