module Board.App exposing (init, update, view, subscriptions)

import Html exposing (div, h1, ul, text, Html)
import Ui.Button as Button

import Board.Column as Column

-- MODEL
type alias Model =
  { columns : List Column.Model
  , button : Button.Model
  }

init : Model
init =
  { columns =
    [ Column.init "Backlog"
    , Column.init "Next"
    , Column.init "In Progress"
    , Column.init "Done"
    ]
  , button = Button.init
  }

-- UPDATE
type Msg
  = MsgForColumn String Column.Msg
  | Button Button.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    MsgForColumn label msg ->
      ( { model |
        columns = List.map (\c -> if c.label == label then Column.update msg c else c) model.columns
      }
      ,
        Cmd.none
      )
    Button buttonMsg ->
        let
          (button, cmd) = Button.update buttonMsg model.button
        in
          ({ model | button = button }, Cmd.map Button cmd)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [text "ElmBoard"]
    , ul [] (List.map (\c -> Column.view (MsgForColumn c.label) c) model.columns)
    , Button.view Button model.button
    ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map Button (Button.subscriptions model.button)
