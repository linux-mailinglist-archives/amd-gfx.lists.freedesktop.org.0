Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2E79EA2
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 04:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6AB897F3;
	Tue, 30 Jul 2019 02:24:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67E7897F3
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 02:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG9IXTnSiheObXAwP1gJxcVvi6bQK25ibd5rzPyO6+mZ1AKWGWY7hUFK2715mpRFiiX1lrcSzjFla5qGNB6YDfdVjTn9Kk/8pTP4sPI3RGPF/qBqq8akNQf43aai8wtx4GUTnexYLxaWYjPTSjt+hLSIvIBgWjgK7++xk1ifkvMlmwVdguMLtv+qh94BKOIUyFRsg9JL8kMJGDyHCcImN8+U5mxNtD09rpwn5Eqlj8CLANz4rjT40uNkolCkrY5+TcEFGP9roAfnEwJu6mv7Q5MZ7+6xPU7c8PYRv/58iWNUiJqUuLJFoSADn1Mnb5C6BbPgbGel1FArZphlQBcswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61LeVGNblaNuGoe8Nb0LryGV5nu5LH89GU2Po2Ya3tQ=;
 b=ZseFQ6NOd25GIz5VfDVTw299hhE/wfndpehrqonIuQaX3nxGRffHR8mV5QF5ATt3/ejOqmZDBd/eRX+vmGvZvdDSsE38D3SyenSBW1F8jhkYWEio3ohIRPEeOfqh/jtX4zObAf3il324BGdt8Re/3paSKnvJVczVDX1TM3Xm7blug+GWqT2yrRWOBU489WTUtlXAucA5/J6DiWM2jutD2u1rbcfhPO7wXMFod9oAo5pAW4QdlcZUaBN0mhbICsPpkd5y5ENX6e+an6wGQfirlP1hNz/DOEuGSKMNqorWkXxzO48dmkYFMgC4TZTuyf8Jf+aXbKwqIN6fpCu8815Q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3854.namprd12.prod.outlook.com (10.255.237.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 02:24:33 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 02:24:33 +0000
From: Kevin Wang <kevwa@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 16/30] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Topic: [PATCH 16/30] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Index: AQHVRkpyh/85YMnnyUqyPb2mvds7uabibzsA
Date: Tue, 30 Jul 2019 02:24:33 +0000
Message-ID: <917d33d4-6f59-59f3-d671-5c2167689f4e@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
 <20190729201508.16136-17-alexander.deucher@amd.com>
