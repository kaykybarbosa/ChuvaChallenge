import 'package:intl/intl.dart';

class Utils{
  static int colorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    try {
      final hexNum = int.parse(hexColor, radix: 16);
      return hexNum;
    } catch (e) {
      return 0xFF1976D2;
    }
  }

  static String formatHour(DateTime? dateTime){
    String hour = DateFormat('HH:mm').format(dateTime!);
    return hour;
  }

  static String formatDate(DateTime? dateTime){
    String date = DateFormat('dd/MM/yyy').format(dateTime!);
    return date;
  }

  static String getDayWeek(int numeroDiaSemana) {
    switch (numeroDiaSemana) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Desconhecido';
    }
  }
}