import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_algoriza/core/styles/colors.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/images.dart';
import 'package:weather_app_algoriza/feature/presentation/pages/chosed_city.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
   String?  cityName ;
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: drawerDark,
            centerTitle: true,
            title: Text('Search with city name'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children:[
                  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                     controller: controller,
                     onSubmitted: (data){

                       cityName = data;
                       print(cityName.toString());


                       // Navigator.pop(context);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => ChosedCity(cityName: cityName!,)));

                       //chosed
                     },
                     decoration: InputDecoration(
                       contentPadding:
                       EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                       fillColor: drawerDark,
                       focusColor: drawerDark,
                       label: Text('Search'),
                       suffix: Icon(
                         Icons.search,
                       ),
                       hintText: 'Enter a city Name',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                      ),
                  ),
                ),
                Lottie.asset(
                     search,
                    fit: BoxFit.cover,
                    width: context.screenHeight,
                    height: context.screenWidth,
                    )]),
            ),
          ),
        );
      }
  }

