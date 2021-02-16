abstract class FeaturedEvent {
  FeaturedEvent();
}

class FetchBooksByFeatured extends FeaturedEvent {
  FetchBooksByFeatured();

  @override
  String toString() {
    return "FetchBooksByFeatured";
  }
}
