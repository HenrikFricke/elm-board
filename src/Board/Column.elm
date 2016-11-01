module Board.Column exposing (init, Msg(..), update, view, Model)

import Html exposing (Html, div, p, text)
import Html.Events exposing (onClick)
import Html.App exposing (map)

import Ui.Button as Button
import Board.Ticket as Ticket

-- MODEL
type alias Model =
  { label: String
  , tickets: List Ticket.Model
  }

init : String -> Model
init label =
  { label = label
  , tickets = []
  }

-- UPDATE
type Msg
  = AddTicket String

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddTicket label ->
      { model | tickets = [Ticket.init "Test" "test"] ++ model.tickets }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ p [] [text model.label]
    , div [] (List.map Ticket.view model.tickets)
    , Button.primary [onClick (AddTicket "Test")] [text "Add a ticket"]
    ]
