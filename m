Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0C7BAF4
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 09:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2806E6A9;
	Wed, 31 Jul 2019 07:51:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9666E67E
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 07:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbe8sYRYDanabnvxsZt+ileknvJh7fFYrlZP57zscjibY/MszMCZlYb62SlXIp9iP6JRvtOTl/S/EzCGT3aUm4+EqqxKAFlUP3mXrPPepNRFH5lNcqlmFNBYCErepBdckiO+4foaht5aQ2BWCByELgKfr7rtMA83NFCTY3ZroKbuJbiOIDxm7j35VDLEm+0r5wuz6ftaWUy6vh3DqhiueHVC4HHhuN8mksHhhStGjm8TK3taNAYCP/KAlquppZOrfvYthysPcYvQ0aFHqGBQTEdkgkVEYC78amac5CfrqnUoh3rK+CpYymiLD1etlalymF0QEfeASDKqhd7ET+00LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfBihHw9cSQgTQFHyE1K7vRpks77pnhIU8mW7OCcSMA=;
 b=U+Z6ltrQUlzGrvhzFDQuraoi0+B5Xo2Ck7xTmqYRF4pBtePjk4Zp3yrIaxbnblKYlkRXeGbEWozBoqW2BiQi1iLfIjD9B2UGDCMpRYJc8uEbBenJY7Buga0FcH5ikY2AmIe7iWeFLqN9RTp0tiP+j7ACRfnQ+2NYmSL8rlFD3O2ps2TLUib2Kdga89vRrDKyeU55m73vimMKh0QmOqW+stxvbik08Oa2qgSctp5msagDIwCrR+9NR76o1ZzL3d09g1Aw0a/iEOi2gQYwr2JwKJWXRh7B80OlUpAnO6W810UiuOt/LE3/0S/Ecd8CbAvHwXloGKjiD0zjt4nuDFQjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB2852.namprd12.prod.outlook.com (20.179.64.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 07:51:20 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 07:51:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: sort feature status index by asic feature
 id for smu
Thread-Topic: [PATCH] drm/amd/powerplay: sort feature status index by asic
 feature id for smu
Thread-Index: AQHVR3S9HSKUfYSP8k2n/AI0gRxY4g==
Date: Wed, 31 Jul 2019 07:51:20 +0000
Message-ID: <20190731075035.32068-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0022.apcprd04.prod.outlook.com
 (2603:1096:203:36::34) To BN8PR12MB3283.namprd12.prod.outlook.com
 (2603:10b6:408:6e::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05e89836-d848-47bf-80f6-08d7158be018
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2852; 
x-ms-traffictypediagnostic: BN8PR12MB2852:
x-microsoft-antispam-prvs: <BN8PR12MB285272D7C5300C7F1CC58A34A2DF0@BN8PR12MB2852.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(189003)(199004)(6916009)(6512007)(14444005)(14454004)(256004)(478600001)(6436002)(3846002)(305945005)(36756003)(86362001)(5640700003)(476003)(2906002)(2616005)(486006)(71190400001)(66066001)(53936002)(54906003)(2501003)(6116002)(66946007)(316002)(64756008)(81166006)(5660300002)(50226002)(6506007)(71200400001)(1076003)(386003)(102836004)(2351001)(6486002)(68736007)(99286004)(8676002)(186003)(66476007)(81156014)(26005)(4326008)(52116002)(66446008)(66556008)(25786009)(8936002)(7736002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2852;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tI2H2mBwtQNBPJMF5eE2Y5aHjRpPxwQFT4p4j8c1XBHgGLl+M7sD3jMmPOj7MX03gWWM/irKD2qFwXuhZj6jbW5dJ4im7+MuEEvQ9NwvxtQkbY+z4bGZ+a1qXjlNaFsp4Qd4sg2g3UaJ6x+JVI0Lzh5gj7dU1NmfjCy5NIv21OV26YVt4FkS/uGsqOCmFWVhPeKyv5LOBVj121Nu/3bSsPkUZWmF/4fNAATETarfP8FTrxTdL192aLc6J1iuCGb/W4LiP3ypxhrWqQv1mi81B3qZnuh/wRO+giSXtfIL9GTFPmyLeaq3J4MMeIvNMnysBYW+XDXwWj3VXdnl57IS6gimZg/5vxDkZkzo0KI5OYjHMvQhs+O0lIvEwvNLYHJ8l0f1pK0w3BT5QMpRDVhvGkuV0SZB5R2lI7PZGBliwUQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e89836-d848-47bf-80f6-08d7158be018
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 07:51:20.3422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfBihHw9cSQgTQFHyE1K7vRpks77pnhIU8mW7OCcSMA=;
 b=azHUYRB9IndjKQci7uk2oiVNMxzhO62f5y7sFv/PyTypzBJNMsD9mPw7EQMSCzTORKy3J9e0Pw3Ej0iW5sQX4j70EfGGGBcQ4p0udYYvOyGNPxLtnhvpcAxOuA9me421HRJmOExAlwDs+v9baOz2FvBHMkJBEP0TTT7I1zBVDqU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YmVmb3JlIHRoaXMgY2hhbmdlLCB0aGUgcHBfZmVhdHVyZSBzeXNmcyBzaG93IGZlYXR1cmUgZW5h
YmxlIHN0YXRlIGJ5CmxvZ2ljIGZlYXR1cmUgaWQsIGl0IGlzIG5vdCBlYXN5IHRvIHJlYWQuCnRo
aXMgY2hhbmdlIHdpbGwgc29ydCBwcF9mZWF0dXJlcyBzaG93IGluZGV4IGJ5IGFzaWMgZmVhdHVy
ZSBpZC4KCmJlZm9yZToKZmVhdHVyZXMgaGlnaDogMHgwMDAwMDYyMyBsb3c6IDB4YjNjZGFmZmIK
MDAuIERQTV9QUkVGRVRDSEVSICAgICAgICggMCkgOiBlbmFiZWxkCjAxLiBEUE1fR0ZYQ0xLICAg
ICAgICAgICAoIDEpIDogZW5hYmVsZAowMi4gRFBNX1VDTEsgICAgICAgICAgICAgKCAzKSA6IGVu
YWJlbGQKMDMuIERQTV9TT0NDTEsgICAgICAgICAgICggNCkgOiBlbmFiZWxkCjA0LiBEUE1fTVAw
Q0xLICAgICAgICAgICAoIDUpIDogZW5hYmVsZAowNS4gRFBNX0xJTksgICAgICAgICAgICAgKCA2
KSA6IGVuYWJlbGQKMDYuIERQTV9EQ0VGQ0xLICAgICAgICAgICggNykgOiBlbmFiZWxkCjA3LiBE
U19HRlhDTEsgICAgICAgICAgICAoMTApIDogZW5hYmVsZAowOC4gRFNfU09DQ0xLICAgICAgICAg
ICAgKDExKSA6IGVuYWJlbGQKMDkuIERTX0xDTEsgICAgICAgICAgICAgICgxMikgOiBkaXNhYmxl
ZAoxMC4gUFBUICAgICAgICAgICAgICAgICAgKDIzKSA6IGVuYWJlbGQKMTEuIFREQyAgICAgICAg
ICAgICAgICAgICgyNCkgOiBlbmFiZWxkCjEyLiBUSEVSTUFMICAgICAgICAgICAgICAoMzMpIDog
ZW5hYmVsZAoxMy4gUk0gICAgICAgICAgICAgICAgICAgKDM1KSA6IGRpc2FibGVkCi4uLi4uLgoK
YWZ0ZXI6CmZlYXR1cmVzIGhpZ2g6IDB4MDAwMDA2MjMgbG93OiAweGIzY2RhZmZiCjAwLiBEUE1f
UFJFRkVUQ0hFUiAgICAgICAoIDApIDogZW5hYmVsZAowMS4gRFBNX0dGWENMSyAgICAgICAgICAg
KCAxKSA6IGVuYWJlbGQKMDIuIERQTV9HRlhfUEFDRSAgICAgICAgICggMikgOiBkaXNhYmxlZAow
My4gRFBNX1VDTEsgICAgICAgICAgICAgKCAzKSA6IGVuYWJlbGQKMDQuIERQTV9TT0NDTEsgICAg
ICAgICAgICggNCkgOiBlbmFiZWxkCjA1LiBEUE1fTVAwQ0xLICAgICAgICAgICAoIDUpIDogZW5h
YmVsZAowNi4gRFBNX0xJTksgICAgICAgICAgICAgKCA2KSA6IGVuYWJlbGQKMDcuIERQTV9EQ0VG
Q0xLICAgICAgICAgICggNykgOiBlbmFiZWxkCjA4LiBNRU1fVkREQ0lfU0NBTElORyAgICAoIDgp
IDogZW5hYmVsZAowOS4gTUVNX01WRERfU0NBTElORyAgICAgKCA5KSA6IGVuYWJlbGQKMTAuIERT
X0dGWENMSyAgICAgICAgICAgICgxMCkgOiBlbmFiZWxkCjExLiBEU19TT0NDTEsgICAgICAgICAg
ICAoMTEpIDogZW5hYmVsZAoxMi4gRFNfTENMSyAgICAgICAgICAgICAgKDEyKSA6IGRpc2FibGVk
CjEzLiBEU19EQ0VGQ0xLICAgICAgICAgICAoMTMpIDogZW5hYmVsZAouLi4uLi4KClNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMTQgKysrKysrKysrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBlYWJlOGE2ZDBlYjcuLjllMjU2
YWEzYjM1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpA
QCAtNjIsNiArNjIsOCBAQCBzaXplX3Qgc211X3N5c19nZXRfcHBfZmVhdHVyZV9tYXNrKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBjaGFyICpidWYpCiAJdWludDMyX3QgZmVhdHVyZV9tYXNrWzJd
ID0geyAwIH07CiAJaW50MzJfdCBmZWF0dXJlX2luZGV4ID0gMDsKIAl1aW50MzJfdCBjb3VudCA9
IDA7CisJdWludDMyX3Qgc29ydF9mZWF0dXJlW1NNVV9GRUFUVVJFX0NPVU5UXTsKKwl1aW50NjRf
dCBod19mZWF0dXJlX2NvdW50ID0gMDsKIAogCXJldCA9IHNtdV9mZWF0dXJlX2dldF9lbmFibGVk
X21hc2soc211LCBmZWF0dXJlX21hc2ssIDIpOwogCWlmIChyZXQpCkBAIC03NCwxMSArNzYsMTcg
QEAgc2l6ZV90IHNtdV9zeXNfZ2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgY2hhciAqYnVmKQogCQlmZWF0dXJlX2luZGV4ID0gc211X2ZlYXR1cmVfZ2V0X2luZGV4
KHNtdSwgaSk7CiAJCWlmIChmZWF0dXJlX2luZGV4IDwgMCkKIAkJCWNvbnRpbnVlOworCQlzb3J0
X2ZlYXR1cmVbZmVhdHVyZV9pbmRleF0gPSBpOworCQlod19mZWF0dXJlX2NvdW50Kys7CisJfQor
CisJZm9yIChpID0gMDsgaSA8IGh3X2ZlYXR1cmVfY291bnQ7IGkrKykgewogCQlzaXplICs9IHNw
cmludGYoYnVmICsgc2l6ZSwgIiUwMmQuICUtMjBzICglMmQpIDogJXNcbiIsCiAJCQkgICAgICAg
Y291bnQrKywKLQkJCSAgICAgICBzbXVfZ2V0X2ZlYXR1cmVfbmFtZShzbXUsIGkpLAotCQkJICAg
ICAgIGZlYXR1cmVfaW5kZXgsCi0JCQkgICAgICAgISFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNt
dSwgaSkgPyAiZW5hYmVsZCIgOiAiZGlzYWJsZWQiKTsKKwkJCSAgICAgICBzbXVfZ2V0X2ZlYXR1
cmVfbmFtZShzbXUsIHNvcnRfZmVhdHVyZVtpXSksCisJCQkgICAgICAgaSwKKwkJCSAgICAgICAh
IXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBzb3J0X2ZlYXR1cmVbaV0pID8KKwkJCSAgICAg
ICAiZW5hYmVsZCIgOiAiZGlzYWJsZWQiKTsKIAl9CiAKIGZhaWxlZDoKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
