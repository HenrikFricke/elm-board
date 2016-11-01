module Board.Board exposing (init, update, view)

import Html exposing (div, text, Html)
import Html.Attributes exposing (class)
import Html.App

import Board.Column
import Ui.Navbar

-- MODEL
type alias Model =
  { columns : List Board.Column.Model
  }

init : Model
init =
  { columns =
    [ Board.Column.init "Backlog"
    , Board.Column.init "Next"
    , Board.Column.init "In Progress"
    , Board.Column.init "Done"
    ]
  }

-- UPDATE
type Msg
  = Column String Board.Column.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    Column label columnMsg ->
      { model |
        columns = List.map (\c -> updateColumn c label columnMsg) model.columns
      }

updateColumn : Board.Column.Model -> String -> Board.Column.Msg -> Board.Column.Model
updateColumn model label columnMsg =
  if model.label == label then
    Board.Column.update columnMsg model
  else
    model

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ Ui.Navbar.view "ElmBoard"
    , div [class "BoardBoard"] (List.map viewColumn model.columns)
    ]

viewColumn : Board.Column.Model -> Html Msg
viewColumn model =
  Html.App.map (Column model.label) (Board.Column.view model)
