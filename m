Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC1D4C72
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 05:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DA56ECB1;
	Sat, 12 Oct 2019 03:29:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713B6ECB0
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 03:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad5O5VGD+bbGgB1D/POuaObq6J7MFxC1S/SZe8AT6FKq2yc2WhbKPYVEl5Uv4CM+SwiJAdpwppeTjJia6wHuZd6EeDphAar7bOrZFP1VWAG2Z6KptQ9KP8HisFjDz/wKan+GBHd8ZdgvNzIu8I4xc0YBBa3whn+A3QtGJwKfI62T1G5vxFgBeXYAFT6ugzakARx7I8EBbp6wt77y3A/rGvHqTZ5hhwCDGbtPUhqlnu4a9a8aQe+0v4NDcqb67I+BqWUeTmQgpRgj8ofaltLtNGFHNNhRcT3UH4CscOdL1O2Y6gs1ARzqoLDHUHIwKQog05EDDyr77CyghDVibosmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ27+OLFA3jz6/skIVBOyb77j25e8WKP1d8SHu5Stjc=;
 b=fa2yvCjquU8v0OcZBigqh4oROBz88vBMLAnnb+mlMO/nk+Kx+kMVAD7aVztSsxllQ1DdLrAhWf9iyClZ9NmnfuKAoFUNTnRqwv7KZtjNyJdIRMInN57m0gXY+Qqm2+yJJtD98ruIqSG/T5y9UQHJfY4SGmkSueXyKMmst2NLlJ3VBep2Psu3WkNzues9+/AKUpCECQFw1/kpbh3TISnmEDIFkdoRG4oY5nSmk1r0fxFXJ0PSyc0naSYGqDeaGQy3mSI3LI5UcIWHAicIQjiPkwKx9HaDhJdPKW849hfU/IzWa449eVeHAPmodCymOdnRlxJnuOGhXWmG8R/OIxqguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Sat, 12 Oct 2019 03:29:44 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560%7]) with mapi id 15.20.2347.021; Sat, 12 Oct 2019
 03:29:44 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm on/off
