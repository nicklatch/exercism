import java.util.Random;

class CaptainsLog {

  private static final char[] PLANET_CLASSES = new char[]{'D', 'H', 'J', 'K', 'L', 'M', 'N', 'R',
      'T', 'Y'};

  private final Random random;

  CaptainsLog(Random random) {
    this.random = random;
  }

  char randomPlanetClass() {
    return PLANET_CLASSES[random.nextInt(PLANET_CLASSES.length)];
  }

  String randomShipRegistryNumber() {
    return "NCC-" + random.nextInt(1000, 10000);
  }

  double randomStardate() {
    return random.nextDouble(41000, 42000);
  }
}
