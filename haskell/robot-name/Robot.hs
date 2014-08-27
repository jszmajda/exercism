module Robot (robotName, mkRobot, resetName) where
import System.Random
import Data.IORef

-- newtype instead of data because it's faster
newtype Robot = Robot { name :: IORef String }

robotName :: Robot -> IO String
robotName r = readIORef $ name r

mkRobot :: IO Robot
mkRobot = do
  nm <- newIORef =<< generateName
  return $ Robot nm

resetName :: Robot -> IO ()
resetName r = do
  writeIORef (name r) =<< generateName
  return ()

generateName :: IO String
generateName = mapM randomRIO [c,c,n,n,n]
  where
    c = ('A','Z')
    n = ('0','9')
