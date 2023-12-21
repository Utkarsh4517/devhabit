import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ide_event.dart';
part 'ide_state.dart';

class IdeBloc extends Bloc<IdeEvent, IdeState> {
  IdeBloc() : super(IdeInitial()) {
    on<IdeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

