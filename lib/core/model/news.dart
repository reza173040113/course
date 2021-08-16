import 'package:json_annotation/json_annotation.dart';

// part 'news.g.dart';
class News {
  @JsonKey(name:"id")
  int id;

  @JsonKey(name:"characteristics")
  String characteristics;

  @JsonKey(name:"image")
  String image;

  @JsonKey(name:"modality")
  String modality;

  @JsonKey(name:"rating")
  int rating;

  @JsonKey(name:"status")
  String status;

  @JsonValue("title")
  String title;

  @JsonValue("type")
  String type;

  News();

  // factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  // Map<String, dynamic> toJson() => _$NewsToJson(this);
}
