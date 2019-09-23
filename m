Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9695BAFD5
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274C06E231;
	Mon, 23 Sep 2019 08:43:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680063.outbound.protection.outlook.com [40.107.68.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21C6E231
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNmGEWe8zCT1PXJIkTguvF74dpknJ9gjeAfCAiEF3D01w+RRAfVjBH6G/OMyyqb6ejit9DOnAJ9joNxvHERw5jpvKN40TXJ7wXudJlQzRiXxRtLDHqEhfUDeg0MOtSkI4f9GZ5xwb8ehvkQmmy+lZfC8/oiU5lV+Od6kvzEsGTK46mCBMx5+DhswI6IGgEaRdHoO5+dfXJZ3N3s371H3pOSrJyGafNEkaPZ6JnVUc0vjCbszJ2WcJ6CW60H095ypel+mWWF1GzkXJ/ZkAK2sHo8KE3UYBdYCOnZzx00KgUQFbBAR9sc3HsBmzxMVyiBe8fXrn05qvk0oE2UiH3Detg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePTiTdJ79+AAOpZ6kBFThb7GfCkgBo+BZgSzXiuwboQ=;
 b=j9uX0v8JoDwnqzcFm4Hiqqi/24ggEfRYOZuQ/kfvZpoRob7pDirEIlqMoKKfxEwq2I047F13g83o/Xn+g17ekC7pwvLuPNaLdG1ugnQEp1EQa6XvtNpIZmOegdXDLQhQV/jDlXILRNU1WXHjByo6nT1WCQP4Z4JeUzj+akZM+j3emEyAIMu4F3DdDU/EqhzATOGrWFBEj5qfiRweIRMK2QTpgy5k8mlyeFf3jhJxcFvgCykt+0vE0IGwsrCqHWUPRo+F+ZCHnG4YDdwaWyzVmBjMt21d8IW2oD5w8PLswyZd4lgdWq6ZVrYJccodwZGHZ3gGl4YNEVq5b6b0iA50Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4078.namprd12.prod.outlook.com (52.135.51.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 08:43:08 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:43:08 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Topic: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Index: AQHVcersfkDnOdQw0U2KY3So/ByJ0g==
Date: Mon, 23 Sep 2019 08:43:08 +0000
Message-ID: <1569228167-3120-2-git-send-email-Prike.Liang@amd.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bd2231c-f921-43be-d40d-08d740020f0d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4078; 
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40782D074D4DC602AABC22F8FB850@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(6436002)(36756003)(478600001)(316002)(14454004)(86362001)(66946007)(66476007)(71200400001)(71190400001)(66066001)(64756008)(66446008)(26005)(7736002)(305945005)(3846002)(6116002)(5640700003)(256004)(14444005)(66556008)(6512007)(6916009)(486006)(186003)(76176011)(6486002)(2501003)(2906002)(386003)(6506007)(99286004)(4326008)(2616005)(8676002)(8936002)(102836004)(54906003)(11346002)(476003)(52116002)(446003)(50226002)(81166006)(81156014)(5660300002)(2351001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4078;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6ldZvQQ5k38yOOMOExoWvTV8ilR8Nagf7Px/eLIhXHrFK42UE67HPf9xcHInzn63GQW3qFUmw0q9llaSy39+fmpuID/GpnMVPFodM2rKZ03Dl5U2/QJHF4rmLO1xoYVHbAa1UGL8PTQq0xq9fe9U4t/bTWIGckQXo3CFHfpYHXkyrfLUau3e5ywkU0Qa+lTDscD8MJFDukpCPtcmIDiSNpDvOyOIaPx69POWOcZ4WcFzAtfncvc6MY+jcW+9qApplkyFyrWlx3yympxsW6behq7aGoDEx6/3fBo555ViDF2UiAPGuLn+Evp9yp/YA4+9UQtLiMk2kd384ZsSg7bRxpGyFdbQjipMDBSW4quWhRVdtKTiYt7M2vLb7AUjoyJQte1PwD4LQmbt5ldRuDwilDKBi8pjIE3MgjeB13ZhcDg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd2231c-f921-43be-d40d-08d740020f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:43:08.5199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leWxakXeu7UK0nV4C57mWWPLK7vKnQN7oWUOwGOHZg37IAOatLUBdgLhMXvVWNlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePTiTdJ79+AAOpZ6kBFThb7GfCkgBo+BZgSzXiuwboQ=;
 b=4HDKgWSeRZcoI/8c3Y/HbtYprwvKi0w4z3OM7dI2FnzK2V4HtA+bKZzlkIGNi/DmKT5Bbal1VQXYFh7HsDuOLc54SFoGYwpQo2HkUxbniVzn2Yfd7PmnylbYzbhD7GWP6X5AO7nKnoOSNSlrI8/PS0ZErOy0bJNlBfYGB/rbpCg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
 "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhdCdzIGJhc2UgZnVuY3Rpb24gZm9yIGZvcmNpbmcgYW5kIHVuZm9yY2luZyBkcG0gbGltaXQg
dmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgfCA2MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3Bw
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCmluZGV4IDkz
MTFiNmEuLjRiYjdlMWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMKQEAgLTMwNCw2ICszMDQsNjYgQEAgc3RhdGljIGludCByZW5vaXJfZHBtX3NldF91dmRf
ZW5hYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSkKIAlyZXR1cm4gcmV0
OwogfQogCitzdGF0aWMgaW50IHJlbm9pcl9mb3JjZV9kcG1fbGltaXRfdmFsdWUoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgaGlnaGVzdCkKK3sKKwlpbnQgcmV0ID0gMCwgaSA9IDA7CisJ
dWludDMyX3QgbWluX2ZyZXEsIG1heF9mcmVxLCBmb3JjZV9mcmVxOworCWVudW0gc211X2Nsa190
eXBlIGNsa190eXBlOworCisJZW51bSBzbXVfY2xrX3R5cGUgY2xrc1tdID0geworCQlTTVVfR0ZY
Q0xLLAorCQlTTVVfTUNMSywKKwkJU01VX1NPQ0NMSywKKwl9OworCisJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUoY2xrcyk7IGkrKykgeworCQljbGtfdHlwZSA9IGNsa3NbaV07CisJCXJldCA9
IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBjbGtfdHlwZSwgJm1pbl9mcmVxLCAmbWF4X2Zy
ZXEpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQlmb3JjZV9mcmVxID0gaGlnaGVz
dCA/IG1heF9mcmVxIDogbWluX2ZyZXE7CisJCXJldCA9IHNtdV9zZXRfc29mdF9mcmVxX3Jhbmdl
KHNtdSwgY2xrX3R5cGUsIGZvcmNlX2ZyZXEsIGZvcmNlX2ZyZXEpOworCQlpZiAocmV0KQorCQkJ
cmV0dXJuIHJldDsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgaW50IHJlbm9pcl91
bmZvcmNlX2RwbV9sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIHsKKworCWludCByZXQg
PSAwLCBpID0gMDsKKwl1aW50MzJfdCBtaW5fZnJlcSwgbWF4X2ZyZXE7CisJZW51bSBzbXVfY2xr
X3R5cGUgY2xrX3R5cGU7CisKKwlzdHJ1Y3QgY2xrX2ZlYXR1cmVfbWFwIHsKKwkJZW51bSBzbXVf
Y2xrX3R5cGUgY2xrX3R5cGU7CisJCXVpbnQzMl90CWZlYXR1cmU7CisJfSBjbGtfZmVhdHVyZV9t
YXBbXSA9IHsKKwkJe1NNVV9HRlhDTEssIFNNVV9GRUFUVVJFX0RQTV9HRlhDTEtfQklUfSwKKwkJ
e1NNVV9NQ0xLLCAgIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVH0sCisJCXtTTVVfU09DQ0xLLCBT
TVVfRkVBVFVSRV9EUE1fU09DQ0xLX0JJVH0sCisJfTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGNsa19mZWF0dXJlX21hcCk7IGkrKykgeworCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2Vu
YWJsZWQoc211LCBjbGtfZmVhdHVyZV9tYXBbaV0uZmVhdHVyZSkpCisJCSAgICBjb250aW51ZTsK
KworCQljbGtfdHlwZSA9IGNsa19mZWF0dXJlX21hcFtpXS5jbGtfdHlwZTsKKworCQlyZXQgPSBz
bXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgY2xrX3R5cGUsICZtaW5fZnJlcSwgJm1heF9mcmVx
KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0ID0gc211X3NldF9zb2Z0X2Zy
ZXFfcmFuZ2Uoc211LCBjbGtfdHlwZSwgbWluX2ZyZXEsIG1heF9mcmVxKTsKKwkJaWYgKHJldCkK
KwkJCXJldHVybiByZXQ7CisJfQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0
cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdldF9zbXVfbXNnX2lu
ZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LAogCS5nZXRfc211X3RhYmxlX2luZGV4ID0g
cmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsCkBAIC0zMTMsNiArMzczLDggQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLnByaW50X2Ns
a19sZXZlbHMgPSByZW5vaXJfcHJpbnRfY2xrX2xldmVscywKIAkuZ2V0X2N1cnJlbnRfcG93ZXJf
c3RhdGUgPSByZW5vaXJfZ2V0X2N1cnJlbnRfcG93ZXJfc3RhdGUsCiAJLmRwbV9zZXRfdXZkX2Vu
YWJsZSA9IHJlbm9pcl9kcG1fc2V0X3V2ZF9lbmFibGUsCisJLmZvcmNlX2RwbV9saW1pdF92YWx1
ZSA9IHJlbm9pcl9mb3JjZV9kcG1fbGltaXRfdmFsdWUsCisJLnVuZm9yY2VfZHBtX2xldmVscyA9
IHJlbm9pcl91bmZvcmNlX2RwbV9sZXZlbHMsCiB9OwogCiB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1
bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
