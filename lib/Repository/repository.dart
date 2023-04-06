import 'dart:io';

import 'package:bangla_bazar/ModelClasses/AddNewBusinessPage2Model.dart';
import 'package:bangla_bazar/ModelClasses/AddNewBussinessPage1Model.dart';
import 'package:bangla_bazar/ModelClasses/add_driver_model.dart';
import 'package:bangla_bazar/ModelClasses/add_process_order_model.dart';
import 'package:bangla_bazar/ModelClasses/add_to_cart_model.dart';
import 'package:bangla_bazar/ModelClasses/add_user_payment_model.dart';
import 'package:bangla_bazar/ModelClasses/auth_net_payment_model.dart';
import 'package:bangla_bazar/ModelClasses/cart_details_response.dart';

import 'package:bangla_bazar/ModelClasses/check_delivery_driver_model.dart';
import 'package:bangla_bazar/ModelClasses/cod_init_model.dart';
import 'package:bangla_bazar/ModelClasses/dashboard_model.dart';
import 'package:bangla_bazar/ModelClasses/delivery_products_check_model.dart';
import 'package:bangla_bazar/ModelClasses/logout_model.dart';
import 'package:bangla_bazar/ModelClasses/order_return_model.dart';
import 'package:bangla_bazar/ModelClasses/order_status_change_model.dart';
import 'package:bangla_bazar/ModelClasses/pathao_area_model.dart';
import 'package:bangla_bazar/ModelClasses/pathao_price_calculation_model.dart';
import 'package:bangla_bazar/ModelClasses/pathao_token_model.dart';
import 'package:bangla_bazar/ModelClasses/pathao_zone_model.dart';
import 'package:bangla_bazar/ModelClasses/refund_order_form_model.dart';
import 'package:bangla_bazar/ModelClasses/remove_from_cart_model.dart';
import 'package:bangla_bazar/ModelClasses/ssl_get_detail_model.dart';
import 'package:bangla_bazar/ModelClasses/sslcommerce_init_model.dart';
import 'package:bangla_bazar/ModelClasses/stripe_model.dart';
import 'package:bangla_bazar/ModelClasses/stripe_payment_validate_model.dart';
import 'package:bangla_bazar/ModelClasses/stripe_trans_init_model.dart';
import 'package:bangla_bazar/ModelClasses/update_cart_model.dart';
import 'package:bangla_bazar/ModelClasses/user_refund_form_model.dart';
import 'package:bangla_bazar/ModelClasses/usps_address_verify_model.dart';
import 'package:bangla_bazar/ModelClasses/usps_rate_calculation_model.dart';
import 'package:bangla_bazar/Providers/login_provider.dart';
import 'package:bangla_bazar/Providers/my_order_provider.dart';
import 'package:bangla_bazar/Providers/product_provider.dart';
import 'package:bangla_bazar/Providers/cart_provider.dart';
import 'package:bangla_bazar/Views/Cart/CartBloc/cart_bloc.dart';
import 'package:bangla_bazar/Views/MyOrders/MyOrdersBloc/myorder_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bangla_bazar/ModelClasses/add_to_cart_model.dart' as cart;

import '../ModelClasses/dhl_price_rate_model.dart';
import '../ModelClasses/get_order_details_response.dart';
import '../ModelClasses/usa_price_plan_check_model.dart';
import '../ModelClasses/validate_DHL_address_model.dart';

class Repository {
  Future login(
          {required String username,
          required String password,
          required String rememberMe}) async =>
      LoginProvider.login(
          username: username, password: password, rememberMe: rememberMe);

