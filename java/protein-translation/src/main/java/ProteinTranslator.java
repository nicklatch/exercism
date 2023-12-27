import java.util.ArrayList;
import java.util.List;

class ProteinTranslator {

    List<String> translate(String rnaSequence) {
        List<String> parsedRnaSequence = List.of(rnaSequence.split("(?<=\\G.{" + 3 + "})"));
        List<String> convertedRnaSequence = new ArrayList<>();

        convert:
        for (String rnaSeq : parsedRnaSequence) {
            switch (rnaSeq) {
                case "AUG" -> convertedRnaSequence.add("Methionine");
                case "UUU", "UUC" -> convertedRnaSequence.add("Phenylalanine");
                case "UUA", "UUG" -> convertedRnaSequence.add("Leucine");
                case "UCU", "UCC", "UCA", "UCG" -> convertedRnaSequence.add("Serine");
                case "UAU", "UAC" -> convertedRnaSequence.add("Tyrosine");
                case "UGU", "UGC" -> convertedRnaSequence.add("Cysteine");
                case "UGG" -> convertedRnaSequence.add("Tryptophan");
                case "UAA", "UAG", "UGA" -> {
                    break convert;
                }
            }
        }
        return convertedRnaSequence;
    }

}
