enum LocalKeys { character }

abstract interface class LocalStorage {
  Future<bool> write({
    required LocalKeys key,
    required Map<String, dynamic> data,
  });

  Future<dynamic> load({required LocalKeys key});

  bool contains({required LocalKeys key});
}
