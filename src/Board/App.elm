module Board.App exposing (init, update, view, subscriptions)

import Html exposing (div, h1, ul, text, Html)
import Html.App

import Board.Column as Column

-- MODEL
type alias Model =
  { backlog : Column.Model
  }

init : Model
init =
  { backlog = Column.init "Backlog"
  }

-- UPDATE
type Msg
  = Backlog Column.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Backlog backlogMsg ->
      let
        (backlog, cmd) = Column.update backlogMsg model.backlog
      in
        ({ model | backlog = backlog }, Cmd.map Backlog cmd)

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [text "ElmBoard"]
    , ul []
        [ Html.App.map Backlog (Column.view model.backlog)
        ]
    ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map Backlog (Column.subscriptions model.backlog)
