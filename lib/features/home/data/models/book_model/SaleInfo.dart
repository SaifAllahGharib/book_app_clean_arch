class SaleInfo {
  SaleInfo({this.country, this.saleability, this.isEbook, buyLink});

  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    buyLink = json['buyLink'];
  }

  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    map['buyLink'] = buyLink;
    return map;
  }
}
