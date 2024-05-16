class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? image;
  bool? isEmailVerified=false;

  UserModel({
    this.name,
    this.phone,
    this.email,
    this.uId,
    this.image,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
      'image': image,
      'isEmailVerified': isEmailVerified,
    };
  }
}
