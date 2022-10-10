import '../../../data/models/current_comic_model.dart';

abstract class CurrentComicState {}

class CurrentComicInitial extends CurrentComicState {}

class CurrentComicLoading extends CurrentComicState {}

class CurrentComicLoaded extends CurrentComicState {
  CurrentComicModel currentComicModel;

  CurrentComicLoaded(this.currentComicModel);
}

class CurrentComicFailure extends CurrentComicState {}
