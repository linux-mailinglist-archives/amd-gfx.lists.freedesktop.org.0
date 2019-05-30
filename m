Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C472EA8C
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 04:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FB66E12E;
	Thu, 30 May 2019 02:16:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790048.outbound.protection.outlook.com [40.107.79.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EA96E12E
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 02:16:57 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1324.namprd12.prod.outlook.com (10.168.238.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 30 May 2019 02:16:55 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::cd69:cef4:aa74:6d81]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::cd69:cef4:aa74:6d81%4]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 02:16:54 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Topic: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Index: AQHVFehEiPDzugQFhEK8qf4kpbR9SKaC74Pw
Date: Thu, 30 May 2019 02:16:54 +0000
Message-ID: <DM5PR12MB141896F6591868AA46E2D16FFC180@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
 <1559111516-21940-4-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559111516-21940-4-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49bb25d5-c3c8-4e76-d758-08d6e4a4e2b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1324; 
x-ms-traffictypediagnostic: DM5PR12MB1324:
x-microsoft-antispam-prvs: <DM5PR12MB13245715A94CAF4348663AB0FC180@DM5PR12MB1324.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(376002)(39860400002)(366004)(189003)(13464003)(199004)(186003)(76116006)(316002)(72206003)(66066001)(53936002)(81166006)(74316002)(26005)(256004)(8676002)(14444005)(14454004)(6636002)(9686003)(68736007)(7736002)(25786009)(81156014)(8936002)(6246003)(305945005)(229853002)(33656002)(478600001)(6436002)(5660300002)(2906002)(55016002)(76176011)(2501003)(3846002)(6116002)(73956011)(99286004)(86362001)(110136005)(7696005)(71200400001)(6506007)(53546011)(66446008)(476003)(66946007)(102836004)(66476007)(52536014)(71190400001)(11346002)(64756008)(446003)(66556008)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1324;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pSE5ttKPGfhwFpn9X5JvyTEJNQvQ+GH7v/A7E4SzOplfEjpr1K9jrlmAmrWmR0zmHn0Ra9FHl1MjP7l3A6xb8uOh1Bc710L+ouX/pxRcxlCvxH70cvBIvLnaqutCXCmNqoc68tRiNcjNswIV3Q4WOlKKrgY3f/dQ9lG168/ufe2A6WrmD+z9uHfdcdPGhaZH89ZrJ1BsB8ZhyP6jUHBw0Ev07neFBzLeLVsZs9X6oW+wa85jrXm1Mhj2Lahc54oPQKa7dhPpf9HaipPbFkFpylmVEJokIzTcYIHvf8GZneY5aj6rcunENpjtCm2oPom9eBUsdXzEjsVRKR2YK0IJITpxjkeL+0NMf+hqJ17ej1pfzmqKE6hsY/z4wCdBeqCAPuBujmythssfGzhXvTS1HyXl/SzyHP2Wl5yrmKwM5bw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bb25d5-c3c8-4e76-d758-08d6e4a4e2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 02:16:54.6885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66MpCsY+cmMEecw4lK5sfPPiH1UhoujYW31LSGkZJcE=;
 b=z1beoQD/xWxnO+K42C3duKOILx2egOZxJP5Esku9r0ZJICQyvbcyNM5Ei4ajKQyZ5Nvf26jk6jMLa4K+/M/qlu8UlbqBr0M4py///mRCVDuTlPPNVASXVBPnww51WQFY5aZwS2TiRb/EfeOuxv3yzrumGZPyK1+kXrS3ANpJNfA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQoNClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDXmnIgy
