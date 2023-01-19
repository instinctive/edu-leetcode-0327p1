module Bench where

import Criterion.Main
import System.Directory
import System.IO

import Gen
import Leet
import CCAlg

leetMain :: IO ()
leetMain = defaultMain
    [ leetBench   2000
    , leetBench  20000
    , leetBench 200000
    ]

leetBench :: Int -> Benchmark
leetBench n =
    envWithCleanup (setupEnv n) removeFile $ \p ->
        bgroup ("size-" <> show n)
            [ bench "haskell" $ nfIO (leet <$> readIntsChar8 p)
            , bench "C++"     $ nfIO (count p)
            ]

setupEnv :: Int -> IO FilePath
setupEnv n = openTempFile "tmp" "input-" >>= \(p,h) -> do
    gen n >>= hPutStr h . unlines . map show
    hFlush h >> hClose h
    pure p
