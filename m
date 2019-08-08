Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC086693
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 18:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337106E890;
	Thu,  8 Aug 2019 16:02:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7F6E890
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 16:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnoH18710WqGvRfTPLZttPzLyVJDVgi0gLqaFdhpw5PBuxMa9BrqlEJcW+8bndJ2YZ5BoFhBGh8Rv2gNJDXvwYzFTmz65l8XVM8pzhiQhg7Me4ZsL5GGqFwZIuhGz7fhwKvrJBwKmQPIOUi3va5L6Jtv7ImfHwf5qIhNmpg6xJyng4zxk/hxGyiuEJkkGfUol3bgm98UlVGBKTBhJ/azQK1I7Ix6vr+AXU6Ws62+Oj4x54Jgk5CeKrWv8WiqAQIx0QfD5A6hkxxrf1Rrh2V7KaeIigThDK6ADknUI3s+XUvqQgmoR7UGmaZH7OOsUnB21fCIzkEvBehxb4m0Np9M/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s3arPcmru7cIsN8pqUc+pUO3EVwUVgmsqF/LMCCWH8=;
 b=aJmvM7JEwJcdbQ7xEOL5qPJEGIkjXpjVGELPCIMqldOhYT8KlLZrbqen6NSIN0BWCjsFkMgD9Elt9kax+db6YD2m9GOcM/767iA3OteRCnCJE2C2Nmg09AgwvUFwyZG4iBFSfkbxJzSPptAFfw6RlV3kOE0VTvDsVJYxoLCDSBzCtK7BU3hUn1uVN+Ugbw8YmrqJMRHsk5aPVzA1iv+4uyibHy9KWgWa6eaikqLmZvqdnDO5KjgmnJQJTXhfpFEbb67m+uqOzSRvKWDH8szC4CgwBgWDrH+Mm2/FBUkq8IbGNUSKd3FHLzK9JKh4u7ET9jqb8vtMPVXSvxAMNsxpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2435.namprd12.prod.outlook.com (52.132.11.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 8 Aug 2019 16:02:42 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 16:02:42 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTMgrPTJV6Fs0ek65dn0x+UgRKabvXkUAgAIJ+RA=
Date: Thu, 8 Aug 2019 16:02:42 +0000
Message-ID: <BL0PR12MB2580601F44DB50051768070080D70@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <3e4f2f68-8840-d85c-052e-fc54dbf45fd4@gmail.com>
In-Reply-To: <3e4f2f68-8840-d85c-052e-fc54dbf45fd4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcc82482-1a1e-4ff7-5794-08d71c19d83e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2435; 
x-ms-traffictypediagnostic: BL0PR12MB2435:
x-microsoft-antispam-prvs: <BL0PR12MB2435DE16313F2C114AE2506480D70@BL0PR12MB2435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(13464003)(99286004)(229853002)(66446008)(52536014)(64756008)(66556008)(5660300002)(66476007)(25786009)(53936002)(14454004)(478600001)(256004)(14444005)(76116006)(446003)(33656002)(4326008)(6246003)(66946007)(476003)(486006)(71190400001)(71200400001)(76176011)(3846002)(102836004)(86362001)(11346002)(66066001)(6506007)(6116002)(53546011)(54906003)(110136005)(305945005)(7696005)(6436002)(2906002)(9686003)(316002)(74316002)(186003)(55016002)(2501003)(66574012)(8936002)(26005)(8676002)(81156014)(81166006)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2435;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fyLVlesLmWAzezU+vwpvAhHQ7tSpxmgOrzm6fl7WTqKOcw7cGNYjzRwkyFt8ePD0s4Dy688CvvW+V5z5VV0TS55sw/tkzWlDMuPInh5McOYcHWPCSWTJO/6Rz71VwXAZF+SwNA2FSyAk6G4+mKtDWBrewfryMI1CBrSWbN9HgRhpPVnh9ScmOs2XNKT3LwRoa8+Mp6EFQd6rolEDXrAevDV7fFG6d4lEAjBw9L8nTE4E3Gh88FR6zxjmuDLpUWGmjkG69+rdnXVmSWTrP/XOsVHMLeFgr1rUD1SswpuSiDZcUN1YP4/a8aL5j4mdcH89BmLCwc9/HfE3RvsS2aSVZ31W4ydrmv7oNtUOLiABNl4P+GzEyTEKbBSkQnwAKOdJz5TxCvw1NQN/zdTTJ/wn5oi34uqghxc+g/U4u1bjtqg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc82482-1a1e-4ff7-5794-08d71c19d83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 16:02:42.1850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpfAE0jlCe0nP8CcBNQrLsShTxuQbA0cnDKkaxKdq8F8JiIIFyGqREKfsFUIKq2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2435
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s3arPcmru7cIsN8pqUc+pUO3EVwUVgmsqF/LMCCWH8=;
 b=tLyCYs3f/6clITJi83aPUce8bP3a8b9abw/QXliZAoRZYI80LaxGgOUOSMBXIhbbFlgXQ08SVgxz2zMPP7hTR+MorYmhpcRUehSW9wAwADIeprgH3ADdkMTYz2Be6h4D4SXJ/pNmIJS2mm45zulxTVJGWKGL0TkvD7GgpJ39PX4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KDQpNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBzbm9vcCBiaXQgKEMgYml0
IGluIHRoZSBQVEUgZGVmaW5pdGlvbikgaXMgdG8gcHJvYmUgcmVtb3RlIGdwdSdzIEwyIGNhY2hl
IGFmdGVyIHRoaXMgZ3B1IHdyaXRlIHJlbW90ZSBncHUncyB2cmFtLiBJcyB0aGlzIGNvcnJlY3Q/
IEkgYW0gc3RpbGwgY2hlY2tpbmcgdGhpcyBwb2ludCB3aXRoIEhXIGVuZ2luZWVyLg0KDQpJZiB0
aGlzIGlzIGNvcnJlY3QsIHRoZW4gdGhlIHNub29waW5nIChvciBwcm9iaW5nKSBpcyBhIHdheSB0
byBtYWludGFpbiBjZXJ0YWluIGNhY2hlIGNvaGVyZW5jeSB3aGVuIG9uZSBtZW1vcnkgaXMgYWNj
ZXNzIGJ5IHR3byBtYXN0ZXJzIChmb3IgZXhhbXBsZSB0d28gZ3B1KS4gV2l0aCBleGlzdGluZyBB
TURHUFVfVk1fIGRlZmluaXRpb25zIGluIGFtZGdwdV9kcm0uaCwgaG93IGRvZXMgYSB1c2VyIGlt
cGxlbWVudCB0aGUgcmVxdWVzdCBsaWtlOiBJIHdhbnQgYSB0cnVuayBvZiB2cmFtIHBoeXNpY2Fs
bHkgaW4gYSByZW1vdGUgZ3B1LCBJIHdhbnQgdG8gYWNjZXNzIGl0IGluIGEgdW5jYWNoZWQgd2F5
IChBTURHUFVfVk1fTVRZUEVfVUMpIGJ1dCBJIHdhbnQgdG8gcHJvYmUgcmVtb3RlIGdwdSdzIGNh
Y2hlIHdoZW4gSSBtb2RpZnkgdGhpcyB2cmFtLg0KDQpGcm9tIFBURSdzIGRlZmluaXRpb24sIGJv
dGggQyBiaXQgYW5kIG10eXBlIGFuZCBSL1cvWCBiaXRzIGFyZSBqdXN0IGZsYWdzIHRvIGVuYWJs
ZSB1c2VyIHRvIHByb2dyYW0gcGFnZSBhY2Nlc3MgYmVoYXZpb3IuIEFueSBkZXRhaWwgcmVhc29u
IHdoeSB3ZSBzaG91bGRuJ3QgZXhwb3NlIHRoZSBzbm9vcCBiaXQ/DQoNClJlZ2FyZHMsDQpPYWsN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNr
b2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0
IDcsIDIwMTkgNDo0MiBBTQ0KVG86IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT47IEtlZWx5LCBTZWFuIDxTZWFuLktlZWx5QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IDEvNV0gZHJtL2FtZGdwdTogRXh0ZW5kcyBhbWRncHUgdm0gZGVmaW5pdGlvbnMNCg0KQW0gMDcu
MDguMTkgdW0gMDQ6MzEgc2NocmllYiBaZW5nLCBPYWs6DQo+IEFkZCBkZWZpbml0aW9uIG9mIGFs
bCBzdXBwb3J0ZWQgbXR5cGVzLiBUaGUgUlcgbXR5cGUgaXMgcmVjZW50bHkgDQo+IGludHJvZHVj
ZWQgZm9yIGFyY3R1cnVzLiBBbHNvIGFkZCBkZWZpbml0aW9uIGZvciB0aGUgDQo+IGNhY2hhYmxl
L3Nub29wYWJsZSBiaXQsIHdoaWNoIHdpbGwgYmUgdXNlZCBsYXRlciBpbiB0aGlzIHNlcmllcy4N
Cj4NCj4gQ2hhbmdlLUlkOiBJOTZmYzliYjRiNmIxZTYyYmRjMTBiNjAwZDhhYWE2YTgwMjEyOGQ2
ZA0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCA5ICsrKysrKystLQ0K
PiAgIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oICAgICAgICAgIHwgNCArKysrDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gaW5kZXggMmVkYTNhOC4u
N2E3NzQ3NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4g
QEAgLTgwLDggKzgwLDEzIEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsNCj4gICAjZGVm
aW5lIEFNREdQVV9QVEVfTVRZUEVfVkcxMChhKQkoKHVpbnQ2NF90KShhKSA8PCA1NykNCj4gICAj
ZGVmaW5lIEFNREdQVV9QVEVfTVRZUEVfVkcxMF9NQVNLCUFNREdQVV9QVEVfTVRZUEVfVkcxMCgz
VUxMKQ0KPiAgIA0KPiAtI2RlZmluZSBBTURHUFVfTVRZUEVfTkMgMA0KPiAtI2RlZmluZSBBTURH
UFVfTVRZUEVfQ0MgMg0KPiArZW51bSBhbWRncHVfbXR5cGUgew0KPiArCUFNREdQVV9NVFlQRV9O
QyA9IDAsDQo+ICsJQU1ER1BVX01UWVBFX1dDID0gMSwNCj4gKwlBTURHUFVfTVRZUEVfQ0MgPSAy
LA0KPiArCUFNREdQVV9NVFlQRV9VQyA9IDMsDQo+ICsJQU1ER1BVX01UWVBFX1JXID0gNCwNCj4g
K307DQo+ICAgDQo+ICAgI2RlZmluZSBBTURHUFVfUFRFX0RFRkFVTFRfQVRDICAoQU1ER1BVX1BU
RV9TWVNURU0gICAgICBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEFN
REdQVV9QVEVfU05PT1BFRCAgICBcDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2Ft
ZGdwdV9kcm0uaCANCj4gYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBpbmRleCBjYTk3
YjY4Li4yODg5NjYzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0u
aA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPiBAQCAtNTAzLDYgKzUw
MywxMCBAQCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fb3Agew0KPiAgICNkZWZpbmUgQU1ER1BVX1ZN
X01UWVBFX0NDCQkoMyA8PCA1KQ0KPiAgIC8qIFVzZSBVQyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1
bHQgTVRZUEUgKi8NCj4gICAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9VQwkJKDQgPDwgNSkNCj4g
Ky8qIFVzZSBSVyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8NCj4gKyNkZWZpbmUg
QU1ER1BVX1ZNX01UWVBFX1JXCQkoNSA8PCA1KQ0KDQo+ICsvKiBDYWNoZWFibGUvc25vb3BhYmxl
ICovDQo+ICsjZGVmaW5lIEFNREdQVV9WTV9QQUdFX1NOT09QRUQJCSgxIDw8IDkpDQoNClRoYXQn
cyBhIHJhdGhlciBiaWcgTkFLLiBDYWNoZSBzbm9vcGluZyBpcyBub3Qgc29tZXRoaW5nIHVzZXJz
cGFjZSBpcyBhbGxvd2VkIHRvIGJlIGF3YXJlIG9mLg0KDQpDaHJpc3RpYW4uDQoNCj4gICANCj4g
ICBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdmEgew0KPiAgIAkvKiogR0VNIG9iamVjdCBoYW5kbGUg
Ki8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
