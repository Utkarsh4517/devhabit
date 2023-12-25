part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class GenerateRoadmapEvent extends HomeEvent {
  final String domain;
  final String days;
  final String experience;
  GenerateRoadmapEvent({
    required this.domain,
    required this.days,
    required this.experience,
  });
}

class DayTileClickedEvent extends HomeEvent {
  final int index;
  DayTileClickedEvent({
    required this.index,
  });
}

class CheckBoxClickedEvent extends HomeEvent {
  final RoadmapModel roadmap;
  final String task;
  final String taskName;
  CheckBoxClickedEvent({
    required this.roadmap,
    required this.task,
    required this.taskName,
  });
}
