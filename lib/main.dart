import 'classes/attack.dart';
import 'classes/cipher.dart';

///
///   Brasilia 09, de Agosto de 2021                                </br>
///   Universidade de Brasilia                                      </br>
///   CIC201 2021-01 | Seguranca Computacional | Turma A            </br>
///   Prof. Dr. Joao Jose Costa Gondim                              </br>
///   Bruno S. R. Barros                                            </br>
///   Davi Torres                                                   </br>
//____________________________________________________________________
///
///   Main-
///      |- Vigenere Cipher / Decipher 
///      |- Frequency Attack
///___________________________________________________________________
///   ### Vigenere Class
///
///   
///
///
///
///
///
///
main() { 

  /// #### Vigenere Cipher / Decipher Block
  Vigenere coder = Vigenere(["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]);

  print(coder.encrypt("Even the smallest person can change the course of the future", "Frodo"));
  print(coder.decrypt("JMSQHMVGPOQCSVHUVFVCSTOQQMRBJSYYSFCZIGHCKKVHTZKIUS", "Frodo"));
  

  /// #### Frequency Attack Block 
  /// 
  /// 
  FrequencyAttack attack = FrequencyAttack();
  print(attack.frequencyStats("siuadAAhsdiua"));
  
}
