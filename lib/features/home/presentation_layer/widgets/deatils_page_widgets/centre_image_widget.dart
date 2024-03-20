import 'package:flutter/material.dart';
import "package:model_viewer_plus/model_viewer_plus.dart";

class CenterImageWidget extends StatelessWidget {
  const CenterImageWidget(
      {super.key,
      required this.pH,
      required this.productimagePath,
      required this.productModelPath});
  final double pH;
  final String productimagePath;
  final String productModelPath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: pH * 0.38,
        width: pH*0.39,
        child: ModelViewer(
          src: productModelPath,
          loading: Loading.eager,
          poster: productimagePath,
          ar: true,
          disableZoom: true,
          environmentImage: "legacy",
          alt: "3D Model",
          arPlacement: ArPlacement.floor,
          cameraControls: true,
        ),
      ),
    );
  }
}
