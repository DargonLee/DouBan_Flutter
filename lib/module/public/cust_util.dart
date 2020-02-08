double StringToDouble(String str) {
  return double.tryParse(str) ?? 0.0;
}