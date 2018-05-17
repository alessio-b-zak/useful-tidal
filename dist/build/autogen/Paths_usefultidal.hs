module Paths_usefultidal (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alessio/.cabal/bin"
libdir     = "/home/alessio/.cabal/lib/x86_64-linux-ghc-7.10.3/usefultidal-0.1.0.0-FU2vLYkW2Cw11E22kk3Pxi"
datadir    = "/home/alessio/.cabal/share/x86_64-linux-ghc-7.10.3/usefultidal-0.1.0.0"
libexecdir = "/home/alessio/.cabal/libexec"
sysconfdir = "/home/alessio/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "usefultidal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "usefultidal_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "usefultidal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "usefultidal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "usefultidal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
