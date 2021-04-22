extension StringExtensions on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get format => '${this.toLowerCase().replaceAll(" ", "_")}';
  String get dateString => '${this.replaceAll(":00.000", "")}';
  String get getDate => '${this.substring(0, 10)}';
}
