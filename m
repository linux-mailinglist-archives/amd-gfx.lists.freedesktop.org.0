Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598229B837
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 23:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424C6ED53;
	Fri, 23 Aug 2019 21:33:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20236ED4C
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 21:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNrauGWJvnEACe3PHZDgN6hYxiU8C8e1WPgPSG9empTTSBbmBWy1t2/xzT1Ce95wY7FmTFyuD1JQ2WQHfck+yu7K/L2HtZOSHrnZLu4zLIuQNLwyd2hGXHsEbJJYLIhDQIEuBO7AaI5uW4LLb8ZKga9aslbj0735j0SUP0DPQoM0/fVclHrR3MQpMTK3JVywdfOncGIHFkUcktyDJzp4h6QMUzyf5juH8HELj2w9geBrQ6ll8l3/cYB5OlSl3H2dyMMxjusoNvshxkC9OG4C2xscRw9OqPF4HHcA1zmlRbGujnsOEZ50/NuMdN5Q5U0kkE2xQrjxW+7miwcmthD5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKcWGKG8YGHgB+z0beHVEy9N4BY2cPikWIxs9Kxeqms=;
 b=kp62E8BrV+slGUYEbPUqtx7BDFl5usAFYlwEo/wf1VGXUJ6EwQ5BpWDJBfd9zIYfn76yhzYaPsJZObcbW43E3N1vgcP53r0wgleCW4AYUzFUbzv8ntKJSDkwdnu8DSw/+e/FTpoEXnA1EfitIAPzm0y6pb7pILTnH74uxlIKhg8NHNXC0ocnhsVtD0ruUd5I4OEgj1bziYV90+yBnKOU9jif/+c2uQGOJ1Q6ASpbE3ljsLvquQJfoTFlohCeWhbG5eO3phXxImkVMezwEr8lzyH5snxsMzarKfwVveURpYQ+QC6BaG4pdtiyCGba6LDlX3hha7Jsfmw19UxujbbRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3644.namprd12.prod.outlook.com (20.178.199.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 21:33:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 21:33:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVWfpxBPvdYhBJRUKrjoVEh1NnNA==
Date: Fri, 23 Aug 2019 21:33:46 +0000
Message-ID: <20190823213249.10749-2-Felix.Kuehling@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190823213249.10749-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44e4c15e-25cc-4856-8c09-08d728119421
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3644; 
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB364467465980468F1D61B85B92A40@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(50226002)(478600001)(86362001)(2616005)(4326008)(26005)(446003)(486006)(186003)(386003)(5640700003)(52116002)(66066001)(25786009)(81156014)(2906002)(14454004)(11346002)(102836004)(76176011)(54906003)(6916009)(66476007)(7736002)(2501003)(66946007)(66446008)(5660300002)(36756003)(6506007)(8676002)(8936002)(81166006)(6436002)(53936002)(71190400001)(6512007)(316002)(3846002)(6116002)(6486002)(476003)(66556008)(64756008)(71200400001)(305945005)(1076003)(99286004)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3644;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ab4EfGYztoyT8HotL1ZFy3HjnUqkWXaQhdYpxvDP+KfsC6HLUC6DXsNmysu6a4hwI5dv9DxL40B86JiQ3LEmSYwGvqUdXn1qqYjgX1sys6yviLvIhvaCmzwcFvecc85+Oncc8ww5NNftigElrWvaBMWiamVnf1GEW2bl43WtqlFmzzmxzBaXhNuAknydJBfv1wMD7g2ut+Ysxgl+MupLog4ZaMvJp+ERZ2GUkUeiw3wcOC1GMG7lb8lBUeApaxsA8ONLh1htluIzzKt2Q4T5teMec5ZbNTzUMAU/PgMBs82qFzG4TLDh8CJeDY7//Snoe0AZDoBgSH+bXzSetKZgR5/U741mG/5oahYJKzY7FYdaypmVnz6Gh4Jbm4PY+U4Flo7TyxZEFyztem9TZZNSKIA6RXAzfkYwP4Su1fCIL9M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e4c15e-25cc-4856-8c09-08d728119421
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 21:33:46.3064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMoGf80DkcILcnh4m5KgBXMS0L5EzjNQV4QtWkklK/9i2iUW/Ml0lDPsW7cujBir0OO/ZB56tEjQSvg9DOc6kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKcWGKG8YGHgB+z0beHVEy9N4BY2cPikWIxs9Kxeqms=;
 b=vAJwoI3ic/mv63LNA9Ui5607dIQjwPisL00YuY77xXc456t1BfPabKnXDMK3Lc/FeF8thVuBFgSuhmHzYPYJEBBlAwkgM3br4HY7S3F2TJXNKehMSbOFrdeGL6VSeY+b0j3R0H5lB4JkwSEwPpgisdbAheTSOoRpBw47tXtckqw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpBZGQgZGVmaW5pdGlvbiBvZiBhbGwg
c3VwcG9ydGVkIG10eXBlcy4gVGhlIFJXIG10eXBlCmlzIHJlY2VudGx5IGludHJvZHVjZWQgZm9y
IGFyY3R1cnVzLiBBbHNvIGFkZCBkZWZpbml0aW9uCm9mIGEgZmxhZyB0byBwcm9iZSBhbmQgcG9z
c2libHkgaW52YWxpZGF0ZSByZW1vdGUgR1BVCmNhY2hlLCB3aGljaCB3aWxsIGJlIHVzZWQgbGF0
ZXIgaW4gdGhpcyBzZXJpZXMuCgpDaGFuZ2UtSWQ6IEk5NmZjOWJiNGI2YjFlNjJiZGMxMGI2MDBk
OGFhYTZhODAyMTI4ZDZkClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHwgOSArKysrKysr
LS0KIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oICAgICAgICAgIHwgNCArKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAppbmRleCAyZWRhM2E4YzMzMGQuLjdhNzc0NzdhZjZh
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKQEAgLTgwLDggKzgwLDEz
IEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsKICNkZWZpbmUgQU1ER1BVX1BURV9NVFlQ
RV9WRzEwKGEpCSgodWludDY0X3QpKGEpIDw8IDU3KQogI2RlZmluZSBBTURHUFVfUFRFX01UWVBF
X1ZHMTBfTUFTSwlBTURHUFVfUFRFX01UWVBFX1ZHMTAoM1VMTCkKIAotI2RlZmluZSBBTURHUFVf
TVRZUEVfTkMgMAotI2RlZmluZSBBTURHUFVfTVRZUEVfQ0MgMgorZW51bSBhbWRncHVfbXR5cGUg
eworCUFNREdQVV9NVFlQRV9OQyA9IDAsCisJQU1ER1BVX01UWVBFX1dDID0gMSwKKwlBTURHUFVf
TVRZUEVfQ0MgPSAyLAorCUFNREdQVV9NVFlQRV9VQyA9IDMsCisJQU1ER1BVX01UWVBFX1JXID0g
NCwKK307CiAKICNkZWZpbmUgQU1ER1BVX1BURV9ERUZBVUxUX0FUQyAgKEFNREdQVV9QVEVfU1lT
VEVNICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEFNREdQVV9QVEVf
U05PT1BFRCAgICBcCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCmluZGV4IGNhOTdiNjgwMjI3NS4uOTdlOGU1
MWY3NmFhIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9p
bmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaApAQCAtNTAzLDYgKzUwMywxMCBAQCBzdHJ1Y3Qg
ZHJtX2FtZGdwdV9nZW1fb3AgewogI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfQ0MJCSgzIDw8IDUp
CiAvKiBVc2UgVUMgTVRZUEUgaW5zdGVhZCBvZiBkZWZhdWx0IE1UWVBFICovCiAjZGVmaW5lIEFN
REdQVV9WTV9NVFlQRV9VQwkJKDQgPDwgNSkKKy8qIFVzZSBSVyBNVFlQRSBpbnN0ZWFkIG9mIGRl
ZmF1bHQgTVRZUEUgKi8KKyNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX1JXCQkoNSA8PCA1KQorLyog
Q2FjaGVhYmxlL3Nub29wYWJsZSAqLworI2RlZmluZSBBTURHUFVfVk1fUEFHRV9JTlZBTElEQVRF
X1BST0JFCSgxIDw8IDkpCiAKIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV92YSB7CiAJLyoqIEdFTSBv
YmplY3QgaGFuZGxlICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
