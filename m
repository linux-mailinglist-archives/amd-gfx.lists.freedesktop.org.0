Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE8744BC
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 07:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA8A6E50B;
	Thu, 25 Jul 2019 05:11:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB66E4F4
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 05:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMhwvxMwmEvBqjK9+VEFFKod5R7ASIN64bCpv4A6nAQlo3nuCtHo8hlPvMH9bg9DqTHr05eEtwwFwGSoO8T6+FaVJlLG9iRj1QUT7y6c8ZXw7wbOfRhbrTezwfoB3GERqc8ehDQzZrGckuXdS5XbX8s7Bpv30cb5HMOOUldyjGZl+CsBkhaW8jzvyorv+IvG6VmYC8Y+opqfDFO9Xw45VAJ0qJnNpxqjtilw7lLG2kU3X9SEt7sn5NQziD1d/R1vQ9s0Lh3Cz+4cEkuMrKAruvOwI7z6HBcK/poIP+nP5fEqt5ySUnWB4vjxnnvD3y8W9EY12AgubbeB8l9JhLl9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d6xPdpTY5nnze7JP6WnxCKHEImRc08K4T7Ah7L7Svg=;
 b=XiH5gJVYwzqYsa5I9WqbJWf5bau77rVtzUic3nTmqFF8Vr1e06jPoWaAxID4R6o2vrVQ2BNXGNept93rJpd3gW6veAwuNikkwqBytaKOQPJCAgIfnf8Gl9et2LAnyxBXhK4l+FtvnXpuYN7lFjzFeIks9t1lNhj4ULR9O+MqCoz4OIvjsBZ59OuKJK5uAqkUYl9wSzt1DT1x5NUPeI3spfnf9Y8L8Wq/+crlTR+j6QFubM7Xl19doFP+SS9cUWvnwwD7mo1cujZaMWT6LYhFR5nRUxHZYJ6693ooAUKq6P7HrFiSWc3oivYLmNTglDeqJqFiE599Vh79Xc/sxKQjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 05:11:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 05:11:16 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
