import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => {
    "login": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "enter_your_account": MessageLookupByLibrary.simpleMessage("البريد الالكترونى"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "how_are_we" : MessageLookupByLibrary.simpleMessage("من نحن"),
    "medical_guide" : MessageLookupByLibrary.simpleMessage("الدليل الطبى"),
    "special_offers" : MessageLookupByLibrary.simpleMessage("عروض خاصه"),
    "request_card" : MessageLookupByLibrary.simpleMessage("طلب بطاقه"),
    "call_us" : MessageLookupByLibrary.simpleMessage("اتصل بنا"),
    "notifications" : MessageLookupByLibrary.simpleMessage("الاشعارات"),
    "main" : MessageLookupByLibrary.simpleMessage("الرئيسيه"),
    "favorite" : MessageLookupByLibrary.simpleMessage("المفضله"),
    "news" : MessageLookupByLibrary.simpleMessage("اخبار"),
    "events" : MessageLookupByLibrary.simpleMessage("فعاليات"),
    "honors" : MessageLookupByLibrary.simpleMessage("تكريمات"),
    "terms_and_conditions" : MessageLookupByLibrary.simpleMessage("الشروط والاحكام"),
    "special_services" : MessageLookupByLibrary.simpleMessage("خدمات خاصه"),





  };
}