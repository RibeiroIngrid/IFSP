import 'package:flutter/material.dart';

// Assuming you have an AppColors class defined somewhere like this:
class AppColorsRegister {
  static const Color backgroundGreen = Color(0xFFE8F5E9); // Light green for background
  static const Color darkGreen = Color(0xFF1B5E20); // Dark green for app bar
  static const Color primaryGreen = Color(0xFF4CAF50); // A general green for buttons/accents
  static const Color lightGrey = Color(0xFFF5F5F5); // For text field background
}

class RegisterTourScreen extends StatefulWidget {
  const RegisterTourScreen({super.key});

  @override
  State<RegisterTourScreen> createState() => _RegisterTourScreenState();
}

class _RegisterTourScreenState extends State<RegisterTourScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _includesController = TextEditingController();

  // You will need to replace 'assets/images/placeholder_tour.png' with your actual image path.
  // Make sure to add the image to your pubspec.yaml under the 'assets' section.
  final String _staticImagePath = 'assets/addFoto.jpg'; 

  // Function to handle tour registration (for demonstration)
  void _registerTour() {
    // Here you would typically send the data to a backend or save it locally
    print('Nome do Passeio: ${_nameController.text}');
    print('Data do Passeio: ${_dateController.text}');
    print('Incluso no Passeio: ${_includesController.text}');
    print('Usando imagem estática: $_staticImagePath');

    // You can add validation and actual data submission logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Passeio cadastrado com sucesso!')),
    );

    // Optionally navigate back after registration
    // Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _includesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsRegister.backgroundGreen, // Consistent background color
      appBar: AppBar(
        backgroundColor: AppColorsRegister.darkGreen, // Consistent app bar color
        title: const Text(
          'Cadastrar Passeio',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Ensures back button is white
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to prevent overflow on small screens
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
          children: [
            // Static Photo Display
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColorsRegister.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset( // Changed to Image.asset for static image
                  _staticImagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Imagem não encontrada',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tour Name Text Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Passeio',
                fillColor: AppColorsRegister.lightGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tour Date Text Field
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Data do Passeio (DD/MM/AAAA)',
                fillColor: AppColorsRegister.lightGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    // Implement date picker functionality here
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColorsRegister.darkGreen, // Header background color
                              onPrimary: Colors.white, // Header text color
                              onSurface: AppColorsRegister.darkGreen, // Body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColorsRegister.darkGreen, // Button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      _dateController.text =
                          "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                    }
                  },
                ),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),

            // Tour Includes Description Text Field
            TextField(
              controller: _includesController,
              maxLines: 5, // Allow multiple lines for description
              decoration: InputDecoration(
                labelText: 'O que está incluso no passeio?',
                alignLabelWithHint: true, // Align label to the top for multiline
                fillColor: AppColorsRegister.lightGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 30),

            // Register Tour Button
            ElevatedButton(
              onPressed: _registerTour,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsRegister.primaryGreen, // Button color
                foregroundColor: Colors.white, // Text color
                minimumSize: const Size(double.infinity, 50), // Full width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Cadastrar Passeio',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}