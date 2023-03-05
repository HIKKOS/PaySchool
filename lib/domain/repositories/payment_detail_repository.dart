import 'package:hola_mundo/domain/enties/payment_detail.dart';

class PaymentDetailRepository {
  static List<PaymentDetail> getPaymentDetail() {
    List<PaymentDetail> paymentDetails = [];

    paymentDetails.add(PaymentDetail(
        id: 1,
        nameService: 'Colegiatura',
        costService: 999.99,
        datePayment: DateTime.parse("2023-01-01"),
        nameStudent: 'Francisco ',
        paymentMethod: 'Paypal',
        urlIconPayment: 'assets/icons/IconPayMethod.svg',
        urlIconService: 'assets/icons/colegiatura.svg',
        urlIconStudent: 'assets/icons/IconPerson.svg'));

        paymentDetails.add(PaymentDetail(
        id: 1,
        nameService: 'Transporte',
        costService: 499.99,
        datePayment: DateTime.parse("2023-01-01"),
        nameStudent: 'Francisco ',
        paymentMethod: 'Paypal',
        urlIconPayment: 'assets/icons/IconPayMethod.svg',
        urlIconService: 'assets/icons/bus.svg',
        urlIconStudent: 'assets/icons/IconPerson.svg'));

    return paymentDetails;
  }
}
