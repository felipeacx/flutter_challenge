import 'package:intl/intl.dart';

//Format number with thousand delimiters
formatNumber(amount) {
  NumberFormat numberFormat = NumberFormat("#,###", "en_US");
  return numberFormat.format(amount);
}
