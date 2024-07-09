import 'package:flutter/material.dart';

import 'package:moneycollection/constant/CustomTable.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:provider/provider.dart';

class SavingCollection extends StatefulWidget {
  

  const SavingCollection({super.key, });
  @override
  State<SavingCollection> createState() => _SavingCollectionState();
}

class _SavingCollectionState extends State<SavingCollection> {
 
  String? postLoanData;

  @override
  void initState() {
    super.initState();
 var collection =Provider.of<LoanStateProvider>(context, listen: false);
    collection.loadSavingCollections();
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
            itemCount: postdeposite.savingCollections.length,
            itemBuilder: (context, index) {
              return TableBodyRow( 
               

                indexxx: index + 1,
                sn: "${index + 1}",
                customer: "${postdeposite.savingCollections[index].cUSTOMERNAME}",
                account: "${postdeposite.savingCollections[index].aCCOUNT}",
                amount: "${postdeposite.savingCollections[index].dEPOSIT}",
                datead: "${postdeposite.savingCollections[index].tranDateAd}",
                datebs: "${postdeposite.savingCollections[index].tranDateBs}",
                isSaving: true,
              );
            },
          ),
        );
      });
    });
  }
}
