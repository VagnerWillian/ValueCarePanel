class Validators{

  static validateNameAndLastName(String str){
    RegExp regex = new RegExp(r"^[A-Z][-a-zA-Z]+$");

    if(str.isEmpty){
      return "Campo obrigatório";
    }else if(regex.hasMatch(str)){
      return "Somente letras e espaços";
    }
  }

  static validateEmpty(str){
    if(str.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }


  static validaNull(Object? str){
    if(str == null){
      return "Campo obrigatório";
    }
    return null;
  }

  static validaEmail(String str, {confirmEmail}){
    if(str.isEmpty){
      return "Campo obrigatório";
    }else if(!RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(str)){
      return "Email inválido";
    }else if(confirmEmail!=null&&str!=confirmEmail){
      return "Os e-mails não coincidem";
    }
    return null;
  }

  static validatePassword(String str, {confirmPassword, int? length}){
    if(str.isEmpty){
      return "Campo obrigatório";
    }else if(length!=null&&str.length<length){
      return "Mínimo $length caracteres";
    }else if(confirmPassword!=null&&str!=confirmPassword){
      return "As senhas não coincidem";
    }else{
      return null;
    }
  }

  static validateMinCaracters(String str, {required int minLength, bool required = true}){
    String nStr = str
        .replaceAll(".", "")
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll("/", "")
        .replaceAll("(","")
        .replaceAll(")", "");

    if(required&&nStr.isEmpty){
      return "Campo obrigatório";
    }else if(nStr.isNotEmpty&&nStr.length < minLength){
      return "Compõe no mínimo $minLength dígitos";
    }
    return null;
  }

  static validaData(String str){
    if(validateMinCaracters(str, minLength: 8)==null){
      if(DateHelper.isValidDateBirth(str, "dd/MM/yyyy")){
        return null;
      }else{
        return "Data inválida";
      }
    }else{
     return validateMinCaracters(str, minLength: 8);
    }
  }

  static validaIdade(String str){
    if(str.contains(".")||str.contains("-")){
      return "idade inválida";
    }
    return null;
  }

}

class DateHelper{

  /*
    * Is valid date and format
    *
    * Format: dd/MM/yyyy
    * valid:
    *   01/12/1996
    * invalid:
    *   01/13/1996
    *
    * Format: MM/dd/yyyy
    * valid:
    *  12/01/1996
    * invalid
    *  13/01/1996
    * */
  static bool isValidDateBirth(String date, String format) {
    try {
      late final int day, month, year;

      //Get separator data  10/10/2020, 2020-10-10, 10.10.2020
      String separator = RegExp("([-/.])").firstMatch(date)!.group(0)![0];

      //Split by separator [mm, dd, yyyy]
      var frSplit = format.split(separator);
      //Split by separtor [10, 10, 2020]
      var dtSplit = date.split(separator);

      for (int i = 0; i < frSplit.length; i++) {
        var frm = frSplit[i].toLowerCase();
        var vl = dtSplit[i];

        if (frm == "dd")
          day = int.parse(vl);
        else if (frm == "mm")
          month = int.parse(vl);
        else if (frm == "yyyy")
          year = int.parse(vl);
      }

      //First date check
      //The dart does not throw an exception for invalid date.
      var now = DateTime.now();
      if(month > 12 || month < 1 || day < 1 || day > daysInMonth(month, year) || year < 1810 || (year > now.year && day > now.day && month > now.month))
        throw Exception("Date birth invalid.");

      return true;
    } catch (e) {
      return false;
    }
  }

  static int daysInMonth(int month, int year) {
    int days = 28 + (month + (month/8).floor()) % 2 + 2 % month + 2 * (1/month).floor();
    return (isLeapYear(year) && month == 2)? 29 : days;
  }

  static bool isLeapYear(int year)
  => (( year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0 );
}