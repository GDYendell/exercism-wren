import "random" for Random

class Util {
  static abilityModifier(n) {
    if (n < 3) {
      Fiber.abort("Ability scores must be at least 3")
    }
    if (n > 18) {
      Fiber.abort("Ability scores can be at most 18")
    }
    return ((n - 10) / 2).floor
  }
}

class Character {
  static rollAbility() {
    var random = Random.new()

    return (1..4).
      map {|x| random.int(1, 6)}.
      toList.
      sort {|a, b| a < b}.
      take(3).
      reduce {|acc, x| acc + x}
  }

  construct new() {
    _strength = Character.rollAbility()
    _dexterity = Character.rollAbility()
    _constitution = Character.rollAbility()
    _intelligence = Character.rollAbility()
    _wisdom = Character.rollAbility()
    _charisma = Character.rollAbility()
  }

  strength { _strength }
  dexterity { _dexterity }
  constitution { _constitution }
  intelligence { _intelligence }
  wisdom { _wisdom }
  charisma { _charisma }

  hitpoints { 10 + Util.abilityModifier(constitution) }
}
