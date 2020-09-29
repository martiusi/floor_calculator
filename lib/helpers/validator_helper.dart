class ValidatorHelper {
  static String isValidText(String value) {
    return value.isEmpty
        ? 'Campo obrigatório'
        : double.tryParse(value) <= 0 ? 'valor invalido' : null;
  }
}
