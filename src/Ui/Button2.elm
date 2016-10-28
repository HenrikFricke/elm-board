module Ui.Button2 exposing (..)

import Html exposing (..)
import Html.CssHelpers
import Css exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
    = Primary

css : Stylesheet
css =
    (stylesheet << namespace "UiButton")
    [ (.) Primary
        [ border3 (px 2) solid (hex "000000")
        , backgroundColor (hex "FFFFFF")
        , padding2 (px 10) (px 8)
        ]
    ]

{ class } =
    Html.CssHelpers.withNamespace "UiButton"

primary : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
primary attributes nodes =
  button (attributes ++ [class [ Primary ]])  nodes
