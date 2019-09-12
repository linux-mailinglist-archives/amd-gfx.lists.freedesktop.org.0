Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C49B0795
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD986EB9A;
	Thu, 12 Sep 2019 04:12:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65BD6E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 02:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg80cTY7EXMvkBsl+5DAm7yyIVOxG3sTxL0zWvnTumq+muo21/1MowRi30i5MoNTEesx/hxRokiPaYsI6K8Cili15IzsGJ0PkYpNbVilToBL6aCeyTazcDLJIcexZZmDD/QkuLQL1iMWRk8aF1Zn3vcLdbRfc1hk/CLZYBnoJ77JYm4JwZ0Mqqp67vyIWaPAxfYISju6hVZbucHvGpK8uYWuDMrpaNKNB6cljgVc4ij/28knoamk+F1mR9+6ouNKGzHEKP/nYhWTZQuvpLEOPNaw/cnj/yXhSiFs68YjZ1QhpcxYaouGHGUO5uUoVJfPXf59ZsUnZcAlsmNSih0fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEn2ZozBhw6GWOnkkNTOjb2fr3bA8utqShbkfNH7JNA=;
 b=OrHGIBKVCn7xrvJoBKX5yYXe3HRdW1lQuoBJmMqCeWjysxRD0rLBib/4K/UCnxJ7WlmoE4bdIXqypVgsTxsLdrvaaWoDtZsDaUwJHi5z/K4uVzk+wZ/IHx7KPw2aw+4R2ISjjWggigNGTYl7lbc/v8BNXpvG36VGeUzanc+ym4C7PhneDets8YZ2oh6NHqogxpmoGaeS60umZKRpMEvB0SsdcrQVPFR4hwruu0fo5eZfnKg4ZUCBq5hMQJAPJPAQQnDhoxHAqFG1Eh2B0tZj/o27h5aGIhW7C42hc87KoLVWEeL8mgwsv5Q/snojC7/5Z4hvDG71ktdVHR8MgstrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3919.namprd12.prod.outlook.com (10.255.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 02:20:08 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 02:20:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Topic: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Index: AQHVaQ2tEwQt0N37/UeTBpEL38+E2KcnTo+A
Date: Thu, 12 Sep 2019 02:20:08 +0000
Message-ID: <MN2PR12MB334464D43A27239078B7F728E4B00@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1568253538-27220-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1568253538-27220-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5488e937-5a95-4ed2-057b-08d73727bbb8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3919; 
x-ms-traffictypediagnostic: MN2PR12MB3919:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB391949C273488BAA29ABDAF8E4B00@MN2PR12MB3919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(189003)(199004)(13464003)(52314003)(7736002)(74316002)(76116006)(76176011)(7696005)(66946007)(99286004)(14454004)(55016002)(186003)(11346002)(446003)(53546011)(6506007)(26005)(305945005)(6246003)(102836004)(53936002)(8936002)(2906002)(25786009)(3846002)(478600001)(9686003)(6116002)(229853002)(4326008)(81166006)(52536014)(66446008)(2501003)(8676002)(66066001)(6436002)(66556008)(5660300002)(66476007)(64756008)(110136005)(54906003)(71200400001)(71190400001)(316002)(81156014)(256004)(486006)(476003)(86362001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3919;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KQz5OoE4RS66nejNAmcO7zo938gD+gwwjE5lQsY1drNztADacPo9MwLkaYucO9gr/xLbbhKhPZcFbvOeYNPOSbCS8LBN6z/o2yRnz0ooAwSOPN+kHAqAaM4rmb/etEPWuVwRZ4n2Uz8opR13DAJvvDfDpyrzfxHx675MGE8IhqEYoiGYcxLFt83rYuJd+/tRf3CEHrubtALmgf07IQmSiTFcT2cx4CpLbdUWtAqWJoEYn5q7FnTu1n7h5JzmL1qE4SI0fknS2J5lAXQfimZybiRImxcFF1GKo1MTEqfmDBtZqM7EGwVd/CCQreT3y1pgc0yeqNWvW1v/QphSbNt7KXAwTTLmiDBvZEGvioYnPWnPqMCYAmeaSYT8uRqe+SpLVWlrEFMwrfMBgC2DPLdq5gC9kPucjZZd9Iox4F9cKcE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5488e937-5a95-4ed2-057b-08d73727bbb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 02:20:08.7616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yA7akpmS2ZRbvVNGnT6BpSbWTckvRRFHCKev8+QTgLTWco2va84sueUxNxGLpEVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEn2ZozBhw6GWOnkkNTOjb2fr3bA8utqShbkfNH7JNA=;
 b=LSo4EmbJCeaTJjPZA1BYA6YmtWAMbC/YHrAq4fEQAmq1d92jfu3fexiwoUaOSMqitdli6CJb+43d/RJ7pAy6d3TQVDA2c/moLQDgufbo9aY/qNh/aa03Cyd09ojW6vQLb60W7IjMF3NGMj0GJaPi7aGAe/B1iAMVjiGC1sXCSs8=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyBiZXR0ZXIgdG8gc2F5ICJzZG1hIGVuZ2luZSIgb3IganVzdCAic2RtYSIgaW5zdGVhZCBv
ZiAic2RtYV92NCIuCkFueXdheSwgdGhlIHBhdGNoIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogTGlh
bmcsIFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29tPiAKU2VudDogVGh1cnNkYXksIFNlcHRlbWJl
ciAxMiwgMjAxOSA5OjU5IEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZl
bmdAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8
QWFyb24uTGl1QGFtZC5jb20+OyBMaWFuZywgUHJpa2UgPFByaWtlLkxpYW5nQGFtZC5jb20+ClN1
YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9hbWRncHU6IHBvd2VyIHVwIHNkbWFfdjQgZm9yIHJlc3Vt
ZSBiYWNrIHBlcmlvZAoKVGhlIHNkbWFfdjQgc2hvdWxkIGJlIHVuZ2F0ZWQgd2hlbiB0aGUgSVAg
cmVzdW1lIGJhY2ssCm90aGVyd2lzZSBpdCB3aWxsIGhhbmcgdXAgYW5kIHJlc3VtZSB0aW1lIG91
dCBlcnJvci4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYyAgICB8ICAyICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgfCAxMCArKysrKyst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAgMyArKysK
IDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHBtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHBtLmMKaW5kZXggMzU3ZTQ1Zi4uMjYzMjY1MiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYwpAQCAtOTUxLDYgKzk1MSw3
IEBAIGludCBhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHVpbnQzMl90IGJsb2NrCiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9VVkQ6
CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9WQ046CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9W
Q0U6CisJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9TRE1BOgogCQlpZiAoc3dzbXUpCiAJCQlyZXQg
PSBzbXVfZHBtX3NldF9wb3dlcl9nYXRlKCZhZGV2LT5zbXUsIGJsb2NrX3R5cGUsIGdhdGUpOwog
CQllbHNlCkBAIC05NTksNyArOTYwLDYgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5n
X2J5X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgYmxvY2sKIAkJYnJl
YWs7CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HTUM6CiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQ
RV9BQ1A6Ci0JY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9TRE1BOgogCQlyZXQgPSAoKGFkZXYpLT5w
b3dlcnBsYXkucHBfZnVuY3MtPnNldF9wb3dlcmdhdGluZ19ieV9zbXUoCiAJCQkJKGFkZXYpLT5w
b3dlcnBsYXkucHBfaGFuZGxlLCBibG9ja190eXBlLCBnYXRlKSk7CiAJCWJyZWFrOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCBkMDE5Yjg1Li5iNTM2ZjA0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMTgwMSw4ICsxODAxLDkgQEAg
c3RhdGljIGludCBzZG1hX3Y0XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJaW50IHI7CiAJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7
CiAKLQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfUkFWRU4gJiYgYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzICYmCi0JCQlhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPnNldF9wb3dlcmdhdGlu
Z19ieV9zbXUpCisJaWYgKChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5w
b3dlcnBsYXkucHBfZnVuY3MgJiYKKwkJCWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bv
d2VyZ2F0aW5nX2J5X3NtdSkgfHwKKwkJCWFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikK
IAkJYW1kZ3B1X2RwbV9zZXRfcG93ZXJnYXRpbmdfYnlfc211KGFkZXYsIEFNRF9JUF9CTE9DS19U
WVBFX1NETUEsIGZhbHNlKTsKIAogCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQpAQCAtMTgy
OSw4ICsxODMwLDkgQEAgc3RhdGljIGludCBzZG1hX3Y0XzBfaHdfZmluaSh2b2lkICpoYW5kbGUp
CiAJc2RtYV92NF8wX2N0eF9zd2l0Y2hfZW5hYmxlKGFkZXYsIGZhbHNlKTsKIAlzZG1hX3Y0XzBf
ZW5hYmxlKGFkZXYsIGZhbHNlKTsKIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZF
TiAmJiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MKLQkJCSYmIGFkZXYtPnBvd2VycGxheS5wcF9m
dW5jcy0+c2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSkKKwlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX1JBVkVOICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcworCQkJJiYgYWRldi0+cG93ZXJw
bGF5LnBwX2Z1bmNzLT5zZXRfcG93ZXJnYXRpbmdfYnlfc211KSB8fAorCQkJYWRldi0+YXNpY190
eXBlID09IENISVBfUkVOT0lSKQogCQlhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUo
YWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfU0RNQSwgdHJ1ZSk7CiAKIAlyZXR1cm4gMDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBlMThiZmNlLi5hNWZj
YTUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC00
MDAsNiArNDAwLDkgQEAgaW50IHNtdV9kcG1fc2V0X3Bvd2VyX2dhdGUoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsIHVpbnQzMl90IGJsb2NrX3R5cGUsCiAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9H
Rlg6CiAJCXJldCA9IHNtdV9nZnhfb2ZmX2NvbnRyb2woc211LCBnYXRlKTsKIAkJYnJlYWs7CisJ
Y2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9TRE1BOgorCQlyZXQgPSBzbXVfcG93ZXJnYXRlX3NkbWEo
c211LCBnYXRlKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
