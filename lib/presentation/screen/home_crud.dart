import 'package:flutter/material.dart';
import '../../consts/custom_card.dart';
import '../bloc/home_crud_bloc.dart';
import '../service_controller/home_crud_service_controller.dart';
import 'custom_alert_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCrud extends StatefulWidget {
  const HomeCrud({super.key});

  @override
  State<HomeCrud> createState() => _HomeCrudState();
}

class _HomeCrudState extends State<HomeCrud> {
  final HomeCrudBloc homeCrudBloc = HomeCrudBloc(HomeCrudServiceController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCrudBloc.add(HomeCrudInitialFetchEvent());
    });
  }

  @override
  void dispose() {
    homeCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCrudBloc, HomeCrudState>(
        bloc: homeCrudBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeCrudLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeCrudSuccess) {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Center(
                    child: Text(
                      "HomeCrud",
                      style: TextStyle(color: Colors.white),
                    )),
                actions: [
                  IconButton(
                    onPressed: (){
                      homeCrudBloc.add(HomeCrudInitialFetchEvent());
                    },
                    icon: Icon(Icons.refresh,color: Colors.white,),
                  ),
                ],
              ),

              body: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.userData.length,
                itemBuilder: (context, index) {
                  final item = state.userData[index];
                  return CustomCard(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                    data: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name, style: const TextStyle(fontSize: 16)),
                              Text(item.contact.toString(), style: const TextStyle(fontSize: 16)),
                              Text(item.email, style: const TextStyle(fontSize: 16)),
                              Text(item.address, style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                        Row(
                          children: const  [
                            Icon(Icons.edit),
                            SizedBox(width: 15),
                            Icon(Icons.delete),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

            );
          } else if (state is HomeCrudError) {
            return const Center(child: Text('Error loading data'));
          }
          return SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CustomAlertBox();
              },
            );
          }),
    );
  }
}


// kkkkk