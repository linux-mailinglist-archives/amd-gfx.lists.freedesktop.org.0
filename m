Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D5A606D
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 07:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4D789998;
	Tue,  3 Sep 2019 05:16:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D889998
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 05:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm92Pem55rDXd1SaYAVJDSwTGjTEGiCNED+rjMsBqWMRvHNI9LYG8WaXpOvHJc6E/IXE16b6yQpqrbNVGAzCMmazAunTuJzy6DlEXpRLfaUbA1d8hmEuk3GF1N8OFD5BXy9/5lsQzL6bVGi9mBOu7Qx3W8K9I6ZauAa8GK0RQneCPHeGGoR7DfvagHFBa2oiwKVbOk5lsfDM1daXq142e2pRSVxULVk6sQeSTW/AvgNDUmreGGTJOxhcVjAxp9QSY+Qpt49v5cfmUbiNtIPK7Xdp5KIt6OUJiB4Kb8ebZ3XBDiehTbbXlwNd+VuRYOMmmtjzNdYgBQzANuwspi+ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAT/2A0mooJOb/bkUYrlvMzz02alQp+z5ISVAx/KIKY=;
 b=bZFX/+PE4QLJzCRbyaVj0foAbpBipX5NN4I12LNEbGgtL5SATikLi7mNm28puV/8vifyWLltf4d6iF//7bKe4OaLjmuXpBYNCP/kijDur5otcQ/cUJjBgwRxmC3wFQknnR7DPh4cKsFp4TK4KDPDjR2mhlslc4FbOB10oqyhqAI/S956G7TUWScIsUme2OUgUykL5wMRe1O4l/kqSGmINllpGqNXWI/twzwpyzYlnfzc35L6CxDH9OizFHk7m1jIzTr5Mwfw+CW8DkXowlNr74A7s1N4LVxYmAIlWivsz60L8wQVCB7RI4nUYh8TqmcrcO9TOSu0Aq3Kax/sNz92cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (52.132.141.166) by
 DM5PR12MB1401.namprd12.prod.outlook.com (10.168.235.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Tue, 3 Sep 2019 05:16:37 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::7927:e3a8:c4bd:2531]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::7927:e3a8:c4bd:2531%5]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 05:16:37 +0000
