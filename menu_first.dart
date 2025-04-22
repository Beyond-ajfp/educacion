import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Navegación',
      // Configuración de rutas nombradas
      routes: {
        '/': (context) => const MainMenuScreen(),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
        '/screen4': (context) => const Screen4(),
      },
      initialRoute: '/',
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de botones con sus respectivas rutas
    final buttons = [
      {'title': 'Pantalla 1', 'route': '/screen1', 'color': Colors.blue},
      {'title': 'Pantalla 2', 'route': '/screen2', 'color': Colors.green},
      {'title': 'Pantalla 3', 'route': '/screen3', 'color': Colors.orange},
      {'title': 'Pantalla 4', 'route': '/screen4', 'color': Colors.purple},
      {'title': 'Opciones', 'route': '/screen1', 'color': Colors.red},
      {'title': 'Configuración', 'route': '/screen2', 'color': Colors.teal},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: GridView.count(
        crossAxisCount: 2, // 2 columnas
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 1.0, // Relación alto/ancho
        mainAxisSpacing: 10.0, // Espacio vertical entre items
        crossAxisSpacing: 10.0, // Espacio horizontal entre items
        children: buttons.map((button) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: button['color'] as Color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, button['route'] as String);
            },
            child: Text(
              button['title'] as String,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Ejemplo de pantallas destino
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 1')),
      body: const Center(child: Text('Contenido de la Pantalla 1')),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 2')),
      body: const Center(child: Text('Contenido de la Pantalla 2')),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 3')),
      body: const Center(child: Text('Contenido de la Pantalla 3')),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 4')),
      body: const Center(child: Text('Contenido de la Pantalla 4')),
    );
  }
}