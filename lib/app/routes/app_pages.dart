import 'package:get/get.dart';

import '../modules/addEditAddress/bindings/add_edit_address_binding.dart';
import '../modules/addEditAddress/views/add_edit_address_view.dart';
import '../modules/addEditCategory/bindings/add_edit_category_binding.dart';
import '../modules/addEditCategory/views/add_edit_category_view.dart';
import '../modules/addProduct/bindings/add_product_binding.dart';
import '../modules/addProduct/views/add_product_view.dart';
import '../modules/archived/bindings/archived_binding.dart';
import '../modules/archived/views/archived_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/changePassword/bindings/change_password_binding.dart';
import '../modules/changePassword/views/change_password_view.dart';
import '../modules/consumer_products/bindings/consumer_products_binding.dart';
import '../modules/consumer_products/views/consumer_products_view.dart';
import '../modules/deleteAccount/bindings/delete_account_binding.dart';
import '../modules/deleteAccount/views/delete_account_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/editProduct/bindings/edit_product_binding.dart';
import '../modules/editProduct/views/edit_product_view.dart';
import '../modules/editProfile/bindings/edit_profile_binding.dart';
import '../modules/editProfile/views/edit_profile_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/forgot_password.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/otp_view.dart';
import '../modules/login/views/reset_password_view.dart';
import '../modules/management/bindings/management_binding.dart';
import '../modules/management/views/management_view.dart';
import '../modules/myCart/bindings/my_cart_binding.dart';
import '../modules/myCart/views/my_cart_view.dart';
import '../modules/myOrder/bindings/my_order_binding.dart';
import '../modules/myOrder/views/my_order_view.dart';
import '../modules/myOrder/views/order_confirm_view.dart';
import '../modules/myProfile/bindings/my_profile_binding.dart';
import '../modules/myProfile/views/my_profile_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/orderHistory/bindings/order_history_binding.dart';
import '../modules/orderHistory/views/order_history_view.dart';
import '../modules/orderList/bindings/order_list_binding.dart';
import '../modules/orderList/views/order_list_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/productDetail/bindings/product_detail_binding.dart';
import '../modules/productDetail/views/product_detail_view.dart';
import '../modules/quate/bindings/quate_binding.dart';
import '../modules/quate/views/quate_view.dart';
import '../modules/selectUser/bindings/select_user_binding.dart';
import '../modules/selectUser/views/select_user_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/uploadFile/bindings/upload_file_binding.dart';
import '../modules/uploadFile/views/upload_file_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_USER,
      page: () => const SelectUserView(),
      binding: SelectUserBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEMENT,
      page: () => const ManagementView(),
      binding: ManagementBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_CATEGORY,
      page: () => const AddEditCategoryView(),
      binding: AddEditCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => const EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.CONSUMER_PRODUCTS,
      page: () => const ConsumerProductsView(),
      binding: ConsumerProductsBinding(),
    ),
    GetPage(
      name: _Paths.MY_CART,
      page: () => const MyCartView(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_HISTORY,
      page: () => const OrderHistoryView(),
      binding: OrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.QUATE,
      page: () => const QuateView(),
      binding: QuateBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_FILE,
      page: () => const UploadFileView(),
      binding: UploadFileBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDER,
      page: () => const MyOrderView(),
      binding: MyOrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_CONFIRM,
      page: () => const OrderConfirmView(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_ADDRESS,
      page: () => const AddEditAddressView(),
      binding: AddEditAddressBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_LIST,
      page: () => const OrderListView(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVED,
      page: () => const ArchivedView(),
      binding: ArchivedBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