In-Reply-To: <20190729201508.16136-17-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf15c8d-b27e-4530-1c93-08d714950f34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3854; 
x-ms-traffictypediagnostic: MN2PR12MB3854:
x-microsoft-antispam-prvs: <MN2PR12MB38547D52F3F55C8936A71F32A2DC0@MN2PR12MB3854.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(66446008)(64756008)(76176011)(66946007)(66476007)(66556008)(3846002)(6116002)(229853002)(66066001)(53936002)(6512007)(186003)(25786009)(31696002)(36756003)(52116002)(31686004)(26005)(99286004)(53546011)(6506007)(386003)(102836004)(305945005)(8676002)(7736002)(14454004)(71190400001)(6436002)(256004)(68736007)(316002)(4326008)(71200400001)(6486002)(2616005)(446003)(476003)(2501003)(486006)(5660300002)(81156014)(8936002)(2906002)(54906003)(11346002)(110136005)(81166006)(6246003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3854;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FyVmZ1jEfeJcp5FJ8FOQGGmK1iKFIBQRP23XtZJEux+vnTCMjluEovBJj3rt3wtq3LfZIIyObMJlcKK/l1UFq1ubI+ZGoa986nzZZzbRfXp9HxDAvjEl/Ik1IwEWJ7BTJh4JMzL8oXjVoqzpi+uSiLOUiho3wx1bbq1OK57Bags3KW1Co2B0Nb7yARvRyHC7nSoa9oz49WoE6JlRScgZeZb2Pp3Gmvz2Qa0qYza3kKk9QrhOFUGBjJYhcaS/5n/MVChQBR0QC1SaQ6cz20+Dxwpa2oBaLv3BzlHVrF89mi6gs3c8TQyi8Y1E9McTw9s7VRXbXHK7KYJ4h3SvOGZE7+m8pB/LBxfPymBKAFOcu+U/Y2rF/CXOOcumnLFzVRRXnliUPIpDib9YRaCIQxjYHAnaamrrN1QHKWnq6e4I4Is=
Content-ID: <7A4703D1F3B94F4F9F6263A367477EC3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf15c8d-b27e-4530-1c93-08d714950f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 02:24:33.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61LeVGNblaNuGoe8Nb0LryGV5nu5LH89GU2Po2Ya3tQ=;
 b=iFlrm5/7DnOJwv1fIdp1OZFvPK1GC1WLnPB0IN/yVqFzmnOLc7yttsiXq4qfmNvQ9b7oQm7DWwfP9V3bsa0gZJeJgclE80F9syy+HadgjdZIrDsmua6C7RpnpVGXhgl7yYzzN7sxSmzaqNZ2JUv/JDQ7rOMBUUjYEmuz5fhKU3Y=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiA3LzMwLzE5IDQ6MTQgQU0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4NCj4gTm8gVkNOIERQTSBiaXQgY2hlY2sgYXMgdGhh
dCdzIGRpZmZlcmVudCBmcm9tIFZDTiBQRy4gQWxzbw0KPiBubyBleHRyYSBjaGVjayBmb3IgcG9z
c2libGUgZG91YmxlIGVuYWJsZW1lbnQvZGlzYWJsZW1lbnQNCj4gYXMgdGhhdCdzIGFscmVhZHkg
ZG9uZSBieSBWQ04uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFt
ZC5jb20+DQo+IFJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YyB8IDI2ICsrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBpbmRleCA5ZGQ5NmQ4YjhkZDUuLjAxZDUzNGM4NDQyZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPiBA
QCAtNTkxLDI3ICs1OTEsMTkgQEAgc3RhdGljIGludCBuYXZpMTBfc2V0X2RlZmF1bHRfZHBtX3Rh
YmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KPiAgIHN0YXRpYyBpbnQgbmF2aTEwX2RwbV9z
ZXRfdXZkX2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpDQo+ICAg
ew0KPiAgIAlpbnQgcmV0ID0gMDsNCj4gLQlzdHJ1Y3Qgc211X3Bvd2VyX2NvbnRleHQgKnNtdV9w
b3dlciA9ICZzbXUtPnNtdV9wb3dlcjsNCj4gLQlzdHJ1Y3Qgc211X3Bvd2VyX2dhdGUgKnBvd2Vy
X2dhdGUgPSAmc211X3Bvd2VyLT5wb3dlcl9nYXRlOw0KPiAgIA0KPiAtCWlmIChlbmFibGUgJiYg
cG93ZXJfZ2F0ZS0+dXZkX2dhdGVkKSB7DQo+IC0JCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVk
KHNtdSwgU01VX0ZFQVRVUkVfRFBNX1VWRF9CSVQpKSB7DQo+IC0JCQlyZXQgPSBzbXVfc2VuZF9z
bWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1Bvd2VyVXBWY24sIDEpOw0KPiAtCQkJaWYg
KHJldCkNCj4gLQkJCQlyZXR1cm4gcmV0Ow0KPiAtCQl9DQo+IC0JCXBvd2VyX2dhdGUtPnV2ZF9n
YXRlZCA9IGZhbHNlOw0KPiArCWlmIChlbmFibGUpIHsNCj4gKwkJcmV0ID0gc211X3NlbmRfc21j
X21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19Qb3dlclVwVmNuLCAxKTsNCj4gKwkJaWYgKHJl
dCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICAgCX0gZWxzZSB7DQo+IC0JCWlmICghZW5hYmxlICYm
ICFwb3dlcl9nYXRlLT51dmRfZ2F0ZWQpIHsNCj4gLQkJCWlmIChzbXVfZmVhdHVyZV9pc19lbmFi
bGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX1VWRF9CSVQpKSB7DQo+IC0JCQkJcmV0ID0gc211X3Nl
bmRfc21jX21zZyhzbXUsIFNNVV9NU0dfUG93ZXJEb3duVmNuKTsNCj4gLQkJCQlpZiAocmV0KQ0K
PiAtCQkJCQlyZXR1cm4gcmV0Ow0KPiAtCQkJfQ0KPiAtCQkJcG93ZXJfZ2F0ZS0+dXZkX2dhdGVk
ID0gdHJ1ZTsNCj4gLQkJfQ0KPiArCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01T
R19Qb3dlckRvd25WY24pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gICAJ
fQ0KPiAgIA0KPiArCXNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfVkNO
X1BHX0JJVCwgZW5hYmxlKTsNCg0KW2tldmluXToNCg0KeW91IHNob3VsZCBjaGVjayByZXR1cm4g
dmFsdWUsIHRoaXMgc2hvdWxkIG5vdCBiZSBiYXNlZCBvbiBzb21lIGFzc3VtcHRpb25zLg0KDQo+
ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
