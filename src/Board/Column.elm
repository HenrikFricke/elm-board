module Board.Column exposing (..)

import Html exposing (Html, div, p, ul, br, text, button, li)
import Html.Events exposing (onClick)
import Html.App exposing (map)

import Ui.Button as Button
import Ui.Button2 as Button2

-- MODEL
type alias Model =
  { label: String
  , tickets: List String
  , button : Button.Model
  }

init : String -> Model
init label =
  { label = label
  , tickets = []
  , button = Button.init
  }

-- UPDATE
type Msg
  = AddTicket String
  | Button Button.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    AddTicket label ->
      ( { model | tickets = [label] ++ model.tickets }
      , Cmd.none
      )
    Button buttonMsg ->
        case buttonMsg of
            Button.Click ->
              update (AddTicket "Test") model
            _ ->
                let
                  (button, cmd) = Button.update buttonMsg model.button
                in
                  ({ model | button = button }, Cmd.map Button cmd)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ p [] [text model.label]
    , ul [] (List.map viewTicket model.tickets)
    , br [] []
    , Button2.primary [onClick (AddTicket "Test")] [text "I'am a button"]
    , map Button (Button.view model.button "Add new ticket")
    ]

viewTicket : String -> Html Msg
viewTicket ticket =
  li [] [text ticket]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map Button (Button.subscriptions model.button)
