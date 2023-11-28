import java.util.Optional;

class Badge {

  public String print(Integer id, String name, String department) {
    StringBuilder badgeInfo = new StringBuilder();

    Optional.ofNullable(id)
        .ifPresent(presentId -> badgeInfo.append(String.format("[%d] - ", presentId)));

    Optional.ofNullable(name)
        .ifPresent(presentName -> badgeInfo.append(String.format("%s - ", name)));

    badgeInfo.append(department == null ? "OWNER" : department.toUpperCase());

    return badgeInfo.toString();
  }
}
