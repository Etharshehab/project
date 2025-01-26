import 'package:dapp/src/feauture/favourite/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..getAllFav(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Items"),
          backgroundColor: Colors.purple[100]!,
        ),
        body: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is FavGetSucess) {
              return ListView.builder(
                itemCount: state.listfav.length,
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الصورة
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(state.listfav[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // النصوص
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.listfav[index].name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.listfav[index].description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.purple[100]!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        FavCubit.get(context).deletFav(
                                            productId: state.listfav[index].id);
                                      },
                                    ),
                                    Text(
                                      "\$${state.listfav[index].price.toString()}",
                                      style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            // إذا لم يتم تحميل البيانات بعد
            if (state is Favload) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Center(child: Text("No Favourite Items"));
          },
        ),
      ),
    );
  }
}
