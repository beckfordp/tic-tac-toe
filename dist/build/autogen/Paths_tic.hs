module Paths_tic (
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
version = Version {versionBranch = [0,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/beckfordp/Library/Haskell/bin"
libdir     = "/Users/beckfordp/Library/Haskell/ghc-7.8.3-x86_64/lib/tic-0.0.0"
datadir    = "/Users/beckfordp/Library/Haskell/share/ghc-7.8.3-x86_64/tic-0.0.0"
libexecdir = "/Users/beckfordp/Library/Haskell/libexec"
sysconfdir = "/Users/beckfordp/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tic_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tic_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "tic_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tic_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tic_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
