Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CBA6F9A2
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A42989AC0;
	Mon, 22 Jul 2019 06:47:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730086.outbound.protection.outlook.com [40.107.73.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B7F89ABA
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0EbpqAKrbL3UFx9/Dqy6rzpXNiT3lztDwD5Hy5etoBea8NHFFUKOFTeWxfsp/VOtDKIg8Ivjj6+7SybKK1UisTKt1eHwsmYfsy7Tipp4HztlXPCyeKYOWUhWVvTpWeVFbfKyseqTKHHrm3JFCtC0W+yGvCMzEOfn8MfnDMdRdDLvWC0U7hArIUZdOejB1XRwfmH6xf7wAu/S3QEKNbpN1QoIK9KRxHwhFe9gjfTc/QrS0H9lXL9OnpinmJWkB8VQTt4f1LHX9QA0pbsxYBBWkA5fxlC4JaP5owK7HHFb5IABw+nzxsLooc+roiAHqQ2dImRz1ly/8irIQSiOq2NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gHS1FcpAWlx+aABxiZrOGM3TgVIUb69AtX0WCaPekI=;
 b=HBJsYlZPsg2edS89839jH1RAMg76CcFrFJLunEKl9rgVSf72gNUA5gqxe9K+EaydmoitWTOl5mRDEf/n3f75afQdpUixkGFRgN94ijNggaTXtzHccpw6QuGm/1pcMagxdI/zmIFKY7R4JNMYItNMoTTAcOuPG3TDyDlXo3UK57oj2wl84hbbb3APy5vxtxe0/z82LQGu9sZ933umFu97iV1D96ftoDj81+FqGm4QYI5pBBT3Bi7P4mNCiHZPQ6FRCvQa/oXxdc+di8+OICIdO+Lo7NsEfL0uXVl2+FbKFW14/5XMSTI1J5VrzsYEes4hKknIho1XOFMvhb7unj4hDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3533.namprd12.prod.outlook.com (20.179.83.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 06:47:24 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 06:47:24 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/amd/powerplay: add new sensor type for VCN
 powergate status
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: add new sensor type for VCN
 powergate status
Thread-Index: AQHVQDvdQsHU6dMJ9EivD9emiq+BCqbWCs6AgAAmoKA=
Date: Mon, 22 Jul 2019 06:47:24 +0000
Message-ID: <MN2PR12MB33445BD68AC020E8EB42B762E4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-2-evan.quan@amd.com>
 <MN2PR12MB359851C9E6C7D57EE8E867188EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB359851C9E6C7D57EE8E867188EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe31c49d-1442-44ac-e134-08d70e70747c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3533; 
x-ms-traffictypediagnostic: MN2PR12MB3533:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB353306AF2A28A6C333A97737E4C40@MN2PR12MB3533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(199004)(189003)(13464003)(316002)(110136005)(966005)(7696005)(9686003)(86362001)(8676002)(3846002)(55016002)(4326008)(5660300002)(6246003)(53936002)(66556008)(74316002)(305945005)(66476007)(256004)(64756008)(478600001)(66446008)(6116002)(68736007)(6306002)(76116006)(25786009)(52536014)(66946007)(7736002)(2906002)(81166006)(33656002)(81156014)(99286004)(2501003)(11346002)(76176011)(476003)(486006)(8936002)(71190400001)(71200400001)(53546011)(186003)(66066001)(102836004)(26005)(6506007)(446003)(6436002)(229853002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3533;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LVrv9F9o9k8gMn8FRTVNqNaA+0sRuI7BY//N4kDq1VHj2Oy3UE9TIf7y/s8ZaQLw91Ea6P4LFZdZ3gF9jI7KxcLOqRiUTwcMiCpErCSxidaAT3DXcv45EF7WUvSIx28cRLYrDfrPyiefrk8paJp17k1KdzyVOCEosR6ZyOp71cG3XW0zbDwoyDj3IE5vxb1/gAl2st7mR8bhLQcUESjzg0OlBXT7sHp/oEF1q0/cKyJaIib8I/vP1VQCxQ65zeBx8aCzLhMobwdM5jQYqtH60RYB/5icLdpeX68gVjbe0POOT6T4hdBc2pT+SKIHAhDRw52pL/zmvMzZl8jwcOAi2+JnWoVw41de7OsXKy7poriR4EW4MO9kohdqeC9Rd9MwoCTOmsRiWVDQsRxrStAqgXeyQZob7KC/DWpgIhm/b+c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe31c49d-1442-44ac-e134-08d70e70747c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 06:47:24.7423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gHS1FcpAWlx+aABxiZrOGM3TgVIUb69AtX0WCaPekI=;
 b=obpC2Ymb1vBPEAYRz9DPV4ysL8RDc4I39IirXI/j9w8N1FmhpcuZ6GtlVZhn35znR7gKcPJE0cMD8cG280lxg7IeS6//SG8p6dhOpmDZ2wcfoAq9A0ThFvPSRlq2QPfNX+ZM2jO4oHPzFIRm9gBdHiGGeoOwEevDFw6xVGobO0o=
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

R29vZCBwb2ludC4gSXQgd2FzIGZvbGxvd2luZyBvbGQgbmFtaW5nIHN0eWxlLg0KQnV0IEkgdGhp
bmsgd2UgY2FuIG1ha2Ugc29tZSBjaGFuZ2VzIHRvIG1ha2UgaXQgbW9yZSB1bmRlcnN0YW5kYWJs
ZS4NCkxldCBtZSBhZGRyZXNzIHRoaXMgaW4gdGhlIFYyIHZlcnNpb24uDQoNClJlZ2FyZHMsDQpF
dmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZlbmcsIEtlbm5ldGgg
PEtlbm5ldGguRmVuZ0BhbWQuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTI6
MjcgUE0NCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT47IFF1YW4sIEV2YW4NCj4gPEV2YW4uUXVhbkBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDEvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBuZXcgc2Vuc29yIHR5
cGUgZm9yIFZDTg0KPiBwb3dlcmdhdGUgc3RhdHVzDQo+IA0KPiBJIGp1c3Qgc3VnZ2VzdCB0aGF0
IHdlIHVzZSBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUl9TVEFURQ0KPiBpbnN0ZWFkIG9mIEFN
REdQVV9QUF9TRU5TT1JfVkNOX1BPV0VSLCBzaW5jZSB3ZSBnZXRzIHRoZSBzdGF0ZSBvZg0KPiBw
b3dlciBvbi9vZmYsIG5vdCB0aGUgcmVhbCBWQ04gcG93ZXIgdmFsdWUuDQo+IFJldmlld2VkLWJ5
OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPg0KPiANCj4gDQo+IA0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IFttYWlsdG86YW1kLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmDQo+IE9mIEV2YW4gUXVhbg0K
PiBTZW50OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTUgQU0NCj4gVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBRdWFuLCBFdmFuDQo+IDxFdmFuLlF1YW5AYW1kLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIDEvNV0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBuZXcgc2Vuc29yIHR5cGUg
Zm9yIFZDTg0KPiBwb3dlcmdhdGUgc3RhdHVzDQo+IA0KPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1h
aWxdDQo+IA0KPiBWQ04gaXMgd2lkZWx5IHVzZWQgaW4gbmV3IEFTSUNzIGFuZCBkaWZmZXJlbnQg
ZnJvbSB0cmFuZGl0aW9uYWwgVVZEIGFuZCBWQ0UuDQo+IA0KPiBDaGFuZ2UtSWQ6IEkzNWM5ZGI0
MjA3MzQwMjllOGY4NDdkY2RjZTIzZGZmMTIwNGQ3MGJjDQo+IFNpZ25lZC1vZmYtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2tnZF9wcF9pbnRlcmZhY2UuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2Rf
cHBfaW50ZXJmYWNlLmgNCj4gaW5kZXggOTczM2JiZjliYzcyLi4xNTdlODU0Njg1NWQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaA0K
PiBAQCAtMTIzLDYgKzEyMyw3IEBAIGVudW0gYW1kX3BwX3NlbnNvcnMgew0KPiAgICAgICAgIEFN
REdQVV9QUF9TRU5TT1JfRU5BQkxFRF9TTUNfRkVBVFVSRVNfTUFTSywNCj4gICAgICAgICBBTURH
UFVfUFBfU0VOU09SX01JTl9GQU5fUlBNLA0KPiAgICAgICAgIEFNREdQVV9QUF9TRU5TT1JfTUFY
X0ZBTl9SUE0sDQo+ICsgICAgICAgQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVIsDQo+ICB9Ow0K
PiANCj4gIGVudW0gYW1kX3BwX3Rhc2sgew0KPiAtLQ0KPiAyLjIyLjANCj4gDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
