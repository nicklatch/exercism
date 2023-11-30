public class ElonsToyCar {

  private int odometer = 0;
  private int batteryLevel = 100;


  public static ElonsToyCar buy() {
    return new ElonsToyCar();
  }

  public String distanceDisplay() {
    return "Driven " + odometer + " meters";
  }

  public String batteryDisplay() {
    return batteryLevel > 0 ? "Battery at " + batteryLevel + "%" : "Battery empty";
  }

  public void drive() {
    if (batteryLevel != 0) {
      odometer += 20;
      batteryLevel -= 1;
    }
  }
}

