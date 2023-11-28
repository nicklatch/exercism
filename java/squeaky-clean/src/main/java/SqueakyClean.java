import java.lang.Character;

class SqueakyClean {

    static String clean(String identifier) {
        StringBuilder cleanedIdentifier = new StringBuilder();

        boolean prevCharHyphen = false;

        for (final char char_ : identifier.toCharArray()) {
            if (Character.isLetter(char_) && (char_ < 'α' || char_ > 'ω')) {
                cleanedIdentifier.append(!prevCharHyphen ? char_ : Character.toUpperCase(char_));
            } else if (char_ == ' ') {
                cleanedIdentifier.append('_');
            } else if (Character.isISOControl(char_)) {
                cleanedIdentifier.append("CTRL");
            }

            prevCharHyphen = char_ == '-';
        }

        return cleanedIdentifier.toString();

    }
}
