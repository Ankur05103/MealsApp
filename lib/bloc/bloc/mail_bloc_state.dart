part of 'mail_bloc_bloc.dart';

abstract class MealsState {}

class MealsInitialState extends MealsState {}

class MealsLoadingState extends MealsState {}

class MealsLoadedState extends MealsState {
  final List<Meal> meals;

  MealsLoadedState(this.meals);
}

class MealsErrorState extends MealsState {
  final String error;

  MealsErrorState(this.error);
}