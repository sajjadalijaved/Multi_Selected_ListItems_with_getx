import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handle_list_with_bloc/bloc/bloc/counter_bloc.dart';
import 'package:handle_list_with_bloc/screens/home_view.dart';
import 'package:handle_list_with_bloc/screens/listcount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListCubit([]),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'List with bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: "Complete with Bloc"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print('Whole \' HomeScreen \' built');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ListCubit, List<String>>(
                builder: (context, state) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) =>
                      Center(child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(state.elementAt(index)),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      'Counter Value : ${state.counterValue}',
                      style: Theme.of(context).textTheme.labelLarge,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<ListCubit>().removeToList();
                          context
                              .read<CounterBloc>()
                              .add(CounterDecrementEvent());

                        },
                        icon: const Icon(Icons.remove_circle),
                        label: const Text("Decrease"),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<ListCubit>().addToList();
                              context
                                  .read<CounterBloc>()
                                  .add(CounterIncreamentEvent());
                            },
                            icon: const Icon(Icons.add_circle),
                            label: const Text("Increase")))
                  ],
                ),
                
              ),

              const SizedBox(height: 20,),
                Center(
                  child: Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),));
                              },
                              icon: const Icon(Icons.pages),
                              label: const Text("Move To Next Page"))),
                )
            ],
          ),
        ),
      ),
    );
  }
}
