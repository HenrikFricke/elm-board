module Board.Ticket exposing (..)

import Html exposing (Html, div, span, text)
import Html.Events exposing (onClick)

-- MODEL
type alias Model =
  { title: String
  , description: String
  }

init : String -> String -> Model
init title description =
  { title = title
  , description = description
  }

-- VIEW
view : Model -> Html msg
view model =
  div []
      [ span [] [text model.title]
      , span [] [text model.description]
      ]
