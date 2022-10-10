import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/current_comic_model.dart';
import '../../../data/repositories/current_comic_repository.dart';
import 'current_comic_state.dart';

class CurrentComicCubit extends Cubit<CurrentComicState> {
  CurrentComicCubit() : super(CurrentComicInitial());

  final CurrentComicRepoImpl currentComicRepoImpl = CurrentComicRepoImpl();

  Future<CurrentComicModel>? getCurrentComic() {
    try {
      emit(CurrentComicLoading());
      currentComicRepoImpl.getCurrentComic().then((value) {
        if (value != null) {
          emit(CurrentComicLoaded(value));
        } else {
          emit(CurrentComicFailure());
        }
      });
    } catch (e) {
      emit(CurrentComicFailure());
    }
    return null;
  }
}
