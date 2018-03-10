module Main exposing (..)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model =
    { activeLight : ActiveLight }


type ActiveLight
    = Green
    | Yellow
    | Red


init : ( Model, Cmd Msg )
init =
    ( { activeLight = Green }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | UpdateLight ActiveLight


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateLight light ->
            ( { model | activeLight = light }, Cmd.none )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


showLight : Model -> Html Msg
showLight model =
    case model.activeLight of
        Red ->
            img [ src "light1.jpg" ] []

        Yellow ->
            img [ src "light2.jpg" ] []

        Green ->
            img [ src "light3.jpg" ] []


view : Model -> Html Msg
view model =
    div []
        [ showLight model
        , div [ class "target-wrap" ]
            [ div [ class "target red", onClick (UpdateLight Red) ] []
            , div [ class "target yellow", onClick (UpdateLight Yellow) ] []
            , div [ class "target green", onClick (UpdateLight Green) ] []
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
