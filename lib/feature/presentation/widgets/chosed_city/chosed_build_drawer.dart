import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_algoriza/core/styles/dimensions.dart';
import 'package:weather_app_algoriza/core/styles/themeChange/theme_bloc.dart';
import 'package:weather_app_algoriza/core/styles/themes.dart';
import 'package:weather_app_algoriza/feature/presentation/pages/search_screen.dart';


class ChosedBuildDrawer extends StatelessWidget {
  const ChosedBuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(context.height15),
          bottomRight: Radius.circular(context.height15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height10,
          horizontal: context.height15,
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.settings_outlined,
                color: Colors.teal,
                size: context.height30,
              ),
            ),
            SizedBox(height: context.height30),
            ListTile(
              leading: Icon(
                Icons.star_rounded,
                color: Colors.teal,
                size: context.height30,
              ),
              title: Text(
                'Favourite Location',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              trailing: Icon(
                Icons.info_outline,
                color: Colors.teal,
                size: context.height30,
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Dikirnis',
                  style:
                  TextStyle(color: Colors.white, fontSize: context.height20),
                ),
              ),
              trailing: Icon(
                Icons.favorite,
                color: Colors.teal,
                size: context.height30,
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            SizedBox(height: context.height20),
            // StreamBuilder(
            //     stream: Preferences().loadCountry(context),
            //     builder: (context,snapshot){
            //       if(!snapshot.hasData){
            //         return const SizedBox();
            //       }
            //       else{
            //         final state = snapshot.data;
            //         return ListTile(
            //           title: Row(
            //             children: [
            //               SizedBox(width: context.height30),
            //               Text(state.toString().substring(state.toString().indexOf(',')+1,state.toString().indexOf(']')),
            //                 style: TextStyle(
            //                     color: Colors.white, fontSize: context.height20),
            //               ),
            //               SizedBox(width: context.height10),
            //               Text(state.toString().substring(1,state.toString().indexOf(',')),
            //                 style: TextStyle(
            //                     color: Colors.white, fontSize: context.height20),
            //               )
            //             ],
            //           ),
            //         );
            //       }
            //     }),
            SizedBox(height: context.height20),
            Row(
              children: List.generate(
                  1000 ~/ 10,
                      (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0
                          ? Colors.transparent
                          : Colors.teal,
                      height: 2,
                    ),
                  )),
            ),
            SizedBox(height: context.height20),
            ListTile(
              leading: Icon(
                Icons.add_location_outlined,
                color: Colors.teal,
                size: context.height30,
              ),
              title: Text(
                'Other Locations',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            SizedBox(height: context.height30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:  (context) => SearchPage()));
                // Preferences().pickCountry(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.height30 * 2,
                    vertical: context.height10),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(context.height30),
                ),
                child: Text(
                  'Manage Locations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.height20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: context.height20),
            Row(
              children: List.generate(
                  1000 ~/ 10,
                      (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0
                          ? Colors.transparent
                          : Colors.teal,
                      height: 2,
                    ),
                  )),
            ),
            SizedBox(height: context.height20),
            ListTile(
              leading: Icon(
                Icons.star_half,
                color: Colors.teal,
                size: context.height30,
              ),
              title: Text(
                'Mode',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              trailing: DayNightSwitcher(
                  isDarkModeEnabled:
                  BlocProvider.of<ThemeBloc>(context).state.isDark,
                  onStateChanged: (isDarkModeEnabled) {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                        theme: isDarkModeEnabled
                            ? AppTheme.dark
                            : AppTheme.light));
                  }),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.teal,
                size: context.height30,
              ),
              title: Text(
                'Report wrong location',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.headset_mic_outlined,
                color: Colors.teal,
                size: context.height30,
              ),
              title: Text(
                'Contact us',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
          ],
        ),
      ),
    );
  }
}


