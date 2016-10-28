module Ui.Button exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

primary : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
primary attributes nodes =
  button (attributes ++ [class "UiButtonPrimary"])  nodes
