import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/category/category.dart';
import 'package:meta/meta.dart';

class CategorysRepository {
  final CategoryApiClient categoryApiClient;

  CategorysRepository({@required this.categoryApiClient})
      : assert(categoryApiClient != null);

  Future getCategory() async {
    return await categoryApiClient.fetchCategory();
  }

  static List<Category> loadCategories() {
    List allProducts = <Category>[
      Category(name: "Art & Entainment"),
      Category(name: "Bios & Memories"),
      Category(name: "Business"),
      Category(name: "Classic"),
      Category(name: "Fiction"),
      Category(name: "History"),
      Category(name: "Self Development"),
      Category(name: "Education"),
      Category(name: "Comedy"),
      Category(name: "Poetry"),
      Category(name: "Kids"),
    ];
    // if (category == Category.all) {
    return allProducts;
    // } else {
    //   return allProducts.where((Product p) {
    //     return p.category == category;
    //   }).toList();
    // }
  }
}
