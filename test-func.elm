port module Test exposing (main)

-- Elm module to get a sense of how to call Elm from JS
-- Very roughly based on https://gist.github.com/evancz/e69723b23958e69b63d5b5502b0edf90
-- and https://github.com/ElmCast/elm-node/blob/master/example/Example.elm

import Platform
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Task
import Console
import NodeProcess

main : Program Never Model Msg
main =
    Platform.program
        { init =
          ( Model "", 
            Cmd.none
          )
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model = { text : String }

-- UPDATE

type Msg
  = Done
  | Test (String)

port done : String -> Cmd msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Test newText ->
      ( Model newText, Cmd.none )

    Done ->
      ( model, done (model.text ++ "a") )

-- SUBSCRIPTIONS

port test : (String -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions model =
  test Test
