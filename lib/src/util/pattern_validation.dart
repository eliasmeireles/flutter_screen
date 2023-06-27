final usernamePattern =
    RegExp("^[A-Z]+[a-z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*\$");
final emailPattern = RegExp(
    "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const wrlWebPattern =
    "/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|"
    "(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/";
const hourPattern = "^([0-1]?[0-9]|2[0-3]):[0-5][0-9]\$";
final phoneNumberPattern = RegExp(r'([0-9]{2}\s[0-9]{4}-[0-9]{4})$');
final cellphoneNumberPattern = RegExp(r'([0-9]{2}\s[0-9]{5}-[0-9]{4})$');
final cpfCnpjPattern = RegExp(
    r'([0-9]{3}[\.][0-9]{3}[\.][0-9]{3}[-][0-9]{2})|([0-9]{2}[\.][0-9]{3}[\.][0-9]{3}[/][0-9]{4}[-][0-9]{2})$');

bool isUsernameValid(String value) => usernamePattern.hasMatch(value);

bool isEmailValid(String value) => emailPattern.hasMatch(value);

bool isPhoneNumberValid(String value) => phoneNumberPattern.hasMatch(value);

bool isCellphoneNumberValid(String value) =>
    cellphoneNumberPattern.hasMatch(value);

bool isCpfCnpjValid(String value) => cpfCnpjPattern.hasMatch(value);
