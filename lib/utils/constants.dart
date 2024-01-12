import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Default values
const bool defaultBoolean = false;
const int defaultInt = 0;
const double defaultDouble = 0.0;
const String defaultString = "";
const String spaceString = " ";
const String newLineString = "\n";
const String currency = "৳";

// App colors (main)
const Color colorPrimary = Color(0xFF452971);
const Color colorSecondary = Color(0xFF636466);
//const Color colorAccent = Color.fromRGBO(230, 46, 4, 1);
const Color colorAccent = Color(0xFFe52e04);
const Color colorBottomBarBg = Color(0xFFFCFCFC);
const Color colorUnselectedBottomBar = Color(0xFFA39DAD);
const Color colorDivider = Color(0xFFA39DAD);
const Color colorDividerF4 = Color(0xFFF4F3F4);
const Color colorBlock00 = Color(0xFF000000);
//const Color colorAccent = Color(0xFF258633);
const Color colorHighlight = Color(0xFFFFA100);
const Color colorDisabled = Color(0xD1272B37);
const Color colorGem = Color(0xFF1388C9);
const Color colorCoin = Color(0xFFFAB43D);

// App colors (text)
const Color colorTextRegular = Color(0xFF272B37);
const Color colorTextSecondary = Color(0xFF707586);
const Color colorTextTertiary = Color(0xFF6B7285);
const Color colorTextWarning = Color(0xFFFF5E00);
const Color colorTextFieldBorder = Color(0xFFA39DAD);
// App colors (light)
const Color colorLightGray1 = Color(0xFF353A44);
const Color colorLightGray2 = Color(0xFF404551);
const Color colorLightGray3 = Color(0xFF6A6B6D);
const Color colorLightGray4 = Color(0xFF8F949E);
const Color colorLightGray5 = Color(0xFF272B31);
const Color colorLightGray6 = Color(0xFFD5D5D5);
const Color colorLightGray7 = Color(0xFF333741);
const Color colorLightGray8 = Color(0xFF2B2F36);
const Color colorLightGray9 = Color(0xFFF1F3F6);
const Color colorLightGray10 = Color(0xFFBFBFBF);
const Color colorLightGray11 = Color(0xFF2B2F36);
const Color colorLightGray12 = Color(0xFF747474);
const Color colorLightGray13 = Color(0xFFD8D8D8);
const Color colorLightGray14 = Color(0xFFCFCFCF);
const Color colorLightGray15 = Color(0xFFA2A2A2);
const Color colorLightGray16 = Color(0xFFA29C9C);
const Color colorLightGray17 = Color(0xFFB4B4B4);

const Color colorLightWhiteFA = Color(0xFFFAFAFA);
const Color colorLightWhite2 = Color(0xFFDBDBDB);
const Color colorLightWhite3 = Color(0xFFF9F9F9);

// Bg color
const Color colorBgGreyF8 = Color(0xFFF8F8F8);
const Color colorBg2GreyF1 = Color(0xFFF1F1F1);
const Color colorBgFC = Color(0xFFFCFCFC);
const Color colorBgE7 = Color(0xFFFEF3E7);
const Color colorBgBFC = Color(0xFFFAFBFC);
const Color colorBgLightPurple = Color(0xFFEAE2F6);
const Color colorBgButtonGrey = Color(0xFFE5E5EA);
const Color colorBgPurpleA2 = Color(0xFF815CA2);

const Color colorTextGrey65 = Color(0xFF402765);
const Color colorTextGrey43 = Color(0xFF434343);
const Color colorTextGrey99 = Color(0xFF8C9199);
const Color colorTextGrey2E = Color(0xFF22292E);
const Color colorTextGrey8E = Color(0xFF8A8A8E);
const Color colorTextGrey5A = Color(0xFF5A5A5A);
const Color colorTextGreyE6 = Color(0xFFDFE1E6);
const Color colorTextGrey85 = Color(0xFF858585);
const Color colorTextGreyCO = Color(0xFFC0C0C0);
const Color colorGreyBE1 = Color(0xFFD8DBE1);
const Color colorGreyF6 = Color(0xFFF4F2F6);

