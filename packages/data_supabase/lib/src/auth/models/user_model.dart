import 'package:domain/auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    super.avatarUrl,
    required super.username,
    required super.role,
  });

  factory UserModel.fromSupabaseUser(User user) {
    final metaData = user.userMetadata ?? {};
    return UserModel(
      id: user.id,
      username: metaData['username'] as String? ?? '',
      avatarUrl: metaData['avatar_url'] as String?,
      role: metaData['role'] as String? ?? 'user',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'avatar_url')
  @override
  String? get avatarUrl;
}
