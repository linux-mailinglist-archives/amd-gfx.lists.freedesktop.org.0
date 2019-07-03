Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0E5DD49
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 06:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C7D6E0A6;
	Wed,  3 Jul 2019 04:18:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6EF6E0A6
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 04:18:30 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3919.namprd12.prod.outlook.com (10.255.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 04:18:28 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::14b7:2b0d:c355:bb32]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::14b7:2b0d:c355:bb32%5]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 04:18:28 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amd/powerplay: increase waiting time for smu response
Thread-Topic: [PATCH] drm/amd/powerplay: increase waiting time for smu response
Thread-Index: AQHVMVZdq9aOrPru8UK6AGHgTk4y1A==
Date: Wed, 3 Jul 2019 04:18:28 +0000
Message-ID: <1562127464-25780-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:203:b0::14) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e90dbb-f8c5-4a7a-e2dd-08d6ff6d7fe3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3919; 
x-ms-traffictypediagnostic: MN2PR12MB3919:
x-microsoft-antispam-prvs: <MN2PR12MB3919B2B5D1412AF07A18C7A7EFFB0@MN2PR12MB3919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(189003)(199004)(81166006)(81156014)(8676002)(386003)(6486002)(66946007)(64756008)(73956011)(2906002)(6436002)(66066001)(66556008)(86362001)(6636002)(50226002)(3846002)(6116002)(102836004)(7736002)(478600001)(6506007)(66446008)(66476007)(8936002)(99286004)(110136005)(36756003)(14454004)(486006)(4326008)(2501003)(71200400001)(316002)(6512007)(476003)(71190400001)(186003)(72206003)(2616005)(52116002)(305945005)(68736007)(256004)(5660300002)(53936002)(25786009)(26005)(69900200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3919;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tdqoaLhYECbJAu5kOwwHlRveP0iBfc4c2HMzvNYZmVHECyE2MOZDSonB4G/dfwP4pxJid+l3FvW9RQ6D841g/fkx8qKza5lZ5yT/MW8bNJ6T9dKdSmXnSdxVTl4JqWibF17nn+ymDkCXtDxY6XeCR3KJrguecczwNuDa2gaFLdZ3aGFdturhamFnYaF3ReHpv4QTN0nH+JmIPiTYmNGi1mY56cvdVL3CO0Y1zwA+nXG1g1CI5UHIwcfppEWWbHtSQWU9b/xEoOlSC/aXU1CMrKuGKM7JpVae9p7QiBBlSvJvYqf0ypfR//vmwKC8vL+GIF4RO0mE0HEjSf+UqkjyLSl2poc3sGpOZx9aLj6tnLLfWDixsPHZokkGYz8TXi7eQN+k+/9Z+jy4yJ+MtZyW43oBIU0dcbTl8ZQIrkNDxC8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e90dbb-f8c5-4a7a-e2dd-08d6ff6d7fe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 04:18:28.7349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+b0OfYXJCnutxJ83yxvV43N/na+zrRlEqIUWsNUBOQ=;
 b=zRHJMrHkreabnhTUdR8fXA/UIQvUoYm5q4UKgz2ZXWxJzwn6nLUwJg8ZDpqqt46+x39vJYL5u34yTYN2eBjd/1ShgvMtRKmEPwlgj9u9/5dWWancB9HyY4nwTJms41IRXzqg4mY0paaecgY4cels5b7Jhk3Df/mvfDNe1/PtEuc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2Ugb2JzZXJ2ZWQgc29tZSBTTVUgY29tbWFuZHMgdGFrZSBtb3JlIHRpbWUgZm9yIGV4ZWN1dGlv
biwKc28gaW5jcmVhc2Ugd2FpdGluZyB0aW1lIGZvciByZXNwb25zZS4KClNpZ25lZC1vZmYtYnk6
IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211X3YxMV8wLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jCmluZGV4IGJjMzk2OTAuLjg4ZDMxMjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCkBAIC02NCw5ICs2NCw5IEBAIHN0YXRpYyBpbnQgc211X3Yx
MV8wX3JlYWRfYXJnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqYXJnKQogc3Rh
dGljIGludCBzbXVfdjExXzBfd2FpdF9mb3JfcmVzcG9uc2Uoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7Ci0JdWludDMy
X3QgY3VyX3ZhbHVlLCBpOworCXVpbnQzMl90IGN1cl92YWx1ZSwgaSwgdGltZW91dCA9IGFkZXYt
PnVzZWNfdGltZW91dCAqIDEwOwogCi0JZm9yIChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91
dDsgaSsrKSB7CisJZm9yIChpID0gMDsgaSA8IHRpbWVvdXQ7IGkrKykgewogCQljdXJfdmFsdWUg
PSBSUkVHMzJfU09DMTUoTVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwKTsKIAkJaWYgKChjdXJf
dmFsdWUgJiBNUDFfQzJQTVNHXzkwX19DT05URU5UX01BU0spICE9IDApCiAJCQlicmVhazsKQEAg
LTc0LDcgKzc0LDcgQEAgc3RhdGljIGludCBzbXVfdjExXzBfd2FpdF9mb3JfcmVzcG9uc2Uoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJfQogCiAJLyogdGltZW91dCBtZWFucyB3cm9uZyBsb2dp
YyAqLwotCWlmIChpID09IGFkZXYtPnVzZWNfdGltZW91dCkKKwlpZiAoaSA9PSB0aW1lb3V0KQog
CQlyZXR1cm4gLUVUSU1FOwogCiAJcmV0dXJuIFJSRUczMl9TT0MxNShNUDEsIDAsIG1tTVAxX1NN
Tl9DMlBNU0dfOTApID09IDB4MSA/IDAgOiAtRUlPOwotLSAKMS45LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