Thread-Topic: [PATCH 3/5] drm/amd/powerplay: add smu feature name support
Thread-Index: AQHVQqdivVW7YjiD6UGydXCZkTj2pw==
Date: Thu, 25 Jul 2019 05:11:16 +0000
Message-ID: <20190725051057.28862-3-kevin1.wang@amd.com>
References: <20190725051057.28862-1-kevin1.wang@amd.com>
In-Reply-To: <20190725051057.28862-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b615a59a-2483-4c1c-d530-08d710be852a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-microsoft-antispam-prvs: <MN2PR12MB34401BCF2FAFADE57BCCE116A2C10@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:462;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(189003)(2501003)(6916009)(6512007)(478600001)(2906002)(81166006)(81156014)(14454004)(66066001)(68736007)(8936002)(53936002)(446003)(186003)(6506007)(7736002)(50226002)(52116002)(66446008)(86362001)(305945005)(5640700003)(2616005)(6436002)(6486002)(4326008)(1076003)(26005)(386003)(476003)(11346002)(3846002)(71190400001)(256004)(6116002)(54906003)(71200400001)(2351001)(76176011)(5660300002)(25786009)(36756003)(316002)(486006)(66476007)(8676002)(66556008)(64756008)(99286004)(102836004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /tOYqsDewrWzbBxEq8ACdI2BKnPuNMaQ/5jqYCwZ04GmXkTCQlKmudbZ2vX8zbOJLbL+swmf8HIQ0fGDA1Ha4jGxhYVmhPlfsrg8oWhMEJ3++QCAf9ZofJ0rckf6ohkEG+WRhB4IWmDaKVYCIU/fWS7PTQJpm/v5Ubiv+PZDf6oqTA6hIGN7g9h3SJcX/kdTM9W1+1CwCoybVvQhSQll1mUGRYluup1dTKNMh1EbKr9UaYO6f7AKJTKaQMeWYXWqfZCU+rNdwBxPrM7kA/ivOrTRQD5XUXEnz8xr6ta+BdbHlig24YQU0mpkjimAwWwKg3Ox9Ei5WwvKiY5jB5JUnwZBdz1TKcbw7QTLPJv6ohMGT2/PCuPSD2VuVqMH+RDEcT21MVpgCUyGjnjHFnFsb0B3T4YVADl4BkEdxjntey8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b615a59a-2483-4c1c-d530-08d710be852a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 05:11:16.2030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d6xPdpTY5nnze7JP6WnxCKHEImRc08K4T7Ah7L7Svg=;
 b=T7xVZIB6VoMshWe8+5tGElGspCOnRWPxi35tYRg+zs8TrTulfewLu+XL/qxfBMasg0O1Ju4rFjEJGB79d9/f4gw/GHjJUg27OD281qEveowjWrOV3MVDl84hnS3fkaSDcyuXG/dvqarfDpFHxlkYy1D1zJZ6VtnsQHxOfE1n3Ug=
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

YWRkIHNtdV9nZXRfZmVhdHVyZV9uYW1lIHN1cHBvcnQgaW4gc211LgoKU2lnbmVkLW9mZi1ieTog
S2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCAgMTMgKysrCiAuLi4vZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oIHwgMTA5ICsrKysrKysrKy0tLS0tLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNDYwNGI2YWY1NmJiLi44NTYz
ZjkwODNmNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
QEAgLTQyLDYgKzQyLDE5IEBAIGNvbnN0IGNoYXIgKnNtdV9nZXRfbWVzc2FnZV9uYW1lKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9tZXNzYWdlX3R5cGUKIAlyZXR1cm4gX19zbXVf
bWVzc2FnZV9uYW1lc1t0eXBlXTsKIH0KIAorI3VuZGVmIF9fU01VX0RVTU1ZX01BUAorI2RlZmlu
ZSBfX1NNVV9EVU1NWV9NQVAoZmVhKQkjZmVhCitzdGF0aWMgY29uc3QgY2hhciogX19zbXVfZmVh
dHVyZV9uYW1lc1tdID0geworCVNNVV9GRUFUVVJFX01BU0tTCit9OworCitjb25zdCBjaGFyICpz
bXVfZ2V0X2ZlYXR1cmVfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVh
dHVyZV9tYXNrIGZlYXR1cmUpCit7CisJaWYgKGZlYXR1cmUgPCAwIHx8IGZlYXR1cmUgPiBTTVVf
RkVBVFVSRV9DT1VOVCkKKwkJcmV0dXJuICJ1bmtub3cgc211IGZlYXR1cmUiOworCXJldHVybiBf
X3NtdV9mZWF0dXJlX25hbWVzW2ZlYXR1cmVdOworfQorCiBpbnQgc211X2dldF9zbWNfdmVyc2lv
bihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKmlmX3ZlcnNpb24sIHVpbnQzMl90
ICpzbXVfdmVyc2lvbikKIHsKIAlpbnQgcmV0ID0gMDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDAzNWY4NTc5MjJlYy4uYmEyMzg1MDI2
Yjg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmgKQEAgLTgwNSw1ICs4MDUsNiBAQCBpbnQgc211X2ZvcmNlX3BlcmZvcm1hbmNlX2xldmVsKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldgogaW50IHNtdV9z
ZXRfZGlzcGxheV9jb3VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgY291bnQp
OwogYm9vbCBzbXVfY2xrX2RwbV9pc19lbmFibGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBl
bnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSk7CiBjb25zdCBjaGFyICpzbXVfZ2V0X21lc3NhZ2Vf
bmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfbWVzc2FnZV90eXBlIHR5cGUp
OworY29uc3QgY2hhciAqc211X2dldF9mZWF0dXJlX25hbWUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIGVudW0gc211X2ZlYXR1cmVfbWFzayBmZWF0dXJlKTsKIAogI2VuZGlmCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmgKaW5kZXggZDQyZTM0MjRlNzA0
Li44NzkzYzhkMGRjNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9zbXVfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
c211X3R5cGVzLmgKQEAgLTE1NCw1OSArMTU0LDY0IEBAIGVudW0gc211X2Nsa190eXBlIHsKIAlT
TVVfQ0xLX0NPVU5ULAogfTsKIAorI2RlZmluZSBTTVVfRkVBVFVSRV9NQVNLUwkJCQlcCisgICAg
ICAgX19TTVVfRFVNTVlfTUFQKERQTV9QUkVGRVRDSEVSKSwJCQlcCisgICAgICAgX19TTVVfRFVN
TVlfTUFQKERQTV9HRlhDTEspLCAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9E
VU1NWV9NQVAoRFBNX1VDTEspLCAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01V
X0RVTU1ZX01BUChEUE1fU09DQ0xLKSwgICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19T
TVVfRFVNTVlfTUFQKERQTV9VVkQpLCAgICAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBf
X1NNVV9EVU1NWV9NQVAoRFBNX1ZDRSksICAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAg
IF9fU01VX0RVTU1ZX01BUChVTFYpLCAgICAgICAgICAgICAgICAgICAgICAgICAgIAlcCisgICAg
ICAgX19TTVVfRFVNTVlfTUFQKERQTV9NUDBDTEspLCAgICAgICAgICAgICAgICAgICAgCVwKKyAg
ICAgICBfX1NNVV9EVU1NWV9NQVAoRFBNX0xJTkspLCAgICAgICAgICAgICAgICAgICAgICAJXAor
ICAgICAgIF9fU01VX0RVTU1ZX01BUChEUE1fRENFRkNMSyksICAgICAgICAgICAgICAgICAgIAlc
CisgICAgICAgX19TTVVfRFVNTVlfTUFQKERTX0dGWENMSyksICAgICAgICAgICAgICAgICAgICAg
CVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoRFNfU09DQ0xLKSwgICAgICAgICAgICAgICAgICAg
ICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChEU19MQ0xLKSwgICAgICAgICAgICAgICAgICAg
ICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKFBQVCksICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoVERDKSwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChUSEVSTUFMKSwgICAgICAgICAgICAg
ICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKEdGWF9QRVJfQ1VfQ0cpLCAgICAg
ICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoUk0pLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChEU19EQ0VGQ0xLKSwgICAg
ICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKEFDREMpLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoVlIwSE9UKSwgICAg
ICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChWUjFIT1QpLCAg
ICAgICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKEZXX0NURiks
ICAgICAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoTEVEX0RJ
U1BMQVkpLCAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChGQU5f
Q09OVFJPTCksICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKEdG
WF9FREMpLCAgICAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAo
R0ZYT0ZGKSwgICAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01B
UChDRyksICAgICAgICAgICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlf
TUFQKERQTV9GQ0xLKSwgICAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1N
WV9NQVAoRFNfRkNMSyksICAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RV
TU1ZX01BUChEU19NUDFDTEspLCAgICAgICAgICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVf
RFVNTVlfTUFQKERTX01QMENMSyksICAgICAgICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NN
VV9EVU1NWV9NQVAoWEdNSSksICAgICAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9f
U01VX0RVTU1ZX01BUChEUE1fR0ZYX1BBQ0UpLCAgICAgICAgICAgICAgICAgIAlcCisgICAgICAg
X19TTVVfRFVNTVlfTUFQKE1FTV9WRERDSV9TQ0FMSU5HKSwgICAgICAgICAgICAgCVwKKyAgICAg
ICBfX1NNVV9EVU1NWV9NQVAoTUVNX01WRERfU0NBTElORyksICAgICAgICAgICAgICAJXAorICAg
ICAgIF9fU01VX0RVTU1ZX01BUChEU19VQ0xLKSwgICAgICAgICAgICAgICAgICAgICAgIAlcCisg
ICAgICAgX19TTVVfRFVNTVlfTUFQKEdGWF9VTFYpLCAgICAgICAgICAgICAgICAgICAgICAgCVwK
KyAgICAgICBfX1NNVV9EVU1NWV9NQVAoRldfRFNUQVRFKSwgICAgICAgICAgICAgICAgICAgICAJ
XAorICAgICAgIF9fU01VX0RVTU1ZX01BUChCQUNPKSwgICAgICAgICAgICAgICAgICAgICAgICAg
IAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKFZDTl9QRyksICAgICAgICAgICAgICAgICAgICAg
ICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoSlBFR19QRyksICAgICAgICAgICAgICAgICAg
ICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChVU0JfUEcpLCAgICAgICAgICAgICAgICAg
ICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKFJTTVVfU01OX0NHKSwgICAgICAgICAg
ICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoQVBDQ19QTFVTKSwgICAgICAgICAg
ICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChHVEhSKSwgICAgICAgICAgICAg
ICAgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKEdGWF9EQ1MpLCAgICAgICAg
ICAgICAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoR0ZYX1NTKSwgICAgICAg
ICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChPVVRfT0ZfQkFORF9N
T05JVE9SKSwgICAgICAgICAgIAlcCisgICAgICAgX19TTVVfRFVNTVlfTUFQKFRFTVBfREVQRU5E
RU5UX1ZNSU4pLCAgICAgICAgICAgCVwKKyAgICAgICBfX1NNVV9EVU1NWV9NQVAoTU1IVUJfUEcp
LCAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01BUChBVEhVQl9Q
RyksICAgICAgICAgICAgICAgICAgICAgIAlcCisKKyN1bmRlZiBfX1NNVV9EVU1NWV9NQVAKKyNk
ZWZpbmUgX19TTVVfRFVNTVlfTUFQKGZlYXR1cmUpCVNNVV9GRUFUVVJFXyMjZmVhdHVyZSMjX0JJ
VAogZW51bSBzbXVfZmVhdHVyZV9tYXNrIHsKLQlTTVVfRkVBVFVSRV9EUE1fUFJFRkVUQ0hFUl9C
SVQsCi0JU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQsCi0JU01VX0ZFQVRVUkVfRFBNX1VDTEtf
QklULAotCVNNVV9GRUFUVVJFX0RQTV9TT0NDTEtfQklULAotCVNNVV9GRUFUVVJFX0RQTV9VVkRf
QklULAotCVNNVV9GRUFUVVJFX0RQTV9WQ0VfQklULAotCVNNVV9GRUFUVVJFX1VMVl9CSVQsCi0J
U01VX0ZFQVRVUkVfRFBNX01QMENMS19CSVQsCi0JU01VX0ZFQVRVUkVfRFBNX0xJTktfQklULAot
CVNNVV9GRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCwKLQlTTVVfRkVBVFVSRV9EU19HRlhDTEtfQklU
LAotCVNNVV9GRUFUVVJFX0RTX1NPQ0NMS19CSVQsCi0JU01VX0ZFQVRVUkVfRFNfTENMS19CSVQs
Ci0JU01VX0ZFQVRVUkVfUFBUX0JJVCwKLQlTTVVfRkVBVFVSRV9URENfQklULAotCVNNVV9GRUFU
VVJFX1RIRVJNQUxfQklULAotCVNNVV9GRUFUVVJFX0dGWF9QRVJfQ1VfQ0dfQklULAotCVNNVV9G
RUFUVVJFX1JNX0JJVCwKLQlTTVVfRkVBVFVSRV9EU19EQ0VGQ0xLX0JJVCwKLQlTTVVfRkVBVFVS
RV9BQ0RDX0JJVCwKLQlTTVVfRkVBVFVSRV9WUjBIT1RfQklULAotCVNNVV9GRUFUVVJFX1ZSMUhP
VF9CSVQsCi0JU01VX0ZFQVRVUkVfRldfQ1RGX0JJVCwKLQlTTVVfRkVBVFVSRV9MRURfRElTUExB
WV9CSVQsCi0JU01VX0ZFQVRVUkVfRkFOX0NPTlRST0xfQklULAotCVNNVV9GRUFUVVJFX0dGWF9F
RENfQklULAotCVNNVV9GRUFUVVJFX0dGWE9GRl9CSVQsCi0JU01VX0ZFQVRVUkVfQ0dfQklULAot
CVNNVV9GRUFUVVJFX0RQTV9GQ0xLX0JJVCwKLQlTTVVfRkVBVFVSRV9EU19GQ0xLX0JJVCwKLQlT
TVVfRkVBVFVSRV9EU19NUDFDTEtfQklULAotCVNNVV9GRUFUVVJFX0RTX01QMENMS19CSVQsCi0J
U01VX0ZFQVRVUkVfWEdNSV9CSVQsCi0JU01VX0ZFQVRVUkVfRFBNX0dGWF9QQUNFX0JJVCwKLQlT
TVVfRkVBVFVSRV9NRU1fVkREQ0lfU0NBTElOR19CSVQsCi0JU01VX0ZFQVRVUkVfTUVNX01WRERf
U0NBTElOR19CSVQsCi0JU01VX0ZFQVRVUkVfRFNfVUNMS19CSVQsCi0JU01VX0ZFQVRVUkVfR0ZY
X1VMVl9CSVQsCi0JU01VX0ZFQVRVUkVfRldfRFNUQVRFX0JJVCwKLQlTTVVfRkVBVFVSRV9CQUNP
X0JJVCwKLQlTTVVfRkVBVFVSRV9WQ05fUEdfQklULAotCVNNVV9GRUFUVVJFX0pQRUdfUEdfQklU
LAotCVNNVV9GRUFUVVJFX1VTQl9QR19CSVQsCi0JU01VX0ZFQVRVUkVfUlNNVV9TTU5fQ0dfQklU
LAotCVNNVV9GRUFUVVJFX0FQQ0NfUExVU19CSVQsCi0JU01VX0ZFQVRVUkVfR1RIUl9CSVQsCi0J
U01VX0ZFQVRVUkVfR0ZYX0RDU19CSVQsCi0JU01VX0ZFQVRVUkVfR0ZYX1NTX0JJVCwKLQlTTVVf
RkVBVFVSRV9PVVRfT0ZfQkFORF9NT05JVE9SX0JJVCwKLQlTTVVfRkVBVFVSRV9URU1QX0RFUEVO
REVOVF9WTUlOX0JJVCwKLQlTTVVfRkVBVFVSRV9NTUhVQl9QR19CSVQsCi0JU01VX0ZFQVRVUkVf
QVRIVUJfUEdfQklULAorCVNNVV9GRUFUVVJFX01BU0tTCiAJU01VX0ZFQVRVUkVfQ09VTlQsCiB9
OwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
