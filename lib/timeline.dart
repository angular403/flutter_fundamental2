import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TimeLine Flutter')),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: TimelineTile(
              endChild: Text('First'),
              beforeLineStyle: LineStyle(color: Colors.red, thickness: 6),
              afterLineStyle: LineStyle(color: Colors.blue, thickness: 6),
              indicatorStyle: IndicatorStyle(
                width: 30,
                height: 50,
                  color: Colors.purple,
                  indicator: Container(
                    width: 30,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8)),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
