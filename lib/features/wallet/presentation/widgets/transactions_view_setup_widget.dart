import 'package:flutter/material.dart';

class TransactionsViewSetupWidget extends StatelessWidget {
  final VoidCallback viewAll;
  const TransactionsViewSetupWidget({
    required this.viewAll,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Last Transactions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            viewAll();
          },
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
