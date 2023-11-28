import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {

  private final LocalDateTime dtMoment;

  public Gigasecond(LocalDate moment) {
    this.dtMoment = moment.atStartOfDay();
  }

  public Gigasecond(LocalDateTime moment) {
    this.dtMoment = moment;
  }

  public LocalDateTime getDateTime() {
    return dtMoment.plusSeconds(1000000000);
  }
}
