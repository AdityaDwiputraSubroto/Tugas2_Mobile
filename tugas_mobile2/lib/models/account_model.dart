class Account {
  String id;
  String username;
  String password;
  List<String> favorites;

  Account({
    required this.id,
    required this.username,
    required this.password,
    required this.favorites,
  });

  void addFavorite(String websiteId) {
    if (!favorites.contains(websiteId)) {
      favorites.add(websiteId);
      print('add');
    }
  }

  void removeFavorite(String websiteId) {
    favorites.remove(websiteId);
    print('remove');
  }
}
