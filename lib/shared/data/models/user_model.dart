class UserModel {
  final String uid;

  UserModel({required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: '${json['name']}/${json['latestVersion']}/${json['description']}',
      );
}
