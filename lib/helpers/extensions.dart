import 'package:intl/intl.dart';

extension NumberExtension on num {
  String formattedMoney() {
    return NumberFormat('R\$###,##0.00', 'pt-BR').format(this);
  }
}

extension DateTimeExtension on DateTime {
  String formattedDate() {
    return DateFormat('dd/MM/yyyy HH:mm', 'pt-BR').format(this);
  }
}
