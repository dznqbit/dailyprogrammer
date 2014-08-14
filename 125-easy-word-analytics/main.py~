# http://www.reddit.com/r/dailyprogrammer/comments/1e97ob/051313_challenge_125_easy_word_analytics/

import sys
import re
from collections import defaultdict
from operator import itemgetter

class KillerWordLikeApplicationDocumentAnalyzer():
  def __init__(self, document):
    self.document = document.lower()

  def __words(self):
    return re.sub(r"[^\w|\s]", "", self.document).split()
  
  def __letters(self):
    return re.sub(r"\W", "", self.document)

  @classmethod
  def __countEntities(cls, list):
    def countOccurence(dict, item):
      dict[item] += 1
      return dict

    return reduce(countOccurence, list, defaultdict(int)).items()

  @classmethod
  def __mostCommonEntities(cls, list):
    return map(
      itemgetter(0), 
      sorted(
        KillerWordLikeApplicationDocumentAnalyzer.__countEntities(list),
        key=itemgetter(1), reverse=True
      )
    )

  def wordCount(self):
    return len(self.__words())

  def letterCount(self):
    return len(self.__letters())

  def symbolCount(self):
    return len(re.sub(r"\w|\s", "", self.document))

  def commonWords(self, count):
    return KillerWordLikeApplicationDocumentAnalyzer.__mostCommonEntities(self.__words())[0:count]
    
  def commonLetters(self, count):
    return KillerWordLikeApplicationDocumentAnalyzer.__mostCommonEntities(self.__letters())[0:count]

  def mostCommonParagraphLeader(self):
    paragraphs = filter(lambda p: len(p) > 0, re.split(r"\n\n", self.document))
        
    if len(paragraphs) > 0:
      countedEntities = KillerWordLikeApplicationDocumentAnalyzer.__mostCommonEntities(
        map(lambda line: re.match(r"\w+", line).group(0), paragraphs)
      )
    
      return countedEntities[0]
    else:
      return None

  def uniqueWords(self):
    return map(
      itemgetter(0),
      filter(
        lambda wordAndCount: wordAndCount[1] == 1,
        KillerWordLikeApplicationDocumentAnalyzer.__countEntities(self.__words())
      )
    )

  def unusedLetters(self):
    return list(
      filter(
        lambda letter: self.document.find(letter) < 0,
        "abcdefghijklmnopqrstuvwxyz"
      )
    )

with open(sys.argv[1], "r") as file:
  analyzer = KillerWordLikeApplicationDocumentAnalyzer(file.read())

print("{0} words".format(analyzer.wordCount()))
print("{0} letters".format(analyzer.letterCount()))
print("{0} symbols".format(analyzer.symbolCount()))

formatWord = lambda x: "\"{}\"".format(x)
formatLetter = lambda x: "'{}'".format(x)

commonWords = analyzer.commonWords(3)
if len(commonWords) > 0:
  print("Top three most common words: {0}".format(", ".join(map(formatWord, commonWords))))

commonLetters = analyzer.commonLetters(3)
if len(commonLetters) > 0:
  print("Top three most common letters: {0}".format(", ".join(map(formatLetter, commonLetters))))

commonParagraphLeader = analyzer.mostCommonParagraphLeader()
if commonParagraphLeader:
  print("{0} is the most common first word of all paragraphs".format(formatWord(commonParagraphLeader)))

uniqueWords = analyzer.uniqueWords()
if len(uniqueWords) > 0:
  print("Words used only once: {0}".format(", ".join(map(formatWord, uniqueWords))))

unusedLetters = analyzer.unusedLetters()
if len(unusedLetters) > 0:
  print("Letters not used in this document: {0}".format(", ".join(map(formatLetter, unusedLetters))))
