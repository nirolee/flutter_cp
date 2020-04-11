// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..email = json['email'] as String
    ..sessionToken = json['sessionToken'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..username = json['username'] as String
    ..createdAt = json['createdAt'] as String
    ..emailVerified = json['emailVerified'] as bool
    ..mobilePhoneVerified = json['mobilePhoneVerified'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'sessionToken': instance.sessionToken,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'username': instance.username,
      'createdAt': instance.createdAt,
      'emailVerified': instance.emailVerified,
      'mobilePhoneVerified': instance.mobilePhoneVerified
    };
