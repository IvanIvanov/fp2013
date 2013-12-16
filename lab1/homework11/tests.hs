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
    "expensiveProducts.hs",
    "treeLevel.hs",
    "treeLevels.hs"
  ]

testsProblem1 :: String
testsProblem1 = unlines
  [
    "frameworkCheck []            (expensiveProducts [(\"foo\", 1), (\"bar\", 1), (\"baz\", 1)])",
    "frameworkCheck [\"d\",\"e\"] (expensiveProducts [(\"a\", 1), (\"b\", 2), (\"c\", 3), (\"d\", 4), (\"e\", 5)])",
    "frameworkCheck [\"house\"]   (expensiveProducts [(\"crappy food\", 1.20), (\"suhsi\", 12.0), (\"car\", 20000.0), (\"house\", 200000.0)])"
  ]

testsProblem2 :: String
testsProblem2 = unlines
  [
    "frameworkCheck [10]      (treeLevel (Node 10 (Node 5 (Node 4 Empty Empty) Empty) (Node 20 (Node 15 Empty Empty) (Node 25 Empty Empty))) 0)",
    "frameworkCheck [5,20]    (treeLevel (Node 10 (Node 5 (Node 4 Empty Empty) Empty) (Node 20 (Node 15 Empty Empty) (Node 25 Empty Empty))) 1)",
    "frameworkCheck [4,15,25] (treeLevel (Node 10 (Node 5 (Node 4 Empty Empty) Empty) (Node 20 (Node 15 Empty Empty) (Node 25 Empty Empty))) 2)",
    "frameworkCheck []        (treeLevel (Node 10 (Node 5 (Node 4 Empty Empty) Empty) (Node 20 (Node 15 Empty Empty) (Node 25 Empty Empty))) 3)"
  ]

testsProblem3 :: String
testsProblem3 = unlines
  [
    "frameworkCheck [[1],[2,3]]             (treeLevels (Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)))",
    "frameworkCheck [[10],[5,20],[4,15,25]] (treeLevels (Node 10 (Node 5 (Node 4 Empty Empty) Empty) (Node 20 (Node 15 Empty Empty) (Node 25 Empty Empty))))"
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

