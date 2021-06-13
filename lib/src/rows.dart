part of v_keyboard;

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRows = [
  // Row 1
  const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],
  // Row 2
  const [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
  ],
  // Row 3
  const [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    ';',
    '\'',
  ],
  // Row 4
  const [
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    ',',
    '.',
    '/',
  ],
  // Row 5
  const [
    '@',
    '_',
  ]
];

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRowsNumeric = [
  // Row 1
  const [
    '1',
    '2',
    '3',
  ],
  // Row 1
  const [
    '4',
    '5',
    '6',
  ],
  // Row 1
  const [
    '7',
    '8',
    '9',
  ],
  // Row 1
  const [
    '.',
    '0',
  ],
];

/// Returns a list of `VKeyboardKey` objects for Numeric keyboard.
List<VKeyboardKey> _getKeyboardRowKeysNumeric(rowNum) {
  // Generate VKeyboardKey objects for each row.
  return List.generate(_keyRowsNumeric[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRowsNumeric[rowNum][keyNum];

    // Create and return new VKeyboardKey object.
    return VKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VKeyboardKeyType.String,
    );
  });
}

/// Returns a list of `VKeyboardKey` objects.
List<VKeyboardKey> _getKeyboardRowKeys(rowNum) {
  // Generate VKeyboardKey objects for each row.
  return List.generate(_keyRows[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRows[rowNum][keyNum];

    // Create and return new VKeyboardKey object.
    return VKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VKeyboardKeyType.String,
    );
  });
}

/// Returns a list of VKeyboard rows with `VKeyboardKey` objects.
List<List<VKeyboardKey>> _getKeyboardRows() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRows.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VKeyboardKey> rowKeys = [];

    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 1:
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);

        // 'Backspace' button.
        rowKeys.add(
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              action: VKeyboardKeyAction.Backspace),
        );
        break;
      case 2:
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);

        // 'Return' button.
        rowKeys.add(
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              action: VKeyboardKeyAction.Return,
              text: '\n',
              capsText: '\n'),
        );
        break;
      case 3:
        // Left Shift
        rowKeys.add(
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              action: VKeyboardKeyAction.Shift),
        );

        // String keys.
        rowKeys.addAll(_getKeyboardRowKeys(rowNum));

        // Right Shift
        rowKeys.add(
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              action: VKeyboardKeyAction.Shift),
        );
        break;
      case 4:
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);

        // Insert the space key into second position of row.
        rowKeys.insert(
          1,
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              text: ' ',
              capsText: ' ',
              action: VKeyboardKeyAction.Space),
        );

        break;
      default:
        rowKeys = _getKeyboardRowKeys(rowNum);
    }

    return rowKeys;
  });
}

/// Returns a list of VKeyboard rows with `VKeyboardKey` objects.
List<List<VKeyboardKey>> _getKeyboardRowsNumeric() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRowsNumeric.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VKeyboardKey> rowKeys = [];

    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 3:
        // String keys.
        rowKeys.addAll(_getKeyboardRowKeysNumeric(rowNum));

        // Right Shift
        rowKeys.add(
          VKeyboardKey(
              keyType: VKeyboardKeyType.Action,
              action: VKeyboardKeyAction.Backspace),
        );
        break;
      default:
        rowKeys = _getKeyboardRowKeysNumeric(rowNum);
    }

    return rowKeys;
  });
}
