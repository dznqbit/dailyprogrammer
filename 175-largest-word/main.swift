#!/usr/bin/env xcrun swift -i

import Foundation
 
let standardInput = NSFileHandle.fileHandleWithStandardInput()
let standardInputData = standardInput.availableData
let allInput = NSString(data: standardInputData, encoding:NSUTF8StringEncoding)
let allLines = allInput.componentsSeparatedByString("\n") 

for line in allLines {
  println(line);
}

// load words + alphabet
// collect real words
// order by length descending
// take first where length same
