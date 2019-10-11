Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94DD3837
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 06:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CA56E3F4;
	Fri, 11 Oct 2019 04:09:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DE96E3F4
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 04:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDUoPQM9fuBhSRxi0KNHxYBEKOYJITXnqIq3Brba3etjZYT4a/A1O+Tolz3/FZ4suXOA7RPT/t513fDUQJA4Sep88rkjvmdJKMU0IymMCe1tQyMq709A47hCrf08OuVtixTNfIGvimQJSRKmKtMFA+vd8wx0iu6aiFFR/cMoVwmHlYnRNSVPniMK+p8cWcLVNsk/6++0TzfEyK5vZZuv915FvvLM871nxAaV9PMrpPpuKgIEhTyqrMxNeGMYe8A4NQTkszgCZWflbtEKfMM7NzpOpXRdTfeCl/VRlhC7liPgD/DNrymz2KMC6vnwLj/bHu/oxpPD+bvxNQLn/B14eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc2w1qYunN2N9tnf0yoHl+gPazOSVGGt+5uAYVyaEfc=;
 b=h6OlX2h1D///s6U30lQ6LD+LXQJ4+/bRIcAdtTYa4YriQQOOC358zHhNnZucDcOdMcs3WhnBqBf9t/BwL/qAEZmFeyrdzbb8am8FSppQlF3lkuW+0xm5k7N+0n4s8s5btWdlVlQUFFnj/7GKpqvNtTzKiVHgG+CWhAJbP6VInmtzUTVNALPd5XjCY8F2Gbpu9Fkix1uBu7luXVzHq+e3Vt34IUBTySTQBp/IgddsWEU+KIkaCPOa9WL+odkQBRNgB/LHilZ9djfZpLfEwwEtoCcEbBwM0I1AdrblMIRVl0S1KxpPZN1aB82ptQ866ODFGxZC35eG7CsOP8CSAtb8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3459.namprd12.prod.outlook.com (20.178.209.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 04:09:01 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 04:09:01 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Topic: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Index: AQHVf38fpZTVkQVYz0m5HpaUx8AeoadU02TAgAAAjWA=
