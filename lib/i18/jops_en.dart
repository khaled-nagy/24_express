import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "enter_your_account": MessageLookupByLibrary.simpleMessage("Enter your Accountُُ"),
    "password": MessageLookupByLibrary.simpleMessage("Passwordُُ"),
    "how_are_we" : MessageLookupByLibrary.simpleMessage("how are we"),
    "medical_guide" : MessageLookupByLibrary.simpleMessage("medical guide"),
    "special_offers" : MessageLookupByLibrary.simpleMessage("special offers"),
    "request_card" : MessageLookupByLibrary.simpleMessage("request card"),
    "call_us" : MessageLookupByLibrary.simpleMessage("call us"),
    "notifications" : MessageLookupByLibrary.simpleMessage("notifications"),
    "main" : MessageLookupByLibrary.simpleMessage("main"),
    "favorite" : MessageLookupByLibrary.simpleMessage("favorite"),
    "news" : MessageLookupByLibrary.simpleMessage("news"),
    "events" : MessageLookupByLibrary.simpleMessage("events"),
    "honors" : MessageLookupByLibrary.simpleMessage("honors"),
    "terms_and_conditions" : MessageLookupByLibrary.simpleMessage("terms and conditions"),
    "special_services" : MessageLookupByLibrary.simpleMessage("special services"),





  };
}