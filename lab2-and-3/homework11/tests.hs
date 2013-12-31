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
    "matrix.hs",
    "streams.hs",
    "treeLevel.hs",
    "treeLevels.hs"
  ]

testsProblem1 :: String
testsProblem1 = unlines
  [
    "frameworkCheck (0, 0) (dimensions [[]])",
    "frameworkCheck (2, 3) (dimensions [[1, 2, 3], [4, 5, 6]])",

    "frameworkCheck [5]       (getRow 4 [[1], [2], [3], [4], [5], [6], [7]])",
    "frameworkCheck [7, 8, 9] (getRow 2 [[1, 2, 3], [4, 5, 6], [7, 8, 9]])",
    "frameworkCheck [1, 2, 3] (getRow 0 [[1, 2, 3]])",

    "frameworkCheck [2]                   (getCol 1 [[1, 2, 3]])",
    "frameworkCheck [3, 6, 9]             (getCol 2 [[1, 2, 3], [4, 5, 6], [7, 8, 9]])",
    "frameworkCheck [1, 2, 3, 4, 5, 6, 7] (getCol 0 [[1], [2], [3], [4], [5], [6], [7]])",

    "frameworkCheck [4, 2]    (diagonal [[4, 3], [1, 2]])",
    "frameworkCheck [1, 0, 1] (diagonal [[1, 2, 3], [4, 0, 5], [6, 7, 1]])",

    "frameworkCheck [[1], [2], [3]]                   (transpose [[1, 2, 3]])",
    "frameworkCheck [[1, 2, 3, 4, 5, 6, 7]]           (transpose [[1], [2], [3], [4], [5], [6], [7]])",
    "frameworkCheck [[1, 4, 7], [2, 5, 8], [3, 6, 9]] (transpose [[1, 2, 3], [4, 5, 6], [7, 8, 9]])",

    "frameworkCheck [[8], [17], [26]]    (matrixMultiply [[1, 2, 3], [4, 5, 6], [7, 8, 9]] [[0], [1], [2]])",
    "frameworkCheck [[19, 22], [43, 50]] (matrixMultiply [[1, 2], [3, 4]] [[5, 6], [7, 8]])",
    "frameworkCheck [[0, 0, 0]]          (matrixMultiply [[1, 2, 3]] [[0, 1, -3], [-3, 1, 0], [2, -1, 1]])"
  ]

testsProblem2 :: String
testsProblem2 = unlines
  [
    "frameworkCheck [4, 9, 25, 49, 121, 169, 289, 361, 529, 841] (take 10 squarePrimes)",

    "frameworkCheck [2, 4, 6, 8, 10]          (take 5 $ sumStreams [1..] [1..])",
    "frameworkCheck [100, 100, 100, 100, 100] (take 5 $ sumStreams [1, 3..] [99, 97..])",

    "frameworkCheck [1, 0, 1, 0, 1, 0, 1, 0, 1, 0]            (take 10 $ alternateStreams (cycle [1]) (cycle [0]))",
    "frameworkCheck [100, 2, 101, 3, 102, 5, 103, 7, 104, 11] (take 10 $ alternateStreams [100..] primes)"
  ]

testsProblem3 :: String
testsProblem3 = unlines
  [
    "frameworkCheck [7]           (treeLevel (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))) 0)",
    "frameworkCheck [4, 9]        (treeLevel (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))) 1)",
    "frameworkCheck [3, 5, 8, 10] (treeLevel (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))) 2)",
    "frameworkCheck [6, 12]       (treeLevel (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))) 3)",
    "frameworkCheck [11, 13]      (treeLevel (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))) 4)"
  ]

testsProblem4 :: String
testsProblem4 = unlines
  [
    "frameworkCheck [[7], [4, 9], [3, 5, 8, 10], [6, 12], [11, 13]] (treeLevels (Node 7 (Node 4 (Node 3 Empty Empty) (Node 5 Empty (Node 6 Empty Empty))) (Node 9 (Node 8 Empty Empty) (Node 10 Empty (Node 12 (Node 11 Empty Empty) (Node 13 Empty Empty))))))"
  ]

solutionTests :: [String]
solutionTests =
  [
    testsProblem1,
    testsProblem2,
    testsProblem3,
    testsProblem4
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
