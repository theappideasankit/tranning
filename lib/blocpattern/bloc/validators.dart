import 'dart:async';

mixin Validators{

  //Email validator
   var emailValidator = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink){
    if(email.isEmpty){
      return sink.addError("email can't be empty");
    }
    if(email.length > 20){
      return sink.addError("email not valid length");
    }
    if(email.length < 6){
      return sink.addError("email can't be  less than 6 characters");
    }if(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return sink.addError("Invalid Email");
    }
    else{
      sink.add(email);
    }
  }
  );

  var passValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError("This field can't be empty");
      }

      if (password.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      } else {
        sink.add(password);
      }
    },
  );
}