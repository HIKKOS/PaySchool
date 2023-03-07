class PaymentDetail {
  final int id;
  final String nameService;
  final double costService;
  final String paymentMethod;
  final DateTime datePayment;
  final String nameStudent;
  final String urlIconService;
  final String urlIconStudent;
  final String urlIconPayment;

  PaymentDetail(
      {required this.id,
      required this.nameService,
      required this.costService,
      required this.paymentMethod,
      required this.datePayment,
      required this.nameStudent,
      required this.urlIconService,
      required this.urlIconStudent,
      required this.urlIconPayment});
}
