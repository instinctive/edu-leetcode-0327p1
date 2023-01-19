module Gen where

import Control.Monad ( replicateM )
import Data.List     ( sort       )
import System.Random ( randomRIO  )

gen :: Int -> IO [Int]
gen n = sort <$> replicateM n rnd
  where rnd = randomRIO (-2000,2000)
