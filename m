Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DC3386F
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 20:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF16589337;
	Mon,  3 Jun 2019 18:44:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB00789337
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 18:44:01 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2488.namprd12.prod.outlook.com (10.172.86.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 18:44:00 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 18:44:00 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: use new HMM APIs and helpers v3
Thread-Topic: [PATCH] drm/amdgpu: use new HMM APIs and helpers v3
Thread-Index: AQHVGjxP4dSQN2+Mu0q1RtOh9a9v0Q==
Date: Mon, 3 Jun 2019 18:44:00 +0000
Message-ID: <20190603184344.8352-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 517263c1-c806-4f1a-6d52-08d6e8537147
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2488; 
x-ms-traffictypediagnostic: DM5PR1201MB2488:
x-microsoft-antispam-prvs: <DM5PR1201MB2488176EE2129734D07B6F29E6140@DM5PR1201MB2488.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(366004)(39860400002)(376002)(136003)(189003)(199004)(68736007)(6916009)(26005)(53936002)(186003)(316002)(52116002)(99286004)(6512007)(102836004)(6506007)(71200400001)(71190400001)(66066001)(1076003)(86362001)(2906002)(6116002)(3846002)(386003)(305945005)(8676002)(4326008)(36756003)(25786009)(81156014)(2351001)(81166006)(50226002)(8936002)(5660300002)(256004)(66476007)(64756008)(66446008)(66946007)(2616005)(14454004)(72206003)(6486002)(5640700003)(478600001)(486006)(6436002)(2501003)(476003)(73956011)(7736002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2488;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u8/66s9+jQcP7HWI5Q6Gu9gsytPlczZzNyUfllHZgtvjt5Kn5BnjIauYb1zQi4ZHuCTDLdX+egKbMjGqadTbeiNeR4r3wkqyLK4XEKAR0TPGkUmxzu2YL7qrJfhefoJZUbF+XUADJ11xmz3a+Ot6mztvll77AEEExoYCKC++1C5ATgC8KxVfag3SMDdcL7znsUhrgbP5PPhur5iZGuBK1hMjNVpmzmD1N1+qilJMyHz40vNAo26zYINWYakxLnFmLMBhyfFRUFlp6HLJkP5jGZKRuRePHMEgmcVFte4AauyFne3raQ0CA9EqI0V28s93EJiKopfLmK3NYk0qMEhPIE6pa7pRG2LMfotx95VSM6FPgFi5qm39Zn+1QavxBMIs/eD3t8c0VNKW75Pb9LE2zHAPYgtB2+lAtFFbKX36CaQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517263c1-c806-4f1a-6d52-08d6e8537147
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 18:44:00.3722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2488
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnRQUh0vBbrOxJBmGyOqa6CSSUNmIFwDz5/+CFje9Sc=;
 b=IasZSMFmP03AbepfGgzGH2xNrzgkFBmRvTrkBUPVQ8Bn9qYe8G71OcQzU/N72RsHRhwzPjfaqOIgzMChw/OgOGlf3TwUOTVInHMZbnEzk+LsDENh6AyhjP+ihk4z7t/turO6ZpHrE/LuOySffykon9WwSLuu192p5JaOgs6SBCo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SE1NIHByb3ZpZGVzIG5ldyBBUElzIGFuZCBoZWxwcyBpbiBrZXJuZWwgNS4yLXJjMSB0byBzaW1w
bGlmeSBkcml2ZXINCnBhdGguIFRoZSBvbGQgaG1tIEFQSXMgYXJlIGRlcHJlY2F0ZWQgYW5kIHdp
bGwgYmUgcmVtb3ZlZCBpbiBmdXR1cmUuDQoNCkJlbG93IGFyZSBjaGFuZ2VzIGluIGRyaXZlcjoN
Cg0KMS4gQ2hhbmdlIGhtbV92bWFfZmF1bHQgdG8gaG1tX3JhbmdlX3JlZ2lzdGVyIGFuZCBobW1f
cmFuZ2VfZmF1bHQgd2hpY2gNCnN1cHBvcnRzIHJhbmdlIHdpdGggbXVsdGlwbGUgdm1hcywgcmVt
b3ZlIHRoZSBtdWx0aXBsZSB2bWFzIGhhbmRsZSBwYXRoDQphbmQgZGF0YSBzdHJ1Y3R1cmUuDQoy
LiBDaGFuZ2UgaG1tX3ZtYV9yYW5nZV9kb25lIHRvIGhtbV9yYW5nZV91bnJlZ2lzdGVyLg0KMy4g
VXNlIGRlZmF1bHQgZmxhZ3MgdG8gYXZvaWQgcHJlLWZpbGwgcGZuIGFycmF5cy4NCjQuIFVzZSBu
ZXcgaG1tX2RldmljZV8gaGVscGVycy4NCg0KdjI6IHJldHJ5IGlmIGhtbV9yYW5nZV9mYXVsdCBy
ZXR1cm5zIC1FQUdBSU4NCnYzOiBkZWZpbmUgTUFYX1JFVFJZX0hNTV9SQU5HRV9GQVVMVCwgc2tp
cCBkcm9wIG1tYXBfc2VtIGlmIHJldHJ5DQoNCkNoYW5nZS1JZDogSTFhMDBmODg0NTlmM2I5NmM5
NTM2OTMzZTlhMTdlYjFlYmFhNzgxMTMNClNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGls
aXAuWWFuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X21uLmMgIHwgICAxIC0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
fCAxNDkgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNl
cnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X21uLmMNCmluZGV4IDQxY2NlZTQ5YTIyNC4uZTBiYjQ3Y2U1NzBiIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQpAQCAtNTE5LDcgKzUxOSw2IEBAIHZvaWQgYW1k
Z3B1X2htbV9pbml0X3JhbmdlKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQ0KIAkJcmFuZ2UtPmZs
YWdzID0gaG1tX3JhbmdlX2ZsYWdzOw0KIAkJcmFuZ2UtPnZhbHVlcyA9IGhtbV9yYW5nZV92YWx1
ZXM7DQogCQlyYW5nZS0+cGZuX3NoaWZ0ID0gUEFHRV9TSElGVDsNCi0JCXJhbmdlLT5wZm5zID0g
TlVMTDsNCiAJCUlOSVRfTElTVF9IRUFEKCZyYW5nZS0+bGlzdCk7DQogCX0NCiB9DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQppbmRleCBlYjRiODUwNjFjN2UuLjlkZTZh
MmY1ZTU3MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQpAQCAt
NzExLDggKzcxMSw3IEBAIHN0cnVjdCBhbWRncHVfdHRtX3R0IHsNCiAJc3RydWN0IHRhc2tfc3Ry
dWN0CSp1c2VydGFzazsNCiAJdWludDMyX3QJCXVzZXJmbGFnczsNCiAjaWYgSVNfRU5BQkxFRChD
T05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQ0KLQlzdHJ1Y3QgaG1tX3JhbmdlCSpyYW5nZXM7DQot
CWludAkJCW5yX3JhbmdlczsNCisJc3RydWN0IGhtbV9yYW5nZQkqcmFuZ2U7DQogI2VuZGlmDQog
fTsNCiANCkBAIC03MjUsNTcgKzcyNCwzNiBAQCBzdHJ1Y3QgYW1kZ3B1X3R0bV90dCB7DQogICov
DQogI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikNCiANCi0vKiBTdXBw
b3J0IFVzZXJwdHIgcGFnZXMgY3Jvc3MgbWF4IDE2IHZtYXMgKi8NCi0jZGVmaW5lIE1BWF9OUl9W
TUFTCSgxNikNCisjZGVmaW5lIE1BWF9SRVRSWV9ITU1fUkFOR0VfRkFVTFQJMTYNCiANCiBpbnQg
YW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBw
YWdlICoqcGFnZXMpDQogew0KIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQgKil0
dG07DQogCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gZ3R0LT51c2VydGFzay0+bW07DQogCXVuc2ln
bmVkIGxvbmcgc3RhcnQgPSBndHQtPnVzZXJwdHI7DQotCXVuc2lnbmVkIGxvbmcgZW5kID0gc3Rh
cnQgKyB0dG0tPm51bV9wYWdlcyAqIFBBR0VfU0laRTsNCi0Jc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEgPSBOVUxMLCAqdm1hc1tNQVhfTlJfVk1BU107DQotCXN0cnVjdCBobW1fcmFuZ2UgKnJh
bmdlczsNCi0JdW5zaWduZWQgbG9uZyBucl9wYWdlcywgaTsNCi0JdWludDY0X3QgKnBmbnMsIGY7
DQorCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0KKwlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZTsNCisJdW5zaWduZWQgbG9uZyBpOw0KKwl1aW50NjRfdCAqcGZuczsNCisJaW50IHJldHJ5ID0g
MDsNCiAJaW50IHIgPSAwOw0KIA0KIAlpZiAoIW1tKSAvKiBIYXBwZW5zIGR1cmluZyBwcm9jZXNz
IHNodXRkb3duICovDQogCQlyZXR1cm4gLUVTUkNIOw0KIA0KLQlkb3duX3JlYWQoJm1tLT5tbWFw
X3NlbSk7DQotDQotCS8qIHVzZXIgcGFnZXMgbWF5IGNyb3NzIG11bHRpcGxlIFZNQXMgKi8NCi0J
Z3R0LT5ucl9yYW5nZXMgPSAwOw0KLQlkbyB7DQotCQl1bnNpZ25lZCBsb25nIHZtX3N0YXJ0Ow0K
LQ0KLQkJaWYgKGd0dC0+bnJfcmFuZ2VzID49IE1BWF9OUl9WTUFTKSB7DQotCQkJRFJNX0VSUk9S
KCJUb28gbWFueSBWTUFzIGluIHVzZXJwdHIgcmFuZ2VcbiIpOw0KLQkJCXIgPSAtRUZBVUxUOw0K
LQkJCWdvdG8gb3V0Ow0KLQkJfQ0KLQ0KLQkJdm1fc3RhcnQgPSB2bWEgPyB2bWEtPnZtX2VuZCA6
IHN0YXJ0Ow0KLQkJdm1hID0gZmluZF92bWEobW0sIHZtX3N0YXJ0KTsNCi0JCWlmICh1bmxpa2Vs
eSghdm1hIHx8IHZtX3N0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsNCi0JCQlyID0gLUVGQVVMVDsN
Ci0JCQlnb3RvIG91dDsNCi0JCX0NCi0JCXZtYXNbZ3R0LT5ucl9yYW5nZXMrK10gPSB2bWE7DQot
CX0gd2hpbGUgKGVuZCA+IHZtYS0+dm1fZW5kKTsNCi0NCi0JRFJNX0RFQlVHX0RSSVZFUigiMHgl
bHggbnJfcmFuZ2VzICVkIHBhZ2VzIDB4JWx4XG4iLA0KLQkJc3RhcnQsIGd0dC0+bnJfcmFuZ2Vz
LCB0dG0tPm51bV9wYWdlcyk7DQotDQorCXZtYSA9IGZpbmRfdm1hKG1tLCBzdGFydCk7DQorCWlm
ICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsNCisJCXIgPSAtRUZB
VUxUOw0KKwkJZ290byBvdXQ7DQorCX0NCiAJaWYgKHVubGlrZWx5KChndHQtPnVzZXJmbGFncyAm
IEFNREdQVV9HRU1fVVNFUlBUUl9BTk9OT05MWSkgJiYNCi0JCXZtYXNbMF0tPnZtX2ZpbGUpKSB7
DQorCQl2bWEtPnZtX2ZpbGUpKSB7DQogCQlyID0gLUVQRVJNOw0KIAkJZ290byBvdXQ7DQogCX0N
CiANCi0JcmFuZ2VzID0ga3ZtYWxsb2NfYXJyYXkoZ3R0LT5ucl9yYW5nZXMsIHNpemVvZigqcmFu
Z2VzKSwgR0ZQX0tFUk5FTCk7DQotCWlmICh1bmxpa2VseSghcmFuZ2VzKSkgew0KKwlyYW5nZSA9
IGt6YWxsb2Moc2l6ZW9mKCpyYW5nZSksIEdGUF9LRVJORUwpOw0KKwlpZiAodW5saWtlbHkoIXJh
bmdlKSkgew0KIAkJciA9IC1FTk9NRU07DQogCQlnb3RvIG91dDsNCiAJfQ0KQEAgLTc4Niw2MSAr
NzY0LDYyIEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCB0dG1fdHQg
KnR0bSwgc3RydWN0IHBhZ2UgKipwYWdlcykNCiAJCWdvdG8gb3V0X2ZyZWVfcmFuZ2VzOw0KIAl9
DQogDQotCWZvciAoaSA9IDA7IGkgPCBndHQtPm5yX3JhbmdlczsgaSsrKQ0KLQkJYW1kZ3B1X2ht
bV9pbml0X3JhbmdlKCZyYW5nZXNbaV0pOw0KKwlhbWRncHVfaG1tX2luaXRfcmFuZ2UocmFuZ2Up
Ow0KKwlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IHJhbmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsN
CisJcmFuZ2UtPmRlZmF1bHRfZmxhZ3MgfD0gYW1kZ3B1X3R0bV90dF9pc19yZWFkb25seSh0dG0p
ID8NCisJCQkJMCA6IHJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXTsNCisJcmFuZ2UtPnBmbl9m
bGFnc19tYXNrID0gMDsNCisJcmFuZ2UtPnBmbnMgPSBwZm5zOw0KKwlobW1fcmFuZ2VfcmVnaXN0
ZXIocmFuZ2UsIG1tLCBzdGFydCwNCisJCQkgICBzdGFydCArIHR0bS0+bnVtX3BhZ2VzICogUEFH
RV9TSVpFLCBQQUdFX1NISUZUKTsNCiANCi0JZiA9IHJhbmdlc1swXS5mbGFnc1tITU1fUEZOX1ZB
TElEXTsNCi0JZiB8PSBhbWRncHVfdHRtX3R0X2lzX3JlYWRvbmx5KHR0bSkgPw0KLQkJCQkwIDog
cmFuZ2VzWzBdLmZsYWdzW0hNTV9QRk5fV1JJVEVdOw0KLQltZW1zZXQ2NChwZm5zLCBmLCB0dG0t
Pm51bV9wYWdlcyk7DQorcmV0cnk6DQorCS8qDQorCSAqIEp1c3Qgd2FpdCBmb3IgcmFuZ2UgdG8g
YmUgdmFsaWQsIHNhZmUgdG8gaWdub3JlIHJldHVybiB2YWx1ZSBhcyB3ZQ0KKwkgKiB3aWxsIHVz
ZSB0aGUgcmV0dXJuIHZhbHVlIG9mIGhtbV9yYW5nZV9mYXVsdCgpIGJlbG93IHVuZGVyIHRoZQ0K
KwkgKiBtbWFwX3NlbSB0byBhc2NlcnRhaW4gdGhlIHZhbGlkaXR5IG9mIHRoZSByYW5nZS4NCisJ
ICovDQorCWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVGQVVM
VF9USU1FT1VUKTsNCiANCi0JZm9yIChucl9wYWdlcyA9IDAsIGkgPSAwOyBpIDwgZ3R0LT5ucl9y
YW5nZXM7IGkrKykgew0KLQkJcmFuZ2VzW2ldLnZtYSA9IHZtYXNbaV07DQotCQlyYW5nZXNbaV0u
c3RhcnQgPSBtYXgoc3RhcnQsIHZtYXNbaV0tPnZtX3N0YXJ0KTsNCi0JCXJhbmdlc1tpXS5lbmQg
PSBtaW4oZW5kLCB2bWFzW2ldLT52bV9lbmQpOw0KLQkJcmFuZ2VzW2ldLnBmbnMgPSBwZm5zICsg
bnJfcGFnZXM7DQotCQlucl9wYWdlcyArPSAocmFuZ2VzW2ldLmVuZCAtIHJhbmdlc1tpXS5zdGFy
dCkgLyBQQUdFX1NJWkU7DQorCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsNCiANCi0JCXIgPSBo
bW1fdm1hX2ZhdWx0KCZyYW5nZXNbaV0sIHRydWUpOw0KLQkJaWYgKHVubGlrZWx5KHIpKQ0KLQkJ
CWJyZWFrOw0KLQl9DQotCWlmICh1bmxpa2VseShyKSkgew0KLQkJd2hpbGUgKGktLSkNCi0JCQlo
bW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlc1tpXSk7DQorCXIgPSBobW1fcmFuZ2VfZmF1bHQocmFu
Z2UsIHRydWUpOw0KKwlpZiAodW5saWtlbHkociA8IDApKSB7DQorCQlpZiAobGlrZWx5KHIgPT0g
LUVBR0FJTikpIHsNCisJCQlpZiAocmV0cnkrKyA8IE1BWF9SRVRSWV9ITU1fUkFOR0VfRkFVTFQp
DQorCQkJCWdvdG8gcmV0cnk7DQorCQkJZWxzZQ0KKwkJCQlwcl9lcnIoIlJldHJ5IGhtbSBmYXVs
dCB0b28gbWFueSB0aW1lc1xuIik7DQorCQl9DQogDQogCQlnb3RvIG91dF9mcmVlX3BmbnM7DQog
CX0NCiANCi0JdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsNCi0NCiAJZm9yIChpID0gMDsgaSA8IHR0
bS0+bnVtX3BhZ2VzOyBpKyspIHsNCi0JCXBhZ2VzW2ldID0gaG1tX3Bmbl90b19wYWdlKCZyYW5n
ZXNbMF0sIHBmbnNbaV0pOw0KLQkJaWYgKCFwYWdlc1tpXSkgew0KKwkJcGFnZXNbaV0gPSBobW1f
ZGV2aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHBmbnNbaV0pOw0KKwkJaWYgKHVubGlrZWx5KCFw
YWdlc1tpXSkpIHsNCiAJCQlwcl9lcnIoIlBhZ2UgZmF1bHQgZmFpbGVkIGZvciBwZm5bJWx1XSA9
IDB4JWxseFxuIiwNCiAJCQkgICAgICAgaSwgcGZuc1tpXSk7DQotCQkJZ290byBvdXRfaW52YWxp
ZF9wZm47DQorCQkJciA9IC1FTk9NRU07DQorDQorCQkJZ290byBvdXRfZnJlZV9wZm5zOw0KIAkJ
fQ0KIAl9DQotCWd0dC0+cmFuZ2VzID0gcmFuZ2VzOw0KKw0KKwl1cF9yZWFkKCZtbS0+bW1hcF9z
ZW0pOw0KKw0KKwlndHQtPnJhbmdlID0gcmFuZ2U7DQogDQogCXJldHVybiAwOw0KIA0KIG91dF9m
cmVlX3BmbnM6DQorCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQorCWhtbV9yYW5nZV91bnJlZ2lz
dGVyKHJhbmdlKTsNCiAJa3ZmcmVlKHBmbnMpOw0KIG91dF9mcmVlX3JhbmdlczoNCi0Ja3ZmcmVl
KHJhbmdlcyk7DQorCWtmcmVlKHJhbmdlKTsNCiBvdXQ6DQotCXVwX3JlYWQoJm1tLT5tbWFwX3Nl
bSk7DQotDQogCXJldHVybiByOw0KLQ0KLW91dF9pbnZhbGlkX3BmbjoNCi0JZm9yIChpID0gMDsg
aSA8IGd0dC0+bnJfcmFuZ2VzOyBpKyspDQotCQlobW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlc1tp
XSk7DQotCWt2ZnJlZShwZm5zKTsNCi0Ja3ZmcmVlKHJhbmdlcyk7DQotCXJldHVybiAtRU5PTUVN
Ow0KIH0NCiANCiAvKioNCkBAIC04NTMsMjMgKzgzMiwyMyBAQCBib29sIGFtZGdwdV90dG1fdHRf
Z2V0X3VzZXJfcGFnZXNfZG9uZShzdHJ1Y3QgdHRtX3R0ICp0dG0pDQogew0KIAlzdHJ1Y3QgYW1k
Z3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQgKil0dG07DQogCWJvb2wgciA9IGZhbHNlOw0KLQlpbnQg
aTsNCiANCiAJaWYgKCFndHQgfHwgIWd0dC0+dXNlcnB0cikNCiAJCXJldHVybiBmYWxzZTsNCiAN
Ci0JRFJNX0RFQlVHX0RSSVZFUigidXNlcl9wYWdlc19kb25lIDB4JWxseCBucl9yYW5nZXMgJWQg
cGFnZXMgMHglbHhcbiIsDQotCQlndHQtPnVzZXJwdHIsIGd0dC0+bnJfcmFuZ2VzLCB0dG0tPm51
bV9wYWdlcyk7DQorCURSTV9ERUJVR19EUklWRVIoInVzZXJfcGFnZXNfZG9uZSAweCVsbHggcGFn
ZXMgMHglbHhcbiIsDQorCQlndHQtPnVzZXJwdHIsIHR0bS0+bnVtX3BhZ2VzKTsNCiANCi0JV0FS
Tl9PTkNFKCFndHQtPnJhbmdlcyB8fCAhZ3R0LT5yYW5nZXNbMF0ucGZucywNCisJV0FSTl9PTkNF
KCFndHQtPnJhbmdlIHx8ICFndHQtPnJhbmdlLT5wZm5zLA0KIAkJIk5vIHVzZXIgcGFnZXMgdG8g
Y2hlY2tcbiIpOw0KIA0KLQlpZiAoZ3R0LT5yYW5nZXMpIHsNCi0JCWZvciAoaSA9IDA7IGkgPCBn
dHQtPm5yX3JhbmdlczsgaSsrKQ0KLQkJCXIgfD0gaG1tX3ZtYV9yYW5nZV9kb25lKCZndHQtPnJh
bmdlc1tpXSk7DQotCQlrdmZyZWUoZ3R0LT5yYW5nZXNbMF0ucGZucyk7DQotCQlrdmZyZWUoZ3R0
LT5yYW5nZXMpOw0KLQkJZ3R0LT5yYW5nZXMgPSBOVUxMOw0KKwlpZiAoZ3R0LT5yYW5nZSkgew0K
KwkJciA9IGhtbV9yYW5nZV92YWxpZChndHQtPnJhbmdlKTsNCisJCWhtbV9yYW5nZV91bnJlZ2lz
dGVyKGd0dC0+cmFuZ2UpOw0KKw0KKwkJa3ZmcmVlKGd0dC0+cmFuZ2UtPnBmbnMpOw0KKwkJa2Zy
ZWUoZ3R0LT5yYW5nZSk7DQorCQlndHQtPnJhbmdlID0gTlVMTDsNCiAJfQ0KIA0KIAlyZXR1cm4g
cjsNCkBAIC05NTMsOSArOTMyLDkgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV90dF91bnBpbl91
c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkNCiAJc2dfZnJlZV90YWJsZSh0dG0tPnNnKTsNCiAN
CiAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQ0KLQlpZiAoZ3R0LT5y
YW5nZXMgJiYNCi0JICAgIHR0bS0+cGFnZXNbMF0gPT0gaG1tX3Bmbl90b19wYWdlKCZndHQtPnJh
bmdlc1swXSwNCi0JCQkJCSAgICAgZ3R0LT5yYW5nZXNbMF0ucGZuc1swXSkpDQorCWlmIChndHQt
PnJhbmdlICYmDQorCSAgICB0dG0tPnBhZ2VzWzBdID09IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFn
ZShndHQtPnJhbmdlLA0KKwkJCQkJCSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNbMF0pKQ0KIAkJV0FS
Tl9PTkNFKDEsICJNaXNzaW5nIGdldF91c2VyX3BhZ2VfZG9uZVxuIik7DQogI2VuZGlmDQogfQ0K
LS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
