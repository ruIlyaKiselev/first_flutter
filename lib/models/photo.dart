class Photo {
  final int _id;
  final String _title;
  final String _url;

  Photo.fromJson(Map<String, dynamic> json) :
        _id = json["id"],
        _title = json["title"],
        _url = json["url"];

  int? get id => _id;
  String? get title => _title;
  String? get url => _url;
}

class PhotoList {
  final List<Photo> photos = [];

  PhotoList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      photos.add(Photo.fromJson(jsonItem));
    }
  }

}

abstract class PhotoResult {}

class PhotoResultSuccess extends PhotoResult {
  final PhotoList photoList;
  PhotoResultSuccess(this.photoList);
}

class PhotoResultFailure extends PhotoResult {
  final String error;
  PhotoResultFailure(this.error);
}

class PhotoResultLoading extends PhotoResult {
  PhotoResultLoading();
}