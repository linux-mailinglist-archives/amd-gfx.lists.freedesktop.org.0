Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863460BE3
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 21:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3B6E52A;
	Fri,  5 Jul 2019 19:50:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE346E52A
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 19:50:28 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4043.namprd12.prod.outlook.com (10.141.185.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 19:50:26 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 19:50:26 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: Prepare for hmm_range_register API change
Thread-Index: AQHVM2rjE73LQcJwTk+mP7aMDFESfg==
Date: Fri, 5 Jul 2019 19:50:26 +0000
Message-ID: <20190705195010.7569-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::40) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee3d5b2-31e3-40cc-e44c-08d70182065b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4043; 
x-ms-traffictypediagnostic: DM6PR12MB4043:
x-microsoft-antispam-prvs: <DM6PR12MB4043073A3E5AC9B434D39CC092F50@DM6PR12MB4043.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:235;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(189003)(199004)(6916009)(68736007)(476003)(486006)(2616005)(50226002)(6506007)(386003)(5640700003)(99286004)(52116002)(66066001)(25786009)(4326008)(2351001)(478600001)(72206003)(1076003)(36756003)(81166006)(2906002)(8936002)(81156014)(8676002)(305945005)(7736002)(6486002)(6512007)(53936002)(54906003)(71200400001)(71190400001)(316002)(6436002)(86362001)(3846002)(5660300002)(186003)(14444005)(66556008)(26005)(6116002)(256004)(14454004)(66946007)(66446008)(2501003)(102836004)(66476007)(64756008)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4043;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8vXm+lS1b9h13aX3MHXcoYbGdfLeK2Q44HOkmLnjjk+djgU9yJoLslwmR4d1QZ+c/YQKBvRa7GAaleozsHNi3pu75xDKrIhpVximbW7RD2c0TR1olh8gnxmh+qlnay8RJ7B5FELrFHeuLH/I5wgMmEo8Qe1AkQwW6OJ8dE/Uf7tAPaQlhj6usuUixl0MX+OlbuE6xBa4Vq+bfI7oPK0RyKGsKzd4YUi0buIbzAB9N9reTCYJKEQRfHQZ2t7CkTx579jey3WuXBMrQBgr3EVP+Ny1EYtscoImz1Ecels17TyQLJbMGI5RYvrebDGkhlFRrPuZSTNT7iv4MM2xMDoberNCT4laQosd9ivP+qIuO2VgmVT5mry0CeTu+nvZNfNCBUo9hiiOKX2IhXPJRSCfFghQMjLkddHL/+g7rJ0pIz0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee3d5b2-31e3-40cc-e44c-08d70182065b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 19:50:26.2774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiqlWpdyI4FmgOTsoSpmTdC/DsAdgXdGOBIdjEE6HzI=;
 b=kAyR8PwsNnLgTBRO56Oq3envxEftowYj8IksOx4RAWoHtFYUz48MM5pT1gKX7sko3yLwBW5506ArxU3Cr/q0UhtITn/vF+P3SayAcI/MaW/qTpF76LopZPEGD/8GbWeehbNcSbIEeHN13tMO1QPNl+6c+a9idNZqJ4JSVeB5vDc=
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+CgpBbiB1cGNvbWluZyBjaGFu
Z2UgaW4gdGhlIGhtbV9yYW5nZV9yZWdpc3RlciBBUEkgcmVxdWlyZXMgcGFzc2luZyBpbgphIHBv
aW50ZXIgdG8gYW4gaG1tX21pcnJvciBpbnN0ZWFkIG9mIG1tX3N0cnVjdC4gVG8gYWNjZXNzIHRo
ZQpobW1fbWlycm9yIHdlIG5lZWQgcGFzcyBibyBpbnN0ZWFkIG9mIHR0bSB0byBhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzCmJlY2F1c2UgbWlycm9yIGlzIHBhcnQgb2YgYW1kZ3B1X21uIHN0
cnVjdHVyZSwgd2hpY2ggaXMgYWNjZXNzaWJsZSBmcm9tIGJvLgoKU2lnbmVkLW9mZi1ieTogUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8ICA1ICstLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzLmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZW0uYyAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfbW4uYyAgICAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgfCAxMCArKysrLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oICAgICAgIHwgIDUgKystCiA3
IGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCA1
OGNlY2ZlNTdmOGIuLmY1ZWNmMjhlYjM3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpAQCAtNTAzLDcgKzUwMyw3IEBAIHN0YXRpYyBp
bnQgaW5pdF91c2VyX3BhZ2VzKHN0cnVjdCBrZ2RfbWVtICptZW0sIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLAogCQlnb3RvIG91dDsKIAl9CiAKLQlyZXQgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzKGJvLT50Ym8udHRtLCBiby0+dGJvLnR0bS0+cGFnZXMpOworCXJldCA9IGFtZGdwdV90dG1f
dHRfZ2V0X3VzZXJfcGFnZXMoYm8sIGJvLT50Ym8udHRtLT5wYWdlcyk7CiAJaWYgKHJldCkgewog
CQlwcl9lcnIoIiVzOiBGYWlsZWQgdG8gZ2V0IHVzZXIgcGFnZXM6ICVkXG4iLCBfX2Z1bmNfXywg
cmV0KTsKIAkJZ290byB1bnJlZ2lzdGVyX291dDsKQEAgLTE3MjgsOCArMTcyOCw3IEBAIHN0YXRp
YyBpbnQgdXBkYXRlX2ludmFsaWRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5m
byAqcHJvY2Vzc19pbmZvLAogCQlibyA9IG1lbS0+Ym87CiAKIAkJLyogR2V0IHVwZGF0ZWQgdXNl
ciBwYWdlcyAqLwotCQlyZXQgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKGJvLT50Ym8u
dHRtLAotCQkJCQkJICAgYm8tPnRiby50dG0tPnBhZ2VzKTsKKwkJcmV0ID0gYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBhZ2VzKTsKIAkJaWYgKHJldCkgewog
CQkJcHJfZGVidWcoIiVzOiBGYWlsZWQgdG8gZ2V0IHVzZXIgcGFnZXM6ICVkXG4iLAogCQkJCV9f
ZnVuY19fLCByZXQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCBj
MjVlMWViYzc2YzMuLmM2OTFkZjZmN2E1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMKQEAgLTYzMSw3ICs2MzEsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJf
Ym9zKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAogCQkJcmV0dXJuIC1FTk9NRU07CiAJCX0K
IAotCQlyID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhiby0+dGJvLnR0bSwgZS0+dXNl
cl9wYWdlcyk7CisJCXIgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKGJvLCBlLT51c2Vy
X3BhZ2VzKTsKIAkJaWYgKHIpIHsKIAkJCWt2ZnJlZShlLT51c2VyX3BhZ2VzKTsKIAkJCWUtPnVz
ZXJfcGFnZXMgPSBOVUxMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCmlu
ZGV4IGVkMjVhNGUxNDQwNC4uMmNlYWQ1YTI0MmQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jCkBAIC0zMjMsOCArMzIzLDcgQEAgaW50IGFtZGdwdV9nZW1fdXNlcnB0
cl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCX0KIAogCWlmIChh
cmdzLT5mbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSkgewotCQlyID0gYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhiby0+dGJvLnR0bSwKLQkJCQkJCSBiby0+dGJvLnR0bS0+
cGFnZXMpOworCQlyID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50
dG0tPnBhZ2VzKTsKIAkJaWYgKHIpCiAJCQlnb3RvIHJlbGVhc2Vfb2JqZWN0OwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jCmluZGV4IGUwYmI0N2NlNTcwYi4uMzk3MWMyMDFm
MzIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwpAQCAtNDUsNDggKzQ1
LDExIEBACiAKICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgogI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgotI2luY2x1ZGUgPGxpbnV4L2htbS5oPgotI2luY2x1ZGUgPGxpbnV4L2ludGVydmFs
X3RyZWUuaD4KLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm0uaD4KIAog
I2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCIKIAotLyoqCi0g
KiBzdHJ1Y3QgYW1kZ3B1X21uCi0gKgotICogQGFkZXY6IGFtZGdwdSBkZXZpY2UgcG9pbnRlcgot
ICogQG1tOiBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UKLSAqIEB0eXBlOiB0eXBlIG9mIE1NVSBub3Rp
ZmllcgotICogQHdvcms6IGRlc3RydWN0aW9uIHdvcmsgaXRlbQotICogQG5vZGU6IGhhc2ggdGFi
bGUgbm9kZSB0byBmaW5kIHN0cnVjdHVyZSBieSBhZGV2IGFuZCBtbgotICogQGxvY2s6IHJ3IHNl
bWFwaG9yZSBwcm90ZWN0aW5nIHRoZSBub3RpZmllciBub2RlcwotICogQG9iamVjdHM6IGludGVy
dmFsIHRyZWUgY29udGFpbmluZyBhbWRncHVfbW5fbm9kZXMKLSAqIEBtaXJyb3I6IEhNTSBtaXJy
b3IgZnVuY3Rpb24gc3VwcG9ydAotICoKLSAqIERhdGEgZm9yIGVhY2ggYW1kZ3B1IGRldmljZSBh
bmQgcHJvY2VzcyBhZGRyZXNzIHNwYWNlLgotICovCi1zdHJ1Y3QgYW1kZ3B1X21uIHsKLQkvKiBj
b25zdGFudCBhZnRlciBpbml0aWFsaXNhdGlvbiAqLwotCXN0cnVjdCBhbWRncHVfZGV2aWNlCSph
ZGV2OwotCXN0cnVjdCBtbV9zdHJ1Y3QJKm1tOwotCWVudW0gYW1kZ3B1X21uX3R5cGUJdHlwZTsK
LQotCS8qIG9ubHkgdXNlZCBvbiBkZXN0cnVjdGlvbiAqLwotCXN0cnVjdCB3b3JrX3N0cnVjdAl3
b3JrOwotCi0JLyogcHJvdGVjdGVkIGJ5IGFkZXYtPm1uX2xvY2sgKi8KLQlzdHJ1Y3QgaGxpc3Rf
bm9kZQlub2RlOwotCi0JLyogb2JqZWN0cyBwcm90ZWN0ZWQgYnkgbG9jayAqLwotCXN0cnVjdCBy
d19zZW1hcGhvcmUJbG9jazsKLQlzdHJ1Y3QgcmJfcm9vdF9jYWNoZWQJb2JqZWN0czsKLQotCS8q
IEhNTSBtaXJyb3IgKi8KLQlzdHJ1Y3QgaG1tX21pcnJvcgltaXJyb3I7Ci19OwotCiAvKioKICAq
IHN0cnVjdCBhbWRncHVfbW5fbm9kZQogICoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X21uLmgKaW5kZXggZjViNjdjNjNlZDZiLi4yODFmZDlmZWY2NjIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tbi5oCkBAIC0yNCwxNyArMjQsNTEgQEAKICNpZm5kZWYgX19BTURH
UFVfTU5fSF9fCiAjZGVmaW5lIF9fQU1ER1BVX01OX0hfXwogCi0vKgotICogSE1NIG1pcnJvcgot
ICovCi1zdHJ1Y3QgYW1kZ3B1X21uOwotc3RydWN0IGhtbV9yYW5nZTsKKyNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPgorI2luY2x1ZGUgPGxpbnV4L2htbS5oPgorI2luY2x1ZGUgPGxpbnV4L3J3c2Vt
Lmg+CisjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CisjaW5jbHVkZSA8bGludXgvaW50ZXJ2
YWxfdHJlZS5oPgogCiBlbnVtIGFtZGdwdV9tbl90eXBlIHsKIAlBTURHUFVfTU5fVFlQRV9HRlgs
CiAJQU1ER1BVX01OX1RZUEVfSFNBLAogfTsKIAorLyoqCisgKiBzdHJ1Y3QgYW1kZ3B1X21uCisg
KgorICogQGFkZXY6IGFtZGdwdSBkZXZpY2UgcG9pbnRlcgorICogQG1tOiBwcm9jZXNzIGFkZHJl
c3Mgc3BhY2UKKyAqIEB0eXBlOiB0eXBlIG9mIE1NVSBub3RpZmllcgorICogQHdvcms6IGRlc3Ry
dWN0aW9uIHdvcmsgaXRlbQorICogQG5vZGU6IGhhc2ggdGFibGUgbm9kZSB0byBmaW5kIHN0cnVj
dHVyZSBieSBhZGV2IGFuZCBtbgorICogQGxvY2s6IHJ3IHNlbWFwaG9yZSBwcm90ZWN0aW5nIHRo
ZSBub3RpZmllciBub2RlcworICogQG9iamVjdHM6IGludGVydmFsIHRyZWUgY29udGFpbmluZyBh
bWRncHVfbW5fbm9kZXMKKyAqIEBtaXJyb3I6IEhNTSBtaXJyb3IgZnVuY3Rpb24gc3VwcG9ydAor
ICoKKyAqIERhdGEgZm9yIGVhY2ggYW1kZ3B1IGRldmljZSBhbmQgcHJvY2VzcyBhZGRyZXNzIHNw
YWNlLgorICovCitzdHJ1Y3QgYW1kZ3B1X21uIHsKKwkvKiBjb25zdGFudCBhZnRlciBpbml0aWFs
aXNhdGlvbiAqLworCXN0cnVjdCBhbWRncHVfZGV2aWNlCSphZGV2OworCXN0cnVjdCBtbV9zdHJ1
Y3QJKm1tOworCWVudW0gYW1kZ3B1X21uX3R5cGUJdHlwZTsKKworCS8qIG9ubHkgdXNlZCBvbiBk
ZXN0cnVjdGlvbiAqLworCXN0cnVjdCB3b3JrX3N0cnVjdAl3b3JrOworCisJLyogcHJvdGVjdGVk
IGJ5IGFkZXYtPm1uX2xvY2sgKi8KKwlzdHJ1Y3QgaGxpc3Rfbm9kZQlub2RlOworCisJLyogb2Jq
ZWN0cyBwcm90ZWN0ZWQgYnkgbG9jayAqLworCXN0cnVjdCByd19zZW1hcGhvcmUJbG9jazsKKwlz
dHJ1Y3QgcmJfcm9vdF9jYWNoZWQJb2JqZWN0czsKKworCS8qIEhNTSBtaXJyb3IgKi8KKwlzdHJ1
Y3QgaG1tX21pcnJvcgltaXJyb3I7Cit9OworCiAjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJP
UikKIHZvaWQgYW1kZ3B1X21uX2xvY2soc3RydWN0IGFtZGdwdV9tbiAqbW4pOwogdm9pZCBhbWRn
cHVfbW5fdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwppbmRleCA4MjI1ZDZlMDVhNTUuLjVkODU2MTc4ODZiMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtNzI2LDggKzcyNiwxMCBAQCBz
dHJ1Y3QgYW1kZ3B1X3R0bV90dCB7CiAKICNkZWZpbmUgTUFYX1JFVFJZX0hNTV9SQU5HRV9GQVVM
VAkxNgogCi1pbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0
dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpCitpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdl
cyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIHsKKwlzdHJ1Y3Qg
aG1tX21pcnJvciAqbWlycm9yID0gYm8tPm1uID8gJmJvLT5tbi0+bWlycm9yIDogTlVMTDsKKwlz
dHJ1Y3QgdHRtX3R0ICp0dG0gPSBiby0+dGJvLnR0bTsKIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAq
Z3R0ID0gKHZvaWQgKil0dG07CiAJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBndHQtPnVzZXJ0YXNr
LT5tbTsKIAl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gZ3R0LT51c2VycHRyOwpAQCAtNzQxLDYgKzc0
MywxMiBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0
dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpCiAJaWYgKCFtbSkgLyogSGFwcGVucyBkdXJpbmcgcHJv
Y2VzcyBzaHV0ZG93biAqLwogCQlyZXR1cm4gLUVTUkNIOwogCisJaWYgKHVubGlrZWx5KCFtaXJy
b3IpKSB7CisJCURSTV9ERUJVR19EUklWRVIoIkZhaWxlZCB0byBnZXQgaG1tX21pcnJvclxuIik7
CisJCXIgPSAtRUZBVUxUOworCQlnb3RvIG91dDsKKwl9CisKIAl2bWEgPSBmaW5kX3ZtYShtbSwg
c3RhcnQpOwogCWlmICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsK
IAkJciA9IC1FRkFVTFQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKaW5k
ZXggYzJiNzY2OTAwNGJhLi5jYWE3NmM2OTM3MDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmgKQEAgLTEwMiwxMCArMTAyLDExIEBAIGludCBhbWRncHVfdHRtX2FsbG9j
X2dhcnQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7CiBpbnQgYW1kZ3B1X3R0bV9yZWNv
dmVyX2dhcnQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8pOwogCiAjaWYgSVNfRU5BQkxF
RChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRSKQotaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJf
cGFnZXMoc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKTsKK2ludCBhbWRn
cHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFn
ZSAqKnBhZ2VzKTsKIGJvb2wgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKHN0cnVj
dCB0dG1fdHQgKnR0bSk7CiAjZWxzZQotc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3R0bV90dF9n
ZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCBwYWdlICoqcGFnZXMpCitz
dGF0aWMgaW5saW5lIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRn
cHVfYm8gKmJvLAorCQkJCQkgICAgICAgc3RydWN0IHBhZ2UgKipwYWdlcykKIHsKIAlyZXR1cm4g
LUVQRVJNOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
