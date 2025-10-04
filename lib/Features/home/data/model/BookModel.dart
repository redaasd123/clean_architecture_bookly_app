import 'dart:convert';


import '../../domain/entity/book_entity.dart';
BookModel bookModelFromJson(String str) =>
    BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel extends BookEntity {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo? searchInfo;

  BookModel._internal({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    this.searchInfo,})
      : super(
    webReaderLink: accessInfo.webReaderLink,
    previewLink: volumeInfo.previewLink,
    category: (volumeInfo.categories?.isNotEmpty ?? false)
        ? volumeInfo.categories!.first
        : "Unknown",
    count: volumeInfo.ratingsCount ?? 0,
    bookId: id,
    image: volumeInfo.imageLinks?.thumbnail ?? '',
    authorName: volumeInfo.authors?.isNotEmpty == true
        ? volumeInfo.authors![0]
        : 'كاتب غير معروف',
    price: 0.0,
    rating: volumeInfo.averageRating,
    title: volumeInfo.title,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfoJson = json["volumeInfo"];
    final saleInfoJson = json["saleInfo"];
    final accessInfoJson = json["accessInfo"];

    if (volumeInfoJson == null ||
        saleInfoJson == null ||
        accessInfoJson == null) {
      throw Exception("Missing required book data");
    }

    final volumeInfo = VolumeInfo.fromJson(volumeInfoJson);

    return BookModel._internal(
      kind: json["kind"] ?? '',
      id: json["id"] ?? '',
      etag: json["etag"] ?? '',
      selfLink: json["selfLink"] ?? '',
      volumeInfo: volumeInfo,
      saleInfo: SaleInfo.fromJson(saleInfoJson),
      accessInfo: AccessInfo.fromJson(accessInfoJson),
      searchInfo: json["searchInfo"] != null
          ? SearchInfo.fromJson(json["searchInfo"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo.toJson(),
    "accessInfo": accessInfo.toJson(),
    "searchInfo": searchInfo?.toJson(),
  };
}

class AccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Pdf pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json["country"],
    viewability: json["viewability"],
    embeddable: json["embeddable"],
    publicDomain: json["publicDomain"],
    textToSpeechPermission: json["textToSpeechPermission"],
    epub: Epub.fromJson(json["epub"]),
    pdf: Pdf.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    accessViewStatus: json["accessViewStatus"],
    quoteSharingAllowed: json["quoteSharingAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "viewability": viewability,
    "embeddable": embeddable,
    "publicDomain": publicDomain,
    "textToSpeechPermission": textToSpeechPermission,
    "epub": epub.toJson(),
    "pdf": pdf.toJson(),
    "webReaderLink": webReaderLink,
    "accessViewStatus": accessViewStatus,
    "quoteSharingAllowed": quoteSharingAllowed,
  };
}


class Epub {
  bool isAvailable;
  String? downloadLink;

  Epub({
    required this.isAvailable,
    this.downloadLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"],
    downloadLink: json["downloadLink"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "downloadLink": downloadLink,
  };
}

class Pdf {
  bool isAvailable;
  String? downloadLink;

  Pdf({
    required this.isAvailable,
    this.downloadLink,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
    isAvailable: json["isAvailable"],
    downloadLink: json["downloadLink"],
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "downloadLink": downloadLink,
  };
}


class SaleInfo {
  String country;
  String saleability;
  bool isEbook;
  String? buyLink;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    this.buyLink,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json["country"],
    saleability: json["saleability"],
    isEbook: json["isEbook"],
    buyLink: json["buyLink"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "saleability": saleability,
    "isEbook": isEbook,
    "buyLink": buyLink,
  };
}

class SearchInfo {
  String textSnippet;

  SearchInfo({
    required this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json["textSnippet"],
  );

  Map<String, dynamic> toJson() => {
    "textSnippet": textSnippet,
  };
}

class VolumeInfo {
  String title;
  String? publishedDate;
  List<String>? authors; // ✅ أضفنا دي
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int? pageCount;
  String printType;
  List<String>? categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks? imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  double? averageRating;
  int? ratingsCount;

  VolumeInfo({
    required this.title,
    required this.publishedDate,
    required this.authors, // ✅ هنا كمان
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.averageRating,
    required this.ratingsCount,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json["title"] ?? "No Title",
    publishedDate: json["publishedDate"] ?? "Unknown",
    authors: json["authors"] == null
        ? []
        : List<String>.from(json["authors"]),
    industryIdentifiers: (json["industryIdentifiers"] as List?)
        ?.map((x) => IndustryIdentifier.fromJson(x))
        .toList() ?? [],
    readingModes: json["readingModes"] != null
        ? ReadingModes.fromJson(json["readingModes"])
        : ReadingModes(text: false, image: false),
    pageCount: json["pageCount"] ?? 0,
    printType: json["printType"] ?? "Unknown",
    categories: json["categories"] == null
        ? []
        : List<String>.from(json["categories"]),
    maturityRating: json["maturityRating"] ?? "Unknown",
    allowAnonLogging: json["allowAnonLogging"] ?? false,
    contentVersion: json["contentVersion"] ?? "",
    panelizationSummary: json["panelizationSummary"] != null
        ? PanelizationSummary.fromJson(json["panelizationSummary"])
        : PanelizationSummary(containsEpubBubbles: false, containsImageBubbles: false),
    imageLinks: json["imageLinks"] != null
        ? ImageLinks.fromJson(json["imageLinks"])
        : null,
    language: json["language"] ?? "Unknown",
    previewLink: json["previewLink"] ?? "",
    infoLink: json["infoLink"] ?? "",
    canonicalVolumeLink: json["canonicalVolumeLink"] ?? "",
    averageRating: json["averageRating"]?.toDouble() ?? 0.0,
    ratingsCount: json["ratingsCount"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "publishedDate": publishedDate,
    "authors": authors, // ✅ هنا
    "industryIdentifiers":
    List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
    "readingModes": readingModes.toJson(),
    "pageCount": pageCount,
    "printType": printType,
    "categories": categories,
    "maturityRating": maturityRating,
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "panelizationSummary": panelizationSummary.toJson(),
    "imageLinks": imageLinks?.toJson(),
    "language": language,
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
    "averageRating": averageRating,
    "ratingsCount": ratingsCount,
  };
}


class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}

class IndustryIdentifier {
  String type;
  String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "identifier": identifier,
  };
}

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
    "containsEpubBubbles": containsEpubBubbles,
    "containsImageBubbles": containsImageBubbles,
  };
}

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
    text: json["text"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
  };
}
