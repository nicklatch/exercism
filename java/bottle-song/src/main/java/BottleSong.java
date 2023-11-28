import java.util.Arrays;
import java.util.List;

class BottleSong {

    List<String> bottles = Arrays.asList("no", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten");

    String song(String firstBottle, String next) {
        if (firstBottle.equals("One")) {
            return """
                    One green bottle hanging on the wall,
                    One green bottle hanging on the wall,
                    And if one green bottle should accidentally fall,
                    There'll be no green bottles hanging on the wall.
                    """;
        } else if (firstBottle.equals("Two")) {
            return """
                    Two green bottles hanging on the wall,
                    Two green bottles hanging on the wall,
                    And if one green bottle should accidentally fall,
                    There'll be one green bottle hanging on the wall.
                    """ + "\n";
        }
        return String.format(("""
                %s green bottles hanging on the wall,
                %s green bottles hanging on the wall,
                And if one green bottle should accidentally fall,
                There'll be %s green bottles hanging on the wall.
                """ + "\n"), firstBottle, firstBottle, next.toLowerCase());
    }


    String recite(int startBottles, int takeDown) {
        StringBuilder songBuilder = new StringBuilder();

        for (int i = startBottles; i > startBottles - takeDown; i--) {
            songBuilder.append(song(bottles.get(i), bottles.get(i - 1)));
        }

        return songBuilder.toString().trim() + "\n";
    }
}