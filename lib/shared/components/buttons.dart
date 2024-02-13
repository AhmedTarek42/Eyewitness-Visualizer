import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  // Properties
  final void Function()? onPressed;
  final String buttonTitle;
  final double width;
  final double height;
  final Color background;
  final double rad;
  final double? borderSideOp;
  final int? boxShadowColor;
  final Color? textColor;
  final bool isImage;
  final String? image;

   const PrimaryButton({
    super.key,
    required this.buttonTitle,
     required this.onPressed,
     this.height = 48,
    this.width = 324,
    this.background = const Color(0xffff7966),
    this.rad = 999,
    this.borderSideOp = 0.30000001192092896,
     this.boxShadowColor = 0x7FFF7966,
     this.textColor = Colors.white,
     this.isImage = false,
     this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: ShapeDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, 0.25),
          radius: 0,
          colors: [Colors.white.withOpacity(0), background],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(borderSideOp!),
          ),
          borderRadius: BorderRadius.circular(rad),
        ),
        shadows: [
          BoxShadow(
            color: Color(boxShadowColor!),
            blurRadius: 25,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isImage? Container(
            width: 16,
            height: 16,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(children: [
              Image.asset(image!)
            ]),
          ):const SizedBox(width: 0.0),
          MaterialButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  // Properties
  final void Function()? onPressed;
  final String buttonTitle;
  final Color background;
  final double width;
  final double height;
  final double rad;
  final double? borderSideOp;
  final int? boxShadowColor;
  final Color? textColor;
  final bool isImage;
  final String? image;


  const SecondaryButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.height = 48,
    this.width = 324,
    this.rad = 999,
    this.borderSideOp = 0.15000000596046448,
    this.boxShadowColor = 0,
    this.textColor = Colors.white,
    this.background = const Color(0x1AFFFFFF),
    this.isImage = false,
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          end: const Alignment(1, 0.25),
          colors: [Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.1),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(borderSideOp!),
          ),
          borderRadius: BorderRadius.circular(rad),
        ),
        shadows: [
          BoxShadow(
            color: Color(boxShadowColor!),
            blurRadius: 25,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isImage? Container(
            width: 16,
            height: 16,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(children: [
              Image.asset(image!)
            ]),
          ):const SizedBox(width: 0.0),
          MaterialButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
