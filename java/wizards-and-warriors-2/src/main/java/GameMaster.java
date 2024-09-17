public class GameMaster {

    public static String describe(Character character) {
        return String.format("You're a level %d %s with %d hit points.",
                character.getLevel(),
                character.getCharacterClass(),
                character.getHitPoints());
    }

    public static String describe(Destination destination) {
        return String.format("You've arrived at %s, which has %d inhabitants.",
                destination.getName(),
                destination.getInhabitants());
    }

    public static String describe(TravelMethod travelMethod) {
        return switch (travelMethod) {
            case WALKING -> "You're traveling to your destination by walking.";
            case HORSEBACK -> "You're traveling to your destination on horseback.";
        };
    }

    public static String describe(Character character, Destination destination, TravelMethod travelMethod) {
        return describe(character) + " " + describe(travelMethod) + " " + describe(destination);
    }

    public static String describe(Character character, Destination destination) {
        return describe(character) + " " + describe(TravelMethod.WALKING) + " " + describe(destination);
    }
}
