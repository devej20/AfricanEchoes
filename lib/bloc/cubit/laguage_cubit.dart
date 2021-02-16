import 'package:bloc/bloc.dart';

import '../../model/language.dart';
import '../../repositories/languages/laguages_repository.dart';

part 'laguage_state.dart';

class LaguageCubit extends Cubit<LanguageState> {
  final LanguagesRepository _languagesRepository;
  LaguageCubit(this._languagesRepository) : super(LaguageInitial());

  Future<void> getLanguage() async {
    try {
      emit(LanguageLoading());
      final language = await _languagesRepository.getLanguage();
      emit(LanguageLoaded(language));
    } catch (e) {
      emit(LanguageError("Couldn't fetch language. Is the device online?"));
    }
  }
}
