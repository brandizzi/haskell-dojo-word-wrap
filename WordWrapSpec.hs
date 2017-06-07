import Test.Hspec
import Data.List

import WordWrap

main :: IO ()
main = hspec $ do
  describe "Word wrapping" $ do
    it "does not wrap string shorter than line length" $ do
      (wrap "a" 2) == "a"

    it "does not wrap a string with length than line length" $ do
      (wrap "aa" 2) == "aa"

    it "wraps string with length smaller than line length" $ do
      (wrap "aa" 1) == "a\na"

    it "wraps string with length smaller than line length" $ do
        (wrap "ab" 1) == "a\nb"

    it "xpto" $ do
      (wrap "aaaa" 3) == "aaa\na"

    it "don't wrap lines with length less than the size, but wrap larger" $ do
      (wrap "aaaaaaaaa" 3) == "aaa\naaa\naaa"
    
    it "wrap on words" $ do
      (wrap "aa aa" 3) == "aa\naa"

    it "wrap on real words" $ do
      (wrap "This is an intersting question. What do you think?" 7) ==
          "This is\nan\ninterst\ning\nquestio\nn. What\ndo you\nthink?"
