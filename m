Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E691A3E1
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 22:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B49D892E4;
	Fri, 10 May 2019 20:17:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3156892E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 20:17:02 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2966.namprd12.prod.outlook.com (20.178.52.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 10 May 2019 20:17:01 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1856.016; Fri, 10 May 2019
 20:17:01 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/amdkfd: Add function to add/remove gws to kfd
 process
Thread-Topic: [PATCH 6/8] drm/amdkfd: Add function to add/remove gws to kfd
 process
Thread-Index: AQHVB0mk+jI+uYrWFE2fzknNDULeKaZkzBAA
Date: Fri, 10 May 2019 20:17:00 +0000
Message-ID: <406e8ef0-8abb-a8c7-b44a-6594e86ee16c@amd.com>
References: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
 <1557504063-1559-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557504063-1559-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::34) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11bfa65d-26a1-401f-4da5-08d6d584759d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2966; 
x-ms-traffictypediagnostic: BYAPR12MB2966:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB296667FB89D93464496B2669920C0@BYAPR12MB2966.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(66476007)(5660300002)(73956011)(66446008)(64756008)(102836004)(66556008)(229853002)(72206003)(66946007)(14454004)(6306002)(6486002)(53546011)(6512007)(966005)(478600001)(386003)(486006)(65826007)(71200400001)(71190400001)(76176011)(476003)(11346002)(2616005)(446003)(6436002)(6506007)(52116002)(86362001)(99286004)(14444005)(256004)(31696002)(58126008)(110136005)(65956001)(65806001)(66066001)(8676002)(8936002)(81156014)(68736007)(7736002)(305945005)(36756003)(81166006)(2906002)(186003)(26005)(25786009)(64126003)(6246003)(316002)(53936002)(4326008)(3846002)(6116002)(31686004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2966;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wQ5HdSR0j73PiJUk31t7D+DCY5uGuU1LcQYMxlv8AuGDVSaku4ZLgsbOA/gjzgVM1JbWcr5CEmYuWwINa/2kujgovd41BnPWJscaaq6H1tCyzIkjDtdFxr3QgYXPxj0X1TWCTjwCeztitGYTkpJcSqVpdiJLrA+qF7Gv6Ep0D9tEHfbKK3n3xzJHKVEvh5ixvVa4y/mcBpEeZ3vVxUfSa3j3O1iNndd6h0KwxkTC74wgxOX3rtkKtPN62VXAuB8JuGN0FgyLIJ2AXk9HKXnQSBlksk49tel+OBkl/h2yr8unn9HPDWbEKqTpliQIfAcurtyl0OpswbWtCPL1TPPTrR4MRtIKYF7AsX1XGX4QANv15zKQuS+/6bEiO4lZqQG6oigegXJk30EIPG42gXIcnXj/XpsQxejr8zwUdG6p5uE=
Content-ID: <AA4BED35C2DA304AA1435F92F3855718@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bfa65d-26a1-401f-4da5-08d6d584759d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 20:17:00.8298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2966
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt2eMUxKP76HhiWsRo6ZzcHY5LPZNXtilz+dviwTa4A=;
 b=2z+Yk3/LPhjf6D/W4WKMyhR+75hPseOg929u2504jUNys4hxfUwBdm0Hr6BeKIv1dBlFEUymDrtG9q5MkHO8aB2AWr9je9AVTJ7o2RQGyvao9fLyaO2mB10qvmD6f/uIr+21wpb2xazer4MZdbU029X7/JW4K/lxTW0X+XiYGeg=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHN1YmplY3QgZm9yIHRoaXMgb25lIHNob3VsZCBzdGFydCB3aXRoIGRybS9hbWRncHU6IGJl
Y2F1c2UgaXQncyBhIA0KY2hhbmdlIGluIGFtZGdwdSwgbm90IEtGRC4NCg0KU2VlIHR3byBtb3Jl
IGNvbW1lbnRzIGlubGluZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA1LTEw
IDEyOjAxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQ0KPg0KPiBHV1MgYm8gaXMgc2hhcmVkIGJldHdlZW4gYWxsIGtmZCBwcm9jZXNzZXMuIEFkZCBm
dW5jdGlvbiB0byBhZGQgZ3dzDQo+IHRvIGtmZCBwcm9jZXNzJ3MgYm8gbGlzdCBzbyBnd3MgY2Fu
IGJlIGV2aWN0ZWQgZnJvbSBhbmQgcmVzdG9yZWQNCj4gZm9yIHByb2Nlc3MuDQo+DQo+IENoYW5n
ZS1JZDogSTc1ZDc0Y2ZkYWRiNzA3NWZmOGIyYjY4NjM0ZTIwNWRlYjczZGMxZWENCj4gU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAgICAgICB8ICAyICsNCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA5NiArKysrKysr
KysrKysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKykN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiBpbmRl
eCBjMDBjOTc0Li5mOTY4YmYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZC5oDQo+IEBAIC0xNTUsNiArMTU1LDggQEAgaW50IGFtZGdwdV9hbWRrZmRf
YWxsb2NfZ3R0X21lbShzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzaXplX3Qgc2l6ZSwNCj4gICB2b2lk
IGFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1l
bV9vYmopOw0KPiAgIGludCBhbWRncHVfYW1ka2ZkX2FsbG9jX2d3cyhzdHJ1Y3Qga2dkX2RldiAq
a2dkLCBzaXplX3Qgc2l6ZSwgdm9pZCAqKm1lbV9vYmopOw0KPiAgIHZvaWQgYW1kZ3B1X2FtZGtm
ZF9mcmVlX2d3cyhzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptZW1fb2JqKTsNCj4gK2ludCBh
bWRncHVfYW1ka2ZkX2FkZF9nd3NfdG9fcHJvY2Vzcyh2b2lkICppbmZvLCB2b2lkICpnd3MsIHN0
cnVjdCBrZ2RfbWVtICoqbWVtKTsNCj4gK2ludCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJv
bV9wcm9jZXNzKHZvaWQgKmluZm8sIHZvaWQgKm1lbSk7DQo+ICAgdWludDMyX3QgYW1kZ3B1X2Ft
ZGtmZF9nZXRfZndfdmVyc2lvbihzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGtnZF9lbmdpbmVfdHlwZSB0eXBlKTsNCj4g
ICB2b2lkIGFtZGdwdV9hbWRrZmRfZ2V0X2xvY2FsX21lbV9pbmZvKHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMNCj4gaW5kZXggZTFjYWU0YS4uMzIyYzFkYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBAQCAtNDU3LDYgKzQ1
NywxNyBAQCBzdGF0aWMgdm9pZCBhZGRfa2dkX21lbV90b19rZmRfYm9fbGlzdChzdHJ1Y3Qga2dk
X21lbSAqbWVtLA0KPiAgICAgICAgICBtdXRleF91bmxvY2soJnByb2Nlc3NfaW5mby0+bG9jayk7
DQo+ICAgfQ0KPg0KPiArc3RhdGljIHZvaWQgcmVtb3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlz
dChzdHJ1Y3Qga2dkX21lbSAqbWVtLA0KPiArICAgICAgICAgICAgICAgc3RydWN0IGFtZGtmZF9w
cm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbykNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgdHRtX3Zh
bGlkYXRlX2J1ZmZlciAqYm9fbGlzdF9lbnRyeTsNCj4gKw0KPiArICAgICAgIGJvX2xpc3RfZW50
cnkgPSAmbWVtLT52YWxpZGF0ZV9saXN0Ow0KPiArICAgICAgIG11dGV4X2xvY2soJnByb2Nlc3Nf
aW5mby0+bG9jayk7DQo+ICsgICAgICAgbGlzdF9kZWwoJmJvX2xpc3RfZW50cnktPmhlYWQpOw0K
PiArICAgICAgIG11dGV4X3VubG9jaygmcHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gK30NCj4gKw0K
PiAgIC8qIEluaXRpYWxpemVzIHVzZXIgcGFnZXMuIEl0IHJlZ2lzdGVycyB0aGUgTU1VIG5vdGlm
aWVyIGFuZCB2YWxpZGF0ZXMNCj4gICAgKiB0aGUgdXNlcnB0ciBCTyBpbiB0aGUgR1RUIGRvbWFp
bi4NCj4gICAgKg0KPiBAQCAtMTE5Nyw2ICsxMjA4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1
dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgNCj4gICAgICAgICAgcmV0dXJuIDA7DQo+DQo+ICAgYWxs
b2NhdGVfaW5pdF91c2VyX3BhZ2VzX2ZhaWxlZDoNCj4gKyAgICAgICByZW1vdmVfa2dkX21lbV9m
cm9tX2tmZF9ib19saXN0KCptZW0sIGF2bS0+cHJvY2Vzc19pbmZvKTsNCg0KSSB0aGluayB5b3Ug
bWVhbnQgdG8gcmVwbGFjZSBzb21lIGNvZGUgYSBmZXcgbGluZXMgdXA6DQoNCiAgICAgwqDCoMKg
wqDCoMKgwqAgaWYgKHVzZXJfYWRkcikgew0KICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gaW5pdF91c2VyX3BhZ2VzKCptZW0sIGN1cnJlbnQtPm1tLCB1c2VyX2FkZHIp
Ow0KICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgew0KICAgIC0g
bXV0ZXhfbG9jaygmYXZtLT5wcm9jZXNzX2luZm8tPmxvY2spOw0KICAgIC0gbGlzdF9kZWwoJigq
bWVtKS0+dmFsaWRhdGVfbGlzdC5oZWFkKTsNCiAgICAtIG11dGV4X3VubG9jaygmYXZtLT5wcm9j
ZXNzX2luZm8tPmxvY2spOw0KICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gYWxsb2NhdGVfaW5pdF91c2VyX3BhZ2VzX2ZhaWxlZDsNCiAgICAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCiAgICAgwqDCoMKgwqDCoMKgwqAgfQ0K
DQpCdXQgeW91J3JlIG5vdCByZW1vdmluZyB0aGF0IG9yaWdpbmFsIGNvZGUgaW4gdGhpcyBwYXRj
aCBzbyB5b3UnZCBlbmQgdXAgDQpyZW1vdmluZyBpdCBmcm9tIHRoZSBsaXN0IHR3aWNlLg0KDQoN
Cj4gICAgICAgICAgYW1kZ3B1X2JvX3VucmVmKCZibyk7DQo+ICAgICAgICAgIC8qIERvbid0IHVu
cmVzZXJ2ZSBzeXN0ZW0gbWVtIGxpbWl0IHR3aWNlICovDQo+ICAgICAgICAgIGdvdG8gZXJyX3Jl
c2VydmVfbGltaXQ7DQo+IEBAIC0yMTA0LDMgKzIxMTYsODcgQEAgaW50IGFtZGdwdV9hbWRrZmRf
Z3B1dm1fcmVzdG9yZV9wcm9jZXNzX2Jvcyh2b2lkICppbmZvLCBzdHJ1Y3QgZG1hX2ZlbmNlICoq
ZWYpDQo+ICAgICAgICAgIGtmcmVlKHBkX2JvX2xpc3QpOw0KPiAgICAgICAgICByZXR1cm4gcmV0
Ow0KPiAgIH0NCj4gKw0KPiAraW50IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZv
aWQgKmluZm8sIHZvaWQgKmd3cywgc3RydWN0IGtnZF9tZW0gKiptZW0pDQo+ICt7DQo+ICsgICAg
ICAgc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9IChzdHJ1Y3QgYW1k
a2ZkX3Byb2Nlc3NfaW5mbyAqKWluZm87DQo+ICsgICAgICAgc3RydWN0IGFtZGdwdV9ibyAqZ3dz
X2JvID0gKHN0cnVjdCBhbWRncHVfYm8gKilnd3M7DQo+ICsgICAgICAgaW50IHJldDsNCj4gKw0K
PiArICAgICAgIGlmICghaW5mbyB8fCAhZ3dzKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ICsNCj4gKyAgICAgICAqbWVtID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGtnZF9t
ZW0pLCBHRlBfS0VSTkVMKTsNCj4gKyAgICAgICBpZiAoISptZW0pDQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArICAgICAgIG11dGV4X2luaXQoJigqbWVtKS0+bG9j
ayk7DQo+ICsgICAgICAgKCptZW0pLT5ibyA9IGFtZGdwdV9ib19yZWYoZ3dzX2JvKTsNCj4gKyAg
ICAgICAoKm1lbSktPmRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX0dXUzsNCj4gKyAgICAgICAo
Km1lbSktPnByb2Nlc3NfaW5mbyA9IHByb2Nlc3NfaW5mbzsNCj4gKyAgICAgICBhZGRfa2dkX21l
bV90b19rZmRfYm9fbGlzdCgqbWVtLCBwcm9jZXNzX2luZm8sIGZhbHNlKTsNCj4gKyAgICAgICBh
bWRncHVfc3luY19jcmVhdGUoJigqbWVtKS0+c3luYyk7DQo+ICsNCj4gKw0KPiArICAgICAgIC8q
IFZhbGlkYXRlIGd3cyBibyB0aGUgZmlyc3QgdGltZSBpdCBpcyBhZGRlZCB0byBwcm9jZXNzICov
DQo+ICsgICAgICAgbXV0ZXhfbG9jaygmKCptZW0pLT5wcm9jZXNzX2luZm8tPmxvY2spOw0KPiAr
ICAgICAgIHJldCA9IGFtZGdwdV9ib19yZXNlcnZlKGd3c19ibywgZmFsc2UpOw0KPiArICAgICAg
IGlmICh1bmxpa2VseShyZXQpKSB7DQo+ICsgICAgICAgICAgICAgICBwcl9lcnIoIlJlc2VydmUg
Z3dzIGJvIGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gKyAgICAgICAgICAgICAgIGdvdG8gYm9fcmVz
ZXJ2YXRpb25fZmFpbHVyZTsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICByZXQgPSBhbWRn
cHVfYW1ka2ZkX2JvX3ZhbGlkYXRlKGd3c19ibywgQU1ER1BVX0dFTV9ET01BSU5fR1dTLCBmYWxz
ZSk7DQo+ICsgICAgICAgaWYgKHJldCkgew0KPiArICAgICAgICAgICAgICAgcHJfZXJyKCJHV1Mg
Qk8gdmFsaWRhdGUgZmFpbGVkICVkXG4iLCByZXQpOw0KPiArICAgICAgICAgICAgICAgZ290byBi
b192YWxpZGF0aW9uX2ZhaWx1cmU7DQo+ICsgICAgICAgfQ0KPiArICAgICAgIC8qIEdXUyByZXNv
dXJjZSBpcyBzaGFyZWQgYi90IGFtZGdwdSBhbmQgYW1ka2ZkDQo+ICsgICAgICAgICogQWRkIHBy
b2Nlc3MgZXZpY3Rpb24gZmVuY2UgdG8gYm8gc28gdGhleSBjYW4NCj4gKyAgICAgICAgKiBldmlj
dCBlYWNoIG90aGVyLg0KPiArICAgICAgICAqLw0KPiArICAgICAgIGFtZGdwdV9ib19mZW5jZShn
d3NfYm8sICZwcm9jZXNzX2luZm8tPmV2aWN0aW9uX2ZlbmNlLT5iYXNlLCB0cnVlKTsNCj4gKyAg
ICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGd3c19ibyk7DQo+ICsgICAgICAgbXV0ZXhfdW5sb2Nr
KCYoKm1lbSktPnByb2Nlc3NfaW5mby0+bG9jayk7DQo+ICsNCj4gKyAgICAgICByZXR1cm4gcmV0
Ow0KPiArDQo+ICtib192YWxpZGF0aW9uX2ZhaWx1cmU6DQo+ICsgICAgICAgYW1kZ3B1X2JvX3Vu
cmVzZXJ2ZShnd3NfYm8pOw0KPiArYm9fcmVzZXJ2YXRpb25fZmFpbHVyZToNCj4gKyAgICAgICBt
dXRleF91bmxvY2soJigqbWVtKS0+cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gKyAgICAgICBhbWRn
cHVfc3luY19mcmVlKCYoKm1lbSktPnN5bmMpOw0KPiArICAgICAgIHJlbW92ZV9rZ2RfbWVtX2Zy
b21fa2ZkX2JvX2xpc3QoKm1lbSwgcHJvY2Vzc19pbmZvKTsNCj4gKyAgICAgICBhbWRncHVfYm9f
dW5yZWYoJmd3c19ibyk7DQo+ICsgICAgICAgbXV0ZXhfZGVzdHJveSgmKCptZW0pLT5sb2NrKTsN
Cj4gKyAgICAgICBrZnJlZSgqbWVtKTsNCg0KU2V0ICptZW0gPSBOVUxMIGFmdGVyIGtmcmVlIHRv
IGF2b2lkIHJldHVybmluZyBhIGRhbmdsaW5nIHBvaW50ZXIuDQoNCg0KPiArICAgICAgIHJldHVy
biByZXQ7DQo+ICt9DQo+ICsNCj4gK2ludCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9w
cm9jZXNzKHZvaWQgKmluZm8sIHZvaWQgKm1lbSkNCj4gK3sNCj4gKyAgICAgICBpbnQgcmV0Ow0K
PiArICAgICAgIHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPSAoc3Ry
dWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKilpbmZvOw0KPiArICAgICAgIHN0cnVjdCBrZ2RfbWVt
ICprZ2RfbWVtID0gKHN0cnVjdCBrZ2RfbWVtICopbWVtOw0KPiArICAgICAgIHN0cnVjdCBhbWRn
cHVfYm8gKmd3c19ibyA9IGtnZF9tZW0tPmJvOw0KPiArDQo+ICsgICAgICAgLyogUmVtb3ZlIEJP
IGZyb20gcHJvY2VzcydzIHZhbGlkYXRlIGxpc3Qgc28gcmVzdG9yZSB3b3JrZXIgd29uJ3QgdG91
Y2gNCj4gKyAgICAgICAgKiBpdCBhbnltb3JlDQo+ICsgICAgICAgICovDQo+ICsgICAgICAgcmVt
b3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdChrZ2RfbWVtLCBwcm9jZXNzX2luZm8pOw0KPiAr
DQo+ICsgICAgICAgcmV0ID0gYW1kZ3B1X2JvX3Jlc2VydmUoZ3dzX2JvLCBmYWxzZSk7DQo+ICsg
ICAgICAgaWYgKHVubGlrZWx5KHJldCkpIHsNCj4gKyAgICAgICAgICAgICAgIHByX2VycigiUmVz
ZXJ2ZSBnd3MgYm8gZmFpbGVkICVkXG4iLCByZXQpOw0KPiArICAgICAgICAgICAgICAgLy9UT0RP
IGFkZCBCTyBiYWNrIHRvIHZhbGlkYXRlX2xpc3Q/DQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiArICAgICAgIH0NCj4gKyAgICAgICBhbWRncHVfYW1ka2ZkX3JlbW92ZV9ldmljdGlv
bl9mZW5jZShnd3NfYm8sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHByb2Nlc3NfaW5mby0+
ZXZpY3Rpb25fZmVuY2UpOw0KPiArICAgICAgIGFtZGdwdV9ib191bnJlc2VydmUoZ3dzX2JvKTsN
Cj4gKyAgICAgICBhbWRncHVfc3luY19mcmVlKCZrZ2RfbWVtLT5zeW5jKTsNCj4gKyAgICAgICBh
bWRncHVfYm9fdW5yZWYoJmd3c19ibyk7DQo+ICsgICAgICAgbXV0ZXhfZGVzdHJveSgma2dkX21l
bS0+bG9jayk7DQo+ICsgICAgICAga2ZyZWUobWVtKTsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4g
K30NCj4gLS0NCj4gMi43LjQNCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
