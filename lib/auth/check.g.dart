part of '../auth/check.dart';

Check _$CheckFromJson(Map<String, dynamic> json) => Check(
  userId: json['userId'] as int?,
  id: json['id'] as int?,
  title: json['title'] as String?,
  completed: json['completed'] as bool?,
);

Map<String, dynamic> _$CheckToJson(Check instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'title': instance.title,
  'completed': instance.completed,
};