{-# LANGUAGE CApiFFI #-}

module CCAlg ( cppER ) where

import Foreign.C.String ( CString, withCString )

foreign import ccall "readAndCount" c_count :: CString -> IO Int

cppER :: String -> IO Int
cppER s = withCString s c_count