Date: Fri, 11 Oct 2019 04:09:01 +0000
Message-ID: <BN8PR12MB3329BDAE6B3980D254CD022EE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
 <20191010152619.31011-3-alexander.deucher@amd.com>
 <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b7330c9-c312-4ca8-9b7c-08d74e00bfb3
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3459:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB345999DF02DF7A79A4490455E4970@BN8PR12MB3459.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(13464003)(199004)(14444005)(8936002)(256004)(81166006)(81156014)(25786009)(33656002)(55016002)(8676002)(6306002)(6436002)(66066001)(2501003)(26005)(4326008)(6246003)(476003)(3846002)(6116002)(186003)(5660300002)(486006)(52536014)(305945005)(7736002)(9686003)(66556008)(66476007)(74316002)(53546011)(66446008)(102836004)(6506007)(11346002)(99286004)(14454004)(316002)(446003)(64756008)(76116006)(478600001)(86362001)(229853002)(2940100002)(2906002)(71200400001)(71190400001)(110136005)(66946007)(76176011)(7696005)(966005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3459;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e86uXNEAh217KQogEad4pX27lOVfAjGR2TbuF9T4K4n/s2VOKWXPXbe12IW7LzUWNv2d9cyO/9jjKWWnGylGrGZNarImktXdpikgmXuYWCCf9LlEgPBZdh0zGUqc4SfkP0dZJENNl99bnu5Za4npCFbYTaxrIZcrff3Xcs/ZOdMTJKV7nbub+jRASIH4fBdXgAjh76l9LiB0YUnwawFHq+FjWJBquhjAuL3RZqwkfmQwlZoBvIvKl4YUSD0guw6nK+cYYgmoNhWTeNy0F8Upxk0dGc84zfkJ/JoRT88uNjp0Qi4ggTm0puhxbSnxR8uo49yFBZRptHlyYyS780eXQCv74gJ0nYxvWbK1N/ot3nAoVdx9mV/xg5FLSPP+bUCY6FJlBZ8YKAF6vg7jHPXSEPFUT4VlWaiwtr0kw3rUIxQzFzd0n9/7/ei7GnZX9vjo+ggrt1MDUbEaNujxg8h7GA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7330c9-c312-4ca8-9b7c-08d74e00bfb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 04:09:01.8240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eO5WYGZY4F/+PYG62wZxagJr1jm8cYabf5n9d+mjS4s/yDRdRYiATe6ZJUGZsoB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc2w1qYunN2N9tnf0yoHl+gPazOSVGGt+5uAYVyaEfc=;
 b=eOKtgn061CwWJIhzjG6Ex8W1iPpk3IMVC1FaRYdd3l8X2fDH7vDQ5UKcBVc1Ftd7qkS0sCWWhp10eJWgVFarb2EsIj8JzsdDGZWd9D59mCeh4C/2pA7d524BLTqXQ5SA6LOXgNP6ww9eE/PF9crnd2Ou+Eh8pi1cpl4SjhTgPfU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBUaGVyZSBhcmUgY2FzZXMgd2VyZSB3ZSBkb24ndCB3YW50IGl0Lg0KVHlwbzogd2VyZSAtPiB3
aGVyZT8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFF1YW4sIEV2YW4gDQpT
ZW50OiBGcmlkYXksIE9jdG9iZXIgMTEsIDIwMTkgMTI6MDcgUE0NClRvOiBBbGV4IERldWNoZXIg
PGFsZXhkZXVjaGVyQGdtYWlsLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVj
dDogUkU6IFtQQVRDSCAyLzVdIGRybS9hbWRncHU6IG1vdmUgZ3B1IHJlc2V0IG91dCBvZiBhbWRn
cHVfZGV2aWNlX3N1c3BlbmQNCg0KSXQgc2VlbXMgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfc3VzcGVu
ZCgpIG5lZWRzIHRvIGJlIHVwZGF0ZWQgYWNjb3JkaW5nbHkgYWxzby4NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4IERldWNoZXINClNlbnQ6IFRodXJzZGF5LCBP
Y3RvYmVyIDEwLCAyMDE5IDExOjI2IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpT
dWJqZWN0OiBbUEFUQ0ggMi81XSBkcm0vYW1kZ3B1OiBtb3ZlIGdwdSByZXNldCBvdXQgb2YgYW1k
Z3B1X2RldmljZV9zdXNwZW5kDQoNCk1vdmUgaXQgaW50byB0aGUgY2FsbGVyLiAgVGhlcmUgYXJl
IGNhc2VzIHdlcmUgd2UgZG9uJ3Qgd2FudCBpdC4gIFdlIG5lZWQgaXQgZm9yIGhpYmVybmF0aW9u
LCBidXQgd2UgZG9uJ3QgbmVlZCBpdCBmb3IgcnVudGltZSBwbS4NCg0KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgNCAtLS0tDQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgNyArKysrKystDQogMiBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCmluZGV4IDliOWIxNTM2MDE5NC4uOTFiZGIyNDZl
NDA1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCkBA
IC0zMTczLDEwICszMTczLDYgQEAgaW50IGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQsIGJvb2wgZmJjb24pDQogCQkvKiBTaHV0IGRvd24g
dGhlIGRldmljZSAqLw0KIAkJcGNpX2Rpc2FibGVfZGV2aWNlKGRldi0+cGRldik7DQogCQlwY2lf
c2V0X3Bvd2VyX3N0YXRlKGRldi0+cGRldiwgUENJX0QzaG90KTsNCi0JfSBlbHNlIHsNCi0JCXIg
PSBhbWRncHVfYXNpY19yZXNldChhZGV2KTsNCi0JCWlmIChyKQ0KLQkJCURSTV9FUlJPUigiYW1k
Z3B1IGFzaWMgcmVzZXQgZmFpbGVkXG4iKTsNCiAJfQ0KIA0KIAlyZXR1cm4gMDsNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCmluZGV4IGQ0M2M0NmRlNzgwNy4uNjQxNDEz
ODZlNjAzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCkBAIC0x
MTE4LDggKzExMTgsMTMgQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikgIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX2ZyZWV6ZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpICB7DQogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQorCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX2Rldi0+ZGV2X3ByaXZh
dGU7DQorCWludCByOw0KIA0KLQlyZXR1cm4gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYs
IGZhbHNlLCB0cnVlKTsNCisJciA9IGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChkcm1fZGV2LCBmYWxz
ZSwgdHJ1ZSk7DQorCWlmIChyKQ0KKwkJcmV0dXJuIHI7DQorCXJldHVybiBhbWRncHVfYXNpY19y
ZXNldChhZGV2KTsNCiB9DQogDQogc3RhdGljIGludCBhbWRncHVfcG1vcHNfdGhhdyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQotLQ0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
