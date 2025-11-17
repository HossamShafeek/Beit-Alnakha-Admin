import 'package:intl/intl.dart';

class AppDateFormatter {
  static String timeAgo(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inSeconds < 60) {
        return "الآن";
      } else if (diff.inMinutes < 60) {
        if (diff.inMinutes == 1) return "منذ دقيقة";
        if (diff.inMinutes == 2) return "منذ دقيقتين";
        return "منذ ${diff.inMinutes} دقائق";
      } else if (diff.inHours < 24) {
        if (diff.inHours == 1) return "منذ ساعة";
        if (diff.inHours == 2) return "منذ ساعتين";
        return "منذ ${diff.inHours} ساعات";
      } else if (diff.inDays == 1) {
        return "أمس";
      } else if (diff.inDays == 2) {
        return "منذ يومين";
      } else if (diff.inDays < 7) {
        return "منذ ${diff.inDays} أيام";
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        if (weeks == 1) return "منذ أسبوع";
        if (weeks == 2) return "منذ أسبوعين";
        return "منذ $weeks أسابيع";
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        if (months == 1) return "منذ شهر";
        if (months == 2) return "منذ شهرين";
        return "منذ $months أشهر";
      } else {
        final years = (diff.inDays / 365).floor();
        if (years == 1) return "منذ سنة";
        if (years == 2) return "منذ سنتين";
        return "منذ $years سنوات";
      }
    } catch (e) {
      return dateString;
    }
  }

  static String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
