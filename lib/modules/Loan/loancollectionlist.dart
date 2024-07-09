import 'package:flutter/material.dart';

import 'package:moneycollection/constant/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:provider/provider.dart';

class Loancoll extends StatefulWidget {
  const Loancoll({
    super.key,
  });
  @override
  State<Loancoll> createState() => _LoancollState();
}

class _LoancollState extends State<Loancoll> {
  @override
  void initState() {
    super.initState();
    var collection = Provider.of<LoanStateProvider>(context, listen: false);
    collection.loadLoanCollections();
  }

// LoanStateProvider() {
  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
      return Consumer<LoanStateProvider>(
          builder: (context, postdeposite, child) {
        return Container(
          constraints: BoxConstraints.expand(),
          child: ListView.builder(
            itemCount: postdeposite.loancollectionsheet.length,
            itemBuilder: (context, index) {
              return TableBodyRow(
                indexxx: index,
                sn: "${index + 1}",
                customer:
                    "${postdeposite.loancollectionsheet[index].cUSTOMERNAME}",
                account: "${postdeposite.loancollectionsheet[index].aCCOUNT}",
                amount: "${postdeposite.loancollectionsheet[index].dEPOSIT}",
                isSaving: false,
                datead: "${postdeposite.loancollectionsheet[index].tranDateAd}",
                datebs: "${postdeposite.loancollectionsheet[index].tranDateBs}",
              );
            },
          ),
        );
      });
    });
  }
}
