import random
import string

class app():
  def __init__(self):
    pass

  def run(self):
    bounds  = [int(x) for x in string.split(raw_input(), " ")]
    self.question(bounds)

  def question(self, bounds):
    numbers = [random.randrange(bounds[0], bounds[1]) for i in range(4)]

    equation = reduce(
      lambda memo, num: 
        ' '.join([memo, random.choice(["+", "-", "x"]), str(num)]) if len(memo) > 0 else str(num),
      numbers,
      ""
    )

    print(equation)

