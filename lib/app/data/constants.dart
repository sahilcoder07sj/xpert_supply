class Constants {

  static const nameRegX = r'^(?=.*[a-zA-Z])[\s\S]{2,}$';
  static const phoneRegX = r'^\+?(\d{1,4})?\s?[-.\s]?(\d+[-.\s]?){6,}$';
  static const dateRegX = r'^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/(19|20)\d\d$';
  static const passwordRegX = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,}$';

  static String selectUser = '';
  static const String consumer = 'customer';
  static const String vendor = 'vendor';
  static bool isSignUp = false;

  static const baseUrl = "https://xpertsupplynetworks.com/";
  static String token = "";

  /// vendor api
  String signUp = "api/$selectUser/signup";
  String verifyOTP = "api/$selectUser/verify-otp";
  String login = "api/$selectUser/login";
  String logout = "api/$selectUser/logout";
  String deleteAccount = "api/$selectUser/delete";
  String forgotPassword = "api/$selectUser/forgot-password";
  String resetPassword = "api/$selectUser/reset-password";

/// vendor api customer
  String  categories = "api/customer/category/get";
  static String delivery = "api/vendor/delivery";
  static String getProfile = "api/vendor/get-profile";
  static String getCategory = "api/vendor/category/get";
  static String addCategory = "api/vendor/category/add";
  static String updateCategory = "api/vendor/category/update";
  static String deleteCategory = "api/vendor/category/delete";
  static String addProduct = "api/vendor/product/add";
  static String getProduct = "api/vendor/product/get";
  static String deleteProduct = "api/vendor/product/delete";
  static String updateProduct = "api/vendor/product/update";
  static String getOrder = "api/vendor/order/get";
  static String orderUpdateStatus = "api/vendor/order/update-status";
  static String getQuoteHistory = "api/vendor/quote-history";
  static String manageOffer = "api/vendor/manage-offer";
  // String  categories = "api/category/get";
}