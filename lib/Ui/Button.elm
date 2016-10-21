module Ui.Button exposing
    ( Model, Msg, update, view, subscriptions, init )

import Html.App as Html
import Html exposing (button, text, Html, node)
import Html.Attributes exposing (style)
import Html.Events exposing (onMouseEnter, onMouseLeave)
import Animation exposing (px)
import Color exposing (black, white)

-- MODEL
type alias Model =
    { style : Animation.State
    }

init : Model
init =
    { style =
        Animation.styleWith
            (Animation.spring
                { stiffness = 100
                , damping = 15 }
            )
            styles.unhover
    }

-- UPDATE
type Msg
    = Hover
    | Unhover
    | Animate Animation.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Hover ->
            ( { model
                | style =
                    Animation.interrupt
                        [ Animation.to styles.hover
                        ]
                        model.style
              }
            , Cmd.none
            )

        Unhover ->
            ( { model
                | style =
                    Animation.interrupt
                        [ Animation.to styles.unhover
                        ]
                        model.style
              }
            , Cmd.none
            )

        Animate animMsg ->
            ( { model
                | style = Animation.update animMsg model.style
              }
            , Cmd.none
            )

type alias Styles =
    { hover : List Animation.Property
    , unhover : List Animation.Property
    }

styles : Styles
styles =
    { hover =
        [ Animation.backgroundColor black
        , Animation.color white
        ]
    , unhover =
        [ Animation.backgroundColor white
        , Animation.color black
        ]
    }

-- VIEW
view : (Msg -> msg) -> Model -> Html msg
view address model =
    button
        (Animation.render model.style
            ++ [ style
                    [ ( "border", "2px solid black" )
                    , ( "padding", "10px 8px" )
                    , ( "cursor", "pointer" )
                    , ( "margin", "50px" )
                    ]
               ]
            ++ [ onMouseEnter (address Hover) ]
            ++ [ onMouseLeave (address Unhover) ]
        )
        [ text "I'am a button" ]

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Animation.subscription Animate [ model.style ]
