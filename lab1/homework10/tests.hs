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
    "coolNumbers.hs",
    "squarePrimes.hs",
    "numbersWith.hs"
  ]

testsProblem1 :: String
testsProblem1 = unlines
  [
    "frameworkCheck [2,4,9] (coolNumbers 1 10)",
    "frameworkCheck [16,25] (coolNumbers 13 42)",
    "frameworkCheck [2,4,9,16,25,64] (coolNumbers 1 100)"
  ]

testsProblem2 :: String
testsProblem2 = unlines
  [
    "frameworkCheck [4,9,25]                                    (take 3 (squarePrimes 1))",
    "frameworkCheck [121,169,289,361,529]                       (take 5 (squarePrimes 10))",
    "frameworkCheck [10201,10609,11449,11881,12769,16129,17161] (take 7 (squarePrimes 100))"
  ]

testsProblem3 :: String
testsProblem3 = unlines
  [
    "frameworkCheck [1,10,11]             (take 3 (numbersWith 1))",
    "frameworkCheck [10,20,30,40,50]      (take 5 (numbersWith 0))",
    "frameworkCheck [5,15,25,35,45,50,51] (take 7 (numbersWith 5))"
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

