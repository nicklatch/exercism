import java.util.HashSet;
import java.util.List;
import java.util.Set;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        return new HashSet<String>(cards);
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        return myCollection.retainAll(theirCollection) && theirCollection.retainAll(myCollection);
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        Set<String> result = new HashSet<>();
        if (!collections.isEmpty()) {
            result.addAll(collections.get(0));
            collections.forEach(result::retainAll);
        }
        return result;
    }

    static Set<String> allCards(List<Set<String>> collections) {
        Set<String> result = new HashSet<>();
        collections.forEach(result::addAll);
        return result;
    }
}
