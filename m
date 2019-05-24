Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC24229E9A
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 20:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFD16E0BB;
	Fri, 24 May 2019 18:59:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700044.outbound.protection.outlook.com [40.107.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3396E0BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 18:59:15 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2971.namprd12.prod.outlook.com (20.178.29.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Fri, 24 May 2019 18:59:13 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 18:59:13 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/amdkfd: Use kfd fd to mmap mmio
Thread-Topic: [PATCH 8/8] drm/amdkfd: Use kfd fd to mmap mmio
Thread-Index: AQHVEbioEKXc1KNidUCnx+XJ7aCxiaZ6ohsA
Date: Fri, 24 May 2019 18:59:13 +0000
Message-ID: <10b1e33c-221d-251f-d939-1df49a4ea192@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-8-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-8-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::48) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dcc95e3-6388-4961-fd0a-08d6e079e972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2971; 
x-ms-traffictypediagnostic: DM6PR12MB2971:
x-microsoft-antispam-prvs: <DM6PR12MB2971961728893537B77CA49492020@DM6PR12MB2971.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(346002)(136003)(376002)(52314003)(189003)(199004)(7736002)(73956011)(386003)(86362001)(6506007)(31696002)(316002)(8936002)(53546011)(305945005)(229853002)(66556008)(66946007)(2501003)(64126003)(66476007)(68736007)(64756008)(76176011)(102836004)(6116002)(3846002)(72206003)(14454004)(2906002)(478600001)(5660300002)(52116002)(71200400001)(71190400001)(81156014)(476003)(2616005)(6436002)(31686004)(66446008)(11346002)(54906003)(4326008)(58126008)(486006)(53936002)(110136005)(99286004)(6512007)(186003)(256004)(446003)(25786009)(6486002)(26005)(6246003)(81166006)(8676002)(65806001)(36756003)(65826007)(66066001)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2971;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tqG6a3P86HrW4uAO2MkeiaBIU+1sEAspFRuZRIYMerF7dtPJl0QQRHXf+gHY/HtyPg03Dk1ShIJFzh9joSVTZJcYakcLXAtvu/y9UHIwT1Y4koN4KsigvOVugsxbrM3/9w71ajT3kgpyowLVknABsoDWIVviMVHz4CqQzT/wawk9WNyK16fx9aM2vjhjBbBomEHis3LM7MTM3h6hSl8sUYfOtho178Q7GcWf7qSa7nvnRvsyBIWtMNjgAIMnSgqdL3TXDsf//YsXylTLG0HoiULGxj4GGwyDVtEge9EwCd8cFcg8PcBrhTRokU0Gdw5Cf4jLkr6npjn8ngHjistfvyJYnUDan78ApnbYJVsBGvf30yL2PUJmttwOIdAN550AvoavjO9y3EBYu+nxNfsX1HPUdqqYgpPQqKy8Ke4m0f0=
Content-ID: <BE11112BE99D194F997E44391EDF5005@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcc95e3-6388-4961-fd0a-08d6e079e972
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 18:59:13.4717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2971
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJjmjhU/Ft871YSwEPnfiYmzHdq/UdNVwVNetbu6BFY=;
 b=vBTynzvO8rfUEt/sduc7oI+RMv5vEFM8rW7CHIcaZvhJKGSl/uR2LOGZhyHLRXFzswWQCo+q9x2KPliursgJU5sWtH96SL5zI8OHap8GVVwqUX9mYwwzlWF5jEdsd/Gg8l3OTYJtyFfpllByrHIbZgL/bL5AYORDzKxMsYRFIVc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgT2FrLA0KDQpJJ20gbm90IHN1cmUgd2h5IHRoaXMgaXMgcGFydCBvZiB0aGUgR1dTIHBhdGNo
IHNlcmllcy4gSXQncyB1bnJlbGF0ZWQgdG8gDQpHV1MuIEFueXdheSwgc2VlIG9uZSBjb21tZW50
IGlubGluZS4NCg0KT24gMjAxOS0wNS0yMyA2OjQxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4g
VFRNIGRvZXNuJ3Qgc3VwcG9ydCBDUFUgbWFwcGluZyBvZiBzZyB0eXBlIGJvICh1bmRlciB3aGlj
aA0KPiBtbWlvIGJvIGlzIGNyZWF0ZWQpLiBTd2l0Y2ggbW1hcGluZyBvZiBtbWlvIHBhZ2UgdG8g
a2ZkDQo+IGRldmljZSBmaWxlLg0KPg0KPiBDaGFuZ2UtSWQ6IEkxYTFhMjRmMmFjMDY2MmJlMzc4
M2Q0NjBjMTM3NzMxYWRlMDA3YjgzDQo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVu
Z0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hh
cmRldi5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgIHwgIDEgKw0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9jaGFyZGV2LmMNCj4gaW5kZXggNDU1YTNkYi4uNjdkMjY5YiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+IEBAIC0xMzA5LDYgKzEzMDksMTUgQEAg
c3RhdGljIGludCBrZmRfaW9jdGxfYWxsb2NfbWVtb3J5X29mX2dwdShzdHJ1Y3QgZmlsZSAqZmls
ZXAsDQo+ICAgCWFyZ3MtPmhhbmRsZSA9IE1BS0VfSEFORExFKGFyZ3MtPmdwdV9pZCwgaWRyX2hh
bmRsZSk7DQo+ICAgCWFyZ3MtPm1tYXBfb2Zmc2V0ID0gb2Zmc2V0Ow0KPiAgIA0KPiArCS8qIE1N
SU8gaXMgbWFwcGVkIHRocm91Z2gga2ZkIGRldmljZQ0KPiArCSAqIEdlbmVyYXRlIGEga2ZkIG1t
YXAgb2Zmc2V0DQo+ICsJICovDQo+ICsJaWYgKGZsYWdzICYgS0ZEX0lPQ19BTExPQ19NRU1fRkxB
R1NfTU1JT19SRU1BUCkgew0KPiArCQlhcmdzLT5tbWFwX29mZnNldCA9IEtGRF9NTUFQX1RZUEVf
TU1JTyB8IEtGRF9NTUFQX0dQVV9JRChhcmdzLT5ncHVfaWQpOw0KPiArCQlhcmdzLT5tbWFwX29m
ZnNldCA8PD0gUEFHRV9TSElGVDsNCj4gKwkJYXJncy0+bW1hcF9vZmZzZXQgfD0gYW1kZ3B1X2Ft
ZGtmZF9nZXRfbW1pb19yZW1hcF9waHlzX2FkZHIoZGV2LT5rZ2QpOw0KDQpJdCBzZWVtcyB0aGUg
bW1pb19yZW1hcF9waHlzX2FkZHIgZG9lc24ndCBuZWVkIHRvIGJlIHBhcnQgb2YgdGhlIA0KbW1h
cF9vZmZzZXQuIEl0J3Mgbm90IHVzZWQgZm9yIGFueXRoaW5nIGluIGtmZF9tbWFwLiBBbmQgaXQg
DQp1bm5lY2Vzc2FyaWx5IGV4cG9zZXMgYSBwaHlzaWNhbCBhZGRyZXNzIHRvIHVzZXIgbW9kZSwg
d2hpY2ggd2UgdXN1YWxseSANCnRlbmQgdG8gYXZvaWQuDQoNCldpdGggdGhhdCBmaXhlcywgdGhl
IHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyANCjxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArCX0NCj4gKw0KPiAgIAlyZXR1
cm4gMDsNCj4gICANCj4gICBlcnJfZnJlZToNCj4gQEAgLTE4ODAsNiArMTg4OSwzOSBAQCBzdGF0
aWMgbG9uZyBrZmRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQgY21kLCB1
bnNpZ25lZCBsb25nIGFyZykNCj4gICAJcmV0dXJuIHJldGNvZGU7DQo+ICAgfQ0KPiAgIA0KPiAr
c3RhdGljIGludCBrZmRfbW1pb19tbWFwKHN0cnVjdCBrZmRfZGV2ICpkZXYsIHN0cnVjdCBrZmRf
cHJvY2VzcyAqcHJvY2VzcywNCj4gKwkJICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
DQo+ICt7DQo+ICsJcGh5c19hZGRyX3QgYWRkcmVzczsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
aWYgKHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCAhPSBQQUdFX1NJWkUpDQo+ICsJCXJldHVy
biAtRUlOVkFMOw0KPiArDQo+ICsJYWRkcmVzcyA9IGFtZGdwdV9hbWRrZmRfZ2V0X21taW9fcmVt
YXBfcGh5c19hZGRyKGRldi0+a2dkKTsNCj4gKw0KPiArCXZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8g
fCBWTV9ET05UQ09QWSB8IFZNX0RPTlRFWFBBTkQgfCBWTV9OT1JFU0VSVkUgfA0KPiArCQkJCVZN
X0RPTlREVU1QIHwgVk1fUEZOTUFQOw0KPiArDQo+ICsJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3By
b3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsNCj4gKw0KPiArCXByX2RlYnVnKCJQcm9j
ZXNzICVkIG1hcHBpbmcgbW1pbyBwYWdlXG4iDQo+ICsJCSAiICAgICB0YXJnZXQgdXNlciBhZGRy
ZXNzID09IDB4JTA4bGxYXG4iDQo+ICsJCSAiICAgICBwaHlzaWNhbCBhZGRyZXNzICAgID09IDB4
JTA4bGxYXG4iDQo+ICsJCSAiICAgICB2bV9mbGFncyAgICAgICAgICAgID09IDB4JTA0bFhcbiIN
Cj4gKwkJICIgICAgIHNpemUgICAgICAgICAgICAgICAgPT0gMHglMDRsWFxuIiwNCj4gKwkJIHBy
b2Nlc3MtPnBhc2lkLCAodW5zaWduZWQgbG9uZyBsb25nKSB2bWEtPnZtX3N0YXJ0LA0KPiArCQkg
YWRkcmVzcywgdm1hLT52bV9mbGFncywgUEFHRV9TSVpFKTsNCj4gKw0KPiArCXJldCA9IGlvX3Jl
bWFwX3Bmbl9yYW5nZSh2bWEsDQo+ICsJCQkJdm1hLT52bV9zdGFydCwNCj4gKwkJCQlhZGRyZXNz
ID4+IFBBR0VfU0hJRlQsDQo+ICsJCQkJUEFHRV9TSVpFLA0KPiArCQkJCXZtYS0+dm1fcGFnZV9w
cm90KTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICsNCj4gICBzdGF0aWMgaW50IGtm
ZF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4g
ICB7DQo+ICAgCXN0cnVjdCBrZmRfcHJvY2VzcyAqcHJvY2VzczsNCj4gQEAgLTE5MTAsNiArMTk1
MiwxMCBAQCBzdGF0aWMgaW50IGtmZF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkNCj4gICAJCWlmICghZGV2KQ0KPiAgIAkJCXJldHVybiAtRU5PREVW
Ow0KPiAgIAkJcmV0dXJuIGtmZF9yZXNlcnZlZF9tZW1fbW1hcChkZXYsIHByb2Nlc3MsIHZtYSk7
DQo+ICsJY2FzZSBLRkRfTU1BUF9UWVBFX01NSU86DQo+ICsJCWlmICghZGV2KQ0KPiArCQkJcmV0
dXJuIC1FTk9ERVY7DQo+ICsJCXJldHVybiBrZmRfbW1pb19tbWFwKGRldiwgcHJvY2Vzcywgdm1h
KTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR1cm4gLUVGQVVMVDsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJpdi5oDQo+IGluZGV4IDQwYTVjNjcuLmI2MWRjNTMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBAQCAtNTksNiArNTksNyBAQA0KPiAg
ICNkZWZpbmUgS0ZEX01NQVBfVFlQRV9ET09SQkVMTAkoMHgzVUxMIDw8IEtGRF9NTUFQX1RZUEVf
U0hJRlQpDQo+ICAgI2RlZmluZSBLRkRfTU1BUF9UWVBFX0VWRU5UUwkoMHgyVUxMIDw8IEtGRF9N
TUFQX1RZUEVfU0hJRlQpDQo+ICAgI2RlZmluZSBLRkRfTU1BUF9UWVBFX1JFU0VSVkVEX01FTQko
MHgxVUxMIDw8IEtGRF9NTUFQX1RZUEVfU0hJRlQpDQo+ICsjZGVmaW5lIEtGRF9NTUFQX1RZUEVf
TU1JTwkoMHgwVUxMIDw8IEtGRF9NTUFQX1RZUEVfU0hJRlQpDQo+ICAgDQo+ICAgI2RlZmluZSBL
RkRfTU1BUF9HUFVfSURfU0hJRlQgKDQ2IC0gUEFHRV9TSElGVCkNCj4gICAjZGVmaW5lIEtGRF9N
TUFQX0dQVV9JRF9NQVNLICgoKDFVTEwgPDwgS0ZEX0dQVV9JRF9IQVNIX1dJRFRIKSAtIDEpIFwN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
