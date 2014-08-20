#!/usr/bin/env xcrun swift -i

import Foundation // for readline n shit
 
let standardInput = NSFileHandle.fileHandleWithStandardInput()
let standardInputData = standardInput.availableData
let allInput = NSString(data: standardInputData, encoding:NSUTF8StringEncoding) as String
let allLines: [String] = allInput.componentsSeparatedByString("\n") 

// load words + alphabet
let allWords = allLines[0]
  .componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
  .filter({ word in !word.isEmpty })

let alphabetStrings : [String] = allLines[1].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
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
for word in allWords { println("All: \"\(word)\"") }

let validWords = allWords.filter({ word -> Bool in isRealWord(String(word), alphabet) })

if (validWords.isEmpty) {
  println("No Words Found")
} else {
  // debug
  // for word in validWords { println("Valid: \(word)") }

  // order by length descending
  let orderedAndValidWords = validWords.sorted { countElements($0) > countElements($1) }

  // debug
  //for word in orderedAndValidWords { println("Ordered and Valid: \(word)") }

  // take first where length same
  let numberOfCharactersInFirstWord = countElements(orderedAndValidWords[0])
  let longestWords = orderedAndValidWords.filter { countElements($0) == numberOfCharactersInFirstWord }

  println(" ".join(longestWords))
}
