import 'package:dapp/src/feauture/cart/cubit/cart_cubit.dart';
import 'package:dapp/src/feauture/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getAllCartCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 5,
          backgroundColor: Colors.purple[100]!,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartGetAllSuccess) {
              if (state.listCart.isEmpty) {
                return const Center(
                  child: Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: state.listCart.length,
                itemBuilder: (context, index) {
                  final item = state.listCart[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      CartCubit.get(context)
                          .deleteCartCubit(productId: item.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} removed from cart.'),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(item.image),
                          backgroundColor: Colors.grey[200],
                        ),
                        title: Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            CartCubit.get(context)
                                .deleteCartCubit(productId: item.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('${item.name} removed from cart.'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is CartErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            } else if (state is CartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('Unexpected state'));
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[100]!,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Proceed to Checkout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
