import random
import string

class app():
  def run(self):
    bounds  = [int(x) for x in string.split(raw_input(), " ")]

    while 1 == 1:
      equation  = self.build_equation(bounds)
      answer    = self.answer(equation)

      if answer == "q":
        break
      else:
        print("Correct!")

  def build_equation(self, bounds):
    numbers = [random.randrange(min(bounds), max(bounds)) for i in range(4)]

    equation = reduce(
      lambda memo, num: 
        ' '.join([memo, random.choice(["+", "-", "*"]), str(num)]) if len(memo) > 0 else str(num),
      numbers,
      ""
    )

    return equation

  def answer(self, equation):
    solution = eval(equation)

    print(equation)
    user_input = raw_input().lower()

    while user_input not in ["q", str(solution)]:
      print("Incorrect...")
      print(equation)
      user_input = raw_input().lower()

    return user_input
