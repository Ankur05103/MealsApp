import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_meals/Form/bloc/form_bloc.dart' as CustomFormBloc;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Submission Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CustomFormBloc.FormBloc(),
        child: MyForm(),
      ),
    );
  }
}

class UserDetails {
  final String name;
  final String email;
  final int phone;
  final String gender, Country, State, City;
  UserDetails({
    required this.phone,
    required this.gender,
    required this.Country,
    required this.State,
    required this.City,
    required this.name,
    required this.email,
  });
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  List<UserDetails> userDetailsList = [];
  @override
  Widget build(BuildContext context) {
    final formBloc = BlocProvider.of<CustomFormBloc.FormBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Submission Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Phone:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your Phone',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Email:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 16),

              Text(
                'gender:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(
                  hintText: 'Enter your gender',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'City:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: 'Enter your City',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'state:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: stateController,
                decoration: InputDecoration(
                  hintText: 'Enter your state',
                ),
              ),
              SizedBox(height: 16),

              Text(
                'country:',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: countryController,
                decoration: InputDecoration(
                  hintText: 'Enter your country',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text;
                  final gender = genderController.text;
                  final phone = int.parse(phoneController.text);
                  final city = cityController.text;
                  final state = stateController.text;
                  final country = countryController.text;
                  final userDetails = UserDetails(
                    name: name,
                    email: email,
                    gender: gender,
                    Country: country,
                    State: state,
                    phone: phone,
                    City: city,
                  );
                  formBloc.add(CustomFormBloc.SubmitFormEvent(name, email,phone,gender,city,state,country));
                  setState(() {
                    userDetailsList.add(userDetails);
                    // Clear text fields
                    nameController.clear();
                    emailController.clear();
                    phoneController.clear();
                    genderController.clear();
                    cityController.clear();
                    stateController.clear();
                    countryController.clear();
                  });
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 24),
              Text(
                'User Details:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200, // Set a fixed height for the user details list
                child: ListView.builder(
                  itemCount: userDetailsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Name: ${userDetailsList[index].name}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${userDetailsList[index].email}'),
                          Text('Phone: ${userDetailsList[index].phone.toString()}'),
                          Text('Gender: ${userDetailsList[index].gender}'),
                          Text('City: ${userDetailsList[index].City}'),
                          Text('State: ${userDetailsList[index].State}'),
                          Text('Country: ${userDetailsList[index].Country}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
