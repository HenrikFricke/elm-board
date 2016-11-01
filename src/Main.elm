import Html.App
import Board.Board as App

main : Program Never
main =
  Html.App.beginnerProgram
      { model = App.init
      , view = App.view
      , update = App.update
      }
