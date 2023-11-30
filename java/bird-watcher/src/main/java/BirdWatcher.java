import java.util.Arrays;
import java.util.function.IntPredicate;

class BirdWatcher {

  private final int[] birdsPerDay;

  private int today;

  public BirdWatcher(int[] birdsPerDay) {
    this.birdsPerDay = birdsPerDay.clone();
    this.today = birdsPerDay.length - 1;
  }

  public int[] getLastWeek() {
    return birdsPerDay;
  }

  public int getToday() {
    return birdsPerDay[today];
  }

  public void incrementTodaysCount() {
    birdsPerDay[today] += 1;
  }

  public boolean hasDayWithoutBirds() {
    return Arrays.stream(birdsPerDay).filter(day -> day == 0).count() > 0;
  }

  public int getCountForFirstDays(int numberOfDays) {
    return Arrays.stream(Arrays.copyOfRange(birdsPerDay, 0, numberOfDays)).sum();
  }

  public int getBusyDays() {
    return (int) Arrays.stream(birdsPerDay).filter(day -> day > 4).count();
  }
}
