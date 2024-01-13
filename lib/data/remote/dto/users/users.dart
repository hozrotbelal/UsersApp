class Users {
  int? id;
  String? gender;
  String? dateOfBirth;
  String? job;
  String? city;
  String? zipcode;
  double? latitude;
  String? profilePicture;
  String? email;
  String? lastName;
  String? firstName;
  String? phone;
  String? street;
  String? state;
  String? country;
  double? longitude;

  Users({this.id, this.gender, this.dateOfBirth, this.job, this.city, this.zipcode, this.latitude, this.profilePicture, this.email, this.lastName, this.firstName, this.phone, this.street, this.state, this.country, this.longitude});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    job = json['job'];
    city = json['city'];
    zipcode = json['zipcode'];
    latitude = json['latitude'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    phone = json['phone'];
    street = json['street'];
    state = json['state'];
    country = json['country'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['job'] = job;
    data['city'] = city;
    data['zipcode'] = zipcode;
    data['latitude'] = latitude;
    data['profile_picture'] = profilePicture;
    data['email'] = email;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['phone'] = phone;
    data['street'] = street;
    data['state'] = state;
    data['country'] = country;
    data['longitude'] = longitude;
    return data;
  }
}
