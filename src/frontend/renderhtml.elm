module RenderHTML exposing (..)

import Common exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import String.Extra exposing (pluralize)


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
