areaOfTriangle :: Double -> Double -> Double -> Double
areaOfTriangle a b c = areaOfTriangleHelper a b c ((a + b + c) / 2.0)

areaOfTriangleHelper :: Double -> Double -> Double -> Double -> Double
areaOfTriangleHelper a b c s = sqrt (s * (s - a) * (s - b) * (s - c))

