import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String email;
    String sessionToken;
    String updatedAt;
    String objectId;
    String username;
    String createdAt;
    bool emailVerified;
    bool mobilePhoneVerified;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
