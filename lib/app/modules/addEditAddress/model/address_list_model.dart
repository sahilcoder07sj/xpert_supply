import 'package:tbd_flutter/app/modules/addEditAddress/model/add_edit_address_model.dart';

class AddressModel {
  final int? status;
  final String? message;
  final List<AddEditAddressData>? data;

  AddressModel({
    this.status,
    this.message,
    this.data,
  });

  AddressModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) =>
                AddEditAddressData.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}
