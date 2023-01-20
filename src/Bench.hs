module Bench where

import Criterion.Main
import Data.List
import System.Directory
import System.IO

import Gen
import CCAlg
import HSAlg

leetMain :: IO ()
leetMain = defaultMain
    [ leetBench     2000
    , leetBench   200000
    , leetBench 20000000
    ]

leetBench :: Int -> Benchmark
leetBench n =
    envWithCleanup (setupEnv n) removeFile $ \p ->
        bgroup (commas n)
            [ bench "haskell" $ nfIO (hsBS  p)
            , bench "C++"     $ nfIO (cppER p)
            ]

commas :: Int -> String
commas = reverse
    . intercalate "," . unfoldr threes
    . reverse . show
  where
    threes [] = Nothing
    threes xx = splitAt 3 <$> Just xx

setupEnv :: Int -> IO FilePath
setupEnv n = openTempFile "tmp" "input-" >>= \(p,h) -> do
    gen n >>= hPutStr h . unlines . map show
    hFlush h >> hClose h
    pure p
