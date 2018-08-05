import 'dart:async';

import 'package:sof_app/data/sof/sof_post_data.dart';
import 'package:sof_app/dependency_injection.dart';

class SofPostsPresenter {
  SofPostsRepository _sofPostsRepository;

  var _itemStreamController = StreamController<List<Post>>();

  get itemStream => _itemStreamController.stream;

  SofPostsPresenter() {
    Injector injector = Injector();
    _sofPostsRepository = injector.sofPostsRepository;
  }

  Future loadPosts() async {
    var items;
    try {
      items = await _sofPostsRepository.fetchPosts();
    } catch (e) {
      print(e);
      _itemStreamController.addError(e);
      return;
    }
    _itemStreamController.add(items);
  }
}