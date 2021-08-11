/*##################################################################
#   Brasilia 09, de Agosto de 2021
#   Universidade de Brasilia
#   CIC201 2021-01 | Seguranca Computacional | Turma A
#   Prof. Dr. Joao Jose Costa Gondim
#   Bruno S. R. Barros
#   Davi Torres
____________________________________________________________________
#
#                   Vigenere Cipher / Decipher
#___________________________________________________________________
#   Vigenere Class
#
#   *TODO*
#
#
#
#
#
##################################################################*/


//TODO
class Vigenere {

  final List<String> _alphabet; //null-safety -> init at constructor
  List<List<String>> _vigenereTable = [[]]; //null-safety

  Vigenere(this._alphabet) {
    //constructor: recieve alphabet

    List<String> _normalizedAlphabet =
        _alphabet //normalize alphabet as upperCase
            .join()
            .toUpperCase()
            .split("");

    _vigenereTable = List.generate(
      //generate i (row)
      _alphabet.length,
      (i) {
        return List.generate(
          //generate j (column)
          _alphabet.length,
          (j) {
            i > 0 && j == 0 //list left-shift conditional
                ? _normalizedAlphabet.insert(
                    //left-shift
                    _alphabet.length - 1,
                    _normalizedAlphabet.removeAt(0))
                : null;
            return _normalizedAlphabet[j];
          },
        );
      },
    );
  }

  //return _vigenereTable
  List<List<String>> _getTable() {
    return this._vigenereTable;
  }

  //return alphabet
  List<String> getAlphabet() {
    return this._alphabet;
  }

  //given and string and a key return encrypted string
  String encrypt(String inputString, String key) {

    String _encryptedString = ""; //null-safety init

    String normalizedInputString = inputString
        .replaceAll(" ", "")
        .toUpperCase(); //normalizing input string

    List<String> normalizedInputList = normalizedInputString
        .split(""); //transform normalized string into list of "chars"

    int _inputKeyModulus = normalizedInputString.length %
        key.length; // modulus of the input string - key so we can compute the keystream
    int _inputKeyRatio = (normalizedInputString.length ~/ key.length)
        .toInt(); // ratio of the input string - key so we can compute the keystream

    //keystream string sums
    String _keystream = (key * _inputKeyRatio +
            (key.substring(0, _inputKeyModulus))) // key * ratio + rest
        .toUpperCase(); // normalized

    //encryption cycle iterating the table
    for (int i = 0; i < normalizedInputList.length; i++) {

      List<List<String>> _auxTable = _getTable();  // auxiliar table init
      List<String> _auxAlphabet = getAlphabet(); // auxiliar alphanet init
      int column = _auxAlphabet.indexOf(normalizedInputList[i]); // set column 
      int row = _auxAlphabet.indexOf(_keystream[i]);

      _encryptedString = _encryptedString + _auxTable[column][row];
    }

    return _encryptedString;
  }

  //given and encrypted string and a key return decrypted string
  String decrypt(String inputString, String key) {

    String _decryptedString = ""; //null-safety init
    String normalizedInputString = inputString.replaceAll(" ", "").toUpperCase(); //normalizing input string
    List<String> normalizedInputList = normalizedInputString.split("");

    int _inputKeyModulus = normalizedInputString.length % key.length;
    int _inputKeyRatio = (normalizedInputString.length ~/ key.length).toInt();

    String _keystream =
        (key * _inputKeyRatio + (key.substring(0, _inputKeyModulus)))
            .toUpperCase();

    for (int i = 0; i < normalizedInputList.length; i++) {
      List<List<String>> _auxTable = _getTable();
      List<String> _auxAlphabet = getAlphabet();
      int row = _auxAlphabet.indexOf(_keystream[i]);
      int column = _auxTable[row].indexOf(normalizedInputList[i]);

      _decryptedString = _decryptedString + _auxAlphabet[column];
    }

    return _decryptedString;
  }
}
