Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A7AFE91
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 16:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA2E6E290;
	Wed, 11 Sep 2019 14:19:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939406E290
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 14:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcPzwZtnuo3m2gFJ6bvrdN0Kx6r8h5oXL2iXUNtU7GBe1lYySCM6SSXWSS5SzNXpsVfweJkIIrs5KgXnIaH8/w3Sh6pwcysRsMrok+541QD+Cd/LptDSTDMyQehbsmaDEcBLTOe+wHkxUu3HhYGW4PMBVzPqAwQCmbub8RfkhsrRQ7YpY6lqN1ZBRdBXMW4N/Z22qAwf90b9WhfIhrQqQ3FKHQMaTseBfKo9RVlHDFHV439QaoB6AVRB+kf9aaW5oyvQzAzxHLKSZ0MOnRfRajQtDHU1PwF/bSGAz4SSfNBbMEXt+vV6PXpiMAEr/hX8VKx0PkM7NXvjVWbHbKvQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtQphB+3SdDuW1+gAylKhsNlOlzp7mB3CRdPj2YEJtY=;
 b=dUVnlW9hNQGbqHDfRq/PM6qDsLMQ+p0q0pLKC8Nawm9dbFhSltP+U/nBI856aJdDCw84e8W1Qm6LgfqNH0lP1Ebfii8iE2VnzdysWGsEnuHjqFRW7bW8snHjVST6V2Dg64uy/MoqWnR4XGX+3fVRVhwr+LGjqwWoIcOUgYRUdMax0z2te3OT1jo7p8DBGbYDHGCmJYibHfWvC06h6K6fz9Fgf7lGc59FDheNoRN8uBoRG4ZqsQBsl0VPWHodq7oYn4oM7nudFyuiXInZQo9TVyGlDeI5/Z3RIWchygEg1OhzDyBlM9TiriYx/3jqq/EU0t15+VXn1Ug0SwbXd7jXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1247.namprd12.prod.outlook.com (10.169.205.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 11 Sep 2019 14:19:02 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::31f2:3115:6265:33a0%11]) with mapi id 15.20.2263.015; Wed, 11 Sep
 2019 14:19:02 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/Asx1vpdHBGkKaZL/KBwFVFaclzGCAgAC7NgA=
Date: Wed, 11 Sep 2019 14:19:02 +0000
Message-ID: <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::43) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f912233-7873-4835-4e5a-08d736c2fed9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1247; 
x-ms-traffictypediagnostic: MWHPR12MB1247:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB12478C28E0FD091F90985706EAB10@MWHPR12MB1247.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(52314003)(199004)(189003)(13464003)(66556008)(99286004)(66476007)(71200400001)(71190400001)(7736002)(305945005)(25786009)(229853002)(186003)(66066001)(8936002)(26005)(4326008)(316002)(6486002)(102836004)(31696002)(476003)(14454004)(486006)(11346002)(6246003)(446003)(53546011)(86362001)(2616005)(6506007)(76176011)(386003)(2906002)(52116002)(256004)(5660300002)(14444005)(31686004)(6116002)(478600001)(6436002)(3846002)(53936002)(81166006)(81156014)(2501003)(54906003)(110136005)(6512007)(66946007)(8676002)(66446008)(64756008)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1247;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W7gT1juoVapB+UtW0nBLXqIhirMLYspQO1lKF8VWEIPY0XFSqYCz5S60e6tCyMs9Y6YrjKvYwdCiwDtTvFwf6DU3MWih80kaj5eOZbw6nf4y+3OFSVc7gVMRDFSu7JlwU0ewGPlvi+1Tz8M9u7UfoXMQMVSC+sN3RvpqlCXXMokqbtgSApTvN2GEc4RsXmaklyi6Q8Ozo4e3b1oj7aJuETET8i8KFMehBUQh695WTuhtJ8Aly2V1VZkKvQ/YQfc9P+k3fDlfGgE0s1orwX34JLh3pC0axjNw4vyGlCOphTeuSZ7OJ8b75FYFGTqYVFndmaqb56YwH/9zwBi687LA+3tIB9GN3vu+UOj6HB9nQVWiLsEiBJI+5U4w/04HrMLtowQWntooz4vijPT7CtBWGtJMJ3D531u9ZI06Iiu/1nQ=
Content-ID: <7FB4B63D1744B5458BEA10ABF301D920@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f912233-7873-4835-4e5a-08d736c2fed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 14:19:02.5703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /uk+ig8Lu/mLeGNQVRNVdoljtLR9a93E4nSIEv1kJRfyIHj8UAsbc2lzijl486hoxmSz8htfV8TSUbvJ2kjwoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtQphB+3SdDuW1+gAylKhsNlOlzp7mB3CRdPj2YEJtY=;
 b=q8pit7cxAN1GaPSPpBnPBzY9YblCETTP6R2/fZiPS6N2pU+BvlwzkB8bnnwtLwwZqpQdMjCZI6PRubHP+xTRh+Xj/2wO4FIjrpfb8c2is824aNFPz2BNUPK+riNKzJhbs+iMQWinJ3bHh49/41CO57SQPp+fyDQ6qc42Cm17l9E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBsaWtlIHRoaXMgbXVjaCBtb3JlLCBJIHdpbGwgcmVsb2NhdGUgdG8gYW1kZ3B1X3VtY19wcm9j
