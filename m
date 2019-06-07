Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78939249
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 18:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E027E8982E;
	Fri,  7 Jun 2019 16:38:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730071.outbound.protection.outlook.com [40.107.73.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A2989E08
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 16:38:04 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0263.namprd12.prod.outlook.com (10.172.76.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 16:38:02 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1943.018; Fri, 7 Jun 2019
 16:38:02 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9A==
Date: Fri, 7 Jun 2019 16:38:02 +0000
Message-ID: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87221bb9-f42b-43e8-6cfe-08d6eb6681fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0263; 
x-ms-traffictypediagnostic: CY4PR1201MB0263:
x-microsoft-antispam-prvs: <CY4PR1201MB026371CA3CAF24E2E2332654E4100@CY4PR1201MB0263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:220;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(366004)(136003)(376002)(189003)(199004)(6506007)(73956011)(26005)(66446008)(66556008)(14454004)(66946007)(316002)(36756003)(476003)(25786009)(2351001)(64756008)(2501003)(2616005)(71200400001)(66066001)(305945005)(486006)(186003)(2906002)(6436002)(5640700003)(6486002)(7736002)(6916009)(102836004)(5660300002)(66476007)(54906003)(53936002)(71190400001)(86362001)(72206003)(256004)(14444005)(478600001)(68736007)(8676002)(99286004)(52116002)(8936002)(6116002)(81156014)(386003)(50226002)(4326008)(6512007)(3846002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0263;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0YMA1adGpc1s/2ipZ/KpqT+l79XhAKFXTR6firHqht1FzaO5bhWVbJoka+TOQglGpQTKw9E2rqtiDEwfRbhuxYUtCxdRMaKhfeFrilwU/kwnGosLjfkMxC5p7WxdfEAP2vJR3Ckom0jGlw8qVanMEVSAKJkMQ9MFD4/iTF7eeL2sIM9YjTGkjxi73XRUP5LcH1mip7Syv7xXaOI5izsTmuHaL737Gx9EGNHpq4PHrEDtPJimguBF+30em+wWCsnFRvcptGeHKa/R8G5U70PEX/tfvKbf2nLvYlNK6Nv9Q0IQDPDNDGnRFqmSMy0nzKv+shapszrqLOiHqR4IEKI2v6aNmUmsu8ypfhxSpp4GERWfsBJR6nVeemqWFDGyjhGWtbmJ7YF2L99e1WbRfLSEJzLNZovR79JTfhTd2Zs5uRc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87221bb9-f42b-43e8-6cfe-08d6eb6681fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 16:38:02.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=880qNIynB7Mx3YdWm8VOajXuZPCcahx/EXPNEjfMeX0=;
 b=q8diMQkfPfqf4RQ1iI6MuBiR0K4Tfh4oiIjTgUz7u7P92Z3/p0F1oKR2/lMGcUHO7B1KIQ5F2D9xet+hkxdqWgfa46/8z0YqvMRi7pjHVsxrrZwMAbMtV1R7Y2gSlDBz8MRlJ3z9XtUgppuHSfLxND+tAsLXUrKPV0JTOlbQKYU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Shamis, Leonid" <Leonid.Shamis@amd.com>, "Gabra,
 Maroun" <Maroun.Gabra@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgSGFyZHdhcmUgYnVnLCBHRFMgZXhpc3QgRUNDIGVycm9yIGFmdGVyIGNvbGQgYm9vdCB1
cCwNCmFkZGluZyBHRFMgY2xlYXJpbmcgd29ya2Fyb3VuZCBpbiBsYXRlciBpbml0IGZvciBnZng5
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDQ4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCA3NjcyMmZjLi44MWY2
YmE4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KQEAgLTM2MzQsNiAr
MzYzNCw1MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19lbnRyeSBzZWNfZGVkX2Nv
dW50ZXJfcmVnaXN0ZXJzW10gPSB7DQogICAgeyBTT0MxNV9SRUdfRU5UUlkoR0MsIDAsIG1tU1FD
X0VEQ19DTlQzKSwgMCwgNCwgNn0sDQogfTsNCiANCisNCitzdGF0aWMgaW50IGdmeF92OV8wX2Rv
X2VkY19nZHNfd29ya2Fyb3VuZHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQorew0KKwlz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1swXTsNCisJ
aW50IHI7DQorDQorCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAxNyk7DQorCWlmIChyKSB7
DQorCQlEUk1fRVJST1IoImFtZGdwdTogR0RTIHdvcmthcm91bmRzIGZhaWxlZCB0byBsb2NrIHJp
bmcgJXMgKCVkKS5cbiIsDQorCQkJcmluZy0+bmFtZSwgcik7DQorCQlyZXR1cm4gcjsNCisJfQ0K
Kw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfV1JJVEVfREFUQSwg
MykpOw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBXUklURV9EQVRBX0VOR0lORV9TRUwoMCkg
fA0KKwkJCSAgIFdSSVRFX0RBVEFfRFNUX1NFTCgwKSk7DQorCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUpKTsNCisJYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgMCk7DQorCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4MTAwMDAp
Ow0KKw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEs
IDUpKTsNCisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgKFBBQ0tFVDNfRE1BX0RBVEFfQ1BfU1lO
QyB8DQorCQkJCVBBQ0tFVDNfRE1BX0RBVEFfRFNUX1NFTCgxKSB8DQorCQkJCVBBQ0tFVDNfRE1B
X0RBVEFfU1JDX1NFTCgyKSB8DQorCQkJCVBBQ0tFVDNfRE1BX0RBVEFfRU5HSU5FKDApKSk7DQor
CWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCAw
KTsNCisJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQorCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIDApOw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9EQVRBX0NNRF9S
QVdfV0FJVCB8IDB4MTAwMDApOw0KKw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQz
KFBBQ0tFVDNfV1JJVEVfREFUQSwgMykpOw0KKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBXUklU
RV9EQVRBX0VOR0lORV9TRUwoMCkgfA0KKwkJCQlXUklURV9EQVRBX0RTVF9TRUwoMCkpOw0KKwlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdEU19WTUlE
MF9TSVpFKSk7DQorCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KKwlhbWRncHVfcmluZ193
cml0ZShyaW5nLCAweDApOw0KKw0KKwlhbWRncHVfcmluZ19jb21taXQocmluZyk7DQorDQorCXJl
dHVybiAwOw0KK30NCisNCisNCiBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fy
b3VuZHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogew0KIAlzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcgPSAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1swXTsNCkBAIC0zODEwLDYgKzM4NTQs
MTAgQEAgc3RhdGljIGludCBnZnhfdjlfMF9lY2NfbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkNCiAJ
CXJldHVybiAwOw0KIAl9DQogDQorCXIgPSBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRz
KGFkZXYpOw0KKwlpZiAocikNCisJCXJldHVybiByOw0KKw0KIAkvKiByZXF1aXJlcyBJQnMgc28g
ZG8gaW4gbGF0ZSBpbml0IGFmdGVyIElCIHBvb2wgaXMgaW5pdGlhbGl6ZWQgKi8NCiAJciA9IGdm
eF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMoYWRldik7DQogCWlmIChyKQ0KLS0gDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
