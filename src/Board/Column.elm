module Board.Column exposing (..)

import Html exposing (Html, div, p, ul, br, text, button, li)
import Html.Events exposing (onClick)

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
  = AddTicket Model String

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddTicket reqModel label ->
      if model == reqModel then { model | tickets = [label] ++ model.tickets } else model

-- VIEW
view : (Msg -> msg) -> Model -> Html msg
view address model =
  div []
    [ p [] [text model.label]
    , ul [] (List.map (\t -> viewTicket address t) model.tickets)
    , br [] []
    , button [onClick (address <| AddTicket model "Test")] [text "Add new ticket"]
    ]

viewTicket : (Msg -> msg) -> String -> Html msg
viewTicket address ticket =
  li [] [text ticket]
