import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/book_image/book_image_api_client.dart';
import 'package:meta/meta.dart';

class BookImageRepository {
  final BookImageApiClient bookImageApiClient;

  BookImageRepository({@required this.bookImageApiClient})
      : assert(bookImageApiClient != null);

  Future<List<BookImage>> getBookImages() async {
    return await bookImageApiClient.fetchBookImage();
  }
}
