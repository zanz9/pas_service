class IUser {
  final String email;
  late String firstName;
  late String lastName;
  late bool state;

  IUser({required this.email});

  fromFirestore(Map<String, dynamic> data) {
    firstName = data['firstName'];
    lastName = data['lastName'];
    state = data['state'];

    return this;
  }

  toFirestore() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'state': state,
      'isAdmin': false,
    };
  }
}
