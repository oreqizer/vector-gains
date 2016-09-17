module Main where

import Graphics.UI.GLUT
import Data.IORef
import System.Random
import System.Exit

import Vectors.Core
import Vectors.Transform

makePoints :: [GLfloat] -> [GLfloat] -> [GLfloat] -> [Vertex3f]
makePoints xs ys zs = map (\(x, y, z) -> Vertex3 x y z) $ zip3 xs ys zs

randomAxis :: StdGen -> [GLfloat]
randomAxis = take 100 . randomRs (-1, 1 :: GLfloat)

randomPoints :: IO [Vertex3f]
randomPoints = do
    genX <- getStdGen
    genY <- newStdGen
    genZ <- newStdGen
    return $ makePoints (randomAxis genX) (randomAxis genY) (randomAxis genZ)

-- utils

paintPoints :: [Vertex3f] -> IO ()
paintPoints points = do
    clear [ColorBuffer]
    renderPrimitive Points $ mapM_ vertex points
    flush

-- callbacks

displayPoints :: IORef [Vertex3f] -> DisplayCallback
displayPoints p = readIORef p >>= paintPoints

keyD :: IORef [Vertex3f] -> IORef [Vertex3f] -> IO ()
keyD orig curr = do
    readIORef orig >>= writeIORef curr
    readIORef curr >>= paintPoints

keyA :: IORef [Vertex3f] -> IO ()
keyA points = do
    modifyIORef points . map $ vectorToPoint . scalePoint 0.5 0.5 0.5 . pointToVector
    readIORef points >>= paintPoints

keyS :: IORef [Vertex3f] -> IO ()
keyS points = do
    modifyIORef points . map $ vectorToPoint . scalePoint 2 2 2 . pointToVector
    readIORef points >>= paintPoints

keyR :: IORef [Vertex3f] -> IO ()
keyR points = do
    modifyIORef points . map $ vectorToPoint . rotateXY 15 . pointToVector
    readIORef points >>= paintPoints

keyboard :: IORef [Vertex3f] -> IORef [Vertex3f] -> KeyboardCallback
keyboard _ _ '\ESC' _ = exitSuccess
keyboard o c 'd' _ = keyD o c
keyboard _ c 'a' _ = keyA c
keyboard _ c 's' _ = keyS c
keyboard _ c 'r' _ = keyR c
keyboard _ _ _ _ = return ()

-- main

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Hello World"
    points <- randomPoints >>= newIORef
    pointsOrig <- readIORef points >>= newIORef
    displayCallback $= displayPoints points
    keyboardCallback $= Just (keyboard pointsOrig points)
    mainLoop
