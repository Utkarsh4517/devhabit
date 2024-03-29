part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class RoadmapLoadingState extends HomeState {}

class RoadmapExistState extends HomeState {}

class RoadmapDoesNotExistState extends HomeState {}

class RoadmapCreatedActionState extends HomeActionState {
  final String domain;
  final String days;
  RoadmapCreatedActionState({
    required this.domain,
    required this.days,
  });
}

class RoadmapCreatedState extends HomeState {
  final List<RoadmapModel> roadmaps;
  RoadmapCreatedState({
    required this.roadmaps,
  });
}

class DayTileClickedState extends HomeActionState {
  final int index;
  DayTileClickedState({
    required this.index,
  });
}

class OpenUserResponseDialogBoxState extends HomeActionState {
  final RoadmapModel roadmapModel;
  final String task;
  final String taskName;
  OpenUserResponseDialogBoxState({
    required this.roadmapModel,
    required this.task,
    required this.taskName,
  });
}
