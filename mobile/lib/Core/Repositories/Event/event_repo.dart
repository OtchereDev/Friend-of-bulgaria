abstract class EventRepository{
  Future<dynamic>getAllEvent(context, {int offset, int limit});
  Future<dynamic> getMyEvent(context, {int offset, int limit});
}