const Color colorLightGreen1 = Color(0xFF0ABB87);
// const Color colorLightGreenAccent1 = Color(0xFF20C3AF);
// const Color colorLightGreenAccent2 = Color(0xFFDDF6F3);
const Color colorLightOrange1 = Color(0xFFFF9900);
// const Color colorLightOrange2 = Color(0xFFF8991C);
// const Color colorLightOrange3 = Color(0xFFF6E8D5);
const Color colorWhite = Color(0xFFFFFFFF);
// App colors (others)
// const Color colorSplashNavigationBarBackground = Color(0xFF0B0C0E);
const Color colorInputFieldBackground = Color(0xFFFAFAFA);
const Color colorInputFieldBorder = Color(0xFFF3F2F2);
const Color colorPageBackground = Color(0xFFF4F5F7);
const Color colorPurple = Color(0xFF7632A7);
const Color colorItemActiveBackground = Color(0xFF3580F7);
// const Color colorCloseButtonBackground = Color(0x12707586);
// const Color colorResetPageBackground = Color(0xFFF6F5F5);
// const Color colorNewPasswordBackground = Color(0xFF3C414B);
// const Color colorNewPasswordRoundShape = Color(0xFF33383F);
// const Color colorMyProfileBg = Color(0xFFF1F3F6);
// const Color colorFavoriteImageBg = Color(0xFFF2F2F2);
// const Color colorFavoriteImageBgBorder = Color(0xFFB7B7B7);

const Color colorRed28 = Color(0xFFFC6828);
const Color colorRed2C = Color(0xFFE6012C);
const Color colorRed10 = Color(0xFFC54610);
const Color colorOrangeC00 = Color(0xFFFF5C00);
const Color colorGreen51 = Color(0xFF00A651);
const Color colorDarkGrey2C = Color(0xFF2C2C2C);

// const Color colorItemInactiveBackground = Color(0xFFEBF2FE);
//
// const Color colorExamItemInactiveBackground = Color(0xFFF5F6FC);
// const Color colorExamItemActiveBackground = Color(0xFF3580F7);
// const Color colorUserActive = Color(0xFF00D563);
// const Color colorWinningTeamBackground = Color(0xFF6CE6E1);
// const Color colorWinProgress = Color(0xFF27AE60);
// const Color colorLoseProgress = Color(0xFFEB5757);
// const Color colorTieProgress = colorAccent;
// const Color colorSkipProgress = colorWinningTeamBackground;
// const Color colorOrange = Color(0xFFF2994A);
//

const Color colorRoundShapeBlue = Color(0x20008fb4);
const Color colorRoundShapeDarkBlue = Color(0xFF1565C0);
const Color colorRoundShapeOrange = Color(0x20fe793d);
const Color colorRoundShapeDarkOrange = Color(0xFFfe793d);
const Color colorRoundShapeGray1 = Color(0x20353A44);
const Color colorRoundShapeRed = Color(0x15EE1C25);
const Color colorRoundShapeDarkRed = Color(0xFFec514b);
const Color colorRoundShapePurple = Color(0x157632A7);

const Color colorAuctionBgSelect1 = Color(0xFFEDE7E0);
const Color colorAuctionBgSelect2 = Color(0xFFDFE3E9);

//StepColor
const Color colorStepComplete = Color(0xFF20C3AF);
const Color colorStepEdit = Color(0xFFb2b4b6);
const Color colorStepBackground = Color.fromRGBO(246, 249, 255, 1);
const Color colorStepLine = Color(0xFFDED9D9);

const Color colorHomeCircle = Color(0xFFacacac);
const Color colorCartInside = Color(0xFF666668);
const Color colorSearchIcon = Color(0xFFf8d2c0);
const Color colorProcessToShippping = Color(0xFFe52e04);

