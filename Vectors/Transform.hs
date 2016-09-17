module Engine.Transform where

import Graphics.UI.GLUT

import Vectors.Core
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

xzRotMatrix :: GLfloat -> Matrix3
xzRotMatrix d = (m1, m2, m3)
    where
        m1 = Vector3 (cos $ rads d) 0 (sin $ rads d)
        m2 = Vector3 0 1 0
        m3 = Vector3 (-(sin $ rads d)) 0 (cos $ rads d)

yzRotMatrix :: GLfloat -> Matrix3
yzRotMatrix d = (m1, m2, m3)
    where
        m1 = Vector3 1 0 0
        m2 = Vector3 0 (cos $ rads d) (-(sin $ rads d))
        m3 = Vector3 0 (sin $ rads d) (cos $ rads d)

scale :: Vector3f -> GLfloat -> GLfloat -> GLfloat -> Vector3f
scale (Vector3 x y z) xs ys zs = Vector3 (x * xs) (y * ys) (z * zs)

rotateXY :: Vector3f -> GLfloat -> Vector3f
rotateXY v = prodMatrix v . xyRotMatrix

rotateXZ :: Vector3f -> GLfloat -> Vector3f
rotateXZ v = prodMatrix v . xzRotMatrix

rotateYZ :: Vector3f -> GLfloat -> Vector3f
rotateYZ v = prodMatrix v . yzRotMatrix
