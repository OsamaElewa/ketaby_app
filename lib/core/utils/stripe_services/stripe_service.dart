import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../features/check_out_view/data/models/stripe_service_models/ephemeral_key_model.dart';
import '../../../features/check_out_view/data/models/stripe_service_models/init_payment_sheet_input_model.dart';
import '../../../features/check_out_view/data/models/stripe_service_models/payment_intent_input_model.dart';
import '../../../features/check_out_view/data/models/stripe_service_models/payment_intent_model.dart';
import '../../api/end_points.dart';
import 'api_keys.dart';
import 'api_services/api_services.dart';

class StripeService{
  final StripeApiServices stripeApiServices;
  StripeService(this.stripeApiServices);
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async{
    Response data = await stripeApiServices.post(
        endPoint: EndPoints.paymentIntent,
        data: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey
    );
    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(data.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({required InitPaymentSheetInputModel initPaymentSheetInputModel}) async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetInputModel.paymentIntentClientSecret,
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
          customerId: initPaymentSheetInputModel.customerId,
          merchantDisplayName: 'Osama',
        ));
  }

  Future displayPaymentSheet()async{
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    EphemeralKeyModel ephemeralKey =await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    InitPaymentSheetInputModel initPaymentSheetInputModel = InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        ephemeralKey: ephemeralKey.secret!,
        customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({required String customerId}) async{
    Response data = await stripeApiServices.post(
        endPoint: EndPoints.ephemeralKeys,
        data: {
          'customer' : customerId
        },
        token: ApiKeys.secretKey,
      headers: {

          'Authorization' : 'Bearer ${ApiKeys.secretKey}',
          'Stripe-version' : '2023-08-16',
      }
    );
    EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(data.data);

    return ephemeralKeyModel;
  }
}