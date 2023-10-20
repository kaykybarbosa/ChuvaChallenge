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
    var year = dateTime?.year ?? 0;
    var day = dateTime?.day ?? 0;
    var month = dateTime?.month ?? 0;
    var hour = dateTime?.hour ?? 0;
    var minute = dateTime?.minute ?? 0;

    hour = hour - 3;

    dateTime = DateTime(year, month, day, hour, minute);
    
    String newHour = DateFormat('HH:mm').format(dateTime!);

    return newHour;
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