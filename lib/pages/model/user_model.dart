abstract class UserModel {
  String _name;
  String _email;
  String _phone;
  String _password;
  String? _address;
  String? _profileImage;

  UserModel({
    required String name,
    required String email,
    required String phone,
    required String password,
    String? address,
    String? profileImage,
  }) : _name = name,
       _email = email,
       _phone = phone,
       _password = password,
       _address = address,
       _profileImage = profileImage;

  // Getter
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get password => _password;
  String? get address => _address;
  String? get profileImage => _profileImage;

  // Setter
  set name(String value) => _name = value;
  set email(String value) => _email = value;
  set phone(String value) => _phone = value;
  set password(String value) => _password = value;
  set address(String? value) => _address = value;
  set profileImage(String? value) => _profileImage = value;

  @override
  String toString();
}

// Customer User
class CustomerUser extends UserModel {
  CustomerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    String? address,
    String? profileImage,
  }) : super(
         name: name,
         email: email,
         phone: phone,
         password: password,
         address: address,
         profileImage: profileImage,
       );

  @override
  String toString() {
    return "Customer{name: $name, email: $email, phone: $phone, address: $address}";
  }
}

// Teacher User
class TeacherUser extends UserModel {
  String _subject;

  TeacherUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String subject,
    String? address,
    String? profileImage,
  }) : _subject = subject,
       super(
         name: name,
         email: email,
         phone: phone,
         password: password,
         address: address,
         profileImage: profileImage,
       );

  String get subject => _subject;
  set subject(String value) => _subject = value;

  @override
  String toString() {
    return "Teacher{name: $name, email: $email, phone: $phone, subject: $_subject, address: $address}";
  }
}
