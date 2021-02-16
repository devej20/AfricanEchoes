import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../model/category.dart';
import 'category_list_item.dart';
import 'widget.dart';

class CategoryList extends StatefulWidget {
  // final List<Category> categories = CategorysRepository.loadCategories();

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // ignore: unused_field
  List<Category> _list = [
    Category(
      id: 1,
      name: "one",
    ),
    Category(
      id: 1,
      name: "tew",
    ),
    Category(
      id: 1,
      name: "three",
    ),
    Category(
      id: 1,
      name: "four",
    ),
    Category(
      id: 1,
      name: "five",
    ),
    Category(
      id: 1,
      name: "six",
    ),
    Category(
      id: 1,
      name: "seven",
    ),
    Category(
      id: 1,
      name: "eight",
    ),
    Category(
      id: 1,
      name: "nine",
    ),
    Category(
      id: 1,
      name: "ten",
    ),
    Category(
      id: 1,
      name: "one",
    ),
    Category(
      id: 1,
      name: "tew",
    ),
    Category(
      id: 1,
      name: "three",
    ),
    Category(
      id: 1,
      name: "four",
    ),
    Category(
      id: 1,
      name: "five",
    ),
    Category(
      id: 1,
      name: "six",
    ),
    Category(
      id: 1,
      name: "seven",
    ),
    Category(
      id: 1,
      name: "eight",
    ),
    Category(
      id: 1,
      name: "nine",
    ),
    Category(
      id: 1,
      name: "ten",
    ),
  ];
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CategoryBloc>(context).add(FetchCategory());
  }

  @override
  Widget build(BuildContext context) {
    // return _buildCategoryList(_list);
    // ignore: missing_return
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      }

      if (state is CategoryLoaded) {
        final categories = state.categories;
        return _buildCategoryList(categories);
      }

      if (state is CategoryErorr) {
        return Center();
      }
    });
  }

  Widget _buildCategoryItems(int position, Category category) {
    return CategoryListItem(category: category);
  }

  Widget _buildCategoryList(List<Category> categories) {
    var size = MediaQuery.of(context).size;

    print("Category list: $size");
    final double itemHeight = (size.height - kToolbarHeight - 84) / 4;
    print("Category list: $itemHeight");
    final double itemWidth = size.width / 2;
    print("Category list: $itemWidth");
    return categories.isNotEmpty
        ? Container(
            height: 120,
            width: 300,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (BuildContext context, int index) =>
                  _buildCategoryItems(
                index,
                categories[index],
              ),
            ),
          )
        : Center(child: Text('No avialable category'));
  }
}
