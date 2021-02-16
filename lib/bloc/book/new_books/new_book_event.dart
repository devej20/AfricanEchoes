abstract class NewBookEvent {
  NewBookEvent();
}

class FetchBooksByNewBook extends NewBookEvent {
  FetchBooksByNewBook();

  @override
  String toString() {
    return "FetchBooksByTopChart";
  }
}
