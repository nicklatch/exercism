import java.util.Arrays;

class ResistorColor {
    int colorCode(String color) {
        return Arrays
                .stream(Colors.values())
                .filter(c -> c.name().equalsIgnoreCase(color))
                .findAny()
                .get()
                .ordinal();
    }

    String[] colors() {
        return Arrays
                .stream(Colors.values())
                .map(Colors::name)
                .toArray(String[]::new);
    }

    enum Colors {
        black,
        brown,
        red,
        orange,
        yellow,
        green,
        blue,
        violet,
        grey,
        white,
    }
}
