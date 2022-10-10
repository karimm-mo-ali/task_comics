import '../../../data/models/previous_comic_model.dart';

abstract class PreviousComicState {}

class PreviousComicInitial extends PreviousComicState {}

class PreviousComicLoading extends PreviousComicState {}

class PreviousComicLoaded extends PreviousComicState {
  PreviousComicModel previousComicModel;

  PreviousComicLoaded(this.previousComicModel);
}

class PreviousComicFailure extends PreviousComicState {}
