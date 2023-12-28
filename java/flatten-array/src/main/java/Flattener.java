import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

class Flattener {
    @SuppressWarnings("unchecked")
    public <T> List<T> flatten(List<?> array) {
        return (List<T>) array.stream()
                .filter(Objects::nonNull)
                .flatMap(n -> n instanceof List ?
                        flatten((List<?>) n).stream() :
                        Stream.of((T) n))
                .collect(Collectors.toList());
    }
}
