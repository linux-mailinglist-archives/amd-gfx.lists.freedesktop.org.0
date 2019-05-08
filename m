Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC21814D
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 22:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363AE8993B;
	Wed,  8 May 2019 20:47:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740079.outbound.protection.outlook.com [40.107.74.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84718993B
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 20:47:01 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0246.namprd12.prod.outlook.com (10.174.53.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Wed, 8 May 2019 20:46:59 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::e1ec:c86a:e5a1:eb2e]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::e1ec:c86a:e5a1:eb2e%6]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 20:46:59 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix S3 test issue
Thread-Topic: [PATCH] drm/amdgpu: Fix S3 test issue
Thread-Index: AQHVBd8uUmseKAxvDk6Opcy1WUTJkA==
Date: Wed, 8 May 2019 20:46:59 +0000
Message-ID: <1557348409-18026-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8db47a1-302a-4337-babd-08d6d3f650be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0246; 
x-ms-traffictypediagnostic: CY4PR1201MB0246:
x-microsoft-antispam-prvs: <CY4PR1201MB0246C316AA2F257D73297BA0E4320@CY4PR1201MB0246.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(4326008)(6486002)(6512007)(5640700003)(53936002)(6436002)(99286004)(316002)(6506007)(386003)(102836004)(186003)(25786009)(26005)(2906002)(6116002)(3846002)(2501003)(6916009)(52116002)(86362001)(5660300002)(68736007)(305945005)(81166006)(81156014)(36756003)(66476007)(8936002)(2351001)(71190400001)(71200400001)(8676002)(50226002)(476003)(478600001)(64756008)(73956011)(66556008)(66446008)(66946007)(14454004)(256004)(486006)(72206003)(7736002)(66066001)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0246;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: knPSCMlWxDp1rggquCuV7fo9bxpkwwj5g91P3YN0gNs/bs2gCMgpE3zYHw7KEAn1UI+Bl/UlOE6uUTurrrMGKIJd921WBYT5jQFe3Tx8xcYE8V4Qvhx4lUOqAjTbPUIBHcVijrupLuAsJj2lFCRYXzT2WHshhzYZ9Z7F16hd3jvY+KFlU7CX5kaLZNgJ5wbRdvPKiNb290Bx2VO0sysz6sTQ8B4/nqjOdfLpGB/K4vktSNiFxJavn1VMpU8kGC1Faemf+HFSH81sgAHHUR8Belkb/ANuV6BaJs7KNDN2eOHnk6rJxJ/oFqVO0T43hDbEi0FG6gw9JsTou6PTShJSj9cZJmggJUF5ucoHU0D2kPFROnkTknC7DMAf+08NDnqZKbfxOHfuHsswCKszK/A8NpHkxCYdCaQkyYS9rSNTe5s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8db47a1-302a-4337-babd-08d6d3f650be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 20:46:59.3849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtIYAGIh96bLlI7AVtse0qVK2yKNM3TqYbcl+7QJH5c=;
 b=y4+/QPddiXvszD+y7T4hbPaVDyeFuBmovIDUxK06rMD+OuSthQpFpVV39UDW8vsH+REw3EsVKisE+klPEAcbcLe06Kv259MijYCFejaIiAGt/yT66WwR4WsCco/boU88FkQPx2H7oLKePjxQAa/p5moliK3H5aZEaZ5SbXrxGoU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Zhu, James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHVyaW5nIFMzIHRlc3QsIHdoZW4gc3lzdGVtIHdha2UgdXAgYW5kIHJlc3VtZSwgcmFzIGludGVy
ZmFjZQ0KaXMgYWxyZWFkeSBhbGxvY2F0ZWQuIE1vdmUgd29ya2Fyb3VuZCBiZWZvcmUgcmFzIGp1
bXBzIHRvIHJlc3VtZQ0Kc3RlcCBpbiBnZnhfdjlfMF9lY2NfbGF0ZV9pbml0LCBhbmQgbWFrZSBz
dXJlIHdvcmthcm91bmQgYXBwbGllZA0KZHVyaW5nIHJlc3VtZS4gQWxzbyByZW1vdmUgdW51c2Vk
IG1tR0JfRURDX01PREUgY2xlYXJpbmcuDQoNClNpZ25lZC1vZmYtYnk6IEphbWVzIFpodSA8SmFt
ZXMuWmh1QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIHwgMTQgKysrKystLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCmlu
ZGV4IDE0ZTY3MWQuLjM0YTAxZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jDQpAQCAtMzYzMCw3ICszNjMwLDYgQEAgc3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ3By
X3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAlzdHJ1Y3QgYW1kZ3B1
X2liIGliOw0KIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmID0gTlVMTDsNCiAJaW50IHIsIGksIGo7DQot
CXUzMiB0bXA7DQogCXVuc2lnbmVkIHRvdGFsX3NpemUsIHZncHJfb2Zmc2V0LCBzZ3ByX29mZnNl
dDsNCiAJdTY0IGdwdV9hZGRyOw0KIA0KQEAgLTM2NDIsOSArMzY0MSw2IEBAIHN0YXRpYyBpbnQg
Z2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikNCiAJaWYgKCFyaW5nLT5zY2hlZC5yZWFkeSkNCiAJCXJldHVybiAwOw0KIA0KLQl0bXAgPSBS
UkVHMzJfU09DMTUoR0MsIDAsIG1tR0JfRURDX01PREUpOw0KLQlXUkVHMzJfU09DMTUoR0MsIDAs
IG1tR0JfRURDX01PREUsIDApOw0KLQ0KIAl0b3RhbF9zaXplID0NCiAJCSgoQVJSQVlfU0laRSh2
Z3ByX2luaXRfcmVncykgKiAzKSArIDQgKyA1ICsgMikgKiA0Ow0KIAl0b3RhbF9zaXplICs9DQpA
QCAtMzgxMCw2ICszODA2LDExIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2
b2lkICpoYW5kbGUpDQogCQlyZXR1cm4gMDsNCiAJfQ0KIA0KKwkvKiByZXF1aXJlcyBJQnMgc28g
ZG8gaW4gbGF0ZSBpbml0IGFmdGVyIElCIHBvb2wgaXMgaW5pdGlhbGl6ZWQgKi8NCisJciA9IGdm
eF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMoYWRldik7DQorCWlmIChyKQ0KKwkJcmV0dXJu
IHI7DQorDQogCWlmICgqcmFzX2lmKQ0KIAkJZ290byByZXN1bWU7DQogDQpAQCAtMzgxNywxMSAr
MzgxOCw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUp
DQogCWlmICghKnJhc19pZikNCiAJCXJldHVybiAtRU5PTUVNOw0KIA0KLQkvKiByZXF1aXJlcyBJ
QnMgc28gZG8gaW4gbGF0ZSBpbml0IGFmdGVyIElCIHBvb2wgaXMgaW5pdGlhbGl6ZWQgKi8NCi0J
ciA9IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMoYWRldik7DQotCWlmIChyKQ0KLQkJ
cmV0dXJuIHI7DQotDQogCSoqcmFzX2lmID0gcmFzX2Jsb2NrOw0KIA0KIAlyID0gYW1kZ3B1X3Jh
c19mZWF0dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsICpyYXNfaWYsIDEpOw0KLS0gDQoyLjcuNA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