  Future signup({
    required String username,
    required String email,
    required String password,
  }) async =>
      LoginProvider.signup(
          username: username, password: password, email: email);
  Future updateUser({
    required String username,
    required String email,
    required String birthday,
    required String gender,
    required String phoneNumber,
    required String emailVerified,
    required String phoneVerified,
  }) async =>
      LoginProvider.updateUser(
        username: username,
        birthday: birthday,
        email: email,
        gender: gender,
        phoneVerified: phoneVerified,
        phoneNumber: phoneNumber,
        emailVerified: emailVerified,
      );
  Future newPassword({
    required String email,
    required String password,
  }) async =>
      LoginProvider.newPassword(password: password, email: email);
  Future signupVerifyOTP({
    required String otp,
    required String email,
  }) async =>
      LoginProvider.signupVerifyOTP(otp: otp, email: email);
  Future forgetPasswordVerifyOTP({
    required String otp,
    required String email,
  }) async =>
      LoginProvider.forgetPasswordVerifyOTP(otp: otp, email: email);
  Future resendVerifyOTP({
    required String email,
  }) async =>
      LoginProvider.resendVerifyOTP(email: email);
  Future forgetPasswordSendOTP({
    required String email,
  }) async =>
      LoginProvider.forgetPasswordSendOTP(email: email);
  Future submitBusinessRegistrationPage1Data({
    required AddBusinessPage1Data addBusinessPage1Data,
  }) async =>
      LoginProvider.submitBusinessRegistrationPage1Data(
          addBusinessPage1Data: addBusinessPage1Data);
  Future registerDriver({
    required AddDriverModel addDriverModel,
  }) async =>
      LoginProvider.registerDriver(addDriverModel: addDriverModel);
  Future submitBusinessRegistrationPage2Data({
    required AddBusinessPage2Data addBusinessPage2Data,
  }) async =>
      LoginProvider.submitBusinessRegistrationPage2Data(
          addBusinessPage2Data: addBusinessPage2Data);
  Future checkEmailAvailability({
    required String email,
  }) async =>
      LoginProvider.checkEmailAvailability(email: email);
  Future sendEmailOTP({
    required String email,
  }) async =>
      LoginProvider.sendEmailOTP(email: email);
  Future getDeliveryDriversDetails() async =>
      LoginProvider.getDeliveryDriversDetails();
  Future getPaymentHistory() async => LoginProvider.getPaymentHistory();
  Future getVendorAllowedCountries() async =>
      LoginProvider.getVendorAllowedCountries();
  Future getPaymentGateway({required String id}) async =>
      LoginProvider.getPaymentGateway(id);
  Future getDeliveryAllowedCountries() async =>
      LoginProvider.getDeliveryAllowedCountries();
  Future getUserCardDetails() async => LoginProvider.getUserCardDetails();
  Future getPathaoAccessToken() async => LoginProvider.getPathaoAccessToken();
  Future getVendorAllowedStates({
    required int id,
  }) async =>
      LoginProvider.getVendorAllowedStates(id: id);
  Future validateDHLAddress({
    required ValidateDHLAddressModel validateDHLAddressModel,
  }) async =>
      LoginProvider.validateDHLAddress(
          validateDHLAddressModel: validateDHLAddressModel);
  Future dhlPriceRate({
    required DHLPriceRateModel dhlPriceRateModel,
  }) async =>
      LoginProvider.dhlPriceRate(dhlPriceRateModel: dhlPriceRateModel);
  Future getUserBusiness({
    required int id,
  }) async =>
      LoginProvider.getUserBusiness(id: id);
  Future getVendorAllowedCities({
    required int id,
  }) async =>
      LoginProvider.getVendorAllowedCities(id: id);
  Future getPathaoCities({
    required PathaoTokenModel pathaoTokenModel,
  }) async =>
      LoginProvider.getPathaoCities(pathaoTokenModel: pathaoTokenModel);
  Future getPathaoZones({
    required PathaoZoneModel pathaoZoneModel,
  }) async =>
      LoginProvider.getPathaoZones(pathaoZoneModel: pathaoZoneModel);
  Future getPathaoAreas({
    required PathaoAreaModel pathaoAreaModel,
  }) async =>
      LoginProvider.getPathaoAreas(pathaoAreaModel: pathaoAreaModel);
  Future logout({
    required LogoutModel logoutModel,
  }) async =>
      LoginProvider.logout(logoutModel: logoutModel);
  Future pathaoPriceCalculation({
    required PathaoPriceCalculationModel pathaoPriceCalculationModel,
  }) async =>
      LoginProvider.pathaoPriceCalculation(
          pathaoPriceCalculationModel: pathaoPriceCalculationModel);
  Future checkInventory({
    required CartDetailsResponse cartDetailsResponseTemp,
  }) async =>
      LoginProvider.checkInventory(
          cartDetailsResponseTemp: cartDetailsResponseTemp);
  Future checkInventoryForBackScreenIssues({
    required CartDetailsResponse cartDetailsResponseTemp,
  }) async =>
      LoginProvider.checkInventoryForBackScreenIssues(
          cartDetailsResponseTemp: cartDetailsResponseTemp);
  Future getInventory({
    required CartDetailsResponse cartDetailsResponseTemp,
  }) async =>
      LoginProvider.getInventory(
          cartDetailsResponseTemp: cartDetailsResponseTemp);
  Future checkDriverAvailability({
    required CheckDeliveryDriverModel checkDeliveryDriverModel,
  }) async =>
      LoginProvider.checkDriverAvailability(
          checkDeliveryDriverModel: checkDeliveryDriverModel);
  Future usaPricePlanCheckEvent({
    required USAPricePlanCheckModel usaPricePlanCheckModel,
  }) async =>
      LoginProvider.usaPricePlanCheckEvent(
          usaPricePlanCheckModel: usaPricePlanCheckModel);
  Future globalPricePlanCheckEvent({
    required USAPricePlanCheckModel usaPricePlanCheckModel,
  }) async =>
      LoginProvider.globalPricePlanCheckEvent(
          usaPricePlanCheckModel: usaPricePlanCheckModel);
  Future verifyUspsAddress({
    required UspsAddressVerifyModel uspsAddressVerifyModel,
  }) async =>
      LoginProvider.verifyUspsAddress(
          uspsAddressVerifyModel: uspsAddressVerifyModel);
  Future uspsCalculateRate({
    required UspsRateCalculationModel uspsRateCalculationModel,
  }) async =>
      LoginProvider.uspsCalculateRate(
          uspsRateCalculationModel: uspsRateCalculationModel);

