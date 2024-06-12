import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/modules/eyewitness_visualizer_app/search_screen/search_screen.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'dart:math';

Future<void> compareImages(BuildContext context, Map<String, String> sketchToDigitalMap) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(
          color: myOrange,
        ),
      );
    },
  );

  double similarity = 0.0;
  String mostSimilarSketch = '';
  Uint8List? uploadedImageBytes;
  Uint8List? mostSimilarImageBytes;
  final ImagePicker picker = ImagePicker();
  final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage == null) {
    Navigator.pop(context);
    return;
  }

  final uploadedImage = await pickedImage.readAsBytes();
  uploadedImageBytes = Uint8List.fromList(uploadedImage);

  double highestSimilarity = 0.0;
  String mostSimilarSketchPath = '';
  Uint8List? mostSimilarImage;

  for (final entry in sketchToDigitalMap.entries) {
    final String sketchPath = entry.key;
    final String digitalPath = entry.value;

    final ByteData? bytes = await rootBundle.load(sketchPath);
    final Uint8List imageBytes = bytes!.buffer.asUint8List();
    final img.Image? image1 = img.decodeImage(uploadedImage);
    final img.Image? image2 = img.decodeImage(imageBytes);

    if (image1 == null || image2 == null) continue;

    int difference = 0;
    for (int y = 0; y < image1.height; y++) {
      for (int x = 0; x < image1.width; x++) {
        final pixel1 = image1.getPixelSafe(x, y);
        final pixel2 = image2.getPixelSafe(x, y);
        if (pixel1 != pixel2) {
          difference++;
        }
      }
    }

    final totalPixels = image1.width * image1.height;
    final similarityPercentage = ((totalPixels - difference) / totalPixels) * 100;

    if (similarityPercentage > highestSimilarity) {
      highestSimilarity = similarityPercentage;
      mostSimilarSketchPath = sketchPath;
      mostSimilarImage = imageBytes;
    }
  }

  // Generate a random duration between 1 and 3 seconds
  final random = Random();
  final delaySeconds = random.nextInt(5) + 1; // Generates a random number between 5 and 10 inclusive
  final delayDuration = Duration(seconds: delaySeconds);

  await Future.delayed(delayDuration); // Delay for the random duration


  Navigator.pop(context); // Dismiss CircularProgressIndicator

  if (highestSimilarity < 30) {
    // No matching image found
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Matching Image Found'),
          content: const Text('Sorry, there is no matched image found!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    similarity = highestSimilarity;
    mostSimilarSketch = mostSimilarSketchPath;
    mostSimilarImageBytes = mostSimilarImage;

    // Navigate to the new page to display the images
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(
          uploadedImageBytes: uploadedImageBytes!,
          matchedImageBytes: mostSimilarImage!,
          uploadedSketchLabel: 'Uploaded Sketch',
          matchedSketchLabel: 'Matched Digital Result',
          matchedSketchPath: sketchToDigitalMap[mostSimilarSketchPath]!,
          similarity: similarity,
        ),
      ),
    );
  }
}
