{-# LANGUAGE LambdaCase #-}

module Main where

import HSAlg
import System.Environment
import System.IO
import Text.Printf

main :: IO ()
main = getArgs >>= \case
    [impl,path] -> case impl of
        "one" -> hs_onepass path >>= print
        "two" -> hs_twopass path >>= print
        _ -> usage
    _ -> usage
  where
    usage = getProgName >>= hPrintf stderr
        "Usage: %s [one|two] input-file"
