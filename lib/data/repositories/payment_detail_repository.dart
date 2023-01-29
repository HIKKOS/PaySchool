import 'package:hola_mundo/core/enties/payment_detail.dart';

class PaymentDetailRepository {
  static List<PaymentDetail> getPaymentDetail() {
    List<PaymentDetail> paymentDetails = [];

    paymentDetails.add(PaymentDetail(
        id: 1,
        nameService: 'Transporte',
        costService: 100.00,
        datePayment: DateTime.parse("2023-01-01"),
        nameStudent: 'Francisco ',
        paymentMethod: '',
        urlIconPayment: '',
        urlIconService: 'assets/icons/bus.svg',
        urlIconStudent: ''));

        paymentDetails.add(PaymentDetail(
        id: 1,
        nameService: 'Transporte',
        costService: 100.00,
        datePayment: DateTime.parse("2023-01-01"),
        nameStudent: 'Francisco ',
        paymentMethod: '',
        urlIconPayment: '',
        urlIconService: 'assets/icons/bus.svg',
        urlIconStudent: ''));

    return paymentDetails;
  }
}
