import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageLocalSecuriteStorageImpl
    implements LocalSecurityStorage {
  FlutterSecureStorage get _instace => const FlutterSecureStorage();

  @override
  Future<void> clear() => _instace.deleteAll();

  @override
  Future<bool> contains(String key) => _instace.containsKey(key: key);

  @override
  Future<String?> read(String key) => _instace.read(key: key);

  @override
  Future<void> remove(String key) => _instace.delete(key: key);

  @override
  Future<void> write(String key, String value) =>
      _instace.write(key: key, value: value);
}
