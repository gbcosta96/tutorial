import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/models/company_model.dart';
import 'package:tutorial/screens/login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  List<CompanyModel> companies = [];

  Widget _companiesWidget(CompanyModel company) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.red,
      child: Column(
        children: [
          Text("Name: ${company.name}"),
          Text("Description: ${company.description}"),
          Text("Year: ${company.year}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Nome",
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Descrição",
                ),
              ),
              TextField(
                controller: yearController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  hintText: "Ano",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    CompanyModel comp = CompanyModel(
                      name: nameController.text,
                      description: descriptionController.text,
                      year: int.parse(yearController.text)
                    );
                    companies.add(comp);
                  });
                  nameController.text = "";
                  descriptionController.text = "";
                  yearController.text = "";
                  
                },
                child: const Text("Criar Empresa"),
              ),
              const Spacer(),
              Expanded(
                child: ListView(
                  children: [
                    for(CompanyModel comp in companies)
                      _companiesWidget(comp),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text("Sair"),
              ),
            ]
          ),
        ),
      ),
    );
  }
}