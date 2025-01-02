import 'package:first_bank_app/features/loan/providers/loan_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<LoanProvider>(
    create: (_) => LoanProvider(),
  ),
];
