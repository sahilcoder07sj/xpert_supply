class ManageOrder {
  int? status;
  String? message;
  ManageOrderData? data;

  ManageOrder({this.status, this.message, this.data});

  ManageOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ManageOrderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ManageOrderData {
  int? id;
  int? customerId;
  int? vendorId;
  String? message;
  String? totalPrice;
  String? offerPrice;
  String? status;
  String? createdAt;
  String? updatedAt;

  ManageOrderData(
      {this.id,
        this.customerId,
        this.vendorId,
        this.message,
        this.totalPrice,
        this.offerPrice,
        this.status,
        this.createdAt,
        this.updatedAt});

  ManageOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    vendorId = json['vendor_id'];
    message = json['message'];
    totalPrice = json['total_price'];
    offerPrice = json['offer_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['vendor_id'] = this.vendorId;
    data['message'] = this.message;
    data['total_price'] = this.totalPrice;
    data['offer_price'] = this.offerPrice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
