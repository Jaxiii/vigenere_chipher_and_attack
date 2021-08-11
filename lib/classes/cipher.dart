///
///   Brasilia 09, de Agosto de 2021                                </br>
///   Universidade de Brasilia                                      </br>
///   CIC201 2021-01 | Seguranca Computacional | Turma A            </br>
///   Prof. Dr. Joao Jose Costa Gondim                              </br>
///   Bruno S. R. Barros                                            </br>
///   Davi Torres                                                   </br>
///____________________________________________________________________
///
///                   Vigenere Cipher / Decipher
///____________________________________________________________________
///   ### Vigenere Class
///
///   
///
///
///
///
///
///
class Vigenere {

  /// null-safety -> init at constructor | "private" ?
  final List<String> alphabet;

  /// null-safety | "private" ?
  List<List<String>> vigenereTable = [[]];

  /// default constructor: recieve alphabet
  Vigenere(this.alphabet) {
    ///normalize alphabet
    List<String> _normalizedAlphabet = alphabet
        .join()
        .toUpperCase() // as upperCase
        .split(""); // to list

    /// generate table
    vigenereTable = List.generate(
      alphabet.length, // i size is equal to alphabet length
      (i) {
        // generate i (row)
        return List.generate(
          alphabet.length, // j size is equal to alphabet length
          (j) {
            // generate j (column)
            i > 0 && j == 0 // list left-shift conditional
                ? _normalizedAlphabet.insert(
                    // left-shift
                    alphabet.length - 1, // insert last
                    _normalizedAlphabet.removeAt(0)) // the first
                : null; // otherwise nothing
            return _normalizedAlphabet[j];
          },
        );
      },
    );
  }

  ///constructor given table: recieve alphabet & table
  Vigenere.withTable(this.alphabet, this.vigenereTable) {}

  ///return vigenereTable, can be called outside of the class | "public"
  List<List<String>> getTable() {
    return this.vigenereTable;
  }

  /// return alphabet, can be called outside of the class | "public"
  List<String> getAlphabet() {
    return this.alphabet;
  }

  /// given and string and a key return encrypted string | "public"
  String encrypt(String _inputString, String _key) {
    /// null-safety -> init at constructor | null-safety | "private"
    String _encryptedString = "";

    ///normalized input string | null-safety | "private"
    String _normalizedInputString = _inputString
        .replaceAll(" ", "") // removing spaces (white-spaces)
        .toUpperCase(); //

    ///init list of "chars from normalized string" | null-safety | "private"
    List<String> _normalizedInputList = _normalizedInputString.split("");

    /// modulus of the input string - key so we can compute the keystream | null-safety | "private"
    int _inputKeyModulus = _normalizedInputString.length % _key.length;

    /// ratio of the input string - key so we can compute the keystream | null-safety | "private"
    int _inputKeyRatio = (_normalizedInputString.length ~/ _key.length).toInt();

    ///keystream string sums normalized
    String _keystream = (_key * _inputKeyRatio +
            (_key.substring(0, _inputKeyModulus))) // key * ratio + remainder
        .toUpperCase();

    ///encryption cycle iterating through table to find x,y (i,j / column,row)
    for (int i = 0; i < _normalizedInputList.length; i++) {
      /// auxiliar table init | null-safety | "private"
      List<List<String>> _auxTable = this.vigenereTable;

      /// auxiliar alphanet init | null-safety | "private"
      List<String> _auxAlphabet = this.alphabet;

      /// set column (i) | null-safety | "private"
      int column = _auxAlphabet.indexOf(_normalizedInputList[i]);

      /// set row (j) | null-safety | "private"
      int row = _auxAlphabet.indexOf(_keystream[i]);

      /// mount the encrypted message with the sum of "chars"
      _encryptedString = _encryptedString + _auxTable[column][row];
    }

    return _encryptedString;
  }

  ///given and encrypted string and a key return decrypted string | "public"
  String decrypt(String _inputString, String _key) {
    /// init  | null-safety | "private"
    String _decryptedString = "";

    ///normalized input string | null-safety | "private"
    String _normalizedInputString = _inputString
        .replaceAll(" ", "")
        .toUpperCase(); //normalizing input string

    ///init list of "chars from normalized string" | null-safety | "private"
    List<String> _normalizedInputList = _normalizedInputString.split("");

    /// modulus of the input string - key so we can compute the keystream | null-safety | "private"
    int _inputKeyModulus = _normalizedInputString.length % _key.length;

    /// ratio of the input string - key so we can compute the keystream | null-safety | "private"
    int _inputKeyRatio = (_normalizedInputString.length ~/ _key.length).toInt();

    ///keystream string sums normalized
    String _keystream =
        (_key * _inputKeyRatio + (_key.substring(0, _inputKeyModulus)))
            .toUpperCase();

    /// decryption cycle iterating through table to find alphabetic index & table index
    for (int i = 0; i < _normalizedInputList.length; i++) {
      int _alphaIndex = this.alphabet.indexOf(_keystream[
          i]); // init to alphabetic index of keystream char (y-axis or j)
      int _tableIndex = this.vigenereTable[_alphaIndex].indexOf(
          _normalizedInputList[
              i]); // init to table index (x-axis or i) from alphabetic index (y-axis or j) and input char

      /// mount the encrypted message with the sum of "chars"
      _decryptedString = _decryptedString + this.alphabet[_tableIndex];
    }

    return _decryptedString;
  }
}
