import 'package:african_echoes/model/cart.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cart_list_item.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<Book> books = BooksRepository.loadProducts();

  Widget _buildCartItems(BuildContext context, int position, Book book) {
    return CartListItem(book);
  }

  // ignore: missing_return
  Widget _buildCartList(List<Book> books) {
    books.isNotEmpty
        ? SafeArea(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              itemBuilder: (BuildContext context, int index) =>
                  _buildCartItems(context, index, books[index]),
              itemCount: books.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 5.0,
                  thickness: 2.0,
                );
              },
            ),
          )
        : Center(child: Text('YOUR CART IS EMPTY  :( '));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CartModel>(
      builder: (BuildContext context, Widget child, CartModel model) {
        return _buildCartList(model.getCartList);
      },
    );
  }
}
