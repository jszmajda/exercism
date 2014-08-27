module Robot (robotName, mkRobot, resetName) where
import System.Random
import Control.Concurrent.MVar

-- newtype instead of data because it's faster
newtype Robot = Robot { name :: MVar String }

mkRobot :: IO Robot
mkRobot = fmap Robot (generateName >>= newMVar)

robotName :: Robot -> IO String
robotName r = readMVar (name r)

resetName :: Robot -> IO ()
resetName r = modifyMVar_ (name r) (const generateName)

generateName :: IO String
generateName = mapM randomRIO [c,c,n,n,n]
  where
    c = ('A','Z')
    n = ('0','9')
