import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/providers/favorites.provider.dart';
import 'package:testing_app/pages/favorites.page.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Sample'),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, FavoritesPage.routeName);
            },
            icon: Icon(Icons.favorite_border),
            label: Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          var isFavorite = provider.items.contains(index);
          return ItemTile(
            id: index,
            isFavorite: isFavorite,
            onTap: () {
              isFavorite ? provider.remove(index) : provider.add(index);
            },
          );
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int id;
  final bool isFavorite;
  final void Function() onTap;

  const ItemTile({
    @required this.id,
    @required this.isFavorite,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[id % Colors.primaries.length],
        ),
        title: Text('Item $id'),
        trailing: IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: onTap,
        ),
      ),
    );
  }
}
