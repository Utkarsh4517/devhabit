import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:devhabit/features/home/repo/gemini_services.dart';
import 'package:devhabit/features/home/repo/home_firebase_services.dart';
import 'package:devhabit/models/roadmap_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<GenerateRoadmapEvent>(generateRoadmapEvent);
    on<DayTileClickedEvent>(dayTileClickedEvent);
    on<CheckBoxClickedEvent>(checkBoxClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(RoadmapLoadingState());
    final doesRoadmapExist = await HomeFirebaseServices.checkRoadmap();
    if (doesRoadmapExist) {
      emit(RoadmapExistState());
    } else if (!doesRoadmapExist) {
      emit(RoadmapDoesNotExistState());
    }
  }

  FutureOr<void> generateRoadmapEvent(
      GenerateRoadmapEvent event, Emitter<HomeState> emit) async {
    await HomeFirebaseServices.deleteRoadmap();
    dynamic output = await HomeRepo.generateRoadmap(
      domain: event.domain,
      days: event.days,
      experience: event.experience,
    );

    final roadmaps = HomeRepo.extractInformation(output);
    await HomeFirebaseServices.addRoadmapsToFirebase(
      roadmaps,
    );
    await HomeFirebaseServices.updateIsRoadmap();
    emit(RoadmapCreatedActionState(days: event.days, domain: event.domain));
    emit(RoadmapCreatedState(roadmaps: roadmaps));
  }

  FutureOr<void> dayTileClickedEvent(
      DayTileClickedEvent event, Emitter<HomeState> emit) {
    emit(DayTileClickedState(index: event.index));
  }

  FutureOr<void> checkBoxClickedEvent(
      CheckBoxClickedEvent event, Emitter<HomeState> emit) {
    // emit a state which opens a dialog box which can accept user response...
    emit(OpenUserResponseDialogBoxState(
      roadmapModel: event.roadmap,
      task: event.task,
      taskName: event.taskName,
    ));
    print('checkbox clicked for ${event.roadmap.day} ${event.task}');
  }
}
