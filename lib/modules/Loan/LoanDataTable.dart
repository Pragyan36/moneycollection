import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AccountBody.dart';
import 'package:moneycollection/modules/Loan/loanForm.dart';
import 'package:moneycollection/provider/controller/depositAccount_state.dart';
import 'package:provider/provider.dart';

class LoanData extends StatefulWidget {
  const LoanData({
    super.key,
  });
  @override
  State<LoanData> createState() => _LoanDataState();
}

class _LoanDataState extends State<LoanData> {
  String? postLoanData;

  @override
  void initState() {
    super.initState();
    var depositeaccount =
        Provider.of<DepositAccountsProvider>(context, listen: false);
    depositeaccount.loadLoanAccountCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DepositAccountsProvider>(
        builder: (context, loanacc, child) {
      return Container(
        constraints: const BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: loanacc.accountLoanCollections.length,
          itemBuilder: (context, index) {
            return AccountTableBodyRow(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoanForm(
                            index: index,
                            accountno:
                                "${loanacc.accountLoanCollections[index].aCCOUNT}",
                            clientid:
                                "${loanacc.accountLoanCollections[index].cUSTID}",
                            depositecode:
                                "${loanacc.accountLoanCollections[index].dEPOSITCODE}",
                            name:
                                "${loanacc.accountLoanCollections[index].cUSTOMERNAME}",
                          )),
                );
              },
              indexxx: index + 1,
              accountno: "${loanacc.accountLoanCollections[index].aCCOUNT}",
              type: "${loanacc.accountLoanCollections[index].dEPOSITTYPE}",
              id: "${loanacc.accountLoanCollections[index].cUSTID}",
              name: "${loanacc.accountLoanCollections[index].cUSTOMERNAME}",
              mobile: "${loanacc.accountLoanCollections[index].mOBILE}",
              depositcode:
                  "${loanacc.accountLoanCollections[index].dEPOSITCODE}",
            );
          },
        ),
      );
    });
  }
}
