Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B9CBAFD4
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D746E222;
	Mon, 23 Sep 2019 08:43:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680066.outbound.protection.outlook.com [40.107.68.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20B6E222
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWfTbCVGhaPZSMcJxDxSJkhguB90RPWvcR6aFKEpPeRffGJkLqS45ZNwQpD9j3k1TqQnqAXdcPrT1moAkFlJxgY6YmUZdzXvsbhdvSpV57/2NWPzIgBpef7xhlbzTPVOaU9bxxERVm0l9OGmilFjzx3rcdKI9q/loUsXDTTrbSji7Nap9pJwvRExO4ye1KDiRSxqF4fBcws2uANkyf+N5X/JyvoM0DHearKLd+Hwv2m/k3nAaniuaDpECLBzBV/43+u2TEHeavK3lqjrJJmklmB7ZuHfDTha2VhwDe1a0rc6JaWKg+JTxHbuxwVxCCIjeN16LpVAuFI3prGlKXD8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBdPB6lcFfRmmRUDuOZVtrwek2zCke/fwyBWPy5J0Is=;
 b=O17InyWgcyanbYZjXdioHeehvSWsNPdDiV+UKvZNWrKcaOUIdf4WcCf1abI+ov0vLDUgfCoc9aCsPdAD3Uk7O2wsIiTkEOWq0xRSpSzGRs+fgc/sGVQZchk4JlZ49EueU7AVF24VG9y9/0qbg60Z66I3z+BazhqjyrXhZBmfTwCeA+jy9wVEgw3jCQTkB8mY77qzFEn5RrMhjsop3boIyBXEKBD46P0Y9nxegXBLwRFh87PQ42XEyKTR27Vi5vGLvGo/QYPK0pigUS1gMjsmsg4xddwozBHUmBatHDz4VxLi1lSelx8Jg6rOnT68q+my9V/Ma7VqgoZDiu5AOGSXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4078.namprd12.prod.outlook.com (52.135.51.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 08:43:05 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:43:05 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer check
 guard for some smu series
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Index: AQHVcerrubVMsKv0tUiXUT/VZyJqCw==
Date: Mon, 23 Sep 2019 08:43:05 +0000
Message-ID: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
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
x-ms-office365-filtering-correlation-id: abbd256d-3301-455e-7719-08d740020d58
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4078; 
x-ms-traffictypediagnostic: MN2PR12MB4078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4078AD972126437284A4BB16FB850@MN2PR12MB4078.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(6436002)(36756003)(478600001)(316002)(14454004)(86362001)(66946007)(66476007)(71200400001)(71190400001)(66066001)(64756008)(66446008)(26005)(7736002)(305945005)(3846002)(6116002)(5640700003)(256004)(14444005)(66556008)(6512007)(6916009)(486006)(186003)(6486002)(2501003)(2906002)(386003)(6506007)(99286004)(4326008)(2616005)(8676002)(8936002)(102836004)(54906003)(476003)(52116002)(50226002)(81166006)(81156014)(5660300002)(2351001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4078;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: okUbkQEGplHJyCWW49bCZLDUhqQIYjKhHLPtgDhfe7ovlg4m/SIzn881ASAIdKlku2MAXCQMTPDTKUxKrP1dQsZfFaskFCkATo2Pqlobj8bh/YeJPdU4rZzt8w19nxndDZBz0DJtrnlEMf7FdIaQKg4k2AestRWx/7O9WbhP9bV0Ah5zK7D2//sXeom6em4j9/w4iB+BukgVvsgFTz7TN5vLDG+zZO3O616xCPP88fFd4tuC+3OAuplK+UNxCaSI+2XIaXebfiqh7QLEtvpxWg9CBQ3dxpX2BrY8I1lvctXTwgbBS1vDjHxfZK0mWldZpvDK2f3tSBbQYTJTzks0xygLpPwXAdC747s6M3TikeMzcG//GV+srKg8LcDsYx+42q5BRNHABDhZwhn3SsEdd0E5wU9sVmeZYPL42UJmwe0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbd256d-3301-455e-7719-08d740020d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:43:05.6606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujKE8u35XjNaMn1q6s6LUIeUbOaUEkLek0cKg7+vVdfmTECE+LiIkLQnCWkmGTVv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBdPB6lcFfRmmRUDuOZVtrwek2zCke/fwyBWPy5J0Is=;
 b=zjurW8HDsluki1QA/N+Y/rpp2aVU3Zzjzt6wpZWEFqi/evk3HnyWdjN2OdLTWQOXHUh87LvS2lpoZWybeZRT1gUe/goshFOi/42NxMODD1URivk/Dw512CotcD4ShbQJLOoY8L5vTG8HmPtXVSNClQ9koM96M/HSlg3IFDRF+a4=
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

Rm9yIG5vdyBBUFUgaGFzIG5vIHNtdV9kcG1fY29udGV4dCBzdHJ1Y3R1cmUgZm9yIGNvbnRhaW5p
bmcgZGVmYXVsdC9jdXJyZW50IHJlbGF0ZWQgZHBtIHRhYmxlLAp0aHVzIHdpbGwgbm90IGluaXRp
YWxpemUgc211X2RwbV9jb250ZXh0IGFuZCBhdmlvZCBudWxsIHBvaW50ZXIgY2hlY2sgZ3VhcmQg
Zm9yIEFQVS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDEwICsr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDkwZmE0
NDQuLjNhZmQyY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKQEAgLTE1NTQsNyArMTU1NCw5IEBAIHN0YXRpYyBpbnQgc211X2VuYWJsZV91bWRfcHN0YXRl
KHZvaWQgKmhhbmRsZSwKIAogCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gKHN0cnVjdCBzbXVf
Y29udGV4dCopKGhhbmRsZSk7CiAJc3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbV9jdHgg
PSAmKHNtdS0+c211X2RwbSk7Ci0JaWYgKCFzbXUtPnBtX2VuYWJsZWQgfHwgIXNtdV9kcG1fY3R4
LT5kcG1fY29udGV4dCkKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsK
KworCWlmICghKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkgJiYgKCFzbXUtPnBtX2VuYWJsZWQg
fHwgIXNtdV9kcG1fY3R4LT5kcG1fY29udGV4dCkpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJaWYg
KCEoc211X2RwbV9jdHgtPmRwbV9sZXZlbCAmIHByb2ZpbGVfbW9kZV9tYXNrKSkgewpAQCAtMTc1
MSw4ICsxNzUzLDkgQEAgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBzbXVfZ2V0X3BlcmZvcm1h
bmNlX2xldmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogewogCXN0cnVjdCBzbXVfZHBtX2Nv
bnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOwogCWVudW0gYW1kX2RwbV9mb3Jj
ZWRfbGV2ZWwgbGV2ZWw7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7
CiAKLQlpZiAoIXNtdV9kcG1fY3R4LT5kcG1fY29udGV4dCkKKwlpZiAoIShhZGV2LT5mbGFncyAm
IEFNRF9JU19BUFUpICYmICFzbXVfZHBtX2N0eC0+ZHBtX2NvbnRleHQpCiAJCXJldHVybiAtRUlO
VkFMOwogCiAJbXV0ZXhfbG9jaygmKHNtdS0+bXV0ZXgpKTsKQEAgLTE3NjYsOCArMTc2OSw5IEBA
IGludCBzbXVfZm9yY2VfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2CiB7CiAJc3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211
X2RwbV9jdHggPSAmKHNtdS0+c211X2RwbSk7CiAJaW50IHJldCA9IDA7CisJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7CiAKLQlpZiAoIXNtdV9kcG1fY3R4LT5kcG1fY29u
dGV4dCkKKwlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpICYmICFzbXVfZHBtX2N0eC0+
ZHBtX2NvbnRleHQpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJcmV0ID0gc211X2VuYWJsZV91bWRf
cHN0YXRlKHNtdSwgJmxldmVsKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
