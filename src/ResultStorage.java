import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

public class ResultStorage implements Serializable {

    private static ResultStorage instance;
    private ArrayList<Pair<UUID,Result>> results;

    private ResultStorage() {
        this.results = new ArrayList<>();
    }

    public static synchronized ResultStorage getInstance(){
        if(instance == null)
            instance = new ResultStorage();
        return instance;
    }

    public ArrayList<Pair<UUID,Result>> getResults() {
        return results;
    }

    public ArrayList<Result> getResults(UUID id){
        return results.stream().
                filter(p -> p.getKey().equals(id)).map(Pair::getVal).
                collect(Collectors.toCollection(ArrayList::new));
    }

    public void addResult(UUID userId, double x, double y, double r, boolean isIncluded){
        results.add(new Pair<>(userId,
                new Result(new Point(x, y), r, isIncluded)));
    }
}
