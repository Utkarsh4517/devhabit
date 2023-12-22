import 'package:devhabit/constants/dimensions.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class PrimaryPopularCard extends StatefulWidget {
  final String domainName;
  final String tagLine;
  final String numOfDays;
  const PrimaryPopularCard({
    required this.domainName,
    required this.tagLine,
    required this.numOfDays,
    super.key,
  });

  @override
  State<PrimaryPopularCard> createState() => _PrimaryPopularCardState();
}

class _PrimaryPopularCardState extends State<PrimaryPopularCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 7),
          )
        ],
      ),
      padding: EdgeInsets.all(getScreenWidth(context) * 0.05),
      margin: EdgeInsets.all(getScreenWidth(context) * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // head text
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: getScreenWidth(context) * 0.45,
            child: Text(
              '${widget.domainName}\nin ${widget.numOfDays} days',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getScreenWidth(context) * 0.05),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: getScreenWidth(context) * 0.45,
            child:  Text(
              widget.tagLine,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: getScreenWidth(context) * 0.57,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: getScreenWidth(context) * 0.07),
                      width: getScreenWidth(context) * 0.45,
                      child: const Divider(
                        thickness: 0.25,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 7),
                            )
                          ]),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.tv,
                                size: 15,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FeatherIcons.heart, size: 15)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                FeatherIcons.moreHorizontal,
                                size: 15,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
