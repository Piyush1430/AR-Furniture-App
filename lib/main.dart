import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:new_app/app/my_app.dart";
import "package:new_app/features/home/presentation_layer/bloc/product_bloc.dart";
import "package:new_app/init_dependencies.dart";

import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();

  runApp(
    BlocProvider(
      create: (context) => serviceLocator<ProductBloc>(),
      child: const MyApp(),
      ),
  );
}
