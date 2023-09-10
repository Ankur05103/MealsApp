part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class SubmitFormEvent extends FormEvent {
  final String name;
  final String email;
    final int phone;
  final String gender;
  final String city;
  final String state;
  final String country;
  SubmitFormEvent(this.name, this.email, this.phone, this.gender, this.city, this.state, this.country);

  @override
  List<Object> get props => [name, email,gender,phone,city,state,country];
}

class ShowFormSummaryEvent extends FormEvent {
  final String name;
  final String email;
  final int phone;
  final String gender;
  final String city;
  final String state;
  final String country;
  ShowFormSummaryEvent(this.name, this.email, this.phone, this.gender, this.city, this.state, this.country);

  @override
  List<Object> get props => [name, email,gender,phone,city,state,country];
}
//android/app/build.gradle