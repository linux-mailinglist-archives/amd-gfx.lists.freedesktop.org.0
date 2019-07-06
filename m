Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A261226
	for <lists+amd-gfx@lfdr.de>; Sat,  6 Jul 2019 18:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856789DA8;
	Sat,  6 Jul 2019 16:21:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F6989DA8
 for <amd-gfx@lists.freedesktop.org>; Sat,  6 Jul 2019 16:21:09 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3444.namprd12.prod.outlook.com (20.178.211.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 6 Jul 2019 16:21:07 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 16:21:07 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/psp11: simplify the ucode register logic
Thread-Topic: [PATCH] drm/amdgpu/psp11: simplify the ucode register logic
Thread-Index: AQHVM8HvWTi3qVZpDUKLOi9hoAzP26a9xgu4
Date: Sat, 6 Jul 2019 16:21:07 +0000
Message-ID: <BN8PR12MB3602187C2AD79EEBA7E3AA4C89F40@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190706061313.28385-1-alexander.deucher@amd.com>
In-Reply-To: <20190706061313.28385-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8d7b03a-072a-4f95-ecec-08d7022df395
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3444; 
x-ms-traffictypediagnostic: BN8PR12MB3444:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3444E904489C5EFFA3F4D8B189F40@BN8PR12MB3444.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(478600001)(2906002)(99286004)(8936002)(86362001)(7696005)(305945005)(53936002)(76176011)(72206003)(6116002)(3846002)(5660300002)(73956011)(71190400001)(52536014)(14454004)(66066001)(66556008)(229853002)(66446008)(76116006)(71200400001)(66476007)(66946007)(64756008)(476003)(186003)(9686003)(26005)(11346002)(33656002)(6436002)(25786009)(55016002)(6306002)(256004)(446003)(6506007)(53546011)(316002)(102836004)(110136005)(966005)(2501003)(4326008)(6246003)(68736007)(74316002)(7736002)(8676002)(486006)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3444;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VjBpy5+aP49URk+hwySL1OjKel7qRmTba56OkC6oWYwcyHPW+CAaGngRx/9KDzmzFfqF0jBNbL3lG3ER0CiAsMmQVsWnMwNK9eZ1FM5YRAm0fAlQUlH55NLfJ/KJXnO9JcMCxDOooUf+h9keR+rdZUZlxzmseR7YxO7IlUl5lUvVKcxDzeZYL43PeWHId0NRlMwMDYI+k3Y5sAL9JfbBEnP3TEphSal4tT9B02j5Ow+ARYe112WQX1L4dkwH0kRUPxPVKv3R3ZmsHtDkep8+Tn5FdHatNUvcrERz7f6dm3McR2LbzFXmUOrWkEOy9c11upDpsgrz3O0RSSRufALMwoLv481CVbOVOfxpUovj2wt0rN4AjPNBZppCpKfCnpowi4avHMlKQkRVuJ63jdivm81ksJZ2O9Cz4wlQu0q8qU0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d7b03a-072a-4f95-ecec-08d7022df395
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 16:21:07.6599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3444
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvrZjmvo2ARUmDiqDkSMC1iEUp7AYGV2E2wTJlR82MA=;
 b=iTMV0h2SruQtOJbiZqPuhaTf+ppQJkIfD3RwSjGSpndmEdX/jmwm/drADCWA0+40SSMUc84lLm/9qg/tBxdDYXe1cOB0M5jwxIgrtCwDFaWo/sLpDiargbcbYZWLxf1UojSLyivAwaCDAFxPxDXhE/gaz/2GbgYXmXPEHxTyqh4=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IFNhdHVyZGF5LCBKdWx5
IDYsIDIwMTkgMjoxMyBQTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IERl
dWNoZXIsIEFsZXhhbmRlcgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvcHNwMTE6IHNpbXBs
aWZ5IHRoZSB1Y29kZSByZWdpc3RlciBsb2dpYwoKU3BsaXQgaXQgYmV0d2VlbiBuYXZpMTAgYW5k
IG5ld2VyIGFuZCBldmVyeXRoaW5nIGJlZm9yZQpuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAxMiArKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9wc3BfdjExXzAuYwppbmRleCA5YWJmNjExY2MyZWQuLjFiNmMyMGNhMzU4OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKQEAgLTUzOCwxMiArNTM4LDEwIEBAIHBzcF92
MTFfMF9zcmFtX21hcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKCiAgICAgICAgY2FzZSBB
TURHUFVfVUNPREVfSURfUkxDX0c6CiAgICAgICAgICAgICAgICAqc3JhbV9vZmZzZXQgPSAweDIw
MDA7Ci0gICAgICAgICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwICYm
Ci0gICAgICAgICAgICAgICAgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTE0KSB7Cisg
ICAgICAgICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9OQVZJMTApIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNF
VChHQywgMCwgbW1STENfR1BNX1VDT0RFX0FERFIpOwogICAgICAgICAgICAgICAgICAgICAgICAq
c3JhbV9kYXRhX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVJMQ19HUE1f
VUNPREVfREFUQSk7Ci0gICAgICAgICAgICAgICB9Ci0gICAgICAgICAgICAgICBlbHNlIHsKKyAg
ICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgICAgICAgICAgICpzcmFtX2FkZHJf
cmVnX29mZnNldCA9IGFkZXYtPnJlZ19vZmZzZXRbR0NfSFdJUF1bMF1bMV0gKyBtbVJMQ19HUE1f
VUNPREVfQUREUl9OVjEwOwogICAgICAgICAgICAgICAgICAgICAgICAqc3JhbV9kYXRhX3JlZ19v
ZmZzZXQgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdWzFdICsgbW1STENfR1BNX1VDT0RF
X0RBVEFfTlYxMDsKICAgICAgICAgICAgICAgIH0KQEAgLTU1MSwxMiArNTQ5LDEwIEBAIHBzcF92
MTFfMF9zcmFtX21hcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKCiAgICAgICAgY2FzZSBB
TURHUFVfVUNPREVfSURfU0RNQTA6CiAgICAgICAgICAgICAgICAqc3JhbV9vZmZzZXQgPSAweDA7
Ci0gICAgICAgICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwICYmCi0g
ICAgICAgICAgICAgICAgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTE0KSB7CisgICAg
ICAgICAgICAgICBpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9OQVZJMTApIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNFVChT
RE1BMCwgMCwgbW1TRE1BMF9VQ09ERV9BRERSKTsKICAgICAgICAgICAgICAgICAgICAgICAgKnNy
YW1fZGF0YV9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNFVChTRE1BMCwgMCwgbW1TRE1BMF9V
Q09ERV9EQVRBKTsKLSAgICAgICAgICAgICAgIH0KLSAgICAgICAgICAgICAgIGVsc2UgeworICAg
ICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgICAgICAgICAgKnNyYW1fYWRkcl9y
ZWdfb2Zmc2V0ID0gYWRldi0+cmVnX29mZnNldFtHQ19IV0lQXVswXVsxXSArIG1tU0RNQTBfVUNP
REVfQUREUl9OVjEwOwogICAgICAgICAgICAgICAgICAgICAgICAqc3JhbV9kYXRhX3JlZ19vZmZz
ZXQgPSBhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdWzBdWzFdICsgbW1TRE1BMF9VQ09ERV9EQVRB
X05WMTA7CiAgICAgICAgICAgICAgICB9Ci0tCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
