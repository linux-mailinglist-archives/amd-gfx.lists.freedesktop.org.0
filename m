Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CA84FB0
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 17:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BE56E72C;
	Wed,  7 Aug 2019 15:21:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8129F6E72C
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 15:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDGTb0RJR2wWs0NETPMDTzvQHGhcDvZh7n99UKQ8qN+wg8yNbWKVo1ygZghmi8M5QINY9JBmgJNKfQ2C2ocyt1nnaBzxWNnEFf0SDeurk8TvSkfSY8p0M7ZcpLWWoO8Fdnde151i8YaJrOwTCr+UUwxYXyMtQMDObOYLpMZWKbXa+YxYaPndmkdIl6sBpmmcU3n63Ap9Dv+SQzrZgYPuDAhrs80qHGceK1PkKsh706p1YYgDQ+Xd4X4H3CUQDrwGChzNef3rJMHMj8EAlP72a8COL72qH7VSsGxMeRCTVPgsrUSVkJbiE76TOy019cGkazyuldsMLZVjNEavnoqi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPHNoYWtdJIO7tY8bJ9dFClwYZkeP5m2G8hnR/dNGiM=;
 b=ZhM831yxtpKum2p5uaRA1hQcqMp1E2Yn5rW11/y5xPzFpygUe3rTK4z9dVPlUySdTwXuC1P/xn3tXfyOeXeayWYTr+j1Yz3jBJvN0JvuQgGhIWWHx/8yd4nx9qkGTNB2VNAzB9Pw2nzw4O3AyS3z4Ky4nOsgJ57qG0xmP+P2tM2hDLlT+9LlzOLOGnyjWj0jo4qW/j6bzC66b4Bq5UIMqf6JjrgXPRTFicNjLkKiFOuwVaXrupUJYZkyeOmnyGusVo4/RfdwPH3HgHOLNuWkXQrFNKRyHbjVOoV0AZkmizIRLUGnGNfOqbJj+p2PhiHOdZ3FfwepyFvxfSTWTCfBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2369.namprd12.prod.outlook.com (52.132.28.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Wed, 7 Aug 2019 15:21:14 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 15:21:14 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/amdkfd: New IOCTL to allocate queue GWS"
Thread-Topic: [PATCH] Revert "drm/amdkfd: New IOCTL to allocate queue GWS"
Thread-Index: AQHVTTEFS+mo4gEbe0aQTcqFhA8wBabvzPxA
Date: Wed, 7 Aug 2019 15:21:14 +0000
Message-ID: <BL0PR12MB258000DD0345CBFDFD955B9380D40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190807150124.13978-1-alexander.deucher@amd.com>
In-Reply-To: <20190807150124.13978-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a02ac49-ca52-4289-e7d8-08d71b4ae31c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2369; 
x-ms-traffictypediagnostic: BL0PR12MB2369:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB236963A78E7B4D96F46588AD80D40@BL0PR12MB2369.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(189003)(199004)(13464003)(14454004)(229853002)(476003)(11346002)(2501003)(186003)(102836004)(486006)(6506007)(53546011)(14444005)(966005)(86362001)(446003)(8936002)(256004)(68736007)(71200400001)(110136005)(66446008)(99286004)(66476007)(66556008)(64756008)(66066001)(316002)(71190400001)(66946007)(76116006)(33656002)(76176011)(26005)(7696005)(52536014)(5660300002)(7736002)(4326008)(6116002)(3846002)(6246003)(53936002)(25786009)(478600001)(2906002)(8676002)(55016002)(81166006)(74316002)(6436002)(305945005)(9686003)(81156014)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2369;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PKqTZPUG+qlcymV7O9hJ3HYdguJdxBX/qgneHW581K8iQ8RT1lAy/RAvhLHpNTW3l8ui/XxOFxKFhPOmserQCtlBVCSGg77FgLRQnnDaLk81vCs/OpG/q0vzrOSwlEcxI/dDQB5cRogVzDYYf2Flt2LkdDS6TETRy6t5ufw4O6Kx7ft+jK4HF1rknNZAU4EdpwINSaDn3ObDWBJZxmOvLXDzCDw8KNm8FVhxwnfzJyAq/QFWqvxOmEPBUk/a1bHBleQx/EmPSNDObLEb7+Bf4bs4PoEwJT4S6zTNqTB+Wz6GbWRaGlG5EWHuRQjMXoAff/L2bpE9Y+F0Bd0aXrtaJsnsLnLvgOR7khz7E06m6zs6p41pf2s/9liNyfIbUsGBhrPz5FU69env9liNAfpt0K9qCU1RL4Idm7IDDDx6InE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a02ac49-ca52-4289-e7d8-08d71b4ae31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 15:21:14.7057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2369
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPHNoYWtdJIO7tY8bJ9dFClwYZkeP5m2G8hnR/dNGiM=;
 b=ilpJ7W340qXlKiK7RhcLoSc1TTkABlSwvfNvH127V18SLPaQ/aXEG00fgO3vEiFV3B911Lp5M8CV5SelEAjMZfTO8pPxszvytk0E91KyQAqtnciUxeUpKtnPa+uT1JMJO8KfbYfAnQkhtzjSsONTrvAHOdZieyYdEElYZyD2sT8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KT2FrDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleCBEZXVjaGVyDQpTZW50
OiBXZWRuZXNkYXksIEF1Z3VzdCA3LCAyMDE5IDExOjAxIEFNDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiZHJtL2FtZGtmZDogTmV3IElPQ1RM
IHRvIGFsbG9jYXRlIHF1ZXVlIEdXUyINCg0KVGhpcyByZXZlcnRzIGNvbW1pdCAxYTA1OGMzMzc2
NzY1ZWUzMWQ2NWUyOGNiYmI5ZDRmZjE1MTIwMDU2Lg0KDQpUaGlzIGludGVyZmFjZSBpcyBzdGls
bCBpbiB0b28gbXVjaCBmbHV4LiAgUmV2ZXJ0IHVudGlsIGl0J3Mgc29ydGVkIG91dC4NCg0KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYyB8IDI4IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KIGluY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCAgICAgICAg
ICAgfCAyMCArLS0tLS0tLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDQ3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2NoYXJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFy
ZGV2LmMNCmluZGV4IDI2YjE1Y2M1NmMzMS4uMWQzY2Q1YzUwZDVmIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KQEAgLTE1NjcsMzIgKzE1NjcsNiBAQCBzdGF0
aWMgaW50IGtmZF9pb2N0bF91bm1hcF9tZW1vcnlfZnJvbV9ncHUoc3RydWN0IGZpbGUgKmZpbGVw
LA0KIAlyZXR1cm4gZXJyOw0KIH0NCiANCi1zdGF0aWMgaW50IGtmZF9pb2N0bF9hbGxvY19xdWV1
ZV9nd3Moc3RydWN0IGZpbGUgKmZpbGVwLA0KLQkJc3RydWN0IGtmZF9wcm9jZXNzICpwLCB2b2lk
ICpkYXRhKQ0KLXsNCi0JaW50IHJldHZhbDsNCi0Jc3RydWN0IGtmZF9pb2N0bF9hbGxvY19xdWV1
ZV9nd3NfYXJncyAqYXJncyA9IGRhdGE7DQotCXN0cnVjdCBrZmRfZGV2ICpkZXY7DQotDQotCWlm
ICghaHdzX2d3c19zdXBwb3J0KQ0KLQkJcmV0dXJuIC1FTk9ERVY7DQotDQotCWRldiA9IGtmZF9k
ZXZpY2VfYnlfaWQoYXJncy0+Z3B1X2lkKTsNCi0JaWYgKCFkZXYpIHsNCi0JCXByX2RlYnVnKCJD
b3VsZCBub3QgZmluZCBncHUgaWQgMHgleFxuIiwgYXJncy0+Z3B1X2lkKTsNCi0JCXJldHVybiAt
RU5PREVWOw0KLQl9DQotCWlmIChkZXYtPmRxbS0+c2NoZWRfcG9saWN5ID09IEtGRF9TQ0hFRF9Q
T0xJQ1lfTk9fSFdTKQ0KLQkJcmV0dXJuIC1FTk9ERVY7DQotDQotCW11dGV4X2xvY2soJnAtPm11
dGV4KTsNCi0JcmV0dmFsID0gcHFtX3NldF9nd3MoJnAtPnBxbSwgYXJncy0+cXVldWVfaWQsIGFy
Z3MtPm51bV9nd3MgPyBkZXYtPmd3cyA6IE5VTEwpOw0KLQltdXRleF91bmxvY2soJnAtPm11dGV4
KTsNCi0NCi0JYXJncy0+Zmlyc3RfZ3dzID0gMDsNCi0JcmV0dXJuIHJldHZhbDsNCi19DQotDQog
c3RhdGljIGludCBrZmRfaW9jdGxfZ2V0X2RtYWJ1Zl9pbmZvKHN0cnVjdCBmaWxlICpmaWxlcCwN
CiAJCXN0cnVjdCBrZmRfcHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkNCiB7DQpAQCAtMTc5NSw4ICsx
NzY5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRrZmRfaW9jdGxfZGVzYyBhbWRrZmRfaW9j
dGxzW10gPSB7DQogCUFNREtGRF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGLA0K
IAkJCQlrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1ZiwgMCksDQogDQotCUFNREtGRF9JT0NUTF9ERUYo
QU1ES0ZEX0lPQ19BTExPQ19RVUVVRV9HV1MsDQotCQkJa2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3
cywgMCksDQogfTsNCiANCiAjZGVmaW5lIEFNREtGRF9DT1JFX0lPQ1RMX0NPVU5UCUFSUkFZX1NJ
WkUoYW1ka2ZkX2lvY3RscykNCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lv
Y3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggaW5kZXggMDcwZDFiYzdlNzI1
Li4yMDkxN2M1OWYzOWMgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3Rs
LmgNCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaA0KQEAgLTQxMCwyMSArNDEw
LDYgQEAgc3RydWN0IGtmZF9pb2N0bF91bm1hcF9tZW1vcnlfZnJvbV9ncHVfYXJncyB7DQogCV9f
dTMyIG5fc3VjY2VzczsJCS8qIHRvL2Zyb20gS0ZEICovDQogfTsNCiANCi0vKiBBbGxvY2F0ZSBH
V1MgZm9yIHNwZWNpZmljIHF1ZXVlDQotICoNCi0gKiBAZ3B1X2lkOiAgICAgIGRldmljZSBpZGVu
dGlmaWVyDQotICogQHF1ZXVlX2lkOiAgICBxdWV1ZSdzIGlkIHRoYXQgR1dTIGlzIGFsbG9jYXRl
ZCBmb3INCi0gKiBAbnVtX2d3czogICAgIGhvdyBtYW55IEdXUyB0byBhbGxvY2F0ZQ0KLSAqIEBm
aXJzdF9nd3M6ICAgaW5kZXggb2YgdGhlIGZpcnN0IEdXUyBhbGxvY2F0ZWQuDQotICogICAgICAg
ICAgICAgICBvbmx5IHN1cHBvcnQgY29udGlndW91cyBHV1MgYWxsb2NhdGlvbg0KLSAqLw0KLXN0
cnVjdCBrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzX2FyZ3Mgew0KLQlfX3UzMiBncHVfaWQ7CQkv
KiB0byBLRkQgKi8NCi0JX191MzIgcXVldWVfaWQ7CQkvKiB0byBLRkQgKi8NCi0JX191MzIgbnVt
X2d3czsJCS8qIHRvIEtGRCAqLw0KLQlfX3UzMiBmaXJzdF9nd3M7CS8qIGZyb20gS0ZEICovDQot
fTsNCi0NCiBzdHJ1Y3Qga2ZkX2lvY3RsX2dldF9kbWFidWZfaW5mb19hcmdzIHsNCiAJX191NjQg
c2l6ZTsJCS8qIGZyb20gS0ZEICovDQogCV9fdTY0IG1ldGFkYXRhX3B0cjsJLyogdG8gS0ZEICov
DQpAQCAtNTQ0LDEwICs1MjksNyBAQCBlbnVtIGtmZF9tbWlvX3JlbWFwIHsNCiAjZGVmaW5lIEFN
REtGRF9JT0NfSU1QT1JUX0RNQUJVRgkJXA0KIAkJQU1ES0ZEX0lPV1IoMHgxRCwgc3RydWN0IGtm
ZF9pb2N0bF9pbXBvcnRfZG1hYnVmX2FyZ3MpDQogDQotI2RlZmluZSBBTURLRkRfSU9DX0FMTE9D
X1FVRVVFX0dXUwkJXA0KLQkJQU1ES0ZEX0lPV1IoMHgxRSwgc3RydWN0IGtmZF9pb2N0bF9hbGxv
Y19xdWV1ZV9nd3NfYXJncykNCi0NCiAjZGVmaW5lIEFNREtGRF9DT01NQU5EX1NUQVJUCQkweDAx
DQotI2RlZmluZSBBTURLRkRfQ09NTUFORF9FTkQJCTB4MUYNCisjZGVmaW5lIEFNREtGRF9DT01N
QU5EX0VORAkJMHgxRQ0KIA0KICNlbmRpZg0KLS0NCjIuMjAuMQ0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