  Future<dynamic> imageUpload({
    required String userId,
    required var selectedImage,
  }) async =>
      LoginProvider.imageUpload(
        userId: userId,
        selectedImage: selectedImage,
      );
  Future getStore({
    required String storeName,
    required String search,
    required int offset,
  }) async =>
      ProductProvider.getStore(
          storeName: storeName, offset: offset, search: search);
  Future getRecentlyViewed({
    required int offset,
  }) async =>
      ProductProvider.getRecentlyViewed(offset: offset);
  Future getWishList() async => ProductProvider.getWishList();
  Future getTrendingForYou({
    required int offset,
    required String search,
    required String country,
  }) async =>
      ProductProvider.getTrendingForYou(
          offset: offset, search: search, country: country);
  Future getTopRated({
    required int offset,
    required String search,
    required String country,
  }) async =>
      ProductProvider.getTopRated(
          offset: offset, search: search, country: country);
  Future getSubCategoriesProducts({
    required int id,
  }) async =>
      ProductProvider.getSubCategoriesProducts(id: id);
  Future getProductDetails({
    required int id,
  }) async =>
      ProductProvider.getProductDetails(id: id);
  Future addClickToAProduct({
    required int id,
  }) async =>
      ProductProvider.addClickToAProduct(id: id);
  Future getHomePageProducts({
    required int id,
    required String country,
  }) async =>
      ProductProvider.getHomePageProducts(id: id, country: country);
  Future search({
    required int searchType,
    required int limit,
    required int offset,
    required String search,
  }) async =>
      ProductProvider.search(
          searchType: searchType, offset: offset, limit: limit, search: search);
  Future addToWishList({
    required int productId,
    required int variantId,
  }) async =>
      ProductProvider.addToWishList(productId: productId, variantId: variantId);
  Future addToCart({
    required AddToCartModel addToCartModel,
  }) async =>
      ProductProvider.addToCart(addToCartModel: addToCartModel);
  Future removeFromWishList({
    required int productId,
  }) async =>
      ProductProvider.removeFromWishList(productId: productId);
  Future addUserReview({
    required int productID,
    required int rating,
    required String review,
  }) async =>
      ProductProvider.addUserReview(
        productID: productID,
        rating: rating,
        review: review,
      );
  Future getCategories() async => ProductProvider.getCategories();
  Future getGeoLocation() async => ProductProvider.getGeoLocation();
  Future getCartDetails() async => CartProvider.getCartDetails();
  Future getUserAddressHistory() async => CartProvider.getUserAddressHistory();
  Future transectioninit({
    required SSLCommerceTransInitModel transInitModel,
  }) async =>
      CartProvider.transectioninit(transInitModel: transInitModel);
  Future transactionInitStripe({
    required StripeTransInitModel stripeTransInitModel,
  }) async =>
      CartProvider.transactionInitStripe(
          stripeTransInitModel: stripeTransInitModel);
  Future stripePayment({
    required StripeModel stripe,
  }) async =>
      CartProvider.stripePayment(stripe: stripe);
  Future transectionInitStripeValidate({
    required StripePaymentValidateModel stripePaymentValidateModel,
  }) async =>
      CartProvider.transectionInitStripeValidate(
          stripePaymentValidateModel: stripePaymentValidateModel);
  Future authNetTransectionInit({
    required AuthorizedNetPaymentModel transInitModel,
  }) async =>
      CartProvider.authNetTransectionInit(transInitModel: transInitModel);
  Future cashOnDeliveryInit({
    required CODInitModel cashOnDeliveryInit,
  }) async =>
      CartProvider.cashOnDeliveryInit(cashOnDeliveryInit: cashOnDeliveryInit);
  Future addUserPayment({
    required AddUserPaymentModel addUserPaymentModel,
  }) async =>
      CartProvider.addUserPayment(addUserPaymentModel: addUserPaymentModel);
  Future addProcessOrder({
    required AddProcessOrderModel addProcessOrderModel,
  }) async =>
      CartProvider.addProcessOrder(addProcessOrderModel: addProcessOrderModel);
  Future getShippingStatus({
    required DeliveryProductsCheckModel deliveryProductsCheckModel,
  }) async =>
      CartProvider.getShippingStatus(
          deliveryProductsCheckModel: deliveryProductsCheckModel);
  Future getTransectionDetails({
    required SSLGetDetailsModel sslGetDetailsModel,
  }) async =>
      CartProvider.getTransectionDetails(
          sslGetDetailsModel: sslGetDetailsModel);
  Future removeProductFromCart({
    required String id,
    required RemoveFromCartModel removeFromCartModel,
  }) async =>
      CartProvider.removeProductFromCart(
          id: id, removeFromCartModel: removeFromCartModel);
  Future updateCart({
    required UpdateCartModel productDetail,
  }) async =>
      CartProvider.updateCart(productDetail: productDetail);
  Future getMyOrders({
    required String search,
    required int offset,
  }) async =>
      MyOrdersProvider.getMyOrders(search: search, offset: offset);
  Future getMyReturnedOrders({
    required int offset,
  }) async =>
      MyOrdersProvider.getMyReturnedOrders(offset: offset);
  Future getMyReturnOrderDetails({
    required String id,
  }) async =>
      MyOrdersProvider.getMyReturnOrderDetails(id: id);
  Future getOrderDetails({required String orderNumber}) async =>
      MyOrdersProvider.getOrderDetails(orderNumber: orderNumber);
  Future returnOrder({required OrderReturnModel orderReturnModel}) async =>
      MyOrdersProvider.returnOrder(orderReturnModel: orderReturnModel);
  Future userReturnOrder(
          {required UserRefundFormModel userRefundFormModel}) async =>
      MyOrdersProvider.userReturnOrder(
          userRefundFormModel: userRefundFormModel);
  Future orderStatusChange(
          {required OrderStatusChangeModel orderStatusChangeModel}) async =>
      MyOrdersProvider.orderStatusChange(
          orderStatusChangeModel: orderStatusChangeModel);
  Future orderStatusChangePic(
          {required OrderStatusChangeModel orderStatusChangeModel,
          required var photo}) async =>
      MyOrdersProvider.orderStatusChangePic(
          orderStatusChangeModel: orderStatusChangeModel, photo: photo);
  Future dashBoard({required DashBoardModel dashBoardModel}) async =>
      MyOrdersProvider.dashBoard(dashBoardModel: dashBoardModel);
  Future getDriversOrders(
          {required int offset, required String status}) async =>
      MyOrdersProvider.getDriversOrders(offset: offset, status: status);
  Future getDriversCODOrders(
          {required int offset, required String status}) async =>
      MyOrdersProvider.getDriversCODOrders(offset: offset, status: status);
  Future setSelectedOrdersMarkAsPaid(
          {required var selectedOrders, required var selectedImage}) async =>
      MyOrdersProvider.setSelectedOrdersMarkAsPaid(
          selectedOrders: selectedOrders, selectedImage: selectedImage);
  Future changeReturnOrderStatus(
          {required String status,
          required GetOrderDetailsResponse getOrderDetailsResponse,
          var productImage,
          required bool isLast}) async =>
      MyOrdersProvider.changeReturnOrderStatus(
          status: status,
          getOrderDetailsResponse: getOrderDetailsResponse,
          isLast: isLast,
          productImage: productImage);
  Future orderReturnFormEvent(
          {required String orderNumber,
          required String refundReason,
          required String? accountTitle,
          required String? accountNumber,
          required XFile refundItemsPic,
          required RefundOrderFormModel refundOrderFormModel}) async =>
      MyOrdersProvider.orderReturnFormEvent(
          orderNumber: orderNumber,
          refundReason: refundReason,
          accountTitle: accountTitle!,
          accountNumber: accountNumber!,
          refundItemsPic: refundItemsPic,
          refundOrderFormModel: refundOrderFormModel);
  Future updatePaymentStatus({
    required String id,
    required String status,
  }) async =>
      CartProvider.updatePaymentStatus(id: id, status: status);
  Future getInAppNotifications() async => CartProvider.getInAppNotifications();
  Future updateInAppNotifications({
    required String id,
  }) async =>
      CartProvider.updateInAppNotifications(id: id);
}
