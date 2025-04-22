import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educación Integral',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ButtonGridScreen(),
        '/aseo': (context) => const ContentScreen(title: 'Aseo Personal'),
        '/cambios': (context) => const ContentScreen(title: 'Cambios Corporales'),
        '/creencias': (context) => const ContentScreen(title: 'Falsas Creencias'),
        '/salud': (context) => const ContentScreen(title: 'Salud Mental'),
        '/perfil': (context) => const ProfileScreen(),
        '/config': (context) => const SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class ButtonGridScreen extends StatelessWidget {
  const ButtonGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mainButtons = [
      {'title': 'Aseo personal', 'route': '/aseo', 'icon': Icons.shower},
      {'title': 'Cambios que tengo', 'route': '/cambios', 'icon': Icons.trending_up},
      {'title': 'Falsas creencias', 'route': '/creencias', 'icon': Icons.psychology},
      {'title': 'Salud mental', 'route': '/salud', 'icon': Icons.health_and_safety},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Educación Integral'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle),
            onSelected: (value) {
              if (value == 'profile') {
                Navigator.pushNamed(context, '/perfil');
              } else if (value == 'settings') {
                Navigator.pushNamed(context, '/config');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'profile',
                  child: Text('Mi Perfil'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('Configuración'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: mainButtons.map((button) {
                    return ElevatedButton.icon(
                      icon: Icon(button['icon'], size: 30),
                      label: Text(
                        button['title'],
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () => Navigator.pushNamed(context, button['route']),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 80), // Espacio para el botón redondo
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Colors.pinkAccent,
                onPressed: () {  },
                child: const Icon(Icons.gamepad, size: 50)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Pantallas de ejemplo (debes crearlas en archivos separados)
class ContentScreen extends StatelessWidget {
  final String title;
  const ContentScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Contenido de $title', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),

    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),

    );
  }
}