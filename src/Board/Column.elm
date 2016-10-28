module Board.Column exposing (..)

import Html exposing (Html, div, p, ul, br, text, button, li)
import Html.Events exposing (onClick)
import Html.App exposing (map)

import Ui.Button as Button

-- MODEL
type alias Model =
  { label: String
  , tickets: List String
  }

init : String -> Model
init label =
  { label = label
  , tickets = []
  }

-- UPDATE
type Msg
  = AddTicket String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    AddTicket label ->
      ( { model | tickets = [label] ++ model.tickets }
      , Cmd.none
      )

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ p [] [text model.label]
    , ul [] (List.map viewTicket model.tickets)
    , br [] []
    , Button.primary [onClick (AddTicket "Test")] [text "Add a ticket"]
    ]

viewTicket : String -> Html Msg
viewTicket ticket =
  li [] [text ticket]
