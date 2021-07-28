class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  BarcodeScannerStatus({
    required this.isCameraAvailable,
    required this.error,
    required this.barcode,
  });

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
