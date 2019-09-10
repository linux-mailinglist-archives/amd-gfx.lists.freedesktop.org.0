Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF12AE292
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 05:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7360989B0C;
	Tue, 10 Sep 2019 03:39:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8B489B0C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 03:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FX3MGwNrkQgScLsUKzIr1TnQEHFCRifPBS5N33X8T2y9j0P4OxhnOLPmnRNxRtbxRa/rxntckUpNlGKVQz3EXqYlAnftFaGL/68CmarXiUQyZufyQ0o+pVqY7OlKdE3gHkc6TEVs7SP8sJbB/SiZx2DcbLPFEfMKmy5olO+FfQZSsG/Zoi7dYkW96RTUdGOXkinw3f99qWtu8YQuW9HlyOWO3LaU1pbwpe9RGCv6O+et7oku2AG3jQoCoyIFO7rqzJJulZN1pvuyxlJ5+twlTHH8qjdAHAwGoeijbiF5ASp1E06QzlSZ/qIGYj/jyNzyKmtWPtZeYTLx3M3bd3jJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/+/4c+br+APSTvTeIeBAKQgiumQwHx/6sfFrMxvuY=;
 b=j6qSuKCfCCRvyxMWfUBtLjI9e2VF+8aT71NwXei+lJdc0DluHiC4k6NN0t4oh32jklm4ANLPzMJDVA5F5VwQaHcpbLjRj/6z+Dw4GTqkd22LBkjI2YuKvdLzdZmzzqZS3pEbM9YSAyZqhzVblmb0ojuTUdLtApKvodw0yclyJT0aV+1Tjd/cUTauxRnjd88xamKMtLr7U5aUCZX0W1YLmjNMNLKMFfGOuPdTJ0nT/Dkd3fJH0s0oRZRtJZ6VqO3GweWBFimnWhHNpXId7EgDVozj/SNDQoMMPX5vdUsHpMF7yKb/vFckWO5d1K1Vxl25TNhy+aosO1zjg3rsyegHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3902.namprd12.prod.outlook.com (10.255.238.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 03:39:17 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 03:39:17 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: Allow to reset to EERPOM table.
Thread-Topic: [PATCH 2/2] drm/amdgpu: Allow to reset to EERPOM table.
Thread-Index: AQHVZ0nSgGgKKJgKTEGlvRIuoBDUvackQxUw
Date: Tue, 10 Sep 2019 03:39:17 +0000
Message-ID: <MN2PR12MB30548297A66F8DFCE1DC921BB0B60@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1568059469-29450-1-git-send-email-andrey.grodzovsky@amd.com>
 <1568059469-29450-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1568059469-29450-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd078ee2-ad50-4f09-cc1c-08d735a07542
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3902; 
x-ms-traffictypediagnostic: MN2PR12MB3902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3902CB6427CC77ACA95A1968B0B60@MN2PR12MB3902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(189003)(199004)(13464003)(256004)(2906002)(55016002)(229853002)(6436002)(54906003)(99286004)(14454004)(110136005)(7696005)(76176011)(6246003)(9686003)(86362001)(53936002)(186003)(33656002)(26005)(81156014)(476003)(71190400001)(71200400001)(81166006)(66066001)(8936002)(8676002)(486006)(2501003)(478600001)(446003)(11346002)(76116006)(6116002)(3846002)(53546011)(102836004)(305945005)(74316002)(52536014)(6506007)(66946007)(316002)(5660300002)(7736002)(66446008)(64756008)(66556008)(66476007)(25786009)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3902;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bLiAT1O7VM4Vatyua8EIpLTd/WCh7j9MvaoDmiK8FztrUisbQUG1qdHpQqEvJNHsIp3CL2I9XUE4KQwP8ZXkgsY3wupa0SNOWY/E0L72JMNuiur7Snr2z3pHWq3xFfUDggFSRDfToWjC3tWA0t5sXAzaTut3ySLfnRZuJutBXKvsaTSUqdlitvMHL150p3RMGHuLFx8ZNUrXAlw4gcur15qhXe8qnoNPEcAYZ58G06AP/0nvVgaIJIUt8TFZI+q8dTNk1lMvpk1vJKAfNpzYzJNHTsw6jBYDfq8xiNOg2AMyJDS1dSROSfHZExNjmLF0hZywrWgMjJfJ4vL41+ibFdint9Dkk79ECV9ThDb9bFaGNSdutCnHs9q8gPwaNf3BEDbHODpaq6J40KMv4nbD7tRESGZAoIaBbWQKZGFzg4I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd078ee2-ad50-4f09-cc1c-08d735a07542
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 03:39:17.2617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do6eguD53ZTbPJNElGzqIGeFgk3aLhEjLpWJyN5svrgKpSeBnGSvuFAiy6i363tU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3902
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/+/4c+br+APSTvTeIeBAKQgiumQwHx/6sfFrMxvuY=;
 b=oO57t6xIPAKh9p/5wPt8Oe2zwUEb3jwPzy3Vuey1PzIt895cSEu8Fxp+9dcWluF+iX5xJanJZv3GvfoRwuL8/mXfc6mWqzGTeVbQuOZM1PH+bmh/S8C+Eq3SpfCmaZ23PFte+Z2rP1Mt2nir5yVf52kicEEqNH9dfA2uiRdg2sw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IFNlbnQ6IDIwMTnlubQ55pyIMTDml6Ug
NDowNA0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IENoZW4sIEd1
Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpob3UxLCBUYW8NCj4gPFRhby5aaG91MUBhbWQu
Y29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
R3JvZHpvdnNreSwgQW5kcmV5DQo+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBBbGxvdyB0byByZXNldCB0byBFRVJQT00gdGFi
bGUuDQo+IA0KPiBUaGUgdGFibGUgZ3Jvd3MgcXVpY2tseSBkdXJpbmcgZGVidWcvZGV2ZWxvcG1l
bnQgZWZmb3J0IHdoZW4gbXVsdGlwbGUgUkFTDQo+IGVycm9ycyBhcmUgaW5qZWN0ZWQuIEFsbG93
IHRvIGF2b2lkIHRoaXMgYnkgc2V0dGluZyB0YWJsZSBoZWFkZXIgYmFjayB0byBlbXB0eQ0KPiBp
ZiBuZWVkZWQuDQo+IA0KPiB2MjogU3dpdGNoIHRvIGRlYnVnZnMgZW50cnkgaW5zdGVhZCBvZiBs
b2FkIHRpbWUgcGFyYW1ldGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+IGluZGV4IDExOWJlZGMuLjUyYzVjNjEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTMwMyw2ICszMDMs
MTcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0
DQo+IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyICoNCj4gIAlyZXR1cm4gc2l6ZTsNCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX3dyaXRlKHN0
cnVjdCBmaWxlICpmLCBjb25zdCBjaGFyDQo+IF9fdXNlciAqYnVmLA0KPiArCQlzaXplX3Qgc2l6
ZSwgbG9mZl90ICpwb3MpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKilmaWxlX2lub2RlKGYpLQ0KPiA+aV9wcml2YXRlOw0KPiAr
CWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPQ0KPiArYW1kZ3B1X3Jhc19lZXByb21fcmVzZXRfdGFi
bGUoJmFkZXYtPnBzcC5yYXMucmFzLT5lZXByb21fY29udHJvbCk7DQoNCltUYW9dIEl0J3MgYmV0
dGVyIHRvIGFkZCB0YWJsZSBrZXkgaW4gZnJvbnQgb2YgdGhlIGZ1bmN0aW9uLCB3aXRoIHRoaXMg
Zml4ZWQsIHRoZSBzZXJpZXMgaXM6DQoNClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3Ux
QGFtZC5jb20+DQoNCj4gKw0KPiArCXJldHVybiByZXQgPT0gMSA/IHNpemUgOiAtRUlPOw0KPiAr
fQ0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhbWRncHVfcmFz
X2RlYnVnZnNfY3RybF9vcHMgPSB7DQo+ICAJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+ICAJLnJl
YWQgPSBOVUxMLA0KPiBAQCAtMzEwLDYgKzMyMSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZp
bGVfb3BlcmF0aW9ucw0KPiBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9vcHMgPSB7DQo+ICAJLmxs
c2VlayA9IGRlZmF1bHRfbGxzZWVrDQo+ICB9Ow0KPiANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZmlsZV9vcGVyYXRpb25zIGFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fb3BzID0gew0KPiArCS5v
d25lciA9IFRISVNfTU9EVUxFLA0KPiArCS5yZWFkID0gTlVMTCwNCj4gKwkud3JpdGUgPSBhbWRn
cHVfcmFzX2RlYnVnZnNfZWVwcm9tX3dyaXRlLA0KPiArCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2Vl
aw0KPiArfTsNCj4gKw0KPiAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19zeXNmc19yZWFkKHN0
cnVjdCBkZXZpY2UgKmRldiwNCj4gIAkJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNo
YXIgKmJ1ZikgIHsgQEAgLTk1MSw2ICs5NjksOA0KPiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFz
X2RlYnVnZnNfY3JlYXRlX2N0cmxfbm9kZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4gIAljb24tPmRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigicmFzIiwgbWlub3ItPmRlYnVnZnNf
cm9vdCk7DQo+ICAJY29uLT5lbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYXNfY3RybCIsIFNf
SVdVR08gfCBTX0lSVUdPLCBjb24tDQo+ID5kaXIsDQo+ICAJCQkJICAgICAgIGFkZXYsICZhbWRn
cHVfcmFzX2RlYnVnZnNfY3RybF9vcHMpOw0KPiArCWNvbi0+ZW50ID0gZGVidWdmc19jcmVhdGVf
ZmlsZSgicmFzX2VlcHJvbV9yZXNldCIsIFNfSVdVR08gfA0KPiBTX0lSVUdPLCBjb24tPmRpciwN
Cj4gKwkJCQkJICAgICAgIGFkZXYsDQo+ICZhbWRncHVfcmFzX2RlYnVnZnNfZWVwcm9tX29wcyk7
DQo+ICB9DQo+IA0KPiAgdm9pZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiAtLQ0KPiAyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
