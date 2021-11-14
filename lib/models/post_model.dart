class Post {
  String? _id;
  String? _userId;
  String? _imageUrl;
  List<String>? _likedList;

  Post(this._id, this._userId, this._imageUrl, this._likedList);

  Post.fromJson(Map<String, dynamic> map) {
    _id = map['id'];
    _userId = map['userId'];
    _imageUrl = map['imageUrl'];
    _likedList = map['likedList'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'imageUrl': _imageUrl,
        'likedList': _likedList,
      };
}
