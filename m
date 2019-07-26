Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D701476EAA
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 18:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EC36EDC2;
	Fri, 26 Jul 2019 16:13:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40216EDC1
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 16:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThdLHGY361u/5xy1jMyzWi2sr87Cx9jJSFW0TR4C55HQjbCzNsxL+TqvakpG4ybeMhKCU7ecdkSwFYqRAO30wmTv+KdEyBPe8ph/wygxQ3eVZzEK+OYilBC8g9egHCDoYUN+dmFH3ezg19iyQmaq59+HKaAPlSkkiDxwEqlQPTNBmQqA066DrTzzzliWQ9sSTs8NUTS1SwnU0KDT4oTLBZUTcygsrm9t60TDmzFHyDkbERKYp+RtHr350663HrBqJiZETabGKaWIRMqD4RcPtmCNJlmbL4/MoFHip9RJW8Y+6UkOZYgGcY2TDti+dVuqMYELSurR+i/DGr8y/RoENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6EkJ/ESJbyuH57qoZA5Lj7MJ6sar89wj/iVLH3o6SU=;
 b=Nx5ZTbXLIf/1HX67FVouDq8YHA6p/gTa/C+mQ9NVNpR9DSgZz0X1citffyNKCY0vovthgr4FB0qLZE+ieOhs18ImenQtdk6sCOLY1ocK4LMJtDS0DjrImjhR4G/55lxPmftvkigqVKQgMbJlOMvRBxIMKZY92n3n1lLOHPofC08dHrshU+yc1OZBgwuMgxUQGTHnbJW0RER3A7Jgza9EmW3c2OSSK0uzFEJ85Da+bpLgnyUsgK9AYhnYPENRZIquiuW4ncmCDni3lsJb8DUa5QA4x1XTV1vGBYdPKFwk5F9yYW6vQF0AC07Di4FN40n09iZVDuVmPAqKfpbSkKCBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3189.namprd12.prod.outlook.com (20.179.92.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 16:13:01 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 16:13:01 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix the build without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Thread-Topic: [PATCH] drm/amdgpu/display: fix the build without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Thread-Index: AQHVQ8yBr7+XacU9PkqA/He9uefizabdEmCA
Date: Fri, 26 Jul 2019 16:13:00 +0000
Message-ID: <40082109-eae3-8a35-c6d8-2e5f8907fd57@amd.com>
References: <20190726160906.6705-1-alexander.deucher@amd.com>
In-Reply-To: <20190726160906.6705-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::26) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a97ace0-da58-4ac4-401a-08d711e42156
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3189; 
x-ms-traffictypediagnostic: BYAPR12MB3189:
x-microsoft-antispam-prvs: <BYAPR12MB31899EFCEE873CD5C1EC937BECC00@BYAPR12MB3189.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(199004)(189003)(6436002)(36756003)(478600001)(6246003)(25786009)(186003)(4326008)(2906002)(76176011)(316002)(53936002)(8936002)(26005)(2501003)(386003)(5660300002)(66476007)(53546011)(66556008)(6506007)(64756008)(102836004)(81166006)(68736007)(81156014)(99286004)(8676002)(14454004)(71190400001)(66946007)(486006)(476003)(31686004)(110136005)(229853002)(256004)(11346002)(7736002)(66066001)(446003)(2616005)(305945005)(6512007)(86362001)(3846002)(6486002)(52116002)(6116002)(71200400001)(31696002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3189;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z0JGky9LTYI+8GT129ztYNPzBOoe8Rav1RKMD6TzTz0613oDVJNMx1UsdmQaOFz8FMyUoaklxksqgN+wHQmrOJ1MIqQ3dschaa2DOTgOKCC9aksLdG4Jd9yGUW5drqp7UjYOQi3CzpgLAoMiyhY4/O2iPDUmLZiMvRCaXpq8B0xpxdvc7S9M/NsZn4gknXi0HU5jr4HEdpWE297CFYygvs3bXKsiAivB4W7OXBOLDfUjYlUwBqcnouZEt/DYVlVjZKxqnRCx8eBRhAN9zMom2I6kL+JvsCFjxBiB0gnUTIg4pQgtD4BBe0wxcJrOZZvUpKHvWfF8KzBHDG/tMzJwGFUBmsFZXIdNlUeJDBmAdnXj0UD0k3bHG7Ujsd2tE7GbrpzqEhxj/DF5no0bpc//tYlZ/4ea3OJIneh7PpTcx7w=
Content-ID: <323BA378B780F242AEBD990847A01749@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a97ace0-da58-4ac4-401a-08d711e42156
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 16:13:00.9648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6EkJ/ESJbyuH57qoZA5Lj7MJ6sar89wj/iVLH3o6SU=;
 b=sO+TdMG73vSAuSdnbtXRrz43IMnhgF5IZSuc5CFcnRate+s2poe1ys+EDMG+o4tvDaWbIaA23WS2B+fEg2aVXL8VcMj1dJnApkk5XFPw7mJ6wuvv2NoYj8ivON6m7HZDlUD9QJGrmAGR8DFI7T24guRKk4PmspOSGX3QF7WwHro=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNy8yNi8xOSAxMjowOSBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBTb21lIGNvZGUgd2Fz
IG1pc3NpbmcgdGhlIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUIGd1YXJkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
DQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0Bh
bWQuY29tPg0KDQpXZSBwcm9iYWJseSB3YW50IHRvIGRyb3AgdGhpcyBhbmQgdGhlIERDTjIgZ3Vh
cmQgZXZlbnR1YWxseSB0aG91Z2guDQoNCk5pY2hvbGFzIEthemxhdXNrYXMNCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDIg
KysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYw0KPiBpbmRl
eCA2OWU0ZDBkOTZjN2YuLjM4YjNjODliMmE1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMNCj4gQEAgLTYzMCw5ICs2
MzAsMTEgQEAgc3RhdGljIHZvaWQgZGNuMjBfaW5pdF9odyhzdHJ1Y3QgZGMgKmRjKQ0KPiAgIAkJ
fQ0KPiAgIAl9DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQN
Cj4gICAJLyogUG93ZXIgZ2F0ZSBEU0NzICovDQo+ICAgCWZvciAoaSA9IDA7IGkgPCByZXNfcG9v
bC0+cmVzX2NhcC0+bnVtX2RzYzsgaSsrKQ0KPiAgIAkJZGNuMjBfZHNjX3BnX2NvbnRyb2woaHdz
LCByZXNfcG9vbC0+ZHNjc1tpXS0+aW5zdCwgZmFsc2UpOw0KPiArI2VuZGlmDQo+ICAgDQo+ICAg
CS8qIEJsYW5rIHBpeGVsIGRhdGEgd2l0aCBPUFAgRFBHICovDQo+ICAgCWZvciAoaSA9IDA7IGkg
PCBkYy0+cmVzX3Bvb2wtPnRpbWluZ19nZW5lcmF0b3JfY291bnQ7IGkrKykgew0KPiANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
