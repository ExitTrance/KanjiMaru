String padWhiteSpace(int input, int requiredCharacters) {
  return '$input${''.padRight(requiredCharacters - input.toString().length, ' ')}';
}
