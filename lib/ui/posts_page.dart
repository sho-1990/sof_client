import 'package:flutter/material.dart';
import 'package:sof_app/data/sof/sof_post_data.dart';
import 'package:sof_app/modules/sof_posts_presenter.dart';
import 'package:sof_app/ui/navigation_util.dart';
import 'ui_util.dart' as uiUtil;

class PostsPage extends StatelessWidget {

  final SofPostsPresenter _sofPostsPresenter = SofPostsPresenter();

  @override
  Widget build(BuildContext context) {
    return _postsWidget();
  }

  Widget _postsWidget() {
    return StreamBuilder(
      stream: _sofPostsPresenter.itemStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _loadErrorWidget(Theme.of(context));
        }
        if (!snapshot.hasData) {
          _sofPostsPresenter.loadPosts();
          return Center(
            child: uiUtil.circleIndicator,
          );
        }
        List<Post> postItems = snapshot.data;
        return Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemCount: postItems.length,
                  itemBuilder: (context, index) {
                    return _getListItemUi(postItems[index], context);
                  },),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _loadErrorWidget(ThemeData themeData) {
    return uiUtil.errorWidget(themeData, () {
      _sofPostsPresenter.loadPosts();
    });
  }

  Widget _getListItemUi(Post postItem, BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image.network(postItem.owner.profileImage),
          ),
          title: Text(postItem.postType, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(postItem.link),
          trailing: FlatButton(
            child: Text("detail"),
            onPressed: () {
              _openWeb(context, postItem.link);
            },
          ),
          onTap: () {
            _openWeb(context, postItem.link);
          },
        ),
        Divider(),
      ],
    );
  }

  void _openWeb(BuildContext context, String url) {
    openWeb(context, url);
  }
}

