Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905FBEAFD
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 05:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51BC6ECB9;
	Thu, 26 Sep 2019 03:50:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750047.outbound.protection.outlook.com [40.107.75.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F16ECB9
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 03:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjKsseVV/hQbfFBzJq9QrYGwGFwIszieT196nh/nh8ewxZ0f+WznCYfKXg9cs39SuWF32pAM8FX7fVJiyyjSElT9TpPZ/OaxsSOWyYDdvYEkhqoPc8IDIwA862+K4mBj992tL1BcXOpbDDh+EWoAN1uP1IoYD4kpR/anP+hL/sw3z/xcVkzEBbZT2zcfy0EZFiSnk1FY7bCqRQGdwLnrzDhNlPiNejqLlDLnAQWyXCR99def6+JknAglkQmKh6vN7W4Zfmp/h3IhQSvjRSE+rpoB6jKABVdSwo47O0TZHwyjZvRghqbWd4lu0nO4kl5BgU93tBlnQUyhCmD9uQVyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsu4JUkmmkx+tTllXEpkEcbQ1l41Ptuy9IlXI2U+jAE=;
 b=gbenBYXsw1HcfG6RYU+mJ+zT2BajZSMrRDKXHQt5Wedr7DjIUMd4b64qnspULzw4iiX3IpsU/Q6+ArSg2uhiCUW9mq90QwpbYWwl637SXgq379WNhxPQgo7/uIOTiHmIYSmSK3U8zenqBeFrTKiwKvGkMTaI6ZYRPXbt7Ab7t3BfIIru4RD36Fo9CnSJXclYkVgZ6/wj+24tYPf80EUo3of5GrFW8ZXQr1QHQun6GA+zif19oqpC1xNp+m9WoY85OUAQEpHci57ih5VgJ3lZTctqe/m5nFhYXyuTjk2LEOLHXuu87M1Vg/749AGz1Auch1F6VGWDG+sr2T0alNFnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3469.namprd12.prod.outlook.com (20.178.242.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:50:06 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 03:50:06 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Topic: [PATCH 3/8] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Index: AQHVdB18ftrRy27M1EuPZ9GDW8z8VQ==
Date: Thu, 26 Sep 2019 03:50:06 +0000
Message-ID: <1569469774-16813-3-git-send-email-Prike.Liang@amd.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3083ea66-3a34-4aba-53ae-08d742349e99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3469; 
x-ms-traffictypediagnostic: MN2PR12MB3469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3469D9A89CD959D9D19F7AE0FB860@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(316002)(256004)(2351001)(14444005)(476003)(7736002)(386003)(66556008)(64756008)(66946007)(305945005)(66476007)(478600001)(6486002)(86362001)(76176011)(5640700003)(2906002)(6436002)(52116002)(5660300002)(8936002)(26005)(54906003)(81156014)(11346002)(50226002)(486006)(8676002)(81166006)(66446008)(6506007)(102836004)(66066001)(71200400001)(6916009)(71190400001)(99286004)(3846002)(2616005)(446003)(4326008)(2501003)(6116002)(186003)(36756003)(14454004)(6512007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3469;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vo+sl3eAP9bcOmdxl6QdV9isgFgCHOLuUoFcE4rHXpE/MB/pQSnKq9siyZKVNQYaZj0FGVyc0BTX4JmBQiJP+r4h80kitjaQS4EMt08E3MZRE2jY9inEc0xL42qe+dnjRDz0BfGCW52G4IVFGq2CFJSDn+uzZ+s3qDgGLkIhmm+fiYpIGYamx748iuzEXYu8abv2JgqZcGiJrVbgUae3qeyS9h4JOSHiNsMOsnDtmkreKACXEfmFfjtGc2eVVSGhiCgv1iXsBn+9juPanC5ofKNV9aek6S2UrMhot+IlK42wdF7Ej/ywAo0fq3PRa1NqJwfHHwqj2M/jTp3eC+a529E8DpMutbBfsYpqhPsxS/SwcQWd5blf/+v9Ev1GR8Sd1IRM7t+Xgn+PofK7CPFYp3IifJ9xJ4n9Ix+x6JEP0uM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3083ea66-3a34-4aba-53ae-08d742349e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:50:06.4984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ticyJB/o56vSUx5EcynPBiHeL3d+9FjnyMQdKPHthtCma2Rj0yh7jwXlnkLRXJHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsu4JUkmmkx+tTllXEpkEcbQ1l41Ptuy9IlXI2U+jAE=;
 b=bnyUqtyjyRimdcxhDpCDPqsPofjoM1C3VyqkU2IkbwBmlQQxSoVIhmIoyxY7gEr4FF2wnTkA0kwbS9XrPM4lH3Ps9yYlHiNj/3e4jYj2eEAUTDA4OYjKnGmY5QPmj5WI4dmdfpbM1CP2HLvsmtiiqw8jypqCeZslr0NN8kgesE0=
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhdCdzIGJhc2UgZnVuY3Rpb24gZm9yIGZvcmNpbmcgYW5kIHVuZm9yY2luZyBkcG0gbGltaXQg
dmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgfCA2MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3Bw
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCmluZGV4IGE0
ZTQ0ZDMuLjhlYzM2NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMKQEAgLTMwNSw2ICszMDUsNjYgQEAgc3RhdGljIGludCByZW5vaXJfZHBtX3NldF91dmRf
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
cmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsCkBAIC0zMTQsNiArMzc0LDggQEAgc3RhdGljIGNv
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
