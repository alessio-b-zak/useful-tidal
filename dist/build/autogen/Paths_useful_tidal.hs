module Paths_useful_tidal (
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
libdir     = "/home/alessio/.cabal/lib/x86_64-linux-ghc-7.10.3/useful-tidal-0.1.0.0-9wcIM9HtSfq4NgabJkMr2x"
datadir    = "/home/alessio/.cabal/share/x86_64-linux-ghc-7.10.3/useful-tidal-0.1.0.0"
libexecdir = "/home/alessio/.cabal/libexec"
sysconfdir = "/home/alessio/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "useful_tidal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "useful_tidal_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "useful_tidal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "useful_tidal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "useful_tidal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
