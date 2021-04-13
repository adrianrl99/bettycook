extension StringExtensions on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get format => '${this.toLowerCase().replaceAll(" ", "_")}';
}
