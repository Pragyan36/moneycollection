
class DepositAccounts {
  String? cUSTID;
  String? cUSTOMERNAME;
  String? mOBILE;
  String? aCCOUNT;
  int? bAL;
  String? dEPOSITTYPE;
  String? dEPOSITCODE;
  String? tYPE;

  DepositAccounts(
      {this.cUSTID,
      this.cUSTOMERNAME,
      this.mOBILE,
      this.aCCOUNT,
      this.bAL,
      this.dEPOSITTYPE,
      this.dEPOSITCODE,
      this.tYPE});

  DepositAccounts.fromJson(Map<String, dynamic> json) {
    cUSTID = json['CUSTID'];
    cUSTOMERNAME = json['CUSTOMERNAME'];
    mOBILE = json['MOBILE'];
    aCCOUNT = json['ACCOUNT'];
     var balValue = json['BAL'];
  if (balValue is String) {
    // Convert string value to integer
    bAL = int.tryParse(balValue);
  } else if (balValue is int) {
    bAL = balValue;
  }
    dEPOSITTYPE = json['DEPOSITTYPE'];
    dEPOSITCODE = json['DEPOSITCODE'];
    tYPE = json['TYPE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CUSTID'] = this.cUSTID;
    data['CUSTOMERNAME'] = this.cUSTOMERNAME;
    data['MOBILE'] = this.mOBILE;
    data['ACCOUNT'] = this.aCCOUNT;
    data['BAL'] = this.bAL;
    data['DEPOSITTYPE'] = this.dEPOSITTYPE;
    data['DEPOSITCODE'] = this.dEPOSITCODE;
    data['TYPE'] = this.tYPE;
    return data;
  }
}
