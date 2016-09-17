import Graphics.UI.GLUT

type Point = (GLfloat, GLfloat, GLfloat)

myPoints :: [Point]
myPoints = [(sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12]]

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  _window <- createWindow "Hello World"
  displayCallback $= display
  mainLoop

display :: DisplayCallback
display = do
  clear [ColorBuffer]
  renderPrimitive Points $
     mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
  flush
