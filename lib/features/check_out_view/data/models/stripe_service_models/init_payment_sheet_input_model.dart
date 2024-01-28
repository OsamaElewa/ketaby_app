class InitPaymentSheetInputModel{
  final String paymentIntentClientSecret;
  final String ephemeralKey;
  final String customerId;

  InitPaymentSheetInputModel(
      {required this.paymentIntentClientSecret, required this.ephemeralKey, required this.customerId});
}