Thread-Topic: [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm on/off
Thread-Index: AQHVgK1KrH2hppOh/kG0Y9vHgbg4TA==
Date: Sat, 12 Oct 2019 03:29:43 +0000
Message-ID: <20191012032925.4212-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:203:36::13) To BN8PR12MB3329.namprd12.prod.outlook.com
 (2603:10b6:408:61::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ced7f12-9fd1-415a-3b9e-08d74ec46c7d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3266:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB32664837E7EFCD2F7D512004E4960@BN8PR12MB3266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(14454004)(256004)(14444005)(5660300002)(8676002)(81156014)(81166006)(8936002)(66066001)(52116002)(2906002)(486006)(102836004)(476003)(36756003)(26005)(71190400001)(71200400001)(2501003)(478600001)(2616005)(6506007)(386003)(186003)(66446008)(99286004)(4326008)(66946007)(6486002)(6512007)(5640700003)(316002)(6116002)(64756008)(66556008)(66476007)(50226002)(3846002)(7736002)(305945005)(1076003)(6436002)(6916009)(86362001)(25786009)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3266;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNwETRlB+qHkfJqWJQN/H+WkuwNwO7S75mLyyTXZHl+N+i+edBZBFecjOV7I9AHIDwUAeGBRafhispp8GJqT1ocEBnoSv1wTMaSO+AY2R+npDjBMnKEYE0zljyXEkFiLJNozo5+9YBIxV7TdgI2zk98TT64jyoji0djElrlaTMmCV59HhUb4LklxZ+MDmOXVgL13dRZtgveeMYwDvU/d+pQq0Dosnr7ROug5yiDQcw8ZxxXrnnE8AdHJ/N0VuEpAAM3cub3IJTTN30ujibIwFa93f9OUcoR2ZQ+zjGOpygmlnOa77EquUAFC6eGEVxZUQPyl/zPMDiWoj4JpdY222uXZop7sGdqiW+FaTvFKPK41TbVpq9hNLqaRSpELN24wKwjGVQViDgqxWqe7Ghugc91pAbg+tIAA8toiyWPFeNc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ced7f12-9fd1-415a-3b9e-08d74ec46c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 03:29:43.8256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wK3HUJ7zXNHJ2YpPtQ1mfEJ9sJCgbujZpit89vdkPbg/Oj9DuOMgMMiGDqMnz8mQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ27+OLFA3jz6/skIVBOyb77j25e8WKP1d8SHu5Stjc=;
 b=rfvnjRNEtLMkpzK6KOcdVI7G5qUwDZtBein8CqnEx4Yi0QHTezSZnRvh7MNmHUr/w4hb/GA447rPyRF/CcW6albHyl/owzeOxEYTyNpCH+beqeiRDx3Vd3FnbjQagBjPDvV4gC60kF1gBIiYJKHknOtoIoSryXdG9YxMIVGzY6I=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RW5hYmxlIHJ1bnRpbWUgVkNOIERQTSBvbi9vZmYgb24gQXJjdHVydXMuCgpDaGFuZ2UtSWQ6IEll
N2Q5NGQ2N2NiNGM2MjJjOTZhY2NlZDFiNWVmMGY0ZTYzZGI1YWFkClNpZ25lZC1vZmYtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzUuYyAgICAgICAgfCAgNyArKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81
LmMKaW5kZXggMjYwOGM5MzJhNzc1Li5kMjcwZGY4OTIyMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzUuYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1QLmg+
CiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3Zjbi5oIgorI2luY2x1ZGUg
ImFtZGdwdV9wbS5oIgogI2luY2x1ZGUgInNvYzE1LmgiCiAjaW5jbHVkZSAic29jMTVkLmgiCiAj
aW5jbHVkZSAidmNuX3YyXzAuaCIKQEAgLTcwOSw2ICs3MTAsOSBAQCBzdGF0aWMgaW50IHZjbl92
Ml81X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXVpbnQzMl90IHJiX2J1ZnN6
LCB0bXA7CiAJaW50IGksIGosIGssIHI7CiAKKwlpZiAoYWRldi0+cG0uZHBtX2VuYWJsZWQpCisJ
CWFtZGdwdV9kcG1fZW5hYmxlX3V2ZChhZGV2LCB0cnVlKTsKKwogCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2kpIHsKIAkJaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2Nv
bmZpZyAmICgxIDw8IGkpKQogCQkJY29udGludWU7CkBAIC05MzksNiArOTQzLDkgQEAgc3RhdGlj
IGludCB2Y25fdjJfNV9zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJflVWRF9Q
T1dFUl9TVEFUVVNfX1VWRF9QT1dFUl9TVEFUVVNfTUFTSyk7CiAJfQogCisJaWYgKGFkZXYtPnBt
LmRwbV9lbmFibGVkKQorCQlhbWRncHVfZHBtX2VuYWJsZV91dmQoYWRldiwgZmFsc2UpOworCiAJ
cmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNf
cHB0LmMKaW5kZXggYTAwYjYwOTY4OTA5Li42NzMxZmVkNTQ1OGUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCkBAIC0xOTA3LDYgKzE5MDcsMzUgQEAg
c3RhdGljIGJvb2wgYXJjdHVydXNfaXNfZHBtX3J1bm5pbmcoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCiAJcmV0dXJuICEhKGZlYXR1cmVfZW5hYmxlZCAmIFNNQ19EUE1fRkVBVFVSRSk7CiB9CiAK
K3N0YXRpYyBpbnQgYXJjdHVydXNfZHBtX3NldF91dmRfZW5hYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCBib29sIGVuYWJsZSkKK3sKKwlzdHJ1Y3Qgc211X3Bvd2VyX2NvbnRleHQgKnNtdV9w
b3dlciA9ICZzbXUtPnNtdV9wb3dlcjsKKwlzdHJ1Y3Qgc211X3Bvd2VyX2dhdGUgKnBvd2VyX2dh
dGUgPSAmc211X3Bvd2VyLT5wb3dlcl9nYXRlOworCWludCByZXQgPSAwOworCisJaWYgKGVuYWJs
ZSkgeworCQlpZiAoIXNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9WQ05f
UEdfQklUKSkgeworCQkJcmV0ID0gc211X2ZlYXR1cmVfc2V0X2VuYWJsZWQoc211LCBTTVVfRkVB
VFVSRV9WQ05fUEdfQklULCAxKTsKKwkJCWlmIChyZXQpIHsKKwkJCQlwcl9lcnIoIltFbmFibGVW
Q05EUE1dIGZhaWxlZCFcbiIpOworCQkJCXJldHVybiByZXQ7CisJCQl9CisJCX0KKwkJcG93ZXJf
Z2F0ZS0+dmNuX2dhdGVkID0gZmFsc2U7CisJfSBlbHNlIHsKKwkJaWYgKHNtdV9mZWF0dXJlX2lz
X2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklUKSkgeworCQkJcmV0ID0gc211X2Zl
YXR1cmVfc2V0X2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9WQ05fUEdfQklULCAwKTsKKwkJCWlm
IChyZXQpIHsKKwkJCQlwcl9lcnIoIltEaXNhYmxlVkNORFBNXSBmYWlsZWQhXG4iKTsKKwkJCQly
ZXR1cm4gcmV0OworCQkJfQorCQl9CisJCXBvd2VyX2dhdGUtPnZjbl9nYXRlZCA9IHRydWU7CisJ
fQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IGFyY3R1cnVzX3BwdF9mdW5jcyA9IHsKIAkvKiB0cmFuc2xhdGUgc211IGluZGV4IGludG8gYXJj
dHVydXMgc3BlY2lmaWMgaW5kZXggKi8KIAkuZ2V0X3NtdV9tc2dfaW5kZXggPSBhcmN0dXJ1c19n
ZXRfc211X21zZ19pbmRleCwKQEAgLTE5NDUsNiArMTk3NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHB0YWJsZV9mdW5jcyBhcmN0dXJ1c19wcHRfZnVuY3MgPSB7CiAJLmR1bXBfcHB0YWJsZSA9
IGFyY3R1cnVzX2R1bXBfcHB0YWJsZSwKIAkuZ2V0X3Bvd2VyX2xpbWl0ID0gYXJjdHVydXNfZ2V0
X3Bvd2VyX2xpbWl0LAogCS5pc19kcG1fcnVubmluZyA9IGFyY3R1cnVzX2lzX2RwbV9ydW5uaW5n
LAorCS5kcG1fc2V0X3V2ZF9lbmFibGUgPSBhcmN0dXJ1c19kcG1fc2V0X3V2ZF9lbmFibGUsCiB9
OwogCiB2b2lkIGFyY3R1cnVzX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
