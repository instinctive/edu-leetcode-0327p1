module HSAlg ( hs_onepass, hs_twopass ) where

import Data.Char     ( isSpace )
import Data.Function ( on      )
import Data.List     ( unfoldr )
import qualified Data.ByteString.Char8 as C

-- Actual Algorithms
-- ----------------------------------------------------------------------

onepass :: [Int] -> Int
onepass = uncurry (on max length)
    . span (<0)
    . filter (/=0)

twopass :: [Int] -> Int
twopass xx = on max length neg pos where
    neg = filter (<0) xx
    pos = filter (>0) xx

-- File Handling
-- ----------------------------------------------------------------------

doFile :: ([Int] -> Int) -> FilePath -> IO Int
doFile f path = f . unfoldr go <$> C.readFile path where
    go s = despace <$> C.readInt s
    despace (n,s) = (n, C.dropWhile isSpace s)

hs_onepass :: FilePath -> IO Int
hs_onepass = doFile onepass

hs_twopass :: FilePath -> IO Int
hs_twopass = doFile twopass
