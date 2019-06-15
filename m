Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CAE46D83
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jun 2019 03:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5F78940F;
	Sat, 15 Jun 2019 01:27:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C638940F
 for <amd-gfx@lists.freedesktop.org>; Sat, 15 Jun 2019 01:27:50 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2417.namprd12.prod.outlook.com (52.132.11.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Sat, 15 Jun 2019 01:27:48 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.013; Sat, 15 Jun 2019
 01:27:48 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] Revert "drm/amdkfd: Fix a circular lock dependency"
Thread-Topic: [PATCH 2/4] Revert "drm/amdkfd: Fix a circular lock dependency"
Thread-Index: AQHVIxmKii+T16yG8kymmrpAtFF2+w==
Date: Sat, 15 Jun 2019 01:27:48 +0000
Message-ID: <1560562057-19810-2-git-send-email-Oak.Zeng@amd.com>
References: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b29dbeb-728a-4a16-5573-08d6f130acf1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2417; 
x-ms-traffictypediagnostic: BL0PR12MB2417:
x-microsoft-antispam-prvs: <BL0PR12MB2417871E8D687C50FE76F32E80E90@BL0PR12MB2417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(199004)(189003)(6486002)(6116002)(72206003)(36756003)(14454004)(2906002)(6436002)(476003)(11346002)(6512007)(53936002)(5640700003)(14444005)(256004)(2351001)(64756008)(68736007)(3846002)(76176011)(446003)(6916009)(7736002)(52116002)(99286004)(305945005)(81166006)(66066001)(26005)(102836004)(25786009)(81156014)(4326008)(6506007)(486006)(73956011)(50226002)(54906003)(316002)(386003)(2501003)(2616005)(86362001)(5660300002)(66946007)(8676002)(66446008)(71200400001)(66476007)(71190400001)(478600001)(66556008)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2417;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bhvd+5sJtTgJdziNj05UebJ1Jk9Cw1C2X7FYP27xfh3WRkKyT5uhNm4cQ/l3rEPNb8e2FDU2RYySLdPkkKaWc8i7hsdHI9mGk/jTRBd5+d+qO+FAdEQ+BTEqrEtDTGUZ7JLgVqgxXmEOTHYyzbUCsKWDNRVRJJ4BK+hbGG0yjTI3eZvRiAHMaoU0VeCGPELbLyN327cakd3klWuJynoWW1GvDvW7mAlkYjT6ZLlaWiipK9ZeZcpl2pmiHjVaj7YqjpkRsH+qcR7kVSuHAi4qh5weIEiOshikdWkI1Fe4J147IVDjyyZXtCb5YiTAETpnLLws1GGNfixE1ontybas/DyxJlU3iBGFptpYV8prMLGHpQSiXLwwHvsP3hiybTujgnSUHwff7oiTpudouWgjAQYuequ7/X86223MkyuuwDo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b29dbeb-728a-4a16-5573-08d6f130acf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 01:27:48.6852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loHml7JhYMZ4l3/0HfiPLvYD6Sq8vqjDtxXKr2TzxJM=;
 b=jIcHHUrjfOntVcYlR/q3sBQjKy8VFLUAUbC0hjeOz9w2rCBkFAe2vH94COO8KmooRHtXK04QOe7LP7EspS1KDGBV9Fwgqiz6+k+yVZ8hWxTHYv/XbQtPZ76+Ms1QM4PCxTqLp7DEYLpg0cB1uz/G4wz4wVtuFqtat1rdHMgAh0g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA0OWI3ZjM4NjM0M2I0ZGE5ZDliMTRkOTcwNjFjMzRmZGQzZGQy
