import 'package:dapp/src/feauture/cart/cubit/cart_cubit.dart';
import 'package:dapp/src/feauture/favourite/cubit/fav_cubit.dart';
import 'package:dapp/src/feauture/get_lapTop/cubit/lap_top_cubit.dart';
import 'package:dapp/src/feauture/get_lapTop/cubit/lap_top_state.dart';
import 'package:dapp/src/feauture/layoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLapTop extends StatelessWidget {
  const GetLapTop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LapTopCubit()..getAllLapCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Laptops"),
          centerTitle: true,
          backgroundColor: Colors.purple[100]!,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }),
        ),
        body: BlocBuilder<LapTopCubit, LapTopState>(
          builder: (context, state) {
            if (state is LapTopLoding) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LapTopSucess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: state.listlap.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Makes it a grid with 2 columns
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7, // Adjust this based on image size
                  ),
                  itemBuilder: (context, index) {
                    final laptop = state.listlap[index];

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                laptop.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              laptop.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "\$${laptop.price}",
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 16),
                              ),
                              // IconButton(
                              //   onPressed: () async {
                              //     final cartCubit = CartCubit.get(context);
                              //     final state = await cartCubit.addCartCubit();

                              //     if (state is CartSucess) {
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //           content: Text(
                              //               "Item added to cart successfully!"),
                              //           duration: Duration(seconds: 2),
                              //           backgroundColor: Colors.green,
                              //         ),
                              //       );
                              //     }
                              //   },
                              //   icon: const Icon(Icons.shopping_bag,
                              //       color: Colors.red),
                              // )
                              IconButton(
                                  onPressed: () {
                                    FavCubit.get(context).addFavCubit(
                                        id: state.listlap[index].id);
                                  },
                                  icon: Icon(Icons.favorite)),
                              IconButton(
                                  onPressed: () {
                                    CartCubit.get(context).getAddToCartCubit();
                                  },
                                  icon: Icon(Icons.shopping_cart))
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text("Fetching laptops..."));
          },
        ),
      ),
    );
  }
}
