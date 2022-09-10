part of 'theme_bloc.dart';



class ThemeState extends Equatable {
  final ThemeData themeData;
  bool isDark =true;
  ThemeState({required this.themeData,required this.isDark });

  @override
  List<Object?> get props => [themeData];
}
