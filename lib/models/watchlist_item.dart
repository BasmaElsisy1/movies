class watchlist_item {
  String id;
  String title;
  String relase_time;
  String image_url;

  watchlist_item(
      {this.id = '',
        required this.title,
        required this.relase_time,
        required  this.image_url});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "relase_time": relase_time,
      "image_url": image_url,
    };
  }

  watchlist_item.fromJson(Map<String, dynamic> json)
      : this(
      id: json['id'],
      title: json['title'],
      relase_time: json['relase_time'],
      image_url: json['image_url']);
}
