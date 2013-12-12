-- This file contains unit tests for the set of Haskell solutions listed in
-- "solutionFiles".
--
-- To run the tests specify the relative or absolute path to the
-- ".hs" files with the proposed solutions by tweaking the "solutionFiles"
-- list bellow. Then you can run the tests by either double clicking on this
-- file or by entering the following command directly in the command line:
--
-- runhaskell <the-name-of-this-file>
--
-- assuming that the Haskell Platform is installed on your system.
--
-- To inspect the actual test cases that are run - look at the "testProblem*"
-- and "solutionTests" constants.
--
import System.IO
import System.Process
 
solutionFiles :: [String]
solutionFiles =
  [
    "letterOfTheMost.hs",
    "removeAt.hs",
    "matchLengths.hs"
  ]
 
testsProblem1 :: String
testsProblem1 = unlines
  [
    "frameworkCheck ('c',5) (letterOfTheMost [\"haskell\", \"javascript\", \"scheme\", \"C++\", \"Clojure\", \"C++\"])",
    "frameworkCheck ('o',4) (letterOfTheMost $ words \"The quick brown fox jumped over the lazy dog\")",
    "frameworkCheck ('d',12) (letterOfTheMost [\"aaaaaaaaa\", \"bbbbbbb\", \"cccccccccc\", \"dddddddddddd\"])"
  ]
 
testsProblem2 :: String
testsProblem2 = unlines
  [
    "frameworkCheck [2,3]  (removeAt 0 [1,2,3])",
    "frameworkCheck [1,3]  (removeAt 1 [1,2,3])",
    "frameworkCheck [5,6,7] (removeAt 3 [5,6,7,9])"
  ]
 
testsProblem3 :: String
testsProblem3 = unlines
  [
    "frameworkCheck True (matchLengths [ [], [1, 2], [3, 4, 5] ] [ [1], [2,3,4], [5,6,7,8] ])",
    "frameworkCheck False (matchLengths [ [], [1,2], [3,4,5] ] [ [], [2,3,4], [5,6,7] ])",
    "frameworkCheck True  (matchLengths [ [1..9], [10..19] ] [ [1,2,3], [1,2,3,4] ])"
  ]
 
solutionTests :: [String]
solutionTests =
  [
    testsProblem1,
    testsProblem2,
    testsProblem3
  ]
 
-- Here be dragons!
--
-- The following definitions create the infrastructure for a very simple
-- "test framework". As a student you should be just fine in skipping them.
frameworkSourceCode :: String
frameworkSourceCode = unlines
  [
    "",
    "testPassed :: IO ()",
    "testPassed = putStrLn \"Test passed!\"",
    "",
    "testFailed :: IO ()",
    "testFailed = putStrLn \"Test failed!\"",
    "",
    "frameworkCheck :: (Eq a) => a -> a -> IO ()",
    "frameworkCheck expectedValue returnValue",
    "  | expectedValue == returnValue = testPassed",
    "  | otherwise                    = testFailed",
    "",
    "frameworkCheckApprox :: Double -> Double -> IO ()",
    "frameworkCheckApprox expectedValue returnValue",
    "  | abs (expectedValue - returnValue) < eps = testPassed",
    "  | otherwise = testFailed",
    "  where eps = 1e-6",
    "",
    "",
    "main :: IO ()",
    "main = do"
  ]
 
testSolution :: String -> String -> IO ()
testSolution testCases solutionFilePath = do
  putStrLn ("Grading solution: " ++ solutionFilePath)
  sourceCode <- readFile solutionFilePath
  let testFile = solutionFilePath ++ "__tests__.hs"
  writeFile  testFile sourceCode
  appendFile testFile frameworkSourceCode
  appendFile testFile (unlines (map ("  "++) (lines testCases)))
  _ <- system ("runhaskell " ++ testFile)
  return ()
 
main :: IO ()
main = do
  mapM_ (\(f, t) -> testSolution t f) $ zip solutionFiles solutionTests
 
-- Dragons no more!
-- End of the "test framework" code.