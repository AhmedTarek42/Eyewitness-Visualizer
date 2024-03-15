import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class DashReport extends StatelessWidget {
  const DashReport({
    super.key,
    required this.categoryColor,
    required this.categoryName,
    required this.value,
  });
  final Color categoryColor;
  final String categoryName;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: greyContainer,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              height: 70,
              width: 110,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(color: categoryColor),
                  ),
                  const Spacer(),
                  Center(
                      child: Column(
                        children: [
                          Text(
                            categoryName,
                            style: TextStyle(color: greyText, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            value,
                            style: const TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
