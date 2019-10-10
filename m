Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E24D29FA
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCB66EB22;
	Thu, 10 Oct 2019 12:48:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A80D6EB22
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 12:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE46ORUwwaJ6ZbMOyAvpzd0W4O8dVtnmG+SsHNJgbdXKDzbXl/dXFddfcaUjl/xhAoi9mn/HXM92bdrWXPmipmiGizlzSz6pg2XnYbEKrdgwoCg0OvAlYiUC1fo3RBV8Ly4d7UImlvj6GY1ZeNIAOJne4l0qJikOjANxTajiZHx5RMu7Na9J2zofuhdh/A/Lz8vUj7Q8RkaUS8qli2HnOLFBxNl7ZPEx3QWh8cKgSspa1qpHfQLAgSvO9P4TfNHDUg7hwyYCm3NnFciv4b1QlrHbIdX7XaDMyKAFihGMuMIebb10PgPgE90nR+Iez8Etdzt+bZDMHoV2KAHwB7p0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45BVT3woipsJzm+aQzvzH1D4a0sUL2NqybYQa116fBY=;
 b=JjCQl2isDPf+iDxfF+ATzgeWKZdZn9CeU1RnIgrAWMpWroidPh3Atp809kJuhnq8k7wIIybg7uniys6GZFKC+btKkvOsyHd859mlMCC3CAhWMj2daNwlmRq/oFnr0mLvW0wmMdCdZMsxsE0xfpOkwXLcqnTpNuiZpyO6NZPJhMQbtQrdD8CWWKB3r3FfJkPkSYJe15f1upfemupZl6c1StCkFC1usZVoZ4jbG3fvHUkRxmz+f67NVKHRc9iqyE2sxP3LhosG/xaxcGAJYPRDoi1ITZ3i9CTTMvbU0fZ0Hq1kBBS4FgYjqXzTTlq0J5BGyznIOro+uHUqI9SbASJ3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3554.namprd12.prod.outlook.com (20.178.209.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Thu, 10 Oct 2019 12:48:19 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 12:48:19 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top of
 VRAM
Thread-Topic: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
Thread-Index: AQHVf2j9PPq8LK37v0ODkpqUDKo3+Q==
Date: Thu, 10 Oct 2019 12:48:18 +0000
Message-ID: <20191010124757.17427-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73186984-34ad-42c4-703b-08d74d802023
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3554C9186DE73BEBBB659CDD89940@BN8PR12MB3554.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(199004)(189003)(2351001)(2501003)(81156014)(81166006)(6512007)(86362001)(50226002)(8936002)(6436002)(5660300002)(486006)(66946007)(36756003)(66556008)(66476007)(66446008)(3846002)(2616005)(6116002)(6486002)(54906003)(1076003)(476003)(64756008)(8676002)(6916009)(4326008)(99286004)(71190400001)(71200400001)(478600001)(25786009)(102836004)(2906002)(186003)(7736002)(5640700003)(66066001)(26005)(14454004)(386003)(52116002)(256004)(6506007)(305945005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3554;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5LBnWCAmXoH8ZC0DS3hCyyCiMdNLBugALaju6DYPI4awETZm6R3a7KfSnlywP1cFf92Kb86YO4rhBwWDQGqwj2p+ieDI6WRh83mhOXOKLJtwSYFmLKgz82HkB7Hbb9+WAu4yIsZh52OoBVMVnBx9/CiLSXvzddziu/mFBdeoFcZfp+Hx4rSW5yc0UtfhtqxgbjSPV8PvlLK/ZtQtXfzJ/fvLM+x8ymxMWJ0BHkeXs9XSDiJyuVTmVdNpHJISXt1rRjwm0gZAsVZVithDDd35/dsos2PwnUrdR4PrZn0tGk2NNNKhHRsNCkDc3GShOs0Zk2HLZ/5SY/XaPCu4ix1PGaGG/JFctJDz/MySguQmFIQMcmCqCtfnMbQCGluZ26sg3Yyn97BDv77oOTPgWhhx1yxIYcOAzSoZKahcU3jhTj8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73186984-34ad-42c4-703b-08d74d802023
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 12:48:18.8879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8H5aOyOulPpRjtlRp8IlcRdZGc9YfWTdP2glF8iDef4WP6RbX8qnvru54DfByhXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3554
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45BVT3woipsJzm+aQzvzH1D4a0sUL2NqybYQa116fBY=;
 b=i4npjdIkOAWT/TqMf/YZ4sFf+hc/s0WqqwvMXYhvdpi9gCZJ6noUZAROWjGRFi6hCsvshjvqRQfgyhli06zabjpJOalSdCfx4+fqZEktoUwA1JYu91sfHCofrnHBMOYcSr9GgNJnJgB5tZn2FIRJw6cRmRKJy6JOU/99t1VcWWQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SVAgRGlzY292ZXJ5IGRhdGEgaXMgVE1SIGZlbmNlZCBieSB0aGUgbGF0ZXN0IFBTUCBCTCwKc28g
d2UgbmVlZCB0byByZXNlcnZlIHRoaXMgcmVnaW9uLgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZ
dWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMgfCAxNSArKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggYmUwYjJjNjljMjIzLi42
Nzc1NjQ3ZjBiYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC04MTIsNiAr
ODEyLDcgQEAgc3RydWN0IGFtZGdwdV9kZXZpY2UgewogCXVpbnQ4X3QJCQkJKmJpb3M7CiAJdWlu
dDMyX3QJCQliaW9zX3NpemU7CiAJc3RydWN0IGFtZGdwdV9ibwkJKnN0b2xlbl92Z2FfbWVtb3J5
OworCXN0cnVjdCBhbWRncHVfYm8JCSpkaXNjb3ZlcnlfbWVtb3J5OwogCXVpbnQzMl90CQkJYmlv
c19zY3JhdGNoX3JlZ19vZmZzZXQ7CiAJdWludDMyX3QJCQliaW9zX3NjcmF0Y2hbQU1ER1BVX0JJ
T1NfTlVNX1NDUkFUQ0hdOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMK
aW5kZXggZWRmZmM4ODM1NDlhLi5jM2Q3ZWI2ODVhMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKQEAgLTE5NTUsNiArMTk1NSwxOCBAQCBpbnQgYW1kZ3B1X3R0bV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCSAgICBOVUxMLCAmc3RvbGVuX3Zn
YV9idWYpOwogCWlmIChyKQogCQlyZXR1cm4gcjsKKworCS8qCisJICogcmVzZXJ2ZSBvbmUgVE1S
ICg2NEspIG1lbW9yeSBhdCB0aGUgdG9wIG9mIFZSQU0gd2hpY2ggaG9sZHMKKwkgKiBJUCBEaXNj
b3ZlcnkgZGF0YSBhbmQgaXMgcHJvdGVjdGVkIGJ5IFBTUC4KKwkgKi8KKwlyID0gYW1kZ3B1X2Jv
X2NyZWF0ZV9rZXJuZWwoYWRldiwgNjQgPDwgMTAsIFBBR0VfU0laRSwKKwkJCQkgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKKwkJCQkgICAgJmFkZXYtPmRpc2NvdmVyeV9tZW1vcnksCisJCQkJ
ICAgIE5VTEwsIE5VTEwpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKwogCURSTV9JTkZPKCJhbWRn
cHU6ICV1TSBvZiBWUkFNIG1lbW9yeSByZWFkeVxuIiwKIAkJICh1bnNpZ25lZCkgKGFkZXYtPmdt
Yy5yZWFsX3ZyYW1fc2l6ZSAvICgxMDI0ICogMTAyNCkpKTsKIApAQCAtMjAyNCw2ICsyMDM2LDkg
QEAgdm9pZCBhbWRncHVfdHRtX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAl2b2lkICpzdG9sZW5fdmdhX2J1ZjsKIAkvKiByZXR1cm4gdGhlIFZHQSBzdG9sZW4gbWVtb3J5
IChpZiBhbnkpIGJhY2sgdG8gVlJBTSAqLwogCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+
c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsICZzdG9sZW5fdmdhX2J1Zik7CisKKwkvKiByZXR1cm4g
dGhlIElQIERpc2NvdmVyeSBUTVIgbWVtb3J5IGJhY2sgdG8gVlJBTSAqLworCWFtZGdwdV9ib19m
cmVlX2tlcm5lbCgmYWRldi0+ZGlzY292ZXJ5X21lbW9yeSwgTlVMTCwgTlVMTCk7CiB9CiAKIC8q
KgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
