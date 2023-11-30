
class ProductionRemoteControlCar implements RemoteControlCar,
    Comparable<ProductionRemoteControlCar> {

  private int distanceTravelled;
  private int victories;

  public ProductionRemoteControlCar() {
    this.distanceTravelled = 0;
    this.victories = 0;
  }

  public void drive() {
    distanceTravelled += 10;
  }

  public int getDistanceTravelled() {
    return distanceTravelled;
  }

  public int getNumberOfVictories() {
    return victories;
  }

  public void setNumberOfVictories(int numberOfVictories) {
    victories += numberOfVictories;
  }

  @Override
  public int compareTo(ProductionRemoteControlCar car) {
    return Integer.compare(this.victories, car.getNumberOfVictories());
  }
}
