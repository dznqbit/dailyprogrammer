import random
import string

class app():
  def __init__(self):
    pass

  def run(self):
    bounds  = [int(x) for x in string.split(raw_input(), " ")]
    numbers = [random.randrange(bounds[0], bounds[1]) for i in range(4)]
    print(str(numbers).strip('[]'))
