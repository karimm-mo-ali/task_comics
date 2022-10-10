import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/previous_comic_model.dart';
import '../../../data/repository/previous_comic_repository.dart';
import 'previous_comic_state.dart';

class PreviousComicCubit extends Cubit<PreviousComicState> {
  PreviousComicCubit() : super(PreviousComicInitial());

  final PreviousComicRepoImpl previousComicRepoImpl = PreviousComicRepoImpl();

  Future<PreviousComicModel>? getPreviousComic({required int num}) {
    try {
      emit(PreviousComicLoading());
      previousComicRepoImpl.getPreviousComic(num).then((value) {
        if (value != null) {
          emit(PreviousComicLoaded(value));
        } else {
          emit(PreviousComicFailure());
        }
      });
    } catch (e) {
      emit(PreviousComicFailure());
    }
    return null;
  }
}
