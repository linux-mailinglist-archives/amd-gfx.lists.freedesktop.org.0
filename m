Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA5BC03C
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187816E9D9;
	Tue, 24 Sep 2019 02:38:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CB96E9D9
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6oj7LZQn1iCon7a6lotKkxPqn+hMOxle1vshit1DM8VEbEbwvVckJZKBsiH4NvZYQLGcDThXMp4bPWa2L3h6ZVYTwFZFJFR30eSqApt5cEuJ3IOh3fvEoqR5G9KyBsUbIalw6sdxWvQmUqPbnIFjsJI3PopMwdROXgkMPXjFANY1JIIzuK9lXtRzxWe7YJe3TH/9kxwr/ndfFl0kQ/JbpPPZIj2EXlWXOvUd5ZpwSpCpNJ0dR1jfDWPTWF1j7NfNpqMfJz2aDgPSwMOzB6oaDbPR681+kaRLutqry5fI1Yj/eVRNxpnQrZbH/BvO/Bgkxv6jOVETLtOl4UaiVeQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T38Wq15vCTdiL0Bg9jkE5h4oMK2wYcV/8F0ZlH3Cyc=;
 b=cfs0UtBrKSM67FPo9bBjULsH51u266pQE3bDOce/IUczd3F0sN40bkya5JZs36TWnqiB8eyImO0PvwdctzplvsM+l7dc5+sHEB5jYvW6FEafXC0o4kaS8ORytGKXDBolkLPqXiMKQuzqbS1yQ7pOOA41uffB3q+iTO9Iq9mYNnzPye4adGal3eMwvhNmPUYzUGDDjJR5NmPMEaVyPnOspmoedA79Qc38CoChwPbpEDrZK35xnxE7xJLu718FMEXBHW/6ViGkHN41bkMmADFc5SSQjrpxf9Vt1v6Id7QhuTUf53vYqfULwMDI8McwsZ3r091pcEGJTCA1Azmh3tAkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3502.namprd12.prod.outlook.com (20.178.242.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Tue, 24 Sep 2019 02:38:33 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:38:33 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and
 setting profiling dpm clock level
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting
 and setting profiling dpm clock level
Thread-Index: AQHVcerwc9p39e8EiE6g3Hn4C55Xqqc6HegQ
Date: Tue, 24 Sep 2019 02:38:33 +0000
Message-ID: <MN2PR12MB334498F8B56AF72C51BBE78FE4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
 <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 960bae5d-64dd-4d8b-5f2f-08d740984aef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3502; 
x-ms-traffictypediagnostic: MN2PR12MB3502:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB350281EF185B439D30F548E4E4840@MN2PR12MB3502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(13464003)(6436002)(7696005)(186003)(86362001)(6506007)(55016002)(66556008)(229853002)(478600001)(64756008)(66946007)(66476007)(76116006)(25786009)(110136005)(66446008)(5660300002)(14444005)(9686003)(54906003)(6246003)(8676002)(81166006)(14454004)(81156014)(256004)(316002)(52536014)(305945005)(4326008)(8936002)(2906002)(74316002)(53546011)(3846002)(6116002)(476003)(33656002)(71190400001)(71200400001)(2501003)(26005)(66066001)(446003)(76176011)(99286004)(11346002)(102836004)(486006)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3502;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vLGwIZSCulBHwWmUpNCdtF37Ssl5htKTJj65xkjj79z5qg917nMm/8GVINHA7CBT0nKh+zESM3UiEO3xllSPrMVPJ2EaB3oPj044LSWFILjkEj15i5hH7uOEtO4vWYXOlaqh5rs/gTMwryY4w4XFP1NUcPlWTlHZ3/TdGO2KIpxjhw90XhfW1jMGzkpnE+AAA6/a6b29VgSMKgOHwGfT5YHuuMWBP44uy9QG+mMD2hoxfJ2Eobizt//YUuyCrJsSeBA19w37DxkeeH+H3fs1u7FC522i3P6JI5VC9PNTIXbX0HM57jDsMnF0z9npvPLmKdxpc93guWza0PnF5zuRwAwdt8fo0W8tSQB4+HeGu3FCF7tV0ZBbjMHoEGxLFDxi2WCusuaCixL2qjgE0joGZeqIGrzI+VAiYD2VRmxRD/g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960bae5d-64dd-4d8b-5f2f-08d740984aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:38:33.0603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPS5p2ns4fAQQKF2PTgMov+mxQnVuKOSCXftIeE9dVMgNOMAuNmM79nUlkx9R3te
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T38Wq15vCTdiL0Bg9jkE5h4oMK2wYcV/8F0ZlH3Cyc=;
 b=Ut3eDRMufAfS3mMOwh3tgENehb1BgeOfyDgMq016X9fJCQ3Nc/uRmzDU8MLSQ51qqgjINIKjQCGZm77OdK0O22j41LpwFbwLh4NJ3LzKyBq6bRsowmAYJPhT7EPLAj82lMoIYGEo+YohFWLHnEVh2U9sQ40aY8kerhCxB/mdFqE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBMaWFuZywgUHJpa2UgPFByaWtlLkxp
YW5nQGFtZC5jb20+IApTZW50OiBNb25kYXksIFNlcHRlbWJlciAyMywgMjAxOSA0OjQzIFBNClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgYXJyb24ubGl1QGFtZC5jb207IExpYW5nLCBQcmlrZSA8
UHJpa2UuTGlhbmdAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDQvNV0gZHJtL2FtZC9wb3dlcnBs
YXk6IGFkZCB0aGUgaW50ZXJmYWNlcyBmb3IgZ2V0dGluZyBhbmQgc2V0dGluZyBwcm9maWxpbmcg
ZHBtIGNsb2NrIGxldmVsCgppbXBsZW1lbnQgZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayBhbmQgZm9y
Y2VfY2xrX2xldmVscyBmb3IgZm9yY2luZyBkcG0gY2xrIHRvIGxpbWl0IHZhbHVlLgoKU2lnbmVk
LW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jIHwgODMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwppbmRleCBmODdhYTU2Li5jNmFhZTFj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC0zOTIs
NiArMzkyLDg3IEBAIHN0YXRpYyBpbnQgcmVub2lyX2dldF93b3JrbG9hZF90eXBlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LCB1aW50MzJfdCBwcm9maWxlKQogCXJldHVybiBwcGxpYl93b3JrbG9h
ZDsKIH0KIAorc3RhdGljIGludCByZW5vaXJfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwKKwkJCQkJIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgbGV2ZWws
CisJCQkJCSB1aW50MzJfdCAqc2Nsa19tYXNrLAorCQkJCQkgdWludDMyX3QgKm1jbGtfbWFzaywK
KwkJCQkJIHVpbnQzMl90ICpzb2NfbWFzaykKK3sKKworCWlmIChsZXZlbCA9PSBBTURfRFBNX0ZP
UkNFRF9MRVZFTF9QUk9GSUxFX01JTl9TQ0xLKSB7CisJCWlmIChzY2xrX21hc2spCisJCQkqc2Ns
a19tYXNrID0gMDsKKwl9IGVsc2UgaWYgKGxldmVsID09IEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BS
T0ZJTEVfTUlOX01DTEspIHsKKwkJaWYgKG1jbGtfbWFzaykKKwkJCSptY2xrX21hc2sgPSAwOwor
CX0gZWxzZSBpZiAobGV2ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9QRUFLKSB7
CisJCWlmKHNjbGtfbWFzaykKKwkJCS8qIFRoZSBzY2xrIGFzIGdmeGNsayBhbmQgaGFzIHRocmVl
IGxldmVsIGFib3V0IG1heC9taW4vY3VycmVudCAqLworCQkJKnNjbGtfbWFzayA9IDMgLSAxOwor
CisJCWlmKG1jbGtfbWFzaykKKwkJCSptY2xrX21hc2sgPSBOVU1fTUVNQ0xLX0RQTV9MRVZFTFMg
LSAxOworCisJCWlmKHNvY19tYXNrKQorCQkJKnNvY19tYXNrID0gTlVNX1NPQ0NMS19EUE1fTEVW
RUxTIC0gMTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCByZW5vaXJfZm9yY2Vf
Y2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkgICBlbnVtIHNtdV9jbGtf
dHlwZSBjbGtfdHlwZSwgdWludDMyX3QgbWFzaykgeworCisJaW50IHJldCA9IDAgOworCXVpbnQz
Ml90IHNvZnRfbWluX2xldmVsID0gMCwgc29mdF9tYXhfbGV2ZWwgPSAwLCBtaW5fZnJlcSA9IDAs
IG1heF9mcmVxID0gMDsKKwlEcG1DbG9ja3NfdCAqY2xrX3RhYmxlID0gc211LT5zbXVfdGFibGUu
Y2xvY2tzX3RhYmxlOworCisJc29mdF9taW5fbGV2ZWwgPSBtYXNrID8gKGZmcyhtYXNrKSAtIDEp
IDogMDsKKwlzb2Z0X21heF9sZXZlbCA9IG1hc2sgPyAoZmxzKG1hc2spIC0gMSkgOiAwOworCisJ
c3dpdGNoIChjbGtfdHlwZSkgeworCWNhc2UgU01VX0dGWENMSzoKKwljYXNlIFNNVV9TQ0xLOgor
CQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgU01VX0dGWENMSywgJm1pbl9mcmVx
LCAmbWF4X2ZyZXEpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwkJcmV0ID0gc211X3Nl
bmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19TZXRTb2Z0TWF4R2Z4Q2xrLCBtYXhf
ZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQlyZXQgPSBzbXVfc2VuZF9zbWNf
bXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldEhhcmRNaW5HZnhDbGssIG1pbl9mcmVxKTsK
KwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CltRdWFuLCBFdmFuXSBJdCBzZWVtcyB1c2VyIHJl
cXVlc3RlZCBzb2Z0X21pbl9sZXZlbCBhbmQgc29mdF9tYXhfbGV2ZWwgYXJlIGFjdHVhbGx5IG5v
dCBhcHBsaWVkLgpQbGVhc2UgdmVyaWZ5IHRoaXMgYnkgc2V0dGluZyAiIHBwX2RwbV9zY2xrIiBz
eXNmcyBpbnRlcmZhY2UuCisJCWJyZWFrOworCWNhc2UgU01VX1NPQ0NMSzoKKwkJR0VUX0RQTV9D
VVJfRlJFUShjbGtfdGFibGUsIGNsa190eXBlLCBzb2Z0X21pbl9sZXZlbCwgbWluX2ZyZXEpOwor
CQlHRVRfRFBNX0NVUl9GUkVRKGNsa190YWJsZSwgY2xrX3R5cGUsIHNvZnRfbWF4X2xldmVsLCBt
YXhfZnJlcSk7CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9N
U0dfU2V0U29mdE1heFNvY2Nsa0J5RnJlcSwgbWF4X2ZyZXEpOworCQlpZiAocmV0KQorCQkJcmV0
dXJuIHJldDsKKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01T
R19TZXRIYXJkTWluU29jY2xrQnlGcmVxLCBtaW5fZnJlcSk7CisJCWlmIChyZXQpCisJCQlyZXR1
cm4gcmV0OworCQlicmVhazsKKwljYXNlIFNNVV9NQ0xLOgorCWNhc2UgU01VX0ZDTEs6CisJCUdF
VF9EUE1fQ1VSX0ZSRVEoY2xrX3RhYmxlLCBjbGtfdHlwZSwgc29mdF9taW5fbGV2ZWwsIG1pbl9m
cmVxKTsKKwkJR0VUX0RQTV9DVVJfRlJFUShjbGtfdGFibGUsIGNsa190eXBlLCBzb2Z0X21heF9s
ZXZlbCwgbWF4X2ZyZXEpOworCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211
LCBTTVVfTVNHX1NldFNvZnRNYXhGY2xrQnlGcmVxLCBtYXhfZnJlcSk7CisJCWlmIChyZXQpCisJ
CQlyZXR1cm4gcmV0OworCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBT
TVVfTVNHX1NldEhhcmRNaW5GY2xrQnlGcmVxLCBtaW5fZnJlcSk7CisJCWlmIChyZXQpCisJCQly
ZXR1cm4gcmV0OworCisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWJyZWFrOworCX0KKworCXJldHVy
biByZXQ7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5vaXJfcHB0
X2Z1bmNzID0gewogCS5nZXRfc211X21zZ19pbmRleCA9IHJlbm9pcl9nZXRfc211X21zZ19pbmRl
eCwKIAkuZ2V0X3NtdV90YWJsZV9pbmRleCA9IHJlbm9pcl9nZXRfc211X3RhYmxlX2luZGV4LCBA
QCAtNDA0LDYgKzQ4NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyByZW5v
aXJfcHB0X2Z1bmNzID0gewogCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUgPSByZW5vaXJfZm9yY2Vf
ZHBtX2xpbWl0X3ZhbHVlLAogCS51bmZvcmNlX2RwbV9sZXZlbHMgPSByZW5vaXJfdW5mb3JjZV9k
cG1fbGV2ZWxzLAogCS5nZXRfd29ya2xvYWRfdHlwZSA9IHJlbm9pcl9nZXRfd29ya2xvYWRfdHlw
ZSwKKwkuZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayA9IHJlbm9pcl9nZXRfcHJvZmlsaW5nX2Nsa19t
YXNrLAorCS5mb3JjZV9jbGtfbGV2ZWxzID0gcmVub2lyX2ZvcmNlX2Nsa19sZXZlbHMsCiB9Owog
CiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQotLQoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
