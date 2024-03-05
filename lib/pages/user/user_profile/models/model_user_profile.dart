class ModelGetUserProfile {
  DriverFullName driverFullName;
  DriverAvatar driverAvatar;
  DriverDirection driverDirection;
  DriverDateBirth driverDateBirth;
  dynamic phone;
  dynamic bio;

  ModelGetUserProfile({
    required this.driverFullName,
    required this.driverAvatar,
    required this.driverDirection,
    required this.driverDateBirth,
     this.phone,
     this.bio,
  });

  factory ModelGetUserProfile.fromJson(Map<String, dynamic> json) => ModelGetUserProfile(
    driverFullName: DriverFullName.fromJson(json["driver_full_name"]),
    driverAvatar: DriverAvatar.fromJson(json["driver_avatar"]),
    driverDirection: DriverDirection.fromJson(json["driver_direction"]),
    driverDateBirth: DriverDateBirth.fromJson(json["driver_date_birth"]),
    phone: json["phone"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "driver_full_name": driverFullName.toJson(),
    "driver_avatar": driverAvatar.toJson(),
    "driver_direction": driverDirection.toJson(),
    "driver_date_birth": driverDateBirth.toJson(),
    "phone": phone,
    "bio": bio,
  };
}

class DriverAvatar {
  dynamic image;

  DriverAvatar({
     this.image,
  });

  factory DriverAvatar.fromJson(Map<String, dynamic> json) => DriverAvatar(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class DriverDateBirth {
  dynamic date;

  DriverDateBirth({
     this.date,
  });

  factory DriverDateBirth.fromJson(Map<String, dynamic> json) => DriverDateBirth(
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "date": date
  };
}

class DriverDirection {
  Direction directionFrom;
  Direction directionTo;

  DriverDirection({
    required this.directionFrom,
    required this.directionTo,
  });

  factory DriverDirection.fromJson(Map<String, dynamic> json) => DriverDirection(
    directionFrom: Direction.fromJson(json["direction_from"]),
    directionTo: Direction.fromJson(json["direction_to"]),
  );

  Map<String, dynamic> toJson() => {
    "direction_from": directionFrom.toJson(),
    "direction_to": directionTo.toJson(),
  };
}

class Direction {
  dynamic id;
  dynamic name;

  Direction({
    this.id,
    this.name,
  });

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class DriverFullName {
  dynamic name;
  dynamic lastName;
  dynamic surname;

  DriverFullName({
    this.name,
    this.lastName,
    this.surname,
  });

  factory DriverFullName.fromJson(Map<String, dynamic> json) => DriverFullName(
    name: json["name"],
    lastName: json["last_name"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last_name": lastName,
    "surname": surname,
  };
}
