{-# LANGUAGE CApiFFI #-}

module CCAlg ( cpp_eqrange, cpp_obvious ) where

import Foreign.C.String ( CString, withCString )

foreign import ccall "ext_eqrange" ext_eqrange :: CString -> IO Int
cpp_eqrange :: String -> IO Int
cpp_eqrange s = withCString s ext_eqrange

foreign import ccall "ext_obvious" ext_obvious :: CString -> IO Int
cpp_obvious :: String -> IO Int
cpp_obvious s = withCString s ext_obvious
