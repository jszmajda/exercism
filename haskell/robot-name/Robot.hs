module Robot (robotName, mkRobot, resetName) where
import System.Random
import Data.IORef

-- newtype instead of data because it's faster
newtype Robot = Robot { name :: IORef String }

robotName :: Robot -> IO String
robotName r = readIORef $ name r

mkRobot :: IO Robot
mkRobot = do
  name <- generateName
  nm <- newIORef name
  return $ Robot nm

resetName :: Robot -> IO ()
resetName r = do
  nm <- generateName
  writeIORef (name r) nm
  return ()

generateName :: IO String
generateName = do
  g1 <- getStdGen
  let r1 = randomR ('A','Z') g1
  let c1 = fst r1
  let r2 = randomR ('A','Z') (snd r1)
  let c2 = fst r2
  let r3 = randomR (0,9) (snd r2) :: (Int, StdGen)
  let n1 = fst r3
  let r4 = randomR (0,9) (snd r3) :: (Int, StdGen)
  let n2 = fst r4
  let r5 = randomR (0,9) (snd r4) :: (Int, StdGen)
  let n3 = fst r5
  let nm = (c1:c2: (foldl (++) "" (map show [n1,n2,n3])))
  setStdGen (snd r5)
  return nm
