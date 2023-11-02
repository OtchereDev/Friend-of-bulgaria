// To parse this JSON data, do
//
//     final eventResponseModel = eventResponseModelFromJson(jsonString);

// import 'dart:convert';

// EventResponseModel eventResponseModelFromJson(String str) => EventResponseModel.fromJson(json.decode(str));

// String eventResponseModelToJson(EventResponseModel data) => json.encode(data.toJson());

class EventResponseModel {
    List<EventModel> events;
    dynamic banner;
    Meta meta;

    EventResponseModel({
        required this.events,
        required this.banner,
        required this.meta,
    });

    factory EventResponseModel.fromJson(Map<String, dynamic> json) => EventResponseModel(
        events: List<EventModel>.from(json["events"].map((x) => EventModel.fromJson(x))),
        banner: json["banner"],
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "banner": banner,
        "meta": meta.toJson(),
    };
}

class EventModel {
    String? id;
    String? eventId;
    String? title;
    String? location;
    String? locationUrl;
    int? price;
    DateTime? eventDate;
    String? details;
    bool? showInApp;
    String? displayImg;
    List<String>? tags;
    bool? isDeleted;
    DateTime? createdAt;
    DateTime? updatedAt;

    EventModel({
         this.id,
         this.eventId,
         this.title,
         this.location,
         this.locationUrl,
         this.price,
         this.eventDate,
         this.details,
         this.showInApp,
         this.displayImg,
         this.tags,
         this.isDeleted,
         this.createdAt,
         this.updatedAt,
    });

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        eventId: json["eventId"],
        title: json["title"],
        location: json["location"],
        locationUrl: json["locationUrl"],
        price: json["price"],
        eventDate: DateTime.parse(json["eventDate"]),
        details: json["details"],
        showInApp: json["showInApp"],
        displayImg: json["displayImg"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "eventId": eventId,
        "title": title,
        "location": location,
        "locationUrl": locationUrl,
        "price": price,
        "eventDate": eventDate?.toIso8601String(),
        "details": details,
        "showInApp": showInApp,
        "displayImg": displayImg,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class Meta {
    int page;
    int limit;
    int totalPage;

    Meta({
        required this.page,
        required this.limit,
        required this.totalPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json["page"],
        limit: json["limit"],
        totalPage: json["totalPage"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "totalPage": totalPage,
    };
}
