import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/laguage_cubit.dart';
import '../model/language.dart';
import 'languages_list_item.dart';
import 'loading_indicator.dart';

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  @override
  void initState() {
    BlocProvider.of<LaguageCubit>(context).getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaguageCubit, LanguageState>(builder: (context, state) {
      if (state is LanguageLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      } else if (state is LanguageLoaded) {
        final languages = state.language;
        return _buildLanguageList(
          languages,
        );
      } else {
        return Center();
      }
    });
  }

  Widget _buildLanguageList(List<Language> languages) {
    return languages.isNotEmpty
        ? Container(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                itemCount: languages.length,
                itemBuilder: (BuildContext context, int index) =>
                    LanguagesListItem(
                      language: languages[index],
                    )),
          )
        : Center(child: Text('No languages avialable'));
  }
}
