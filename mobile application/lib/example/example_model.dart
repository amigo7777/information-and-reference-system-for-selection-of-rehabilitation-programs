import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_vkr/domain/api_client.dart';
import 'package:flutter_mobile_vkr/domain/entity/post_program.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    // final posts = await apiClient.getPosts();
    _posts += posts;
    notifyListeners();
  }

  void createPost() {}
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(ExampleModelProvider oldWidget) {
    return true;
  }
}
