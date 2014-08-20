#!/usr/bin/env xcrun swift -i

import Foundation // for readline n shit
 
let standardInput = NSFileHandle.fileHandleWithStandardInput()
let standardInputData = standardInput.availableData
let allInput = NSString(data: standardInputData, encoding:NSUTF8StringEncoding) as String
let allLines: [String] = allInput.componentsSeparatedByString("\n") 

// load words + alphabet
let allWords = allLines[0].componentsSeparatedByString(" ").filter({ word in !word.isEmpty })

let alphabetStrings : [String] = allLines[1].componentsSeparatedByString(" ")
let alphabet: [Character] = alphabetStrings.map({ (string: String) -> Character in string[string.startIndex] })

// collect real words
func isRealWord(word: String, alphabet: Array<Character>) -> Bool {
  var myAlphabet = alphabet

  for letter in word {
    if let alphabetLetterIndex = find(myAlphabet, letter) {
      myAlphabet.removeAtIndex(alphabetLetterIndex)
    } else {
      return false
    }
  }

  return true
}

// debug
// for word in allWords { println("All: \"\(word)\"") }

let validWords = allWords.filter({ word -> Bool in isRealWord(String(word), alphabet) })

// debug
// for word in validWords { println("Valid: \(word)") }

// order by length descending
// take first where length same
