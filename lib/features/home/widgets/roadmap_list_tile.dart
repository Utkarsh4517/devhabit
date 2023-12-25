import 'package:devhabit/constants/dimensions.dart';
import 'package:devhabit/features/home/bloc/home_bloc.dart';
import 'package:devhabit/models/roadmap_model.dart';
import 'package:flutter/material.dart';

class RoadmapListTile extends StatefulWidget {
  final RoadmapModel roadmap;
  final HomeBloc homeBloc;
  const RoadmapListTile({
    super.key,
    required this.roadmap,
    required this.homeBloc,
  });

  @override
  State<RoadmapListTile> createState() => _RoadmapListTileState();
}

class _RoadmapListTileState extends State<RoadmapListTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(
        horizontal: getScreenWidth(context) * 0.05,
        vertical: getScreenWidth(context) * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: getScreenWidth(context) * 0.05,
        horizontal: getScreenWidth(context) * 0.05,
      ),
      alignment: Alignment.center,
      width: getScreenWidth(context),
      height: getScreenheight(context) * 0.33,
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.roadmap.description,
              style: const TextStyle(fontFamily: "Poppins"),
            ),
          ),
          CheckboxListTile(
            value: widget.roadmap.isTask1,
            onChanged: (value) {
              widget.homeBloc.add(
                CheckBoxClickedEvent(
                  roadmap: widget.roadmap,
                  task: 'istask1',
                  taskName: widget.roadmap.task1,
                ),
              );
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.roadmap.task1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getScreenWidth(context) * 0.03,
                ),
              ),
            ),
          ),
          CheckboxListTile(
            value: widget.roadmap.isTask1,
            onChanged: (value) {
              widget.homeBloc.add(
                CheckBoxClickedEvent(
                  roadmap: widget.roadmap,
                  task: 'istask2',
                  taskName: widget.roadmap.task2,
                ),
              );
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.roadmap.task2,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getScreenWidth(context) * 0.03,
                ),
              ),
            ),
          ),
          CheckboxListTile(
            value: widget.roadmap.isTask1,
            onChanged: (value) {
              widget.homeBloc.add(
                CheckBoxClickedEvent(
                  roadmap: widget.roadmap,
                  task: 'istask3',
                  taskName: widget.roadmap.task3,
                ),
              );
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.roadmap.task3,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: getScreenWidth(context) * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
