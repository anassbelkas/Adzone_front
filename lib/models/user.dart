class User {
  final String _id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String active;
  final String image;
  final String points;
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

  // NOTE: implementing functionality here in the next step!
}
