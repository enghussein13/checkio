
import 'message.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputMax  $max ";
  }
  if (val.isEmpty) {
    return messageInputEmpty;
  }
  if (val.length < min) {
    return "$messageInputMin  $min ";
  }
}
validInputWithSiemens(String val, int min, int max){
  if (val.isEmpty) {
    return messageInputEmpty;
  }
  if (val.length < min) {
    return "$messageInputMin  $min ";
  }

  if (val.length > max) {
    return "$messageInputMax  $max ";
  }
  //if (!val.contains('siemens-energy')) {
    //return "$messageInputSiemens ";
  //}
}
