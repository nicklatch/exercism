class RaindropConverter {

    String convert(int number) {
        StringBuilder rainDrops = new StringBuilder();
        if (number % 3 == 0) {
            rainDrops.append("Pling");
        }

        if (number % 5 == 0) {
            rainDrops.append("Plang");
        }

        if (number % 7 == 0) {
            rainDrops.append("Plong");
        }

        if (rainDrops.isEmpty()) {
            return String.valueOf(number);
        }

        return rainDrops.toString();
    }

}
