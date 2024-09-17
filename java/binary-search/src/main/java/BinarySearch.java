import java.util.List;

class BinarySearch {

    List<Integer> items;

    BinarySearch(List<Integer> items) {
        this.items = items;
    }

    int indexOf(int item) throws ValueNotFoundException {
        int low = 0;
        int high = this.items.size() - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int midVal = this.items.get(mid);

            if (midVal == item) {
                return mid;
            } else if (midVal > item) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        throw new ValueNotFoundException("Value not in array");
    }
}
