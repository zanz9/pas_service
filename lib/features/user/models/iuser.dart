class IUser {
  final String email;
  late String firstName;
  late String lastName;
  late bool state;
  late bool firstTime;

  late double professional;
  late double personal;
  late double business;
  late double integral;
  late double test;

  IUser({required this.email});

  fromFirestore(Map<String, dynamic> data) {
    firstName = data['firstName'];
    lastName = data['lastName'];
    state = data['state'];
    firstTime = data['firstTime'];

    professional = data['professional']?.toDouble() ?? 0;
    personal = data['personal']?.toDouble() ?? 0;
    business = data['business']?.toDouble() ?? 0;
    integral = data['integral']?.toDouble() ?? 0;
    test = data['test']?.toDouble() ?? 0;

    return this;
  }

  toFirestore() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'state': state,
      'isAdmin': false,
      'firstTime': firstTime,
      'professional': professional,
      'personal': personal,
      'business': business,
      'integral': integral,
      'test': test,
    };
  }
}
