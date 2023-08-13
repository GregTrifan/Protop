import 'package:flutter/material.dart';
import 'package:protop/widgets/item_card.dart';
import 'package:protop/widgets/sidebar.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints:const  BoxConstraints(maxWidth: 1400),
        child: Row(
          children: [
            Expanded(
              child: AnimatedTileListView(
                showSidebar: MediaQuery.of(context).size.width > 768,
              ),
            ),
            if (MediaQuery.of(context).size.width > 768)
              const SidebarWidget(),
          ],
        ),
      ),
    );
  }
}

class AnimatedTileListView extends StatelessWidget {
  final bool showSidebar;

  const AnimatedTileListView({Key? key, required this.showSidebar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const  BoxConstraints(maxWidth: 600), // Limit max width to 600px
      child: ListView.builder(
        itemCount: 120, // Number of tiles
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:8),
            child: ItemCard(index: index),
          );
        },
      ),
    );
  }
}

