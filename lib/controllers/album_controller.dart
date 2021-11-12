import 'package:first_flutter/data/repository.dart';
import 'package:first_flutter/models/photo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AlbumController extends ControllerMVC {
  final Repository repo = Repository();

  PhotoResult currentState = PhotoResultLoading();

  void init() async {
    try {
      final photoList = await repo.fetchPhotos();
      setState(() => currentState = PhotoResultSuccess(photoList));
    } catch (error) {
      setState(() => currentState = PhotoResultFailure("Loading failure"));
    }
  }
}