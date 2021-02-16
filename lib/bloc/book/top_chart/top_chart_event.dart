abstract class TopChartEvent {
  TopChartEvent();
}

class FetchBooksByTopChart extends TopChartEvent {
  FetchBooksByTopChart();

  @override
  String toString() {
    return "FetchBooksByTopChart";
  }
}
