
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentmanegement/core/app_color.dart';
import 'package:studentmanegement/presentation/screens/new_registraion.dart';
import 'package:studentmanegement/presentation/widgets/common_app_bar.dart';


class RegistrationsScreen extends StatelessWidget {
  const RegistrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
      //    context.read<RegistrationsBloc>().add(GetAllRegistrations());
        },
        child: const CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            CommonAppbar(title: 'Registration'),
         
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.blue.withOpacity(0.15)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(AppColors.blue),
              ),
              child: const Text('New Registration'),
              onPressed: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewRegistrationScreen()),
                        );
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
