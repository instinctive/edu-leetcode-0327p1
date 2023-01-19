{-# LANGUAGE CApiFFI #-}

module CCAlg where

import Foreign.C.String ( CString, withCString )

foreign import ccall "readAndCount" c_count :: CString -> IO Int

count :: String -> IO Int
count s = withCString s c_count
