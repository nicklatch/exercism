public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        if (speed < 5) {
            return speed * 221;
        } else if (speed < 9) {
            return (speed * 221) * 0.9;
        } else if (speed == 9) {
            return 1989 * 0.8;
        } else {
            return 2210 * 0.77;
        }
    }

    public int workingItemsPerMinute(int speed) {
        return (int) productionRatePerHour(speed) / 60;
    }
}