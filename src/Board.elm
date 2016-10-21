import Html.App
import Board.App as App

main : Program Never
main =
  Html.App.program
      { init = ( App.init, Cmd.none)
      , view = App.view
      , update = App.update
      , subscriptions = App.subscriptions
      }
