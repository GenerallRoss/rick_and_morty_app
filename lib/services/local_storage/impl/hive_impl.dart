import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/services/local_storage/local_storage.dart';

@Singleton(as: LocalStorage)
class HiveStorage implements LocalStorage {
  final Box _box = Hive.box("app");

  @override
  bool contains({required LocalKeys key}) {
    try {
      return _box.containsKey(key);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<dynamic> load({required LocalKeys key}) async {
    try {
      return await _box.get(key);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> write({required LocalKeys key, required data}) async {
    try {
      await _box.put(key, data);
      return true;
    } catch (_) {
      return false;
    }
  }
}
