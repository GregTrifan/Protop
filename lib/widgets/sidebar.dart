import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protop/cubit/theme_cubit.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _sidebarAnimationController;
  late Animation<double> _sidebarAnimation;

  @override
  void initState() {
    super.initState();
    _sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sidebarAnimation = CurvedAnimation(
      parent: _sidebarAnimationController,
      curve: Curves.easeInOut,
    );

    _sidebarAnimationController.forward();
  }

  @override
  void dispose() {
    _sidebarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double sidebarWidth = screenWidth * 0.3;

    if (sidebarWidth > 700) {
      sidebarWidth = 700;
    }

    return BlocBuilder<ThemeCubit, ThemeType>(
      builder :(context, state) {
        return AnimatedBuilder(
          animation: _sidebarAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-sidebarWidth + sidebarWidth * _sidebarAnimation.value, 0),
              child: Container(
                decoration:  BoxDecoration(
                  color: context.read<ThemeCubit>().state == ThemeType.light ? Colors.white70 :  const Color(0xff242526),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),

                margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
                width: sidebarWidth,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const   CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/55629140?s=400&u=b25d84a6f851800bd9174899d25180b73e8f665e&v=4', // Replace with actual URL
                      ),
                    ),
                    const  SizedBox(height: 10),
                    const  Text(
                      'Grigore Gabriel Trifan',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Full Stack Developer',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const  SizedBox(height: 20),
                    const  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Experienced software developer with a 2-year track record in crafting engaging digital experiences. Specializing in React, Flutter, and ASP.NET Core, I thrive on translating ideas into elegant code.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const  SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color(0xff1ad20d),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: Text('Contact Me',style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
}
