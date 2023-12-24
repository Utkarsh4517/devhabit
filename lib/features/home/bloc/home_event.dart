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
