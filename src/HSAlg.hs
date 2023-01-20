-- https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer/
-- https://github.com/codereport/LeetCode/tree/master/Problem%20327P1
-- https://youtu.be/U6I-Kwj-AvY

module HSAlg ( hsBS ) where

import Data.Char     ( isSpace )
import Data.Function ( on      )
import Data.List     ( unfoldr )
import qualified Data.ByteString.Char8 as C

leet :: [Int] -> Int
leet = uncurry (on max length)
    . span (<0)
    . filter (/=0)

hsBS :: FilePath -> IO Int
hsBS path =
    leet . unfoldr go <$> C.readFile path
  where
    go s = do
        (n, s1) <- C.readInt s
        let s2 = C.dropWhile isSpace s1
        return (n, s2)
