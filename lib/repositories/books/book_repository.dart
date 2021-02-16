import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/books/book.dart';
import 'package:meta/meta.dart';

class BooksRepository {
  final BookApiClient bookApiClient;

  BooksRepository({@required this.bookApiClient})
      : assert(bookApiClient != null);

  Future getBook() async {
    return await bookApiClient.fetchBook();
  }

  Future getBookByCategory({@required int categoryId}) async {
    return await bookApiClient.fetchBookByCategory(categoryId: categoryId);
  }

  Future getBookByLanguage({@required int languageId}) async {
    return await bookApiClient.fetchBookByLanguage(languageId: languageId);
  }

  Future getBookByFeatured() async {
    return await bookApiClient.fetchBookByFeaatured();
  }

  Future getBookByNew() async {
    return await bookApiClient.fetchBookByNew();
  }

  Future getBookByTopChart() async {
    return await bookApiClient.fetchBookByTopChart();
  }

  static List<Book> loadProducts() {
    List allProducts = <Book>[
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
      Book(
        title: "Africa Must Unite",
        author: "Kwame Nkruma",
        coverImage:
            "https://images-na.ssl-images-amazon.com/images/I/41rIdUgXviL._SX321_BO1,204,203,200_.jpg",
        audioUrl:
            "https://www.blissgh.com/wp-content/uploads/2019/10/Kofi-Kinaata-%E2%80%93-Things-Fall-Apart-Prod-by-Two-Bars.mp3",
      ),
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
