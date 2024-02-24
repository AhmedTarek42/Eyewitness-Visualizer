import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercenIndicator extends StatelessWidget {
  const PercenIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        circularStrokeCap: CircularStrokeCap.round,
        startAngle: 270,
        animation: true,
        radius: 100,
        lineWidth: 15,
        percent: .75,
        arcBackgroundColor: Colors.grey[400],
        center: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              const Text(
                '1,235',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white
                ),

              ),
              Text(
                'Images/month',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400]
                ),

              ),
            ],
          ),
        ),
        progressColor: const Color(0xFFFF7966),
        arcType: ArcType.values[1]
      ),
    );
  }
}
