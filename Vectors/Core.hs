module Vectors.Core where

import Graphics.UI.GLUT

type Vector3f = Vector3 GLfloat

type Vertex3f = Vertex3 GLfloat

pointToVector :: Vertex3f -> Vector3f
pointToVector (Vertex3 x y z) = Vector3 x y z

vectorToPoint :: Vector3f -> Vertex3f
vectorToPoint (Vector3 x y z) = Vertex3 x y z

-- Points

addVectorToPoint :: Vertex3f -> Vector3f -> Vector3f
addVectorToPoint (Vertex3 px py pz) (Vector3 vx vy vz) = Vector3 (px + vx) (py + vy) (pz + vz)

subVectorFromPoint :: Vertex3f -> Vector3f -> Vector3f
subVectorFromPoint (Vertex3 px py pz) (Vector3 vx vy vz) = Vector3 (px - vx) (py - vy) (pz - vz)

subPoints :: Vertex3f -> Vertex3f -> Vector3f
subPoints (Vertex3 px py pz) (Vertex3 vx vy vz) = Vector3 (px - vx) (py - vy) (pz - vz)

-- Vectors

addVectors :: Vector3f -> Vector3f -> Vector3f
addVectors (Vector3 px py pz) (Vector3 vx vy vz) = Vector3 (px + vx) (py + vy) (pz + vz)

subVectors :: Vector3f -> Vector3f -> Vector3f
subVectors (Vector3 px py pz) (Vector3 vx vy vz) = Vector3 (px - vx) (py - vy) (pz - vz)
