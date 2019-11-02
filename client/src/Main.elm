module Main exposing (..)

import Browser
import Color
import Html exposing (..)
import Html.Attributes exposing (..)



-- VIEW


view : Model -> Html Msg
view model =
    layout [ text "Hello, World!" ] [] [ templateList model.templates ]


layout : List (Html Msg) -> List (Html Msg) -> List (Html Msg) -> Html Msg
layout head content menu =
    div
        [ style "font-family" "arial"
        , style "height" "600px"
        ]
        [ div
            [ style "color" Color.secondary
            , style "background-color" Color.primary
            , style "padding" "1rem"
            ]
            head
        , div
            [ style "width" "200px"
            , style "background-color" Color.tertiary
            , style "height" "100%"
            , style "float" "left"
            ]
            menu
        , div
            [ style "margin-left" "200px"
            , style "height" "100%"
            ]
            content
        ]


templateList : List Template -> Html Msg
templateList templates =
    div [] (List.map templateView templates)


templateView : Template -> Html Msg
templateView template =
    div
        [ style "color" Color.secondary
        , style "padding" "0.5rem"
        , style "margin" "0.5rem"
        , style "background-color" template.color
        , style "cursor" "grab"
        ]
        [ text template.name ]



-- MODEL


type alias Template =
    { name : String
    , color : String
    }


type alias Node =
    { name : String
    , template : Template
    }


type alias Model =
    { templates : List Template
    , nodes : List Node
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { templates =
            [ { name = "Trousers"
              , color = "darkkhaki"
              }
            , { name = "Stuff"
              , color = "darkgoldenrod"
              }
            , { name = "Thing"
              , color = "darkgray"
              }
            ]
      , nodes = []
      }
    , Cmd.none
    )



-- UPDATE


type alias Msg
    = Int


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
