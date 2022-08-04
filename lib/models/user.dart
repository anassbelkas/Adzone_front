class User {
  final String _id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final bool active;
  final String image;
  final int points;
  final String last_reward;
  final String created_at;
  final String updated_at;

  User(
      this._id,
      this.first_name,
      this.last_name,
      this.email,
      this.password,
      this.active,
      this.image,
      this.points,
      this.last_reward,
      this.created_at,
      this.updated_at);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['_id'],
        json['first_name'],
        json['last_name'],
        json['email'],
        json['password'],
        json['active'],
        json['image'],
        json['points'],
        json['last_reward'],
        json['created_at'],
        json['updated_at']);
  }
  //to json
  Map<String, dynamic> toJson() => {
        '_id': _id,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'active': active,
        'image': image,
        'points': points,
        'last_reward': last_reward,
        'created_at': created_at,
        'updated_at': updated_at,
      };

  // NOTE: implementing functionality here in the next step!
}
