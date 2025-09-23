import 'package:flutter/material.dart';
import 'userdata.dart';
import 'model/user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  bool _obscurePassword = true;
  String _selectedRole = "Customer";

  void _signUp() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String pass = _passwordController.text.trim();
    String subject = _subjectController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Semua field wajib diisi")));
      return;
    }

    //  objek sesuai role
    UserModel newUser;
    if (_selectedRole == "Guru") {
      if (subject.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Mata pelajaran wajib diisi untuk Guru"),
          ),
        );
        return;
      }
      newUser = TeacherUser(
        name: name,
        email: email,
        phone: phone,
        password: pass,
        subject: subject,
        address: "Belum diisi",
      );
    } else {
      newUser = CustomerUser(
        name: name,
        email: email,
        phone: phone,
        password: pass,
        address: "Belum diisi",
      );
    }

    newUser.profileImage = null;

    // Simpan ke list
    UserData.users.add(newUser);

    print("User baru ditambahkan: ${newUser.toString()}");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Akun")),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 233, 152, 179),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Image.asset("assets/panda.png", height: 100),
              const SizedBox(height: 10),
              const Text(
                "LES MANIA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: const [
                  DropdownMenuItem(value: "Customer", child: Text("Customer")),
                  DropdownMenuItem(value: "Guru", child: Text("Guru")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Daftar sebagai",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "Nomor Telepon",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              if (_selectedRole == "Guru") ...[
                TextField(
                  controller: _subjectController,
                  decoration: const InputDecoration(
                    labelText: "Mata Pelajaran",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
              ],

              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 64, 137, 1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
