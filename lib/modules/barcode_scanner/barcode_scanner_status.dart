import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus({
    this.cameraController,
    this.isCameraAvailable = false,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeScannerStatus.available(CameraController controller) =>
      BarcodeScannerStatus(
        isCameraAvailable: true,
        cameraController: controller,
      );

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(
        isCameraAvailable: false,
        error: message,
      );

  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
