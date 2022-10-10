class CurrentComicModel {
  int? num;
  String? title;
  String? image;
  String? alt;
  String? day;
  String? month;
  String? year;

  CurrentComicModel({
    this.num,
    this.title,
    this.image,
    this.alt,
    this.day,
    this.month,
    this.year,
  });

  CurrentComicModel.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    title = json['title'];
    image = json['img'];
    alt = json['alt'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['title'] = title;
    data['img'] = image;
    data['alt'] = alt;
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}
