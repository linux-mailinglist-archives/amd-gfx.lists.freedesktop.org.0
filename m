Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C81BAFD8
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540246E25B;
	Mon, 23 Sep 2019 08:43:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBB66E25A
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhST6mwscFl9IsVK1Rq7wYuYzPpiQdgTXSfW6VnM3+wYOzqZEdtZADn7snhz7N5n32ah8D73Xp7F0zDEMLqgqMmls6kZ7CYPmblAHy6r3zvrSBZUX13Ydzriin+GBdIvL363NuLoRnsDIdenQ9BMrRds5wiQdZvHuJrmV6zOh7LAGLLi6WAiuGij3q4AGyqi8k3G6QjKi1aIPUuS2regYB0F4lwrFDfh/CVrDx7O4qO/qCiglVMoYh5B7jEIIfJvA5u8NBnJKrUbz9QuQ5TKFcDLamfN1Kwv1oCkm8qqh3AQknBbWVKu8ScM3Heax8cnAupuFfBkzkAj4Eoxul/6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdonEzWhNOjcd6PhYIi4zLSfFEHCgEV8lcDRvnyjRGY=;
 b=XKKWp6kBct0XdOBBLj86KgGKG7Gg4BLFw73lmxV9ktdhh2rgVDcT+oCY+wTkx4ILDsFMzTLAWdUTQb4iBxUfiKCN2hq4i0vvpYKCnRgVDwVwKlhj5nRyAkokln25489TeATL5+Ejld3A4PxykE89KSdTFMhX3MSh4MoXekXHgCQAtpbaFA1ESH+TENZEN/rkVMU8Q9zVrlYyi0BzEPLqccsJWhtCcQP3dO1cFWeUU1/twu1zWffUROfU5rXLAFLVDFMCkNUmdS1L9QH7nYdXvmurvxsuURSnX7CdySExVCvHaJvjHBMHxlE2aP1Dgs319XIPbs5VEV7uoeKWaPTqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4078.namprd12.prod.outlook.com (52.135.51.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 08:43:17 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:43:17 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: implement interface
 set_power_profile_mode()
Thread-Index: AQHVcerxBgfT7Ttf8U2o09TutIVKeQ==
Date: Mon, 23 Sep 2019 08:43:17 +0000
Message-ID: <1569228167-3120-5-git-send-email-Prike.Liang@amd.com>
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
x-ms-office365-filtering-correlation-id: 99e14ccb-bca9-40c6-23f7-08d740021426
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4078; 
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB407899A6C57782DEA86A5049FB850@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(6436002)(36756003)(478600001)(316002)(14454004)(86362001)(66946007)(66476007)(71200400001)(71190400001)(66066001)(64756008)(66446008)(26005)(7736002)(305945005)(3846002)(6116002)(5640700003)(256004)(66556008)(6512007)(6916009)(486006)(186003)(76176011)(6486002)(2501003)(2906002)(386003)(6506007)(99286004)(4326008)(2616005)(8676002)(8936002)(102836004)(54906003)(11346002)(476003)(52116002)(446003)(50226002)(81166006)(81156014)(5660300002)(2351001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4078;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vwwg6IEp3ZKHGBxy4OjkvJIBPVIydkMJnOsATLCZsUa69ze9AnDnbdsdEwcPHY7PTjGlaxUoVyhEHzp+6M2WCe3ihhs/lZaHgEIAg+T5DBdnATUvHFI6fWb33mcTEJv9hGxxLlRZPAQ0/njyHwhhI9sQPpgPC1mp9i7YUn4Ies2Yd52kMHpTzZkHa+M0brr+xPlrw3qmi6Iav43xfiIEn8F/3jCJxia3+3MiQdYwoOdx2h/0ndrGH34KGUAQ0U294xfBN2bg+xCpGt5UeOAsc9puxDyrG5p7EkW6j9Wy4hCfQRuvC/PPNLw8T10z7QT0GIw5WymHpz3hFNS1PY5XokAqZcJdl5zwxdTyMxlENEM2RRwUzh4w0SGwRxK0GH4yVyYasA1vQJpf700Mt26hPPYhZktuSUVlG/1/u/LjZbs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e14ccb-bca9-40c6-23f7-08d740021426
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:43:17.1079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1oK6k3Xni1m9f02t7yavnW/bhlH7Zpd2Sku53Hk1QvkLucw/KVjORy8e3aAlhAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdonEzWhNOjcd6PhYIi4zLSfFEHCgEV8lcDRvnyjRGY=;
 b=Tqg3XA1MiPckOpDSkKFKr7mrVuSauSID+jKHT3ioeQPP8SCdSM5j6lZBg8UgMw6xkCQ1gcKotEhoFDR40SGK3sDGxFL3vkvqR4PcTxEGGuaQzaZAlnHUkxAPqG8TE5wHZsOFken8P4kc12k5xbW7rt6yufJJ2dp1CDCNHCl6sZg=
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

QWRkIHNldF9wb3dlcl9wcm9maWxlX21vZGUoKSBmb3Igbm9uZSBtYW51YWwgZHBtIGxldmVsIGNh
c2Ugc2V0dGluZyBwb3dlciBwcm9maWxlIG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFu
ZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9yZW5vaXJfcHB0LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jl
bm9pcl9wcHQuYwppbmRleCBjNmFhZTFjLi42ODE5NTE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC00NzMsNiArNDczLDMwIEBAIHN0YXRpYyBpbnQg
cmVub2lyX2ZvcmNlX2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJu
IHJldDsKIH0KIAorc3RhdGljIGludCByZW5vaXJfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwgbG9uZyAqaW5wdXQsIHVpbnQzMl90IHNpemUpCit7CisJaW50
IHdvcmtsb2FkX3R5cGU7CisKKwlzbXUtPnBvd2VyX3Byb2ZpbGVfbW9kZSA9IGlucHV0W3NpemVd
OworCisJaWYgKHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlID4gUFBfU01DX1BPV0VSX1BST0ZJTEVf
Q1VTVE9NKSB7CisJCXByX2VycigiSW52YWxpZCBwb3dlciBwcm9maWxlIG1vZGUgJWRcbiIsIHNt
dS0+cG93ZXJfcHJvZmlsZV9tb2RlKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJaWYgKHNt
dS0+cG93ZXJfcHJvZmlsZV9tb2RlID09IFBQX1NNQ19QT1dFUl9QUk9GSUxFX0NVU1RPTSkgewor
CQlpZiAoc2l6ZSA8IDApCisJCQlyZXR1cm4gLUVJTlZBTDsKKworCS8qIGNvbnYgUFBfU01DX1BP
V0VSX1BST0ZJTEUqIHRvIFdPUktMT0FEX1BQTElCXypfQklUICovCisJd29ya2xvYWRfdHlwZSA9
IHNtdV93b3JrbG9hZF9nZXRfdHlwZShzbXUsIHNtdS0+cG93ZXJfcHJvZmlsZV9tb2RlKTsKKwlz
bXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldFdvcmtsb2FkTWFzaywK
KwkJCQkgICAgMSA8PCB3b3JrbG9hZF90eXBlKTsKKwl9CisJcmV0dXJuIDA7Cit9CisKKwogc3Rh
dGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7CiAJLmdl
dF9zbXVfbXNnX2luZGV4ID0gcmVub2lyX2dldF9zbXVfbXNnX2luZGV4LAogCS5nZXRfc211X3Rh
YmxlX2luZGV4ID0gcmVub2lyX2dldF9zbXVfdGFibGVfaW5kZXgsCkBAIC00ODcsNiArNTExLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7
CiAJLmdldF93b3JrbG9hZF90eXBlID0gcmVub2lyX2dldF93b3JrbG9hZF90eXBlLAogCS5nZXRf
cHJvZmlsaW5nX2Nsa19tYXNrID0gcmVub2lyX2dldF9wcm9maWxpbmdfY2xrX21hc2ssCiAJLmZv
cmNlX2Nsa19sZXZlbHMgPSByZW5vaXJfZm9yY2VfY2xrX2xldmVscywKKwkuc2V0X3Bvd2VyX3By
b2ZpbGVfbW9kZSA9IHJlbm9pcl9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlLAogfTsKIAogdm9pZCBy
ZW5vaXJfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
