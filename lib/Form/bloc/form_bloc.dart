import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormInitial()) {
    on<SubmitFormEvent>(submitForm);
  }

  FutureOr<void> submitForm(SubmitFormEvent event, Emitter<FormState> emit) async {
  try {
    // Access form data from the event
    final name = event.name;
    final email = event.email;
    final phone = event.phone;
    final gender = event.gender;
    final state = event.state;
    final city = event.city;
    final country = event.country;
    if(name.isEmpty || state.isEmpty || city.isEmpty || country.isEmpty)throw Error();
    if(email.isEmpty)throw Error();
    if(phone.toString().length != 10 || phone<7000000000) throw Error();
    if(gender.toUpperCase()!='MALE' || gender.toUpperCase()!='FEMALE' || gender.toUpperCase()!='OTHER') throw Error();
  } catch (e) {
    print(e.toString());
  }
}

}
