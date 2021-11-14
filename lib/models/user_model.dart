class UserModel {
  String? _id;
  String? _fullName;
  String? _email;
  String? _password;
  String? _username;
  String? _position;
  String? _imageUrl;
  bool? _isOnline;

  UserModel(
    this._id,
    this._fullName,
    this._email,
    this._password,
    this._imageUrl,
    this._username,
    this._position,
    this._isOnline,
  );

  UserModel.fromJson(Map<String, dynamic> map) {
    _id = map['id'];
    _fullName = map['fullName'];
    _email = map['email'];
    _username = map['username'];
    _position = map['position'];
    _isOnline = map['isOnline'];
    _password = map['password'];
    _imageUrl = map['imageUrl'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'fullName': _fullName,
        'email': _email,
        'password': _password,
        'username': _username,
        'position': _position,
        'isOnline': _isOnline,
        'imageUrl': _imageUrl,
      };

  String get id => _id!;

  String get fullName => _fullName!;

  bool get isOnline => _isOnline!;

  String get position => _position!;

  String get username => _username!;

  String get password => _password!;

  String get email => _email!;

  String get imageUrl => _imageUrl!;
}
