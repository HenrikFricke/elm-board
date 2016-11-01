module Ui.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view : String -> Html.Html msg
view title =
  div [class "UiNavbar"]
      [ h1 [class "UiNavbarTitle"] [text title]
      ]
