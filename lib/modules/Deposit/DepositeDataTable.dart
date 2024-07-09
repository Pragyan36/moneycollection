import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AccountBody.dart';
import 'package:moneycollection/modules/Deposit/DepositForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class DepositData extends StatefulWidget {
  @override
  State<DepositData> createState() => _DepositDataState();
}

class _DepositDataState extends State<DepositData> {
  @override
  void initState() {
    super.initState();
    var depositeaccount =
        Provider.of<DepositAccountsProvider>(context, listen: false);
    depositeaccount.loadDepositAccountCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
      return Container(
        constraints: const BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: loanacc.accountDepositCollections.length,
          itemBuilder: (context, index) {
            return AccountTableBodyRow(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepositForm(
                            index: index,
                            accountno:
                                "${loanacc.accountDepositCollections[index].aCCOUNT}",
                            clientid:
                                "${loanacc.accountDepositCollections[index].cUSTID}",
                            depositecode:
                                "${loanacc.accountDepositCollections[index].dEPOSITCODE}",
                            name:
                                "${loanacc.accountDepositCollections[index].cUSTOMERNAME}",
                                
                          )),
                );
              },
              indexxx: index,
              accountno: "${loanacc.accountDepositCollections[index].aCCOUNT}",
              type: "${loanacc.accountDepositCollections[index].dEPOSITTYPE}",
              id: "${loanacc.accountDepositCollections[index].cUSTID}",
              name: "${loanacc.accountDepositCollections[index].cUSTOMERNAME}",
              mobile: "${loanacc.accountDepositCollections[index].mOBILE}",
              depositcode:
                  "${loanacc.accountDepositCollections[index].dEPOSITCODE}",
            );
          },
        ),
      );
    });
  }
}
