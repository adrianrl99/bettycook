extension StringExtensions on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get format =>
      '${this.toLowerCase().replaceAll(" ", "_").replaceAll("Á", "a").replaceAll("á", "a").replaceAll("É", "e").replaceAll("é", "e").replaceAll("Í", "i").replaceAll("í", "i").replaceAll("Ó", "o").replaceAll("ó", "o").replaceAll("Ú", "u").replaceAll("ú", "u")}';
  String get dateString => '${this.replaceAll(":00.000", "")}';
  String get getDate => '${this.substring(0, 10)}';
}
