Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA98129E
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 08:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3617089D9B;
	Mon,  5 Aug 2019 06:58:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680044.outbound.protection.outlook.com [40.107.68.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7189D9B
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 06:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJPJo+bEVYXvh1jkkHLPQDtdrMx+YllGh3y62qwKy8REmaXiVw10eZcizVzS4Qxf4lpXrLlQ0dp44uHTlaIp80mbedK0pKxIAliW0evOy4bm0/skJsrcDMbv1E4ywrKxSi1Uxz9NvhHbgv0LE2TyxdNZ1htIcHVLZvogF5nwr15BvuVUnT8zCnPFrDt04GErMWJlb/qyTVZS+Aib4JDRsEnfCCP6Vx+mrD28RAzaqlng+gLlEFZxDoXqdQcyfx6wCsveV3Tu/mB1vNkJr0rD1z8BGire0nqC8aL8l7DTpWQSZAmF7hFpNlpcsgmFQe1vWyWArAwbFU1PK7wB0h6KBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaUCScr9zUkNo0Tt67HYy89F0lRJvpdhPKuMDJdQR8s=;
 b=AaipGsn8Zg1wKUc0jfgOJGrbIXhMEdOrAPiy4m1Q9gvDSMJcWRxx9yp464zQ9VUiJ9fK0QUsboRasejz3zolFeyt1u4MnFtQ05fxb+rHgNyGixAAFl6CC7gCyf/IjqL1JXT4vx/NDlVDvYCJKOq9pqvAHLsTZQtsPjPpOaWv7FLPfoN/nD17FVGrdEj544/D/leXgAbHNdNjMO7Yt7MWIbPrj67YITl5/vPgBKNYLvXW+S8226Lti84RAKVx0l2QQZJr1TQleeKc5bZSqMgkEKJ4OydVkGBeoNX7K3GzSw2BpGAEncj/dPpjOYpori2rlLC9oTH6BEQpoPQ7MHNxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2623.namprd12.prod.outlook.com (52.135.103.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 06:58:27 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::accd:7f0e:8a0e:d10a]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::accd:7f0e:8a0e:d10a%7]) with mapi id 15.20.2115.017; Mon, 5 Aug 2019
 06:58:27 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix panic during gpu reset
Thread-Topic: [PATCH] drm/amdgpu: Fix panic during gpu reset
Thread-Index: AdVLWxnCmtewJ2ZoSpuv2sekqerKFA==
Date: Mon, 5 Aug 2019 06:58:27 +0000
Message-ID: <SN6PR12MB2800C2017D0188CB813D82E487DA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee6928e0-ebd0-46ad-c15f-08d71972512e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2623; 
x-ms-traffictypediagnostic: SN6PR12MB2623:
x-microsoft-antispam-prvs: <SN6PR12MB262336298F20714523AF1CE687DA0@SN6PR12MB2623.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(199004)(189003)(6916009)(81166006)(81156014)(478600001)(2501003)(6116002)(68736007)(86362001)(8676002)(99286004)(14454004)(74316002)(7696005)(2351001)(8936002)(4326008)(25786009)(53936002)(7736002)(66946007)(316002)(5640700003)(66476007)(66556008)(64756008)(66446008)(2906002)(6506007)(55016002)(54906003)(305945005)(9686003)(76116006)(66066001)(6436002)(186003)(71200400001)(71190400001)(486006)(33656002)(102836004)(26005)(14444005)(256004)(476003)(5660300002)(4744005)(52536014)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2623;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RSVJW3T0/lhhgMWxhiEwOOGEuv7TyjanDrbhdauscW0O4wrcu4T0plwt/rr5LxQYOsFt3AaO80Ed8tR3YcLstKQXXcXLTjJJkBLF/lzK56xTz5EtSY+c0qYMK9p8YVAg+syn5Ar1iUfC2npdjEOebddjZKCe2swVBimVH0KYj15C5fOQGc758Nz0ev39dHq+FvwWb8rM/hYUPZBxpSKWLQfkUod89ySnw32NvyFEBOs7Xtsv/Ewnz9DrTui23ATiQobE9s5rR5D2F1vfUryYW0ZU3p+UUV9v0gcbSP/zIxGdmGKAXCu2v6cYzzzdNnf3qP14QQtSEmM3pQ91mD5BQVk/i5yo3jirkiGCRS7xmzJd2p1Vzkyu9ljXSjg25hrC1x4N34kRlQuWrAM+RGKye66YLufggWuLaiXrhB/kMg8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6928e0-ebd0-46ad-c15f-08d71972512e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 06:58:27.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2623
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaUCScr9zUkNo0Tt67HYy89F0lRJvpdhPKuMDJdQR8s=;
 b=0bGbbo9dcznvFGLxnD085lKqYbHFkrZCH+Hjw7tEm4rKdMwIHRCmI19L8W4cXZjO+xs2kSYNMm4tavsf58q13IjBh4CXTPgOYMpGHK7AcCYEHIeNjtZDJc/7qQfYpDjqlLjRcoeF5vXo2urqlrSPzTUv+gnA4lh7lvuXtzgVnZs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2xlYXIgdGhlIGZsYWcgYWZ0ZXIgaHcgc3VzcGVuZCwgb3RoZXJ3aXNlIGl0IHNraXBzIHRoZSBj
b3JyZXNwb25kaW5nIGh3CnJlc3VtZS4KClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1
aS5wYW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggMzFh
YmQ4ODg1ZmRlLi5mNjJkNGYzMGU4MTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKQEAgLTIyNTYsNiArMjI1Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Rl
dmljZV9pcF9zdXNwZW5kX3BoYXNlMihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCURS
TV9FUlJPUigic3VzcGVuZCBvZiBJUCBibG9jayA8JXM+IGZhaWxlZCAlZFxuIiwKIAkJCQkgIGFk
ZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+bmFtZSwgcik7CiAJCX0KKwkJYWRldi0+
aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IGZhbHNlOwogCQkvKiBoYW5kbGUgcHV0dGluZyB0aGUg
U01DIGluIHRoZSBhcHByb3ByaWF0ZSBzdGF0ZSAqLwogCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ld
LnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQX0JMT0NLX1RZUEVfU01DKSB7CiAJCQlpZiAoaXNfc3Vw
cG9ydF9zd19zbXUoYWRldikpIHsKQEAgLTIyNzAsNyArMjI3MSw2IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJCQkJCSAgYWRldi0+bXAxX3N0YXRlLCByKTsKIAkJCQkJcmV0dXJuIHI7CiAJCQkJfQotCQkJ
CWFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSBmYWxzZTsKIAkJCX0KIAkJfQogCX0KLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
