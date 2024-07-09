class PostLoan {
  List<Entries>? entries;

  PostLoan({this.entries});

  PostLoan.fromJson(Map<String, dynamic> json) {
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(new Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entries != null) {
      data['entries'] = this.entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  String? bRANCHCODE;
  String? aCCOUNT;
  String? cUSTID;
  String? dEPOSITCODE;
  String? tranDateAd;
  String? tranDateBs;
  String? cUSTOMERNAME;
  String? dEPOSIT;

  Entries(
      {this.bRANCHCODE,
      this.aCCOUNT,
      this.cUSTID,
      this.dEPOSITCODE,
      this.tranDateAd,
      this.tranDateBs,
      this.cUSTOMERNAME,
      this.dEPOSIT});

  Entries.fromJson(Map<String, dynamic> json) {
    bRANCHCODE = json['BRANCHCODE'];
    aCCOUNT = json['ACCOUNT'];
    cUSTID = json['CUSTID'];
    dEPOSITCODE = json['DEPOSITCODE'];
    tranDateAd = json['tran_date_ad'];
    tranDateBs = json['tran_date_bs'];
    cUSTOMERNAME = json['CUSTOMERNAME'];
    dEPOSIT = json['DEPOSIT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BRANCHCODE'] = this.bRANCHCODE;
    data['ACCOUNT'] = this.aCCOUNT;
    data['CUSTID'] = this.cUSTID;
    data['DEPOSITCODE'] = this.dEPOSITCODE;
    data['tran_date_ad'] = this.tranDateAd;
    data['tran_date_bs'] = this.tranDateBs;
    data['CUSTOMERNAME'] = this.cUSTOMERNAME;
    data['DEPOSIT'] = this.dEPOSIT;
    return data;
  }
}
