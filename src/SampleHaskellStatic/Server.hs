{-# LANGUAGE OverloadedStrings #-}
module SampleHaskellStatic.Server where

import           Data.Maybe                     (fromMaybe)
import qualified Data.Time                      as Time
import qualified Network.Wai                    as Wai
import           Network.Wai.Application.Static
import qualified Network.Wai.Handler.Warp       as Warp
import           System.Environment             (lookupEnv)

startServer :: IO ()
startServer = do
  port <- fromMaybe 3000 <$> fmap read <$> lookupEnv "PORT"
  env <- fromMaybe "local" <$> lookupEnv "APP_ENV"
  now <- Time.getCurrentTime
  putStrLn $ (show now) ++ " - info: Starting " ++ env ++ " server on port " ++ (show port)
  Warp.run port $ httpApp

httpApp :: Wai.Application
httpApp = staticApp $ defaultFileServerSettings "./data"