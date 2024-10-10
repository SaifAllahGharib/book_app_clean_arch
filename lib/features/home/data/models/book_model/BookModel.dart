import 'package:book_app_clean_arch/features/home/domain/entities/book_entity.dart';

import 'AccessInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';
import 'VolumeInfo.dart';

class BookModel extends BookEntity {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          bookId: id!,
          image: volumeInfo?.imageLinks?.thumbnail ?? "sa",
          title: volumeInfo!.title!,
          author: volumeInfo.authors?.first ?? "No name",
          rating: volumeInfo.averageRating ?? 0,
          ratingCount: volumeInfo.ratingsCount ?? 0,
          bookLink: saleInfo!.buyLink ?? volumeInfo.previewLink ?? "",
        );

  BookModel.fromJson(dynamic json)
      : super(
          bookId: json['id'],
          image: json['volumeInfo']?['imageLinks']?['thumbnail'] ?? "No Image",
          title: json['volumeInfo']?['title'] ?? "No Title",
          author: (json['volumeInfo']?['authors'] != null &&
                  json['volumeInfo']['authors'].isNotEmpty)
              ? json['volumeInfo']['authors'][0]
              : "No Author",
          rating: json['volumeInfo']?['averageRating']?.toDouble() ?? 0.0,
          ratingCount: json['volumeInfo']?['ratingsCount'] ?? 0,
          bookLink: json['saleInfo']?['buyLink'] ??
              json['volumeInfo']?['previewLink'] ??
              "",
        ) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
    saleInfo =
        json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null
        ? AccessInfo.fromJson(json['accessInfo'])
        : null;
    searchInfo = json['searchInfo'] != null
        ? SearchInfo.fromJson(json['searchInfo'])
        : null;
  }

  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}
