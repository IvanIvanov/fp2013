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
    "fact2.hs",
    "tribonacci.hs",
    "areaOfTriangle.hs"
  ]

testsProblem1 :: String
testsProblem1 = unlines
  [
    "frameworkCheck 1          (fact2 0)",
    "frameworkCheck 1          (fact2 1)",
    "frameworkCheck 3840       (fact2 10)",
    "frameworkCheck 3715891200 (fact2 20)"
  ]

testsProblem2 :: String
testsProblem2 = unlines
  [
    "frameworkCheck 0   (tribonacci 0)",
    "frameworkCheck 1   (tribonacci 1)",
    "frameworkCheck 2   (tribonacci 2)",
    "frameworkCheck 230 (tribonacci 10)"
  ]

testsProblem3 :: String
testsProblem3 = unlines
  [
    "frameworkCheckApprox 0.4330127018922193 (areaOfTriangle 1 1 1)",
    "frameworkCheckApprox 6.0                (areaOfTriangle 3 4 5)",
    "frameworkCheckApprox 24.0               (areaOfTriangle 6 8 10)",
    "frameworkCheckApprox 208.71032557111303 (areaOfTriangle 21 22 23)"
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

