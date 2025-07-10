import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Bookly App 📚',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('المفضلة'),
            onTap: () {
              Navigator.pop(context); // يقفل Drawer
              GoRouter.of(context).push(AppRouter.kFavouriteView); // غيرها حسب المسار
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.magnifyingGlass),
            title: const Text('البحث'),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('الوضع الليلي'),
            onTap: () {
             // Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}

