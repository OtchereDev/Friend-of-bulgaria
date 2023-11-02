import 'package:flutter/material.dart';
import 'package:hackaton/Model/Response/event_response_model.dart';
import 'package:hackaton/Services/Remote/Event/event_service.dart';

class EventProvider extends ChangeNotifier {
  final eventService = EventRemoteService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<EventModel> _eventModel = [];
  List<EventModel> get eventModel => _eventModel;

  EventModel _selectedEvent = EventModel();
  EventModel get selectedEvent => _selectedEvent;




  int _limit = 30;
  int get limit => _limit;

  int _offset = 1;
  int get offset => _offset;

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }


  setEvent(EventModel event){
    _selectedEvent = event;
    notifyListeners();
  }

  loadMore() async {}

  getAllEvents(context) async {
    setLoading(true);
    await eventService
        .getAllEvent(context, limit: _limit, offset: _offset)
        .then((value) {
      setLoading(false);

      for (var x in value['data']['events']) {
        _eventModel.add(EventModel.fromJson(x));
        notifyListeners();
      }
    });
  }

  getMyEvents(context) async {
    await eventService.getAllEvent(context).then((value) {
      print(value);
    });
  }
}
