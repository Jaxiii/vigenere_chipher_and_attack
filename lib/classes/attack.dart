///
///   Brasilia 09, de Agosto de 2021                                </br>
///   Universidade de Brasilia                                      </br>
///   CIC201 2021-01 | Seguranca Computacional | Turma A            </br>
///   Prof. Dr. Joao Jose Costa Gondim                              </br>
///   Bruno S. R. Barros                                            </br>
///   Davi Torres                                                   </br>
//____________________________________________________________________
///
///             Vigenere Cipher / DecipherFrequency Attack
///___________________________________________________________________
///   ### FrequencyAttack Class
///
///   
///
///
///
///
///
///
// not now
//import 'cipher.dart';
class FrequencyAttack {
  
  Map<String, List<double>> _frequency = {
    "A": [14.63, 8.167],
    "B": [1.04, 1.492],
    "C": [3.88, 2.782],
    "D": [4.99, 4.253],
    "E": [12.57, 12.702],
    "F": [1.02, 2.228],
    "G": [1.30, 2.015],
    "H": [1.28, 6.094],
    "I": [6.18, 6.966],
    "J": [0.40, 0.153],
    "K": [0.02, 0.772],
    "L": [2.78, 4.025],
    "M": [4.74, 2.406],
    "N": [5.05, 6.749],
    "O": [10.73, 7.507],
    "P": [2.52, 1.929],
    "Q": [1.2, 0.095],
    "R": [6.53, 5.987],
    "S": [7.81, 6.327],
    "T": [4.34, 9.056],
    "U": [4.63, 2.758],
    "V": [1.67, 0.978],
    "W": [0.01, 2.360],
    "X": [0.21, 0.150],
    "Y": [0.01, 1.974],
    "Z": [0.47, 0.074]
  };

  Map<String, dynamic> frequencyStats(String inputString) {
    int counter = 0;
    String _normalizedInputString = inputString
        .replaceAll(" ", "")
        .toUpperCase(); //normalizing input string

    List<String> _normalizedInputList = _normalizedInputString
        .split(""); //transform normalized string into list of "chars"

    Map<String, dynamic> _frequency = {
      "A": [],
      "B": [],
      "C": [],
      "D": [],
      "E": [],
      "F": [],
      "G": [],
      "H": [],
      "I": [],
      "J": [],
      "K": [],
      "L": [],
      "M": [],
      "N": [],
      "O": [],
      "P": [],
      "Q": [],
      "R": [],
      "S": [],
      "T": [],
      "U": [],
      "V": [],
      "W": [],
      "X": [],
      "Y": [],
      "Z": []
    };

    void _incrementFrequencyMap(String key) {
      _frequency[key].add(key);
      //_frequency[key] = List.from(value).length;
    }

    _normalizedInputList.forEach((element) {
      if (_frequency.containsKey(element)) {
        counter++;
        try {
          _incrementFrequencyMap(element);
        } catch (error) {
          print(error);
          //TODO
        }
        ;
      }
    });

    try {
      _frequency.forEach((key, value) {
        value = List.from(value).length;
      });
    } catch (error) {
      print(error);
      //TODO
    }

    return _frequency;
  }
}