NjI4Lg0KVGhpcyBmaXggaXMgbm90IHByb3Blci4gYWxsb2NhdGVfbXFkIGNhbid0IGJlIG1vdmVk
IGJlZm9yZQ0KYWxsb2NhdGVfc2RtYV9xdWV1ZSBhcyBpdCBkZXBlbmRzIG9uIHEtPnByb3BlcnRp
ZXMtPnNkbWFfaWQNCnNldCBpbiBsYXRlci4NCg0KQ2hhbmdlLUlkOiBJYTk5ZWM2MjhlOWRmNWFi
ZGY0YzRjNzMwZTU3ZDQwY2FiMGI2YTRhZA0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5a
ZW5nQGFtZC5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jICAgfCAyMSArKysrKysrKysrKy0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCBk
NTY2YzI2Li5jN2FiMjAzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMjc0LDEyICsyNzQsNiBAQCBzdGF0
aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtLA0KIA0KIAlwcmludF9xdWV1ZShxKTsNCiANCi0JbXFkX21nciA9IGRxbS0+bXFkX21ncnNb
Z2V0X21xZF90eXBlX2Zyb21fcXVldWVfdHlwZSgNCi0JCQlxLT5wcm9wZXJ0aWVzLnR5cGUpXTsN
Ci0JcS0+bXFkX21lbV9vYmogPSBtcWRfbWdyLT5hbGxvY2F0ZV9tcWQobXFkX21nci0+ZGV2LCAm
cS0+cHJvcGVydGllcyk7DQotCWlmICghcS0+bXFkX21lbV9vYmopDQotCQlyZXR1cm4gLUVOT01F
TTsNCi0NCiAJZHFtX2xvY2soZHFtKTsNCiANCiAJaWYgKGRxbS0+dG90YWxfcXVldWVfY291bnQg
Pj0gbWF4X251bV9vZl9xdWV1ZXNfcGVyX2RldmljZSkgew0KQEAgLTMwNSw2ICsyOTksOCBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdl
ciAqZHFtLA0KIAlxLT5wcm9wZXJ0aWVzLnRiYV9hZGRyID0gcXBkLT50YmFfYWRkcjsNCiAJcS0+
cHJvcGVydGllcy50bWFfYWRkciA9IHFwZC0+dG1hX2FkZHI7DQogDQorCW1xZF9tZ3IgPSBkcW0t
Pm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQorCQkJcS0+cHJvcGVydGll
cy50eXBlKV07DQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfQ09N
UFVURSkgew0KIAkJcmV0dmFsID0gYWxsb2NhdGVfaHFkKGRxbSwgcSk7DQogCQlpZiAocmV0dmFs
KQ0KQEAgLTMyMyw2ICszMTksMTEgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfbm9jcHNjaChz
dHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJaWYgKHJldHZhbCkNCiAJCWdvdG8g
b3V0X2RlYWxsb2NhdGVfaHFkOw0KIA0KKwlxLT5tcWRfbWVtX29iaiA9IG1xZF9tZ3ItPmFsbG9j
YXRlX21xZChtcWRfbWdyLT5kZXYsICZxLT5wcm9wZXJ0aWVzKTsNCisJaWYgKCFxLT5tcWRfbWVt
X29iaikgew0KKwkJcmV0dmFsID0gLUVOT01FTTsNCisJCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9v
cmJlbGw7DQorCX0NCiAJbXFkX21nci0+aW5pdF9tcWQobXFkX21nciwgJnEtPm1xZCwgcS0+bXFk
X21lbV9vYmosDQogCQkJCSZxLT5nYXJ0X21xZF9hZGRyLCAmcS0+cHJvcGVydGllcyk7DQogCWlm
IChxLT5wcm9wZXJ0aWVzLmlzX2FjdGl2ZSkgew0KQEAgLTMzNCw3ICszMzUsNyBAQCBzdGF0aWMg
aW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KIAkJCXJldHZhbCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+cGlw
ZSwNCiAJCQkJCXEtPnF1ZXVlLCAmcS0+cHJvcGVydGllcywgY3VycmVudC0+bW0pOw0KIAkJaWYg
KHJldHZhbCkNCi0JCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOw0KKwkJCWdvdG8gb3V0
X2ZyZWVfbXFkOw0KIAl9DQogDQogCWxpc3RfYWRkKCZxLT5saXN0LCAmcXBkLT5xdWV1ZXNfbGlz
dCk7DQpAQCAtMzU0LDkgKzM1NSwxMCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2No
KHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAlkcW0tPnRvdGFsX3F1ZXVlX2Nv
dW50Kys7DQogCXByX2RlYnVnKCJUb3RhbCBvZiAlZCBxdWV1ZXMgYXJlIGFjY291bnRhYmxlIHNv
IGZhclxuIiwNCiAJCQlkcW0tPnRvdGFsX3F1ZXVlX2NvdW50KTsNCi0JZHFtX3VubG9jayhkcW0p
Ow0KLQlyZXR1cm4gcmV0dmFsOw0KKwlnb3RvIG91dF91bmxvY2s7DQogDQorb3V0X2ZyZWVfbXFk
Og0KKwltcWRfbWdyLT5mcmVlX21xZChtcWRfbWdyLCBxLT5tcWQsIHEtPm1xZF9tZW1fb2JqKTsN
CiBvdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDoNCiAJZGVhbGxvY2F0ZV9kb29yYmVsbChxcGQsIHEp
Ow0KIG91dF9kZWFsbG9jYXRlX2hxZDoNCkBAIC0zNzAsNyArMzcyLDYgQEAgc3RhdGljIGludCBj
cmVhdGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJ
CWRlYWxsb2NhdGVfdm1pZChkcW0sIHFwZCwgcSk7DQogb3V0X3VubG9jazoNCiAJZHFtX3VubG9j
ayhkcW0pOw0KLQltcWRfbWdyLT5mcmVlX21xZChtcWRfbWdyLCBxLT5tcWQsIHEtPm1xZF9tZW1f
b2JqKTsNCiAJcmV0dXJuIHJldHZhbDsNCiB9DQogDQotLSANCjIuNy40DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
