Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BDDA4BB
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 06:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C14E6E0EB;
	Thu, 17 Oct 2019 04:28:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E596E0EB
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 04:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdJ8TBHx4xaoYUZuH8mDexhRlDy8TTpLow66qcJElayquBIBM0g8TZQkegYHyH2T0rFudb0rIt2CUQ7h6o9ol8xgSGcQS6j6SuOjE/E7fezR/iEULcpBDa9D8Z42pCbsUeLjegCjsdmvTDLSFpMWoo23i0mq9CMgE5A5HsxkIbQohOHddP9V1JjQDawiR8KgZNEodLMoClgneKz6Oc4BTTKwJ/oiqwia8DP/hda7IjAgqzGeBsQw5RZwaBH7+5XfcKJrj+bSQwiwr9M4Hc2SMo8yebXpHVhJnA1F4CEo3sTDYtp6S65driHu08TIbUSAMGyUws5TTmdf0UN9T99AlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dulS1eY+zwaAtb3+7SZRZywWQO7w6Qhg46w2nExELZA=;
 b=gyOn16RxDTI6EQQKwUu3zn/hfzmNbIMuVNItfIUHYL3LDVrLTJu1/VqB1PaM/ExJ5T6kq41/rApbW/57FfLHWd8NBcALHSy3EHCFKX8uv60OpZFA+ie9fqwg76o8Bt5KkVrolfwzS3rmqaFllvTRPdbDMcnQiBwJS3hXK55vpBbNJZZpXD9t2Ed3X/6sV9PW/XmM1ee1YSzJx3RyAfBLKSU1udoWTQQGD11RMR3EFkw186DaepdOdz1BaBLmjitOpJNccipl3BRh4yr2KzcgbA9DFlgpMHE/3a5JgfZIYQW6zeAqghLJoBXC4eRt9B7Lh1U7XkW2aKKtP1n4qVJnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3052.namprd12.prod.outlook.com (20.178.30.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 04:28:08 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::b5f1:6693:1573:ab1e%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 04:28:08 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Zhan" <Zhan.Liu@amd.com>
Subject: [PATCH] drm/amd/display: Modify display link stream setup sequence.
Thread-Topic: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhKHEf7z6O+vtZ0KYLzN3Nfjkzw==
Date: Thu, 17 Oct 2019 04:28:08 +0000
Message-ID: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 466740b8-2d64-4b11-cef4-08d752ba69ac
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3052:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB30525F253389DA5C61E89AA39E6D0@DM6PR12MB3052.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(199004)(189003)(99286004)(81166006)(2501003)(256004)(91956017)(6116002)(74316002)(478600001)(66946007)(76116006)(7696005)(66476007)(3846002)(66556008)(64756008)(66446008)(66066001)(486006)(110136005)(5660300002)(316002)(8676002)(476003)(25786009)(81156014)(52536014)(71200400001)(26005)(186003)(55016002)(7736002)(305945005)(6436002)(102836004)(2906002)(8936002)(86362001)(14454004)(71190400001)(33656002)(6506007)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3052;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5mQn9Ti/nPGIhlb5593WMFSAVVaTz97tKpLG5dIAEK06NLvTIozOeYzuDdltUp8hC1c/U2ZCtfmEU9AUyKbjcpLhw1UKJYBK1iIy5/dPEV3koZ5u7mutJzuoiAtMvOu1XF5ODPg+yge2McE/AMon/26JnuGAYpkAnxiHmrtc8qfCxG/G876m4gwsjvx4AOKH9LaHcF4QuG1Jc64BVKwCP8kOHj/y1yvBzbFa0uvvwEFgfaMX8rsshIFpUG37wXn9FxzDaGXQaiaOEUwcqVap/VW9F3lf8b6MjBBU7ErYUQ4HiafPm/hm71LeCmkZQ/msxzd5xjU5aL+Fz23HmO+cURrvu6QDXgKEEKv9mEZbJ9fKtj+opG5mt2c2Do9ElTjlvNtRir+ZxuD7qB4CCsz+IKUPo1rJGldmFKHsD4rbkQ0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466740b8-2d64-4b11-cef4-08d752ba69ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 04:28:08.4903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6Boj/oqokdHw4jqoTNR4WeRVhbcOUw+tMBY7xPo7WYYTPQ3pdO6CSYd9N/i8sBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dulS1eY+zwaAtb3+7SZRZywWQO7w6Qhg46w2nExELZA=;
 b=Y0l/bBYeCfpMoLNMXscaOx6c6EMFwHXxB0Vc/RXF/3ALXdGvnD2rOgsDeTszNHmPsSwnwUY4zctZudNYOR5XVKrD/C2/bgxM70LCRJg2mkVgFZitP3C/Pyka0Z/VsWnQOnLPv+B9n7IzbTWLx/ph/epUxpd5AOjF4FMzZQRPgjY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+CgpbV2h5XQpXaGVuIGEgc3BlY2lmaWMg
a2luZCBvZiBjb25uZWN0b3IgaXMgZGV0ZWN0ZWQsCkRDIG5lZWRzIHRvIHNldCB0aGUgYXR0cmli
dXRlIG9mIHRoZSBzdHJlYW0uClRoaXMgc3RlcCBuZWVkcyB0byBiZSBkb25lIGJlZm9yZSBlbmFi
bGluZyBsaW5rLApvciBzb21lIGJ1Z3MgKGUuZy4gZGlzcGxheSB3b24ndCBsaWdodCB1cCkKd2ls
bCBiZSBvYnNlcnZlZC4KCltIb3ddClNldHRpbmcgdGhlIGF0dHJpYnV0ZSBvZiB0aGUgc3RyZWFt
IGZpcnN0LCB0aGVuCmVuYWJsaW5nIHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IFpoYW4gTGl1IDx6
aGFuLmxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYyB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggZmIxODY4MWI1MDJiLi43MTNjYWFiODI4Mzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAg
LTI3NDUsMTYgKzI3NDUsNiBAQCB2b2lkIGNvcmVfbGlua19lbmFibGVfc3RyZWFtKAogICAgICAg
ICAgICAgICAgICAgICAgICBkY19pc192aXJ0dWFsX3NpZ25hbChwaXBlX2N0eC0+c3RyZWFtLT5z
aWduYWwpKQogICAgICAgICAgICAgICAgcmV0dXJuOwoKLSAgICAgICBpZiAoIWRjX2lzX3ZpcnR1
YWxfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpIHsKLSAgICAgICAgICAgICAgIHN0
cmVhbS0+bGluay0+bGlua19lbmMtPmZ1bmNzLT5zZXR1cCgKLSAgICAgICAgICAgICAgICAgICAg
ICAgc3RyZWFtLT5saW5rLT5saW5rX2VuYywKLSAgICAgICAgICAgICAgICAgICAgICAgcGlwZV9j
dHgtPnN0cmVhbS0+c2lnbmFsKTsKLSAgICAgICAgICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVz
LnN0cmVhbV9lbmMtPmZ1bmNzLT5zZXR1cF9zdGVyZW9fc3luYygKLSAgICAgICAgICAgICAgICAg
ICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywKLSAgICAgICAgICAgICAgICAg
ICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmluc3QsCi0gICAgICAgICAgICAgICAgICAg
ICAgIHN0cmVhbS0+dGltaW5nLnRpbWluZ18zZF9mb3JtYXQgIT0gVElNSU5HXzNEX0ZPUk1BVF9O
T05FKTsKLSAgICAgICB9Ci0KICAgICAgICBpZiAoZGNfaXNfZHBfc2lnbmFsKHBpcGVfY3R4LT5z
dHJlYW0tPnNpZ25hbCkpCiAgICAgICAgICAgICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJl
YW1fZW5jLT5mdW5jcy0+ZHBfc2V0X3N0cmVhbV9hdHRyaWJ1dGUoCiAgICAgICAgICAgICAgICAg
ICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsCkBAIC0yODQxLDYgKzI4MzEs
MTYgQEAgdm9pZCBjb3JlX2xpbmtfZW5hYmxlX3N0cmVhbSgKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIENPTlRST0xMRVJfRFBfVEVTVF9QQVRURVJOX1ZJREVPTU9ERSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENPTE9SX0RFUFRIX1VOREVG
SU5FRCk7CgorICAgICAgICAgICAgICAgaWYgKCFkY19pc192aXJ0dWFsX3NpZ25hbChwaXBlX2N0
eC0+c3RyZWFtLT5zaWduYWwpKSB7CisgICAgICAgICAgICAgICAgICAgICAgIHN0cmVhbS0+bGlu
ay0+bGlua19lbmMtPmZ1bmNzLT5zZXR1cCgKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJlYW0tPmxpbmstPmxpbmtfZW5jLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCk7CisgICAgICAgICAgICAgICAgICAgICAgIHBpcGVf
Y3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5zZXR1cF9zdGVyZW9fc3luYygKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1f
ZW5jLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVz
LnRnLT5pbnN0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmVhbS0+dGltaW5n
LnRpbWluZ18zZF9mb3JtYXQgIT0gVElNSU5HXzNEX0ZPUk1BVF9OT05FKTsKKyAgICAgICAgICAg
ICAgIH0KKwogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCiAgICAgICAgICAg
ICAgICBpZiAocGlwZV9jdHgtPnN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykgewogICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoZGNfaXNfZHBfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25h
bCkgfHwKLS0KMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
