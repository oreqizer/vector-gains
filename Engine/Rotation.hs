module Engine.Rotation where

import Graphics.UI.GLUT

import Engine.Vector
import Utils.Angles

type Matrix3 = (Vector3f, Vector3f, Vector3f)

prodMatrixRow :: Vector3f -> Vector3f -> GLfloat
prodMatrixRow (Vector3 v1 v2 v3) (Vector3 m1 m2 m3) = v1 * m1 + v2 * m2 + v3 * m3

prodMatrix :: Vector3f -> Matrix3 -> Vector3f
prodMatrix v (m1, m2, m3) = Vector3 r1 r2 r3
    where
        r1 = prodMatrixRow v m1
        r2 = prodMatrixRow v m2
        r3 = prodMatrixRow v m3

xyRotMatrix :: GLfloat -> Matrix3
xyRotMatrix d = (m1, m2, m3)
    where
        m1 = Vector3 (cos $ rads d) (-(sin $ rads d)) 0
        m2 = Vector3 (sin $ rads d) (cos $ rads d) 0
        m3 = Vector3 0 0 1
