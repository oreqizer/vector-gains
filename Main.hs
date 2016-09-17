module Main where

import Graphics.UI.GLUT

import Engine.Vector

displayPoint :: Vertex3f -> DisplayCallback
displayPoint v = do
    clear [ColorBuffer]
    renderPrimitive Points $ vertex v
    flush

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Hello World"
    displayCallback $= displayPoint (Vertex3 0 0 0)
    mainLoop
