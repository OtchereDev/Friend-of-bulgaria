class EventResponseModel {
  String? title;
  String? location;
  String? locationCoordinate;
  List<Tickets>? tickets;
  String? eventDate;
  String? details;
  String? displayImg;
  List<String>? tags;
  String? createdAt;
  String? updatedAt;

  EventResponseModel(
      {this.title,
      this.location,
      this.locationCoordinate,
      this.tickets,
      this.eventDate,
      this.details,
      this.displayImg,
      this.tags,
      this.createdAt,
      this.updatedAt});

  EventResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    location = json['location'];
    locationCoordinate = json['locationCoordinate'];
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
    eventDate = json['eventDate'];
    details = json['details'];
    displayImg = json['displayImg'];
    tags = json['tags'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['location'] = this.location;
    data['locationCoordinate'] = this.locationCoordinate;
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    data['eventDate'] = this.eventDate;
    data['details'] = this.details;
    data['displayImg'] = this.displayImg;
    data['tags'] = this.tags;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Tickets {
  String? type;
  dynamic price;
  String? currency;

  Tickets({this.type, this.price, this.currency});

  Tickets.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}
