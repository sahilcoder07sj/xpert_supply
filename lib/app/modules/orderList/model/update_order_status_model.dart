class UpdateOrderStatus {
  int? status;
  String? message;
  UpdateOrderStatusData? data;

  UpdateOrderStatus({this.status, this.message, this.data});

  UpdateOrderStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UpdateOrderStatusData.fromJson(json['data']) : null;
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

class UpdateOrderStatusData {
  int? orderId;
  String? status;

  UpdateOrderStatusData({this.orderId, this.status});

  UpdateOrderStatusData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    return data;
  }
}