From: "Gui, Jack" <Jack.Gui@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: do proper cleanups on hw_fini
Thread-Topic: [PATCH] drm/amd/powerplay: do proper cleanups on hw_fini
Thread-Index: AQHVYgnVJlYcNsHbwkaZ7rqoIq5RdqcZaVPQ
Date: Tue, 3 Sep 2019 05:16:37 +0000
Message-ID: <DM5PR12MB2583BF7FB6A6C26295003C518BB90@DM5PR12MB2583.namprd12.prod.outlook.com>
References: <20190903034336.16005-1-evan.quan@amd.com>
In-Reply-To: <20190903034336.16005-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bd42088-e4b2-4b1e-43d2-08d7302de55a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1401; 
x-ms-traffictypediagnostic: DM5PR12MB1401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1401686CD39985E88393F85B8BB90@DM5PR12MB1401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:16;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(199004)(13464003)(189003)(6436002)(53936002)(6246003)(66066001)(2906002)(14444005)(256004)(33656002)(55016002)(9686003)(3846002)(64756008)(66446008)(6116002)(66946007)(66476007)(66556008)(229853002)(7696005)(76176011)(81166006)(81156014)(74316002)(316002)(7736002)(8676002)(305945005)(486006)(446003)(11346002)(476003)(102836004)(14454004)(26005)(76116006)(478600001)(2501003)(53546011)(6506007)(110136005)(4326008)(71200400001)(71190400001)(25786009)(99286004)(86362001)(186003)(8936002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1401;
 H:DM5PR12MB2583.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: deO0fd9O6K+CBsxF70jxwnzTJExblyiyG27sqpu62bld62ca3k+GOORMxhp8Les/4KyEetOKb6oB9+2tP8Mrl1hq/aaPI1fMXjvSkb0prgh8JIyGMh3oHGd5R+BKKmgXlaH01TRJCWhWUoPVrG0ll36izNlpOVljz5iVjknFUS2h+weXlCd44BB7E1uW3tTdt2bxO90sIBGO0hiIzC4L3cn4yBI0mHyy2A94y4He5OM0U79i4RhDXwLeXitpokQD2EivxE41lGN4bbKICZgQ+0aRdL5Ofe2XQ9j43XNWYBvxbfKMxstkH+2VJeDMn9R/RKb8QMJJ6PxoL5sA7a6Fbqy8julQ5aYYGzMk4v0dcvJYe/h1ZiD9ulcpOlVeEWEjxwtvU/jJEuqzCK1gntro6QFb727BD3TWZNm9FixKMuA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd42088-e4b2-4b1e-43d2-08d7302de55a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 05:16:37.3985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j/6v8E1CNyVia1F9PVG5eCTz313KQT8GwNPJSlYgf6VyGINZoi9QSj+xqYhrRSqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1401
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAT/2A0mooJOb/bkUYrlvMzz02alQp+z5ISVAx/KIKY=;
 b=4N9Zq5FtiVoiZx9gM2/gtk/vx6deKBrVRR4ZR+wxKtxa4DGK50YKgoYNs2kRA82Bkskzy5mdTFRSBhRbO3l+k301Krq0Ik4H/1KSvLPDxkvvrnnInbDbyEdWO1/LessO20odSDuTDgTj5AcWqedw8LqqDFjrw+IuMN4V52nNI8c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Gui@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEphY2sgR3VpIDxKYWNrLkd1aUBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KRnJvbTogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+IApTZW50OiBU
dWVzZGF5LCBTZXB0ZW1iZXIgMywgMjAxOSAxMTo0NCBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxpQGFtZC5jb20+OyBHdWksIEph
Y2sgPEphY2suR3VpQGFtZC5jb20+OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogZG8gcHJvcGVyIGNsZWFudXBzIG9uIGh3
X2ZpbmkKClRoZXNlIGFyZSBuZWVkZWQgZm9yIHNtdV9yZXNldCBzdXBwb3J0LgoKQ2hhbmdlLUlk
OiBJZjI5ZWRlNGI5OTc1OGFkYjA4ZmQ0ZTE2NjY1ZjQ0ZmQ4OTNlYzk5YgpTaWduZWQtb2ZmLWJ5
OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICAgfCAxNyArKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8ICAzICsrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgICB8IDEwICsrKysrKysrKysK
IDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBkNWVlMTNhNzhlYjcuLjNjZjhkOTQ0Zjg5MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTI4Niw2
ICsxMjg2LDExIEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCXJldHVy
biByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgc211X3N0b3BfZHBtcyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkgeworCXJldHVybiBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19EaXNhYmxlQWxs
U211RmVhdHVyZXMpOyB9CisKIHN0YXRpYyBpbnQgc211X2h3X2Zpbmkodm9pZCAqaGFuZGxlKQog
ewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICop
aGFuZGxlOyBAQCAtMTI5OCw2ICsxMzAzLDE4IEBAIHN0YXRpYyBpbnQgc211X2h3X2Zpbmkodm9p
ZCAqaGFuZGxlKQogCQlzbXVfcG93ZXJnYXRlX3ZjbigmYWRldi0+c211LCB0cnVlKTsKIAl9CiAK
KwlyZXQgPSBzbXVfc3RvcF90aGVybWFsX2NvbnRyb2woc211KTsKKwlpZiAocmV0KSB7CisJCXBy
X3dhcm4oIkZhaWwgdG8gc3RvcCB0aGVybWFsIGNvbnRyb2whXG4iKTsKKwkJcmV0dXJuIHJldDsK
Kwl9CisKKwlyZXQgPSBzbXVfc3RvcF9kcG1zKHNtdSk7CisJaWYgKHJldCkgeworCQlwcl93YXJu
KCJGYWlsIHRvIHN0b3AgRHBtcyFcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwogCWtmcmVlKHRh
YmxlX2NvbnRleHQtPmRyaXZlcl9wcHRhYmxlKTsKIAl0YWJsZV9jb250ZXh0LT5kcml2ZXJfcHB0
YWJsZSA9IE5VTEw7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1k
Z3B1X3NtdS5oCmluZGV4IGIxOTIyNGNiNmQ2ZC4uOGU0YjBhZDI0NzEyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKQEAgLTQ5OCw2ICs0OTgs
NyBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJaW50ICgqZ2V0X2N1cnJlbnRfY2xrX2ZyZXEpKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfaWQsIHVpbnQzMl90ICp2
YWx1ZSk7CiAJaW50ICgqaW5pdF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzKShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSk7CiAJaW50ICgqc3RhcnRfdGhlcm1hbF9jb250cm9sKShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSk7CisJaW50ICgqc3RvcF90aGVybWFsX2NvbnRyb2wpKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KTsKIAlpbnQgKCpyZWFkX3NlbnNvcikoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAogCQkJICAgdm9pZCAqZGF0YSwgdWludDMyX3Qg
KnNpemUpOwogCWludCAoKnNldF9kZWVwX3NsZWVwX2RjZWZjbGspKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MzJfdCBjbGspOyBAQCAtNjQ3LDYgKzY0OCw4IEBAIHN0cnVjdCBzbXVfZnVu
Y3MKIAkoKHNtdSktPnBwdF9mdW5jcy0+c2V0X3RoZXJtYWxfZmFuX3RhYmxlID8gKHNtdSktPnBw
dF9mdW5jcy0+c2V0X3RoZXJtYWxfZmFuX3RhYmxlKChzbXUpKSA6IDApICAjZGVmaW5lIHNtdV9z
dGFydF90aGVybWFsX2NvbnRyb2woc211KSBcCiAJKChzbXUpLT5mdW5jcy0+c3RhcnRfdGhlcm1h
bF9jb250cm9sPyAoc211KS0+ZnVuY3MtPnN0YXJ0X3RoZXJtYWxfY29udHJvbCgoc211KSkgOiAw
KQorI2RlZmluZSBzbXVfc3RvcF90aGVybWFsX2NvbnRyb2woc211KSBcCisJKChzbXUpLT5mdW5j
cy0+c3RvcF90aGVybWFsX2NvbnRyb2w/IAorKHNtdSktPmZ1bmNzLT5zdG9wX3RoZXJtYWxfY29u
dHJvbCgoc211KSkgOiAwKQogI2RlZmluZSBzbXVfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRh
dGEsIHNpemUpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+cmVhZF9zZW5zb3I/IChzbXUpLT5wcHRf
ZnVuY3MtPnJlYWRfc2Vuc29yKChzbXUpLCAoc2Vuc29yKSwgKGRhdGEpLCAoc2l6ZSkpIDogMCkg
ICNkZWZpbmUgc211X3NtY19yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSkgXCBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCBkYjVlOTRjZTU0
YWYuLjFhMzhhZjg0Mzk0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMKQEAgLTEyMDksNiArMTIwOSwxNSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zdGFydF90
aGVybWFsX2NvbnRyb2woc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJcmV0dXJuIHJldDsKIH0K
IAorc3RhdGljIGludCBzbXVfdjExXzBfc3RvcF90aGVybWFsX2NvbnRyb2woc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUpIHsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsK
KworCVdSRUczMl9TT0MxNShUSE0sIDAsIG1tVEhNX1RIRVJNQUxfSU5UX0VOQSwgMCk7CisKKwly
ZXR1cm4gMDsKK30KKwogc3RhdGljIHVpbnQxNl90IGNvbnZlcnRfdG9fdmRkYyh1aW50OF90IHZp
ZCkgIHsKIAlyZXR1cm4gKHVpbnQxNl90KSAoKDYyMDAgLSAodmlkICogMjUpKSAvIFNNVTExX1ZP
TFRBR0VfU0NBTEUpOyBAQCAtMTc4Myw2ICsxNzkyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
bXVfZnVuY3Mgc211X3YxMV8wX2Z1bmNzID0gewogCS5nZXRfY3VycmVudF9jbGtfZnJlcSA9IHNt
dV92MTFfMF9nZXRfY3VycmVudF9jbGtfZnJlcSwKIAkuaW5pdF9tYXhfc3VzdGFpbmFibGVfY2xv
Y2tzID0gc211X3YxMV8wX2luaXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2NrcywKIAkuc3RhcnRfdGhl
cm1hbF9jb250cm9sID0gc211X3YxMV8wX3N0YXJ0X3RoZXJtYWxfY29udHJvbCwKKwkuc3RvcF90
aGVybWFsX2NvbnRyb2wgPSBzbXVfdjExXzBfc3RvcF90aGVybWFsX2NvbnRyb2wsCiAJLnJlYWRf
c2Vuc29yID0gc211X3YxMV8wX3JlYWRfc2Vuc29yLAogCS5zZXRfZGVlcF9zbGVlcF9kY2VmY2xr
ID0gc211X3YxMV8wX3NldF9kZWVwX3NsZWVwX2RjZWZjbGssCiAJLmRpc3BsYXlfY2xvY2tfdm9s
dGFnZV9yZXF1ZXN0ID0gc211X3YxMV8wX2Rpc3BsYXlfY2xvY2tfdm9sdGFnZV9yZXF1ZXN0LAot
LQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
