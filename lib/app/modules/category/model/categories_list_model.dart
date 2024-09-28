class CategoryListModel {
  final int? status;
  final String? message;
  final List<CategoryData>? data;

  CategoryListModel({
    this.status,
    this.message,
    this.data,
  });

  CategoryListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map(
                (dynamic e) => CategoryData.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class CategoryListData {
  final int? currentPage;
  final List<CategoryData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<LinksData>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  CategoryListData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  CategoryListData.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)
            ?.map(
                (dynamic e) => CategoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)
            ?.map((dynamic e) => LinksData.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total
      };
}

class CategoryData {
  final int? id;
  final String? name;
  final bool? status;
  final int? vendorId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  CategoryData({
    this.id,
    this.name,
    this.status,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  CategoryData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        status = json['status'] as bool?,
        vendorId = json['vendor_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'vendor_id': vendorId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt
      };
}

class LinksData {
  final dynamic url;
  final String? label;
  final bool? active;

  LinksData({
    this.url,
    this.label,
    this.active,
  });

  LinksData.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

  Map<String, dynamic> toJson() =>
      {'url': url, 'label': label, 'active': active};
}
