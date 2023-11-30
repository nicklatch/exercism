class NeedForSpeed {

  private final int speed;
  private final int batteryDrain;
  private int totalBattery = 100;
  private int totalDistanceDriven = 0;

  NeedForSpeed(int speed, int batteryDrain) {
    this.batteryDrain = batteryDrain;
    this.speed = speed;
  }

  public boolean batteryDrained() {
    return totalBattery == 0;
  }

  public int distanceDriven() {
    return totalDistanceDriven;
  }

  public void drive() {
    if (totalBattery != 0) {
      this.totalBattery -= this.batteryDrain;
      this.totalDistanceDriven += this.speed;
    }
  }

  public static NeedForSpeed nitro() {
    return new NeedForSpeed(50, 4);
  }
}

class RaceTrack {

  private final int distance;

  RaceTrack(int distance) {
    this.distance = distance;
  }

  public boolean tryFinishTrack(NeedForSpeed car) {
    while (!car.batteryDrained()) {
      car.drive();
    }

    return car.distanceDriven() >= distance;
  }
}
