import '../../../data/models/next_comic_model.dart';

abstract class NextComicState {}

class NextComicInitial extends NextComicState {}

class NextComicLoading extends NextComicState {}

class NextComicLoaded extends NextComicState {
  NextComicModel nextComicModel;

  NextComicLoaded(this.nextComicModel);
}

class NextComicFailure extends NextComicState {}
