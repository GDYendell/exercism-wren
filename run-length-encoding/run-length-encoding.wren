class RLE {
  static encode(s) {
    var output = ""
    var element = ""
    var count = 1
    s = s + "."
    for (c in s) {
      if (element == c) {
        count = count + 1
      } else {
        if (count > 1) {
          output = output + "%(count)%(element)"
        } else {
          output = output + element
        }
        element = c
        count = 1
      }
    }

    return output
  }
  static decode(s) {
    var output = ""

    var count = ""
    for (c in s) {
      System.print("'%(c)'")
      if (c != " " && Num.fromString(c)) {
        count = count + c
      } else {
        count = Num.fromString(count)
        if (!count) { count = 1 }
        output = output + "%((1..count).map{|n| c}.join())"
        count = ""
      }
    }

    return output
  }
}
