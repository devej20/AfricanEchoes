part of 'laguage_cubit.dart';

abstract class LanguageState {
  const LanguageState();
}

class LaguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {
  const LanguageLoading();
}

class LanguageLoaded extends LanguageState {
  final List<Language> language;
  const LanguageLoaded(this.language);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LanguageLoaded && o.language == language;
  }

  @override
  int get hashCode => language.hashCode;
}

class LanguageError extends LanguageState {
  final String message;
  const LanguageError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LanguageError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
