// lib/features/splash/presentation/pages/splash_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_learning/locator.dart';

import '../../../../common/navigation/navigation_service.dart';

class SplashPage extends StatefulWidget {
  final SplashBloc splashBloc;

  const SplashPage({Key? key, required this.splashBloc}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.splashBloc.add(AutoLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: widget.splashBloc,
      listener: (context, state) {
        if (state is SplashSuccess) {
          // locator<NavigationService>().navigateTo('/home');
        } else if (state is SplashFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            bloc: widget.splashBloc,
            builder: (context, state) {
              if (state is SplashLoading) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('正在加载...'),
                  ],
                );
              } else if (state is SplashLogining) {
                return const Text('Logining...');
              } else if (state is SplashSuccess) {
                return Text('Login Success: ${state.responseBody}');
              } else if (state is SplashFailure) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {
                        widget.splashBloc.add(AutoLoginEvent());
                      },
                      child: const Text('重试'),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
