class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
    if (inputBase < 2) {
      Fiber.abort("input base must be >= 2")
    }
    if (outputBase < 2) {
      Fiber.abort("output base must be >= 2")
    }

    var rev_digits = []
    for (digit in digits) {
      if (digit < 0 || digit >= inputBase) {
        Fiber.abort("all digits must satisfy 0 <= d < input base")
      }
      rev_digits.insert(0, digit)
    }

    var value = 0
    var digit_value = 1
    for (digit in rev_digits) {
      value = value + digit_value * digit
      digit_value = digit_value * inputBase
    }

    System.print(value)

    digit_value = outputBase
    var new_digits = []
    while (value > 0) {
      var digit = value % digit_value
      new_digits.insert(0, digit * outputBase / digit_value)
      value = value - digit
      digit_value = digit_value * outputBase
      System.print("%(value), %(new_digits)")
    }

    if (new_digits.count == 0) {
      new_digits = [0]
    }

    return new_digits
  }
}