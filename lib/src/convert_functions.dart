String convertUnit(
    {required String from, required String to, required String value}) {
  double converted = 0;
  if (value.isNotEmpty) {
    double toConvert = double.parse(value);
    switch (from) {
      case "mg":
        converted = convertFrommg(to, converted, toConvert);
        break;
    }
  }

  return converted.toStringAsFixed(9);
}

double convertFrommg(String to, double converted, double toConvert) {
  switch (to) {
    case "cg":
      converted = toConvert / 10;
      break;
    case "dg":
      converted = toConvert / 100;
      break;
    case "g":
      converted = toConvert / 1000;
      break;
    case "dag":
      converted = toConvert / 10000;
      break;
    case "hg":
      converted = toConvert / 100000;
      break;
    case "kg":
      converted = toConvert / 1000000;
      break;
    case "t":
      converted = toConvert / 1000000000;
      break;
  }
  return converted;
}

double convertFromcg(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 10;
      break;
    case "dg":
      converted = toConvert / 10;
      break;
    case "g":
      converted = toConvert / 100;
      break;
    case "dag":
      converted = toConvert / 1000;
      break;
    case "hg":
      converted = toConvert / 10000;
      break;
    case "kg":
      converted = toConvert / 100000;
      break;
    case "t":
      converted = toConvert / 100000000;
      break;
  }
  return converted;
}

double convertFromdg(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 100;
      break;
    case "cg":
      converted = toConvert * 10;
      break;
    case "g":
      converted = toConvert / 10;
      break;
    case "dag":
      converted = toConvert / 100;
      break;
    case "hg":
      converted = toConvert / 1000;
      break;
    case "kg":
      converted = toConvert / 10000;
      break;
    case "t":
      converted = toConvert / 10000000;
      break;
  }
  return converted;
}

double convertFromg(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 1000;
      break;
    case "cg":
      converted = toConvert * 100;
      break;
    case "dg":
      converted = toConvert * 10;
      break;
    case "dag":
      converted = toConvert / 10;
      break;
    case "hg":
      converted = toConvert / 100;
      break;
    case "kg":
      converted = toConvert / 1000;
      break;
    case "t":
      converted = toConvert / 1000000;
      break;
  }
  return converted;
}

double convertFromdag(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 10000;
      break;
    case "cg":
      converted = toConvert * 1000;
      break;
    case "dg":
      converted = toConvert * 100;
      break;
    case "g":
      converted = toConvert * 10;
      break;
    case "hg":
      converted = toConvert / 10;
      break;
    case "kg":
      converted = toConvert / 100;
      break;
    case "t":
      converted = toConvert / 100000;
      break;
  }
  return converted;
}

double convertFromhg(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 100000;
      break;
    case "cg":
      converted = toConvert * 10000;
      break;
    case "dg":
      converted = toConvert * 1000;
      break;
    case "g":
      converted = toConvert * 100;
      break;
    case "dag":
      converted = toConvert * 10;
      break;
    case "kg":
      converted = toConvert / 10;
      break;
    case "t":
      converted = toConvert / 10000;
      break;
  }
  return converted;
}

double convertFromkg(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 1000000;
      break;
    case "cg":
      converted = toConvert * 100000;
      break;
    case "dg":
      converted = toConvert * 10000;
      break;
    case "g":
      converted = toConvert * 1000;
      break;
    case "dag":
      converted = toConvert * 100;
      break;
    case "hg":
      converted = toConvert * 10;
      break;
    case "t":
      converted = toConvert / 1000;
      break;
  }
  return converted;
}

double convertFromt(String to, double converted, double toConvert) {
  switch (to) {
    case "mg":
      converted = toConvert * 1000000000;
      break;
    case "cg":
      converted = toConvert * 100000000;
      break;
    case "dg":
      converted = toConvert * 10000000;
      break;
    case "g":
      converted = toConvert * 1000000;
      break;
    case "dag":
      converted = toConvert * 100000;
      break;
    case "hg":
      converted = toConvert * 10000;
      break;
    case "kg":
      converted = toConvert * 1000;
      break;
  }
  return converted;
}
