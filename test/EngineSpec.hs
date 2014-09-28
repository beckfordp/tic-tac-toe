module EngineSpec (spec) where


import Test.Hspec

import Engine
import Position
import qualified Data.Map as M
import Control.Monad.State

spec :: Spec
spec = do
  describe "Engine" $ do
    context "minimax" $ do
      it "should determine a win for X" $ do
        evalState (minimax (Position ("XXX"++"   "++"   ") 'X')) M.empty
          `shouldBe` 100
      it "should determine a win for O" $ do
        evalState (minimax (Position ("OOO"++"   "++"   ") 'O')) M.empty
          `shouldBe` -100
      it "should determine a draw" $ do
        evalState (minimax (Position ("OXO"++"XOX"++"XOX") 'O')) M.empty
          `shouldBe` 0
      it "should determine a win for X in 1 move" $ do
        evalState (minimax (Position ("XX "++"   "++"   ") 'X')) M.empty
          `shouldBe` 107
      it "should determine a win for O in 1 move" $ do
        evalState (minimax (Position ("OO "++"   "++"   ") 'O')) M.empty
          `shouldBe` -107
      it "should determine a value from cache" $ do
        evalState (minimax initPosition) M.empty `shouldBe` 5
    context "bestMove" $ do
      it "should determine the best move for X" $ do
        evalState (bestMove (Position ("XX "++" OO"++"   ") 'X')) M.empty
          `shouldBe` 2
      it "should determine the best move for O" $ do
        evalState (bestMove (Position ("XX "++" OO"++"   ") 'O')) M.empty
          `shouldBe` 3
