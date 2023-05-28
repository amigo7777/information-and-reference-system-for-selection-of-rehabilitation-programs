// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    duration: json['duration'] as int,
    goal: json['goal'] as String,
    results: json['results'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'goal': instance.goal,
      'results': instance.results,
    };
