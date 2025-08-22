import 'package:e_commerce/core/app_strings.dart';
import 'package:e_commerce/core/validators/app_reg_exp.dart';
import 'package:e_commerce/core/validators/app_validators.dart';

class EmailAppValidators extends AppValidator{
  EmailAppValidators({super.initValue});
  
  @override
  List<String> check() {
    List<String> reasons =[];

   if (!AppRegExp.emailRegExp.hasMatch(value)) {
    reasons.add(AppStrings.emailNotValid);
  } 

  if (value.endsWith('.com')) {
    reasons.add(AppStrings.emailEndWith);
  } 
    return reasons;
  }
  
}