class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  final String nationalId;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.nationalId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic>? jsonData) {
    if (jsonData == null) {
      return ProfileModel(
        name: '',
        email: '',
        phone: '',
        profileImage: '',
        nationalId: '',
      );
    }

    return ProfileModel(
      name: jsonData['name'] ?? '',
      email: jsonData['email'] ?? '',
      phone: jsonData['phone'] ?? '',
      profileImage: jsonData['profileImage'] ?? '',
      nationalId: jsonData['nationalId'] ?? '',
    );
  }
}

class UserProfile {
  final ProfileModel profileModel;

  UserProfile({required this.profileModel});

  factory UserProfile.fromJson(Map<String, dynamic>? jsonData) {
    if (jsonData == null || jsonData['user'] == null) {
      return UserProfile(profileModel: ProfileModel.fromJson(null));
    }

    return UserProfile(
      profileModel: ProfileModel.fromJson(jsonData['user']),
    );
  }
}
