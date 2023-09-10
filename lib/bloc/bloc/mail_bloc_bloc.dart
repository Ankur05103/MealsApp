import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internshala_meals/models/mealmodel.dart';

part 'mail_bloc_event.dart';
part 'mail_bloc_state.dart';

class MailBlocBloc extends Bloc<MealsEvent, MealsState> {
  MailBlocBloc() : super(MealsInitialState()) {
    // Register event handlers in the constructor
    on<FetchMealsEvent>(_fetchMeals);
  }

  FutureOr<void> _fetchMeals(
      FetchMealsEvent event, Emitter<MealsState> emit) async {
    emit(MealsLoadingState());
    try {
      final List<Meal> meals = await fetchMeals();
      emit(MealsLoadedState(meals));
    } catch (e) {
      emit(MealsErrorState('Failed to load meals: $e'));
    }
  }

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      final List<dynamic> mealsData = parsed['meals'];

      List<Meal> meals = mealsData.map((json) => Meal.fromJson(json)).toList();
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }
}

