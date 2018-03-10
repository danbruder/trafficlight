module Tests exposing (..)

import Expect
import Main exposing (..)
import Test exposing (..)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "A Test Suite"
        [ test "Update light updates the light, duh" <|
            \_ ->
                let
                    model =
                        { activeLight = Red }

                    result =
                        update (UpdateLight Green) model
                in
                Expect.equal ( { activeLight = Green }, Cmd.none ) result
        ]
