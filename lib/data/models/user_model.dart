class UserModel {
  //final use kortesi jate api theke jei data ashche shetai final, keu modify jate na korte pari.
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
  });

  //named constructor method, factory r moto create kore return kore.
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    //factory r bhitor theke uporer class er e akta instance create kortesi.
    return UserModel(
      id: jsonData['_id'],
      email: jsonData['email'],
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      mobile: jsonData['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };
  }
}