ZXNzX3Jhc19kYXRhX2NiIA0KYW4gcHVzaC4NCg0KQW5kcmV5DQoNCk9uIDkvMTAvMTkgMTE6MDgg
UE0sIFpob3UxLCBUYW8gd3JvdGU6DQo+IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgaXMg
b25seSB1c2VkIGJ5IHVtYyBibG9jaywgc28gYW5vdGhlciBhcHByb2FjaCBpcyB0byBtb3ZlIGl0
IGludG8gYW1kZ3B1X3VtY19wcm9jZXNzX3Jhc19kYXRhX2NiLg0KPiBBbnl3YXksIGVpdGhlciB3
YXkgaXMgT0sgYW5kIHRoZSBwYXRjaCBpczoNCj4NCj4gUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4NCj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBG
cm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+IFNl
bnQ6IDIwMTnlubQ55pyIMTHml6UgMzo0MQ0KPj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+PiBDYzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhvdTEs
IFRhbw0KPj4gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+PiA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleQ0KPj4gPEFuZHJleS5H
cm9kem92c2t5QGFtZC5jb20+DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBt
dXRleCBsb2NrIGZyb20gYXRvbWljIGNvbnRleHQuDQo+Pg0KPj4gUHJvYmxlbToNCj4+IGFtZGdw
dV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgd2FzIG1vdmVkIHRvIGFtZGdwdV9yYXNfcmVzZXRfZ3B1
DQo+PiBiZWNhdXNlIHdyaXRpbmcgdG8gRUVQUk9NIGR1cmluZyBBU0lDIHJlc2V0IHdhcyB1bnN0
YWJsZS4NCj4+IEJ1dCBmb3IgRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGFtZGdwdV9yYXNfcmVz
ZXRfZ3B1IGlzIGNhbGxlZA0KPj4gZGlyZWN0bHkgZnJvbSBJU1IgY29udGV4dCBhbmQgc28gbG9j
a2luZyBpcyBub3QgYWxsb3dlZC4gQWxzbyBpdCdzIGlycmVsZXZhbnQgZm9yDQo+PiB0aGlzIHBh
cnRpbGN1bGFyIGludGVycnVwdCBhcyB0aGlzIGlzIGdlbmVyaWMgUkFTIGludGVycnVwdCBhbmQg
bm90IG1lbW9yeQ0KPj4gZXJyb3JzIHNwZWNpZmljLg0KPj4NCj4+IEZpeDoNCj4+IEF2b2lkIGNh
bGxpbmcgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyBpZiBub3QgaW4gdGFzayBjb250ZXh0
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpv
dnNreUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaCB8IDQgKysrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmgNCj4+IGluZGV4IDAxMjAzNGQuLmRkNWRhM2MgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4gQEAgLTUwNCw3ICs1MDQsOSBAQCBzdGF0
aWMgaW5saW5lIGludCBhbWRncHVfcmFzX3Jlc2V0X2dwdShzdHJ1Y3QNCj4+IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+PiAgIAkvKiBzYXZlIGJhZCBwYWdlIHRvIGVlcHJvbSBiZWZvcmUgZ3B1IHJl
c2V0LA0KPj4gICAJICogaTJjIG1heSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4+ICAgCSAq
Lw0KPj4gLQlhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKGFkZXYpOw0KPj4gKwlpZiAoaW5f
dGFzaygpKQ0KPj4gKwkJYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsNCj4+ICsN
Cj4+ICAgCWlmIChhdG9taWNfY21weGNoZygmcmFzLT5pbl9yZWNvdmVyeSwgMCwgMSkgPT0gMCkN
Cj4+ICAgCQlzY2hlZHVsZV93b3JrKCZyYXMtPnJlY292ZXJ5X3dvcmspOw0KPj4gICAJcmV0dXJu
IDA7DQo+PiAtLQ0KPj4gMi43LjQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
