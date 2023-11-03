import 'dart:convert';
import 'package:hackaton/Model/Request/payment_status_request.dart';
import 'package:hackaton/Services/Local/localDB_config.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/Utils/Dialogs/notifications.dart';
import 'package:html/parser.dart';

import 'package:flutter/material.dart';
import 'package:hackaton/Model/Response/event_response_model.dart';
import 'package:hackaton/Services/Remote/Event/event_service.dart';

class EventProvider extends ChangeNotifier {
  final eventService = EventRemoteService();
  final sharedPref = SharedPrefsManager();
  final paymentRequestDatabase = PaymentRequestDatabase();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<EventResponseModel> _eventModel = [];
  List<EventResponseModel> get eventModel => _eventModel;



  List<PaymentRequest> _paymentRequest = [];
  List<PaymentRequest> get paymentRequest => _paymentRequest;

  EventResponseModel _selectedEvent = EventResponseModel();
  EventResponseModel get selectedEvent => _selectedEvent;



  PaymentRequest _myselectedEvent = PaymentRequest();
  PaymentRequest get mySelectedEvent => _myselectedEvent;

  String? _ticketType;
  String? get ticketType => _ticketType;

  int _quantity = 1;
  int get quantity => _quantity;

  String? _totalAmount;
  String? get totalAmount => _totalAmount;

  double _itemPrice =0.0;
  double get itemPrice => _itemPrice;


  String? _payerName;
  String? get payerName => _payerName;

  setMyRequest(PaymentRequest pay){
    _myselectedEvent = pay;
    notifyListeners();
  }

  setAmount(String i) {
    _totalAmount = i;
    notifyListeners();
  }

   setItemPrice(double i) {
    _itemPrice = i;
    notifyListeners();
  }


   setPayerName(String i) {
    _payerName = i;
    notifyListeners();
  }

  setQantity(int i) {
    _quantity = i;
    notifyListeners();
  }

  increaseQuantity(){
    _quantity ++;
    notifyListeners();
  }

  decreaseQuantity(context){
    if(_quantity <1){
      NotificationUtils.showToast(context, message: 'Ticket quantity cannot be less than one');
    }else{
    _quantity --;
    notifyListeners();

    }
  }

  setTicketTypr(String t) {
    _ticketType = t;
    notifyListeners();
  }

  int _limit = 30;
  int get limit => _limit;

  int _offset = 1;
  int get offset => _offset;

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  setEvent(EventResponseModel event) {
    _selectedEvent = event;
    notifyListeners();
  }

  loadMore() async {}

  getAllEvents(context) async {
    //decode base64
    _eventModel.clear();
    setLoading(true);
    await eventService
        .getAllEvent(context, limit: _limit, offset: _offset)
        .then((value) {
      setLoading(false);
      if (value['data'] != null) {
        for (var x in value['data']) {
          final document = parse(x['content']['rendered']);
          String parsedString =
              parse(document.body?.text).documentElement!.text;
          var data = base64Decode(parsedString.trim());
          // print(data);
          var newData = utf8.decode(data);
          _eventModel.add(EventResponseModel.fromJson(json.decode(newData)));
          notifyListeners();
        }
      }
    });
  }

  getMyEvents(context) async {
    await sharedPref.getEvent().then((value) {
      var data = jsonDecode(value);
      if (data != null) {
        for (var x in data) {
          print(x);
        }
      }
    });
  }

  Future<void> saveEventForLoacal(
      {String? name, price, int? quantity, ticketType}) async {
    await paymentRequestDatabase.open();
    PaymentRequest _pr = PaymentRequest();

    _pr.location = _selectedEvent.location;
    _pr.payerName = name;
    _pr.eventDate = _selectedEvent.eventDate;
    _pr.totalAmount = price;
    _pr.eventQuantity = quantity;
    _pr.ticketType = ticketType;
    _pr.details = _selectedEvent.details;
    _pr.title = _selectedEvent.title;
    _pr.displayImg = _selectedEvent.displayImg;

    await paymentRequestDatabase.insertPaymentRequest(_pr);
  }

  getAllMyEvent() async {
      print('Title: , Location:');

    _paymentRequest.clear();
    await paymentRequestDatabase.open();
    final paymentRequests = await paymentRequestDatabase.getPaymentRequests();
    for (final request in paymentRequests) {
      _paymentRequest.add(PaymentRequest.fromJson(request.toJson()));
      notifyListeners();
      print('Title: ${request.title}, Location: ${request.location}');
    }
  }
}
