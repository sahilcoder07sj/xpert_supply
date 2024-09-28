class AddToCartModel {
  final int? status;
  final String? message;
  final AddToCartData? data;

  AddToCartModel({
    this.status,
    this.message,
    this.data,
  });

  AddToCartModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? AddToCartData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class AddToCartData {
  final int? cartId;
  final int? productId;
  final int? quantity;

  AddToCartData({
    this.cartId,
    this.productId,
    this.quantity,
  });

  AddToCartData.fromJson(Map<String, dynamic> json)
      : cartId = json['cart_id'] as int?,
        productId = json['product_id'] as int?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() => {
    'cart_id' : cartId,
    'product_id' : productId,
    'quantity' : quantity
  };
}