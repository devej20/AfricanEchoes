import 'package:african_echoes/model/book.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  List<Book> _cartList = [];

  List<Book> get getCartList {
    return List.from(_cartList);
  }

  void addToCart(Book book) {
    _cartList.add(book);
    notifyListeners();
  }
}
