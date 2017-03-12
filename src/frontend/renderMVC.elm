module RenderMVC exposing (..)

import Common exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (..)


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


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
