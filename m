Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690D66506
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 05:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D7F6E2B0;
	Fri, 12 Jul 2019 03:33:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FD86E2B0
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 03:33:44 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3021.namprd12.prod.outlook.com (20.178.240.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 03:33:42 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 03:33:42 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add pstate mclk(uclk) support for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: add pstate mclk(uclk) support for
 navi10
Thread-Index: AQHVOGKaAPe1kugtnkWc0GEZOeMXzA==
Date: Fri, 12 Jul 2019 03:33:42 +0000
Message-ID: <20190712033326.12294-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PS2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:1a::28) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe555c30-981e-4204-dac3-08d70679bc6f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3021; 
x-ms-traffictypediagnostic: MN2PR12MB3021:
x-microsoft-antispam-prvs: <MN2PR12MB3021ECFBB29A072FAF6A9865A2F20@MN2PR12MB3021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(189003)(199004)(8936002)(4326008)(66066001)(25786009)(1076003)(86362001)(305945005)(6916009)(5660300002)(8676002)(81166006)(478600001)(66476007)(81156014)(7736002)(64756008)(2351001)(66946007)(66556008)(66446008)(36756003)(2906002)(71200400001)(6116002)(316002)(53936002)(71190400001)(68736007)(6506007)(386003)(476003)(102836004)(99286004)(486006)(6512007)(54906003)(256004)(2501003)(52116002)(2616005)(14444005)(6486002)(186003)(14454004)(3846002)(26005)(5640700003)(6436002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3021;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K/9wqsOZQcSHMUk6BZRLBJMqPnBO+qGYKsQUv9dIcFuZ58rXMD+haVUMVxlxAgEB9gTEZ5XwlxLIKpGwJZV8unccMS6VIai6yqX1QcW8dpwgvV/ViD6hxQMIyPtRnL1p1pxLnyUlJ4NpuzxfUIA7O4hRCle9zGdOk9TiTDYHPhaAG0vrsR/UOkUdlaoWZmtYCkXbFBU0xp8UNnxkjbtfBcxOjJK7173Vt7t4dKKrId8YzHIJcVcjUDYhIh2Eg2Z6F+fFQL9dw4SIRjSNiFKbrLxfO0o/Bl+hwJiyuvDzHuiKeKyJ2b92wSboA10XDkC4piAfOOi5l4GYtc8sLgaaN+70M1VmUsxLwC2eUlRL1ncsO4WZ5FG3oD/ok3XPpYbhyC5Yl6wZ83MYayn21B93CbSnuLYY5wKE6WiCX8842aM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe555c30-981e-4204-dac3-08d70679bc6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 03:33:42.1149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ob4bBAcd8c+R9Zo0QNTIUYbYVlU2fZPJcAio+JP3Ec=;
 b=a9JYnKSiLClPaNQwZomJdExqxv0Xvi4tZZeSqv6UN2/7/fr4l8KdJ0ByhMxfxyt48XlA39ziywtblzuIl44B9n8xG/TY7xtiz4eaB2g880YFJp2nyGBbbX8OsLhiB4NwHMn9W36XfkyEkHDvSgfQQdyOyUwDIisaK4rroH1fgiM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIHBzdGF0ZSBtY2xrKHVjbGspIHN1cHBvcnQuCgpDaGFuZ2UtSWQ6IEk3ZjNiY2E0OTAxODMz
YjRlYTIxM2ZlMDIyNDlmYzA1NWI4MGU1Y2RkClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtl
dmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgfCA4ICsrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRl
eCBkZTZjYzVkNDg5Y2QuLjY3ZGIyNzQ2ZWM0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTM2LDYgKzEzNiw3IEBAIGludCBzbXVfZ2V0X2RwbV9m
cmVxX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtf
dHlwZSwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlzd2l0Y2ggKGNsa190eXBlKSB7CisJY2FzZSBT
TVVfTUNMSzoKIAljYXNlIFNNVV9VQ0xLOgogCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQo
c211LCBTTVVfRkVBVFVSRV9EUE1fVUNMS19CSVQpKSB7CiAJCQlwcl93YXJuKCJ1Y2xrIGRwbSBp
cyBub3QgZW5hYmxlZFxuIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKaW5kZXggY2QzMmIyMGExM2MxLi4xNmE0YzFjYTk4Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTcwOSw3ICs3MDksNyBAQCBzdGF0aWMg
aW50IG5hdmkxMF9mb3JjZV9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogc3Rh
dGljIGludCBuYXZpMTBfcG9wdWxhdGVfdW1kX3N0YXRlX2NsayhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkKIHsKIAlpbnQgcmV0ID0gMDsKLQl1aW50MzJfdCBtaW5fc2Nsa19mcmVxID0gMDsKKwl1
aW50MzJfdCBtaW5fc2Nsa19mcmVxID0gMCwgbWluX21jbGtfZnJlcSA9IDA7CiAKIAlyZXQgPSBz
bXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgU01VX1NDTEssICZtaW5fc2Nsa19mcmVxLCBOVUxM
KTsKIAlpZiAocmV0KQpAQCAtNzE3LDYgKzcxNywxMiBAQCBzdGF0aWMgaW50IG5hdmkxMF9wb3B1
bGF0ZV91bWRfc3RhdGVfY2xrKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCiAJc211LT5wc3Rh
dGVfc2NsayA9IG1pbl9zY2xrX2ZyZXEgKiAxMDA7CiAKKwlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVx
X3JhbmdlKHNtdSwgU01VX01DTEssICZtaW5fbWNsa19mcmVxLCBOVUxMKTsKKwlpZiAocmV0KQor
CQlyZXR1cm4gcmV0OworCisJc211LT5wc3RhdGVfbWNsayA9IG1pbl9tY2xrX2ZyZXEgKiAxMDA7
CisKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
