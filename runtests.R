library('RUnit')
source('cachematrix.R')

test.suite <- defineTestSuite(
  "cachematrix",
  dirs = file.path("tests"),
  testFileRegexp = '*_tests.R'
)

test.result <- runTestSuite(test.suite)
printTextProtocol(test.result)