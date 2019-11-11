public class Result {
    private Point point;
    private boolean isIncluded;
    private double rArea;

    public Result(Point point, double rArea, boolean isIncluded) {
        this.point = point;
        this.isIncluded = isIncluded;
        this.rArea = rArea;
    }

    public Point getPoint() {
        return point;
    }

    public boolean isIncluded() {
        return isIncluded;
    }

    public double getrArea() {
        return rArea;
    }
}
