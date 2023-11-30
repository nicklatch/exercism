abstract class Fighter {

  boolean isVulnerable() {
    return false;
  }

  abstract int damagePoints(Fighter fighter);

}

class Warrior extends Fighter {

  @Override
  public String toString() {
    return "Fighter is a Warrior";
  }

  @Override
  int damagePoints(Fighter fighter) {
    return fighter.isVulnerable() ? 10 : 6;
  }
}

class Wizard extends Fighter {

  private boolean hasSpell = false;

  @Override
  public String toString() {
    return "Fighter is a Wizard";
  }

  @Override
  boolean isVulnerable() {
    return !hasSpell;
  }

  @Override
  int damagePoints(Fighter fighter) {
    return hasSpell ? 12 : 3;
  }

  void prepareSpell() {
    this.hasSpell = true;
  }

}