/*If you are not a developer, do not change the bottom colors*/
const Color white = Color.fromRGBO(255, 255, 255, 1);
const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
const Color darkGrey = Color.fromRGBO(112, 112, 112, 1);
const Color mediumGrey = Color.fromRGBO(132, 132, 132, 1);
const Color mediumGrey50 = Color.fromRGBO(132, 132, 132, .5);
const Color grey153 = Color.fromRGBO(153, 153, 153, 1);
const Color fontGrey = Color.fromRGBO(73, 73, 73, 1);
const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color golden = Color.fromRGBO(248, 181, 91, 1);
const Color softAccentColor = Color.fromRGBO(247, 189, 168, 1);

Color shimmerBase = Colors.grey.shade50;
Color shimmerHighlighted = Colors.grey.shade200;

// Text styles
const TextStyle textStyleBottomBarItem = TextStyle(
  color: colorDisabled,
  fontSize: 14.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionTitle = TextStyle(
  color: colorTextRegular,
  fontSize: 18.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleSectionItemTitle = TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionItemBody = TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleAppBar = TextStyle(
  color: colorTextRegular,
  fontSize: 20.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w600,
);

const TextStyle textStyleFocused = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleExtraExtraLarge = TextStyle(
  color: colorTextRegular,
  fontSize: 20.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleExtraLarge = TextStyle(
  color: colorTextRegular,
  fontSize: 18.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleLarge = const TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleRegular = const TextStyle(
  color: colorTextRegular,
  fontSize: 14.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleSmall = const TextStyle(
  color: colorTextRegular,
  fontSize: 12.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleHeadline = TextStyle(
  color: colorTextRegular,
  fontSize: 26.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleButtonRegular = TextStyle(
  color: colorLightWhiteFA,
  fontSize: 14.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w500,
);

TextStyle hintTextStyleSmall = const TextStyle(
  color: colorLightGray4,
  fontSize: 10.0,
  fontFamily: fontFamilyQuicksand,
  fontWeight: FontWeight.w400,
);

// Input Decoration
InputDecoration inputDecorationForm = const InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
  //hintStyle: textStyleInputFormHint,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  border: InputBorder.none,
);

// Box Decoration
BoxDecoration boxDecorationBorderForm = const BoxDecoration(
  color: colorInputFieldBackground,
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  border: Border.fromBorderSide(
    BorderSide(color: colorInputFieldBorder),
  ),
);

BoxDecoration boxDecorationSectionCardBackground = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
);

const BoxDecoration boxDecorationBackButtonBorder = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  border: Border.fromBorderSide(
    BorderSide(color: colorTextSecondary),
  ),
);

const BoxDecoration otpPutDecoration = BoxDecoration(
  color: colorLightWhiteFA,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
  border: Border.fromBorderSide(
    BorderSide(color: colorLightWhiteFA),
  ),
);

// Shape
const RoundedRectangleBorder shapeButtonRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

const RoundedRectangleBorder shapeCardItemRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(16.0),
  ),
);

// Service
const SystemUiOverlayStyle systemUiOverlayStyleGlobal = SystemUiOverlayStyle(
  systemNavigationBarColor: colorPageBackground,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);

// App essentials
const String responseOfJsonType = "application/json";
const String fontFamilyPoppins = "Poppins";
const String fontFamilyQuicksand = "Quicksand";
const String valueClientID = "APP_CLIENT";
const String valueClientSecret = "APP_CLIENT_AF61E59520943DC26494F8941B";
const String valueGrantTypeClientCredentials = "client_credentials";
const String valueGrantTypeRefreshToken = "refresh_token";
const int minimumPasswordLength = 8;
const int minimumVerificationCodeLength = 4;
const String appName = "Mohazan"; //this shows in the splash screen
const String purchaseCode = "e61f6cbb-bf4f-4df0-bfc7-8b2632b513db"; //enter your purchase code for the app from codecanyon

//const String facebookUrl = "www.facebook.com/ezcart.com.bd"; //enter your purchase code for the app from codecanyon
const String facebookUrl = 'https://www.facebook.com/ezcart.com.bd';
const String facebook = 'https://www.facebook.com';

const String prefixAuthToken = "Bearer ";
const String saleTypeAuction = "Auction";
const String saleTypeBargain = "Bargain";
const String saleTypeGallery = "Gallery";

//Order Status
const String pending = "Pending";
const String confirmed = "Confirmed";
const String delivered = "Delivered";
const String processing = "Processing";
const String hold = "Hold";
const String returned = "Returned";
const String canceled = "Canceled";

// Backend
const String baseDevelopmentUrl = "";
const String baseLiveUrl = "";
const String baseUrl = baseDevelopmentUrl;

//const String baseAppDevelopmentUrl = "https://ezcart.com.bd/";
//const String baseAppDevelopmentUrl = "https://dev.ezcart.com.bd/";
const String baseAppDevelopmentUrl = "https://test.ezcart.com.bd/";

const String baseAppLiveUrl = "";
const String baseAppUrl = baseAppDevelopmentUrl;

final String baseAppImageUrl = join(baseAppUrl, "public");
final String baseApiUrl = join(baseAppUrl, "api/v2");
final String loginUrl = join(baseApiUrl, "auth/login");
final String socialLoginUrl = join(baseApiUrl, "auth/social-login");

final String logoutUrl = join(baseApiUrl, "auth/logout");
final String userSignUpUrl = join(baseApiUrl, "auth/signup");
final String resendCodeUrl = join(baseApiUrl, "auth/resend_code");
final String confirmCodeUrl = join(baseApiUrl, "auth/confirm_code");
final String forgetPasswordUrl = join(baseApiUrl, "auth/password/forget_request");
final String passwordConfirmCodeUrl = join(baseApiUrl, "auth/password/confirm_code");

final String confirmResetPasswordUrl = join(baseApiUrl, "auth/password/confirm_reset");
final String passwordResendCodeUrl = join(baseApiUrl, "auth/password/resend_code");
final String getUserByTokenUrl = join(baseApiUrl, "get-user-by-access_token");
final String getProfileCounterUrl = join(baseApiUrl, "profile/counters/");
final String profileUpdateUrl = join(baseApiUrl, "profile/update");
final String profileUpdateDeviceTokenUrl = join(baseApiUrl, "profile/update-device-token");
final String profileUpdateImageUrl = join(baseApiUrl, "profile/update-image");

final String siteSettingsUrl = join(baseApiUrl, "sitesetting/get");
final String slidersUrl = join(
  baseApiUrl,
  "sliders",
);
final String getFeaturedProductsUrl = join(
  baseApiUrl,
  "products/featured",
);

final String getBestSellerProductsUrl = join(
  baseApiUrl,
  "products/best-seller",
);

// Key
const String keySuccess = "success";
const String keyData = "data";
const String keyMessage = "message";
const String keyAccessLocal = "access_local";

const String keyTrainingCategories = "training_categories";
const String keyTimeLengths = "time_lengths";
const String keyProfessions = "professions";
const String keyCategoryIconUrl = "cat_icon_url";
const String keyStoreLoginResponse = "store_login_response";
const String keyStoreIsLoggedIn = "is_logged_in";
// --------------------------------------------- //

const String keyAccessToken = "access_token";
const String keyClientId = "client_id";
const String keyClientSecret = "client_secret";
const String keyGrantType = "grant_type";
const String keyavatarOriginal = "avatar_original";

const String keyUserName = "username";
const String keyEmail = "email";
const String keyPhone = "phone";
const String keyPassword = "password";
const String keyCurrentPassword = "current_password";
const String keyConfirmationPassword = "password_confirmation";
const String keyNewPassword = "new_password";

// Regular Expression
const String regularExpressionEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String regularExpressionPhone = "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" "([0-9][0-9\\- \\.]+[0-9])";

// Asset Resources
const String assetImgLogo = 'assets/app_mohazon.png';
const String assetPlaceHolder = 'assets/placeholder.jpeg';
const String assetDefaultAvatar = 'assets/default_avatar.png';
//Dummy
const String assetDummyCategory1 = 'assets/dummy_category1.png';
const String assetDummyTopBrand1 = 'assets/dummy_top_brand1.png';
const String assetDummyTopBrand2 = 'assets/dummy_top_brand2.png';
const String assetDummyProduct1 = 'assets/dummy_product1.png';
const String assetDummyProduct2 = 'assets/dummy_product2.png';
const String assetDummySpecialDeals1 = 'assets/dummy_special_deals1.png';
const String assetDummyProfile = 'assets/dummy_profile.png';
const String assetDummyHome1 = 'assets/dummy_home1.png';
const String assetDummyHome2 = 'assets/dummy_home2.png';
const String loadingImage = 'assets/loading.png';

//SVG
const String assetSvgBottomCenterDocked = 'assets/svg/center_bottom_menu.svg';
const String assetSvgIcHome = 'assets/svg/ic_home.svg';
const String assetSvgIcChat = 'assets/svg/ic_chat.svg';
const String assetSvgIcCategories = 'assets/svg/ic_categories.svg';
const String assetSvgIcCategoriesWithoutFill = 'assets/svg/ic_category_without_fill.svg';
const String assetSvgIcAccount = 'assets/svg/ic_account.svg';
const String assetSvgIcSearch = 'assets/svg/ic_search.svg';
const String assetSvgIcOffer = 'assets/svg/ic_offer.svg';
const String assetSvgIcLeftArrow = 'assets/svg/ic_left_arrow.svg';
const String assetSvgIcFilter = 'assets/svg/ic_filter.svg';
const String assetSvgIcDone = 'assets/svg/ic_done.svg';
const String assetSvgIcInfo = 'assets/svg/ic_info.svg';
const String assetSvgIcCancel = 'assets/svg/ic_cancel.svg';
const String assetSvgIcArrowDown = 'assets/svg/ic_arrow_down.svg';
const String assetSvgIcSortby = 'assets/svg/ic_sortby.svg';
const String assetSvgIcProductGrid = 'assets/svg/ic_product_grid.svg';
const String assetSvgIcProductList = 'assets/svg/ic_product_list.svg';
const String assetSvgIcFilter2 = 'assets/svg/ic_filter2.svg';
const String assetSvgIcComments = 'assets/svg/ic_comments.svg';
const String assetSvgIcShare = 'assets/svg/ic_share.svg';
const String assetSvgIcHeartLikeRed = 'assets/svg/ic_heart_like_red.svg';
const String assetSvgIcHeartLikeGrey = 'assets/svg/ic_heart_like_grey.svg';
const String assetSvgIcSend = 'assets/svg/ic_send.svg';
const String assetSvgIcBackArrow = 'assets/svg/ic_back_arrow.svg';
const String assetSvgIcFileUpload = 'assets/svg/ic_file_upload.svg';
const String assetSvgIcAlertCircle = 'assets/svg/ic_alert_circle.svg';
const String assetSvgIcCopy = 'assets/svg/ic_copy.svg';
const String assetSvgIcHeart = 'assets/svg/ic_heart.svg';
const String assetSvgIcHide = 'assets/svg/ic_hide.svg';
const String assetSvgIcRectanlge = 'assets/svg/ic_rectangle.svg';
const String assetSvgIcPhoneCall = 'assets/svg/ic_phone_call.svg';
const String assetSvgIcSMS = 'assets/svg/ic_sms.svg';
// Common String
const String strAddAddress = "Add";
const String strEditAddress = "Edit";
const int typeAsCustomer = 2;
const int typeAsSeller = 1;
const String isBaseCategory = "isBaseCategory";
const String isTopCategory = "isTopCategory";
const String hasBottomnav = "hasBottomnav";
const String cartPayment = "cart_payment";
const String walletPayment = "wallet_payment";

const String bkashScreen = "Bkash";
const String nagadScreen = "Nagad";
const String paypalScreen = "Paypal";
const String razorPayScreen = "RazorPay";
const String payStackScreen = "PayStack";
const String sslCommerceScreen = "SSLcommerze";
const String stripeScreen = "Stripe";
const String iyzicoScreen = "Iyzico";
const String cardOnDeliveryScreen = "Card On Delivery";
