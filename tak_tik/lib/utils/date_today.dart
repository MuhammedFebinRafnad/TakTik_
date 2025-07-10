import 'package:intl/intl.dart';

class CurrentDate{
static String getformatedDate(){
  final now =DateTime.now();
  final formatter=DateFormat("EEEE,MMM,d");
  return formatter.format(now);
}
}