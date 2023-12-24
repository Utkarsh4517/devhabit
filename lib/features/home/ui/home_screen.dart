import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:devhabit/constants/colors.dart';
import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/bloc/home_bloc.dart';
import 'package:devhabit/features/home/ui/roadmap_does_not_exist_ui.dart';
import 'package:devhabit/features/home/ui/roadmap_exist_ui.dart';
import 'package:devhabit/features/home/ui/roadmap_loading_ui.dart';
import 'package:devhabit/features/home/widgets/primary_popular_card.dart';
import 'package:devhabit/features/home/widgets/roadmap_creator_dialog.dart';
import 'package:devhabit/features/onBoarding/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RiveAnimationController _btnAnimationController;
  late RiveAnimationController _generateRoadmapButtonController;
  late RiveAnimationController _gnrBtnCntrl;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _generateRoadmapButtonController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    _gnrBtnCntrl = OneShotAnimation(
      "active",
      autoplay: true,
    );
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final _homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is RoadmapCreatedActionState) {
          AnimatedSnackBar.material(
            '${state.days} days roadmap created for ${state.domain}',
            type: AnimatedSnackBarType.success,
          ).show(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case RoadmapLoadingState:
            return RoadmapLoadingHomeUI(
              btnAnimationController: _btnAnimationController,
              generateRoadmapButtonController: _generateRoadmapButtonController,
              gnrBtnCntrl: _gnrBtnCntrl,
            );
          case RoadmapExistState:
            return RoadmapExistHomeUI(
              homeBloc: _homeBloc,
              btnAnimationController: _btnAnimationController,
              generateRoadmapButtonController: _btnAnimationController,
              gnrBtnCntrl: _gnrBtnCntrl,
            );
          case RoadmapDoesNotExistState:
            return RoadmapDoesNotExistHomeUI(
              homeBloc: _homeBloc,
              btnAnimationController: _btnAnimationController,
              generateRoadmapButtonController: _generateRoadmapButtonController,
              gnrBtnCntrl: _gnrBtnCntrl,
            );
          case RoadmapCreatedState:
            return const Scaffold(
              body: Center(
                child: Text('ROadmap created'),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }

  // show general dialog
}
