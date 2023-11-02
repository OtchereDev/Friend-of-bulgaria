abstract class TransactionRepository{
  Future<dynamic> getTransaction(context, {int? limit, int? offset});
  Future<dynamic> getStatistics(context);
}