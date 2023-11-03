import 'package:hackaton/Model/Request/payment_status_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PaymentRequestDatabase {
  late Database _database;

  Future open() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'payment_request.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE PaymentRequest (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          location TEXT,
          locationCoordinate TEXT,
          eventDate TEXT,
          details TEXT,
          displayImg TEXT,
          createdAt TEXT,
          updatedAt TEXT,
          payerName TEXT,
          ticketType TEXT,
          eventQuantity INTEGER,
          totalAmount REAL
        )
      ''');
    });
  }

  Future<int> insertPaymentRequest(PaymentRequest paymentRequest) async {
    await open();
    return await _database.insert('PaymentRequest', paymentRequest.toJson());
  }

  Future<List<PaymentRequest>> getPaymentRequests() async {
    await open();
    final List<Map<String, dynamic>> maps = await _database.query('PaymentRequest');
    return List.generate(maps.length, (i) {
      return PaymentRequest.fromJson(maps[i]);
    });
  }



  Future<void> deletePaymentRequest(int id) async {
    await open();
    await _database.delete(
      'PaymentRequest',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async => _database.close();
}
