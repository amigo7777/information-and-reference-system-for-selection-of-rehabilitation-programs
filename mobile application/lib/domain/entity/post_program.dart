import 'package:json_annotation/json_annotation.dart';

part 'post_program.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(name: 'id')
  final int id;
  final String name;
  final String description;
  final int duration;
  final String goal;
  final String results;

  Post(
      {required this.id,
      required this.name,
      required this.description,
      required this.duration,
      required this.goal,
      required this.results});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
