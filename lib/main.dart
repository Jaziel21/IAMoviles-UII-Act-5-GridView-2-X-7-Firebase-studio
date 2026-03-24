import 'package:flutter/material.dart';

void main() => runApp(const LibreriaAJMG());

class LibreriaAJMG extends StatelessWidget {
  const LibreriaAJMG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Librería AJMG',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5D4037),
      ),
      home: const CatalogoLimpio(),
    );
  }
}

class CatalogoLimpio extends StatelessWidget {
  const CatalogoLimpio({super.key});

  @override
  Widget build(BuildContext context) {
    // 14 Libros con imágenes de red
    final List<Map<String, String>> libros = [
      {'t': 'Don Quijote', 's': 'Cervantes', 'img': 'lib/assets/imagenes/Captura1.PNG'},
      {'t': 'Cien Años', 's': 'García Márquez', 'img': 'lib/assets/imagenes/Captura2.PNG'},
      {'t': 'El Principito', 's': 'Saint-Exupéry', 'img': 'lib/assets/imagenes/Captura3.PNG'},
      {'t': 'Rayuela', 's': 'Julio Cortázar', 'img': 'lib/assets/imagenes/Captura4.PNG'},
      {'t': '1984', 's': 'George Orwell', 'img': 'lib/assets/imagenes/Captura5.PNG'},
      {'t': 'Fahrenheit 451', 's': 'Ray Bradbury', 'img': 'lib/assets/imagenes/Captura6.PNG'},
      {'t': 'La Odisea', 's': 'Homero', 'img': 'lib/assets/imagenes/Captura7.PNG'},
      {'t': 'El Aleph', 's': 'Jorge Luis Borges', 'img': 'lib/assets/imagenes/Captura8.PNG'},
      {'t': 'Crónica Muerte', 's': 'García Márquez', 'img': 'lib/assets/imagenes/Captura9.PNG'},
      {'t': 'Pedro Páramo', 's': 'Juan Rulfo', 'img': 'lib/assets/imagenes/Captura10.PNG'},
      {'t': 'Metamorfosis', 's': 'Franz Kafka', 'img': 'lib/assets/imagenes/Captura11.PNG'},
      {'t': 'Drácula', 's': 'Bram Stoker', 'img': 'lib/assets/imagenes/Captura12.PNG'},
      {'t': 'Frankenstein', 's': 'Mary Shelley', 'img': 'lib/assets/imagenes/Captura13.PNG'},
      {'t': 'Hamlet', 's': 'Shakespeare', 'img': 'lib/assets/imagenes/Captura1.PNG'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LIBRERÍA AJMG', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: const Color(0xFF5D4037),
        centerTitle: true,
        elevation: 0,
      ),
      // Al no poner bottomNavigationBar, el GridView usa todo el espacio disponible
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,           // 2 columnas
          childAspectRatio: 0.65,      // Relación para ver las 7 filas con scroll
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: libros.length,      // 14 elementos
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen principal
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      libros[index]['img']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                // Información inferior de la tarjeta
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(libros[index]['t']!, 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(libros[index]['s']!, 
                        style: TextStyle(color: Colors.brown[300], fontSize: 11)),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (i) => const Icon(
                          Icons.star, color: Colors.amber, size: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}