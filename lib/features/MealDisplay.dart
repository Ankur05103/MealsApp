import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_meals/bloc/bloc/mail_bloc_bloc.dart';


class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MailBlocBloc mealsBloc = BlocProvider.of<MailBlocBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: BlocBuilder<MailBlocBloc, MealsState>(
        builder: (context, state) {
          if (state is MealsInitialState) {
            mealsBloc.add(FetchMealsEvent());
          }

          if (state is MealsLoadingState) {
            return CircularProgressIndicator();
          } else if (state is MealsErrorState) {
            return Text('Error: ${state.error}');
          } else if (state is MealsLoadedState) {
            final meals = state.meals;
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meals[index].strMeal,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Image.network(meals[index].strMealThumb)),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
