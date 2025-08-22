import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/core/validators/app_reg_exp.dart';
import 'package:e_commerce/core/validators/app_validators.dart';

class PasswordAppValidators extends AppValidator{
  PasswordAppValidators({super.initValue});
  
  @override
  List<String> check() {
    List<String> reasons =[];

    if (value.length < 8){
      reasons.add(AppStrings.passwordMin);
    }
    if (!AppRegExp.capitalLetters.hasMatch(value)) {
      reasons.add(AppStrings.mustHaveCapital);
    }
    return reasons;
  }
  
}