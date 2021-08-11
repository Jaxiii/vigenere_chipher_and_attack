/*##################################################################
#   Brasilia 09, de Agosto de 2021
#   Universidade de Brasilia
#   CIC201 2021-01 | Seguranca Computacional | Turma A
#   Prof. Dr. Joao Jose Costa Gondim
#   Bruno S. R. Barros
#   Davi Torres
____________________________________________________________________
#
#    Main-
#        |- Vigenere Cipher / Decipher 
#        |- Frequency Attack
#___________________________________________________________________
#
#
#
#
#
#
#
#
##################################################################*/


import 'attack.dart';
import 'cipher.dart';

main() { 
  FrequencyAttack attack = FrequencyAttack();
  print(attack.frequencyStats("siuadAAhsdiua"));
}