OeaXpSAxNDozMg0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCkNjOiBY
aWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAzLzNdIGRybS9h
bWRrZmQ6IHJlbW92ZSBkdXBsaWNhdGVkIFBDSUUgYXRvbWljcyByZXF1ZXN0DQoNClNpbmNlIGFt
ZGdwdSBoYXMgYWx3YXlzIHJlcXVlc3RlZCBQQ0lFIGF0b21pY3MsIGtmZCBkb24ndCBuZWVkIGR1
cGxpY2F0ZWQgUENJRSBhdG9taWNzIGVuYWJsZW1lbnQuIFJlZmVycmluZyB0byBhbWRncHUgcmVx
dWVzdCByZXN1bHQgaXMgZW5vdWdoLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2su
WGlhb0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jIHwgIDcgKysrKysrKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5oIHwgIDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAg
ICB8IDEwICsrKystLS0tLS0NCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
LmMNCmluZGV4IDk4MzI2ZTNiLi5kZGQ2YzUyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkLmMNCkBAIC02MjAsNiArNjIwLDEzIEBAIGJvb2wgYW1kZ3B1X2Ft
ZGtmZF9pc19rZmRfdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHZtaWQpDQog
CXJldHVybiBmYWxzZTsNCiB9DQogDQorYm9vbCBhbWRncHVfYW1ka2ZkX2hhdmVfYXRvbWljc19z
dXBwb3J0KHN0cnVjdCBrZ2RfZGV2ICprZ2QpIHsNCisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilrZ2Q7DQorDQorCXJldHVybiBhZGV2LT5oYXZl
X2F0b21pY3Nfc3VwcG9ydDsNCit9DQorDQogI2lmbmRlZiBDT05GSUdfSFNBX0FNRA0KIGJvb2wg
YW1ka2ZkX2ZlbmNlX2NoZWNrX21tKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tKSAgeyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQpp
bmRleCBmNTdmMjk3Li44ZDEzNWM4MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZC5oDQpAQCAtMTM1LDYgKzEzNSw3IEBAIGludCBhbWRncHVfYW1ka2ZkX3N1
Ym1pdF9pYihzdHJ1Y3Qga2dkX2RldiAqa2dkLCBlbnVtIGtnZF9lbmdpbmVfdHlwZSBlbmdpbmUs
DQogCQkJCXVpbnQzMl90IHZtaWQsIHVpbnQ2NF90IGdwdV9hZGRyLA0KIAkJCQl1aW50MzJfdCAq
aWJfY21kLCB1aW50MzJfdCBpYl9sZW4pOyAgdm9pZCBhbWRncHVfYW1ka2ZkX3NldF9jb21wdXRl
X2lkbGUoc3RydWN0IGtnZF9kZXYgKmtnZCwgYm9vbCBpZGxlKTsNCitib29sIGFtZGdwdV9hbWRr
ZmRfaGF2ZV9hdG9taWNzX3N1cHBvcnQoc3RydWN0IGtnZF9kZXYgKmtnZCk7DQogDQogc3RydWN0
IGtmZDJrZ2RfY2FsbHMgKmFtZGdwdV9hbWRrZmRfZ2Z4XzdfZ2V0X2Z1bmN0aW9ucyh2b2lkKTsN
CiBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyAqYW1kZ3B1X2FtZGtmZF9nZnhfOF8wX2dldF9mdW5jdGlv
bnModm9pZCk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQppbmRleCA3
YjRlYTI0Li43NmExNTk5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
LmMNCkBAIC00ODEsMTcgKzQ4MSwxNSBAQCBzdHJ1Y3Qga2ZkX2RldiAqa2dkMmtmZF9wcm9iZShz
dHJ1Y3Qga2dkX2RldiAqa2dkLA0KIAkgKiAzMiBhbmQgNjQtYml0IHJlcXVlc3RzIGFyZSBwb3Nz
aWJsZSBhbmQgbXVzdCBiZQ0KIAkgKiBzdXBwb3J0ZWQuDQogCSAqLw0KLQlyZXQgPSBwY2lfZW5h
YmxlX2F0b21pY19vcHNfdG9fcm9vdChwZGV2LA0KLQkJCVBDSV9FWFBfREVWQ0FQMl9BVE9NSUNf
Q09NUDMyIHwNCi0JCQlQQ0lfRVhQX0RFVkNBUDJfQVRPTUlDX0NPTVA2NCk7DQotCWlmIChkZXZp
Y2VfaW5mby0+bmVlZHNfcGNpX2F0b21pY3MgJiYgcmV0IDwgMCkgew0KKwlrZmQtPnBjaV9hdG9t
aWNfcmVxdWVzdGVkID0gYW1kZ3B1X2FtZGtmZF9oYXZlX2F0b21pY3Nfc3VwcG9ydChrZ2QpOw0K
KwlpZiAoZGV2aWNlX2luZm8tPm5lZWRzX3BjaV9hdG9taWNzICYmDQorCSAgICAha2ZkLT5wY2lf
YXRvbWljX3JlcXVlc3RlZCkgew0KIAkJZGV2X2luZm8oa2ZkX2RldmljZSwNCiAJCQkgInNraXBw
ZWQgZGV2aWNlICV4OiV4LCBQQ0kgcmVqZWN0cyBhdG9taWNzXG4iLA0KIAkJCSBwZGV2LT52ZW5k
b3IsIHBkZXYtPmRldmljZSk7DQogCQlrZnJlZShrZmQpOw0KIAkJcmV0dXJuIE5VTEw7DQotCX0g
ZWxzZSBpZiAoIXJldCkNCi0JCWtmZC0+cGNpX2F0b21pY19yZXF1ZXN0ZWQgPSB0cnVlOw0KKwl9
DQogDQogCWtmZC0+a2dkID0ga2dkOw0KIAlrZmQtPmRldmljZV9pbmZvID0gZGV2aWNlX2luZm87
DQotLQ0KMS45LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
