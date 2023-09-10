part of 'form_bloc.dart';


abstract class FormState extends Equatable {
  const FormState();

  @override
  List<Object> get props => [];
}

class FormInitial extends FormState {}

class FormSubmitting extends FormState {}

class FormSubmissionSuccess extends FormState {
  final String name;
  final String email;
    final int phone;
  final String gender;
  final String city;
  final String state;
  final String country;
  FormSubmissionSuccess(this.name, this.email, this.phone, this.gender, this.city, this.state, this.country);

  @override
  List<Object> get props => [name, email,gender,phone,city,state,country];
}

class FormSubmissionFailure extends FormState {
  final String error;

  FormSubmissionFailure(this.error);

  @override
  List<Object> get props => [error];
}

class FormSubmissionSummary extends FormState{}