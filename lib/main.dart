import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protop/cubit/theme_cubit.dart';
import 'package:protop/views/home_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeType>(
      builder: (context, state) {
        return MaterialApp(
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: state == ThemeType.light
              ? ThemeMode.light
              : ThemeMode.dark,
          builder: (context, child) {
            return Scaffold
          (
            appBar: AppBar(
              shape: const Border(
                  bottom: BorderSide(
                      color: Colors.black54,
                      width: 1
                  )
              ),
              title:  Image.asset('assets/logo.png',width: 40, height:40,fit: BoxFit.contain),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 22.0), // Add margin to the left side
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: context.read<ThemeCubit>().state == ThemeType.light
                          ? const Color(0xfff0f2f5)
                          : const Color(0xff18191a),
                      border: Border.all(
                        color: context.read<ThemeCubit>().state == ThemeType.light
                            ? Colors.white70
                            : Colors.black54,
                        width: 1.5,
                      ),
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {
                          // Toggle theme
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            context.read<ThemeCubit>().state == ThemeType.light
                                ? Icons.sunny
                                : Icons.nights_stay,
                            color: context.read<ThemeCubit>().state == ThemeType.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )

                )

              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: child,
            ),
          );
      },
          home: const HomeView(),
        );
      },
    );
  }
}

ThemeData _buildLightTheme() {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor:const Color(0xfff0f2f5),
    primaryColor: const Color(0xfff0f2f5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff18191a),
    primaryColor:const Color(0xff18191a),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff242526),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardColor: const Color(0xff242526)
  );
}
