class Flatten {
  static flatten(list) {
    var new_list = []
    for (entry in list) {
      if (!entry) continue

      if (entry is Sequence) {
        new_list = new_list + flatten(entry)
      } else {
        new_list = new_list + [entry]
      }
    }

    return new_list
  }
}