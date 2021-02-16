import 'package:african_echoes/repositories/languages/laguages_repository.dart';
import 'package:african_echoes/repositories/languages/languages_api_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'bloc/bloc.dart';
import 'bloc/book/featured/featured_bloc.dart';
import 'bloc/book/new_books/new_book_bloc.dart';
import 'bloc/book/top_chart/top_chart_bloc.dart';
import 'bloc/book_images/book_images_bloc.dart';
import 'bloc/cubit/laguage_cubit.dart';
import 'bloc/download_task/download_task_bloc.dart';
import 'colors.dart';
import 'dao/donwload_task_dao.dart';
import 'pages/page.dart';
import 'repositories/book_image/book_image.dart';
import 'repositories/repositories.dart';
import 'routes/route_generator.dart';
import 'widget/widget.dart';

void main() async {
  await FlutterDownloader.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // BlocSupervisor.delegate = SimpleBlocDelegate();

  final userRepository =
      UserRepository(userApiClient: UserApiClient(httpClient: http.Client()));

  final bookRepository =
      BooksRepository(bookApiClient: BookApiClient(httpClient: http.Client()));

  final categorysRepository = CategorysRepository(
      categoryApiClient: CategoryApiClient(httpClient: http.Client()));

  final languageRepository = LanguagesRepository(
      languageApiClient: LanguageApiClient(httpClient: http.Client()));

  final bookImageRepository = BookImageRepository(
      bookImageApiClient: BookImageApiClient(httpClient: http.Client()));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
      BlocProvider<BookBloc>(
        create: (context) {
          return BookBloc(booksRepository: bookRepository);
        },
      ),
      BlocProvider<TopChartBloc>(
        create: (context) {
          return TopChartBloc(booksRepository: bookRepository);
        },
      ),
      BlocProvider<NewBookBloc>(
        create: (context) {
          return NewBookBloc(booksRepository: bookRepository);
        },
      ),
      BlocProvider<FeaturedBloc>(
        create: (context) {
          return FeaturedBloc(booksRepository: bookRepository);
        },
      ),
      BlocProvider<BookImagesBloc>(
        create: (context) {
          return BookImagesBloc(bookImageRepository: bookImageRepository);
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return CategoryBloc(categorysRepository: categorysRepository);
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return LaguageCubit(languageRepository);
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return BookBloc(
              booksRepository: BooksRepository(
                  bookApiClient: BookApiClient(httpClient: http.Client())));
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return DownloadTaskBloc(
              downloadRepository:
                  DownloadTaskRepository(downloadTaskDao: DownloadTaskDao()));
        },
      ),
    ],
    child: App(
      userRepository: userRepository,
    ),
  ));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  const App({Key key, @required this.userRepository}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generatorRoute,
      title: "Afrikan Echoes Publishers",
      theme: _buildAfricanEchoesTheme(
        ctx: context,
      ),
      home:
          // AudioServiceWidget(
          //   child:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            // return HomePage();
            return LandingPage(
              userRepository: widget.userRepository,
            );
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
      // ),
    );
  }
}

ThemeData _buildAfricanEchoesTheme({@required BuildContext ctx}) {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: GoogleFonts.ubuntuTextTheme(
      Theme.of(ctx).textTheme,
    ),
    accentColor: colorPrimary,
    primaryColor: colorSecondary,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: colorSecondary,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: kShrineBackgroundWhite,
    errorColor: kShrineErrorRed,
  );
}
