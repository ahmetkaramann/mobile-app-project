import 'package:life_duration/user_data.dart';

class Calculation {
  UserData _userData;
  Calculation(this._userData); // Noktalı virgül eklendi.

  double calculate() {
    double result;
    result = 90 + _userData.sporGunu - _userData.icilenSigara;
    result = result + (_userData.boy / _userData.kilo);

    return (_userData.seciliCinsiyet == 'KADIN') ? result + 3 : result;
  }
}
