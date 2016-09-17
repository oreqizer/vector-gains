import Graphics.UI.GLUT

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  _window <- createWindow "Hello World"
  displayCallback $= display
  mainLoop

display :: DisplayCallback
display = do
  clear [ ColorBuffer ]
  flush

-- REFERENCE:
--
-- import qualified Graphics.UI.GLUT as G
--
-- main :: IO ()
-- main = do
--   (_progName, _args) <- G.getArgsAndInitialize
--   _window <- G.createWindow "Hello World"
--   G.displayCallback G.$= display
--   G.mainLoop
--
-- display :: G.DisplayCallback
-- display = do
--   G.clear [ G.ColorBuffer ]
--   G.flush
