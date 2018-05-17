module Sound.Tidal.Useful.Utility(stk_pl_sa, play_sample_types, rpstk) where

import Sound.Tidal.Context
import Sound.Tidal.Pattern
import Sound.Tidal.Scales
import Sound.Tidal.Chords

pointwise :: [a -> b] -> [a] -> [b]
pointwise (f:fs) (x:xs) = f x : (pointwise fs xs)
pointwise _ _ = []

change_sample_list = pointwise $ (repeat (($) n))

sample_change xs = change_sample_list (pure <$> xs)

apply_sample_change_effect xs = (|=|) <$> (sample_change xs)

apply_diff_sample xs sampl = pointwise (apply_sample_change_effect xs) (repeat (sound sampl))

play_sample_types xs sampl = apply_diff_sample xs sampl

stk_pl_sa xs sampl = stack $ play_sample_types xs sampl

rpstk num pattern = fastcat $ replicate num pattern



