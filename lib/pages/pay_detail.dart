import 'package:flutter/material.dart';
import 'package:payschool/pages/dialogs/confirmRenew.dart';
import 'package:payschool/pages/global/app_colors.dart';
import 'package:payschool/providers/alumno_provider.dart';
import 'package:payschool/widgets/card_costo.dart';
import 'package:payschool/widgets/custom_appbar.dart';
import 'package:payschool/widgets/custom_card_pay.dart';
import 'package:payschool/widgets/subtitle_section.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_button.dart';

final scaffoldRenew = ScaffoldRenew();
class LayoutPayDetail extends StatelessWidget {
  final dynamic paymentDetail;
  final isRenew;
  const LayoutPayDetail(
      {super.key, required this.paymentDetail, this.isRenew = null});

  @override
  Widget build(BuildContext context) {
    final alumnoid = Provider.of<AlumnoProvider>(
                                      context,
                                      listen: false)
                                  .getAlumnoSeleccionado?.id;
    return Scaffold(
      key: scaffoldRenew.scaffoldKey,
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.greyDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CustomAppBar(text: 'Detalle de pago'),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: SubtitleSection(
                    subtitle: 'Servicio',
                    color: AppColors.greyDark,
                    fontsize: 20,
                    fontWeight: FontWeight.bold),
              ),
              customCardPay(
                  icon: 'assets/Icons/service.svg',
                  title: paymentDetail.servicio),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: SubtitleSection(
                    subtitle: 'Beneficiario',
                    color: AppColors.greyDark,
                    fontsize: 20,
                    fontWeight: FontWeight.bold),
              ),
              customCardPay(
                  icon: 'assets/Icons/IconPerson.svg',
                  title: paymentDetail.alumno),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: SubtitleSection(
                    subtitle: 'Pago con',
                    color: AppColors.greyDark,
                    fontsize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const customCardPay(
                  icon: 'assets/Icons/IconPayMethod.svg', title: 'Paypal'),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5),
                child: SubtitleSection(
                    subtitle: 'Costo',
                    color: AppColors.greyDark,
                    fontsize: 20,
                    fontWeight: FontWeight.bold),
              ),
              CardCost(
                paymentDetail: paymentDetail,
              ),
              isRenew == true
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          horizontal: 150,
                          vertical: 14,
                          text: 'Renovar',
                          function: () {
                            DialogRenew().alertConfirm(context,
                                paymentDetail.servicio, paymentDetail.alumno, paymentDetail.idService, alumnoid);
                          },
                          fontsize: 20,
                        ),
                      ),
                    )
                  : Text('')
            ],
          )),
    );
  }
}

class ScaffoldRenew {
  GlobalKey _scaffoldKey = GlobalKey();
  ScaffoldRenew() {
    _scaffoldKey = GlobalKey();
  }
  GlobalKey get scaffoldKey => _scaffoldKey;
}
