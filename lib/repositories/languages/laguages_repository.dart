import 'package:african_echoes/model/language.dart';
import 'package:meta/meta.dart';

import 'languages_api_client.dart';

class LanguagesRepository {
  final LanguageApiClient languageApiClient;

  LanguagesRepository({@required this.languageApiClient})
      : assert(languageApiClient != null);

  Future getLanguage() async {
    return await languageApiClient.fetchLanguage();
  }

  static List<Language> loadCategories() {
    List allProducts = <Language>[
      Language(name: "Art & Entainment"),
      Language(name: "Bios & Memories"),
      Language(name: "Business"),
      Language(name: "Classic"),
      Language(name: "Fiction"),
      Language(name: "History"),
      Language(name: "Self Development"),
      Language(name: "Education"),
      Language(name: "Comedy"),
      Language(name: "Poetry"),
      Language(name: "Kids"),
    ];
    // if (language == Language.all) {
    return allProducts;
    // } else {
    //   return allProducts.where((Product p) {
    //     return p.language == language;
    //   }).toList();
    // }
  }
}
