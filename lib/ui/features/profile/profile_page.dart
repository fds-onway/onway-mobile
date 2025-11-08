import 'package:flutter/material.dart';
import 'package:onway/ui/features/auth/viewmodels/auth_view_model.dart';
import 'package:onway/ui/features/auth/widgets/auth_page.dart';
import 'package:onway/util/navigation/util_navigation.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Perfil'),
          ),
          body: Column(
            children: [
              Expanded(child: const SizedBox()),
            ],
          ),

          persistentFooterButtons: [
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.logout),
                                  const Text('Sair'),
                                ],
                              ),
                        onPressed: viewModel.isLoading
                            ? null
                            : () {
                                viewModel.signOut();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  UtilNavigation.nextPageFromBottom(
                                    page: const LoginPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
