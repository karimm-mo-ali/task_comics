import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/Next_comic_model.dart';
import '../../../data/repository/next_comic_repository.dart';
import 'next_comic_state.dart';

class NextComicCubit extends Cubit<NextComicState> {
  NextComicCubit() : super(NextComicInitial());

  final NextComicRepoImpl nextComicRepoImpl = NextComicRepoImpl();

  Future<NextComicModel>? getNextComic({required int num}) {
    try {
      emit(NextComicLoading());
      nextComicRepoImpl.getNextComic(num).then((value) {
        if (value != null) {
          emit(NextComicLoaded(value));
        } else {
          emit(NextComicFailure());
        }
      });
    } catch (e) {
      emit(NextComicFailure());
    }
    return null;
  }
}
