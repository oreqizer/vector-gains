module Utils.Angles where

rads :: (Floating a) => a -> a
rads = (/180) . (* pi)

degs :: (Floating a) => a -> a
degs = (/pi) . (* 180)
