class UserModel {
  late String userName;
  late String email;
  late String uId;
  late String image;

  UserModel({
    required this.userName,
    required this.email,
    required this.uId,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'image': image,
    };
  }
}
