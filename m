Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6474355F
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 13:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB091898C8;
	Thu, 13 Jun 2019 11:11:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820041.outbound.protection.outlook.com [40.107.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A100898C8
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 11:11:58 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3341.namprd12.prod.outlook.com (20.178.242.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 11:11:56 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b%4]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 11:11:56 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Paul Menzel <pmenzel+amd-gfx@molgen.mpg.de>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH] drm/amdgpu: return 0 by default in
 amdgpu_pm_load_smu_firmware
Thread-Topic: [PATCH] drm/amdgpu: return 0 by default in
 amdgpu_pm_load_smu_firmware
Thread-Index: AQHVIGUgb/s6u+4tNk27u+I6MZ2Xc6aZZc4AgAAKgzA=
Date: Thu, 13 Jun 2019 11:11:56 +0000
Message-ID: <MN2PR12MB330976ACC5C5C05D801C6C0AECEF0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190611145103.621-1-alexander.deucher@amd.com>
 <af8e0143-5d3c-b683-d877-60d7f6e2a6b9@molgen.mpg.de>
In-Reply-To: <af8e0143-5d3c-b683-d877-60d7f6e2a6b9@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ae6c2d5-8d87-4229-f2dc-08d6efeff27a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3341; 
x-ms-traffictypediagnostic: MN2PR12MB3341:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB33418B31112A7FF2A41FF6B7ECEF0@MN2PR12MB3341.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(366004)(13464003)(189003)(199004)(7736002)(74316002)(305945005)(102836004)(5660300002)(6306002)(52536014)(66946007)(86362001)(9686003)(25786009)(26005)(4326008)(76116006)(2906002)(6246003)(66066001)(8676002)(66476007)(8936002)(73956011)(81156014)(81166006)(71190400001)(71200400001)(3846002)(6116002)(66556008)(66446008)(64756008)(53936002)(476003)(256004)(486006)(7696005)(76176011)(99286004)(68736007)(53546011)(6506007)(33656002)(316002)(186003)(55016002)(229853002)(6436002)(72206003)(110136005)(446003)(14454004)(478600001)(966005)(54906003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3341;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AoucY6iH+dmeBVr5BbTMc0NeRHpMPnzOKPyEdbXJp9f+3Jh77epbHs17gao/1ub9dVg5ZfbBVXAYFoC50kVZwy37jOfprANzHWPznE2Oka3nOg1+KQF6VWnOvO++gOU0E7IcbZhJinf0vOzEcS0xA9I/Vb/+69/ILmAUXazPNolBtomJYjOIgtx8y5lHvl3vRBtixlCtBDqSAnEShqtU5yLqBagLCTTER65ciY8uX5iKeeIPDvtQfX4P76FEzzZ/uv5ZFYYPj3KlxNYHLwc6i5M51bhBUKT0T86X58Am02gQIzFFMsKNlQBfzoSmr3WYzXI4OgL7av4WNzbGDbKzafVxAd2rZ2sKNd4viqY8J2Abe9LvqUEsUAO5YBavGOMflN/fPDlo4EO7RA7TnXbVqUTRiJZe/ukWdO7h55dtuik=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae6c2d5-8d87-4229-f2dc-08d6efeff27a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 11:11:56.1861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3341
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtnlISiUXFIsinTFtXWZos1c03rcUrT934qNZF51EAk=;
 b=QQAUA/jFEpzIBn33MaXhzBWtXKW6nd/D0+17Wj/OQ6l7LcjNhBwqT/zviJRWo/RJbtghvVL9eVwHmFtJd9IWVvN/5WRK0zOXKfaTMc5txBwyzZWN7jCzKQeCGB61sQEEQMm/ubsB478B3IRmT+8WPpgjgxasXWX1mfVPUdZV74c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>, Sibren Vasse <freedesktop@sibrenvasse.nl>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUGF1bA0KPiBNZW56ZWwN
Cj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTMsIDIwMTkgNjozMiBQTQ0KPiBUbzogQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBTaWJyZW4gVmFzc2UNCj4gPGZyZWVkZXNrdG9wQHNp
YnJlbnZhc3NlLm5sPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVmYXVsdCBpbg0KPiBhbWRncHVf
cG1fbG9hZF9zbXVfZmlybXdhcmUNCj4gDQo+IERlYXIgQWxleCwNCj4gDQo+IA0KPiBPbiAwNi8x
MS8xOSAxNjo1MSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiA+IEZpeGVzIFNJIGNhcmRzIHJ1bm5p
bmcgb24gYW1kZ3B1Lg0KPiANCj4gU2hvdWxkbuKAmXQgdGhlIGNhbGxlciBiZSB1cGRhdGVkIHRv
IGNoZWNrIGZvciB0aGUgZXJyb3IgY29kZT8NCj4gV291bGRu4oCZdCB0aGF0IGJlIG1vcmUgZXhw
bGljaXQ/DQo+IA0KPiAgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoY2hpcF9uYW1lLCAicmF2ZW4i
KSAmJg0KPiAoYW1kZ3B1X3BtX2xvYWRfc211X2Zpcm13YXJlKGFkZXYsICZzbXVfdmVyc2lvbikg
PT0gMCkNCj4gDQoNClllcy4gQWxleCwgdGhpcyBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCB0byBn
ZXQgdGhlIFNNQyBGVyB2ZXJzaW9uIGZyb20gU0JJT1MuIEFuZCBtYWtlIHN1cmUgd2hldGhlciBj
dXJyZW50IEFTSUMgaXMgUlYxIHJlZnJlc2gga2lja2VyLg0KDQpUaGFua3MsDQpSYXkNCg0KDQo+
ID4gRml4ZXM6IDE5MjkwNTk4OTMwMjIgKCJkcm0vYW1kL2FtZGdwdTogYWRkIFJMQyBmaXJtd2Fy
ZSB0byBzdXBwb3J0DQo+ID4gcmF2ZW4xIHJlZnJlc2giKQ0KPiA+IEJ1ZzogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwODgzDQo+ID4gU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDQgKystLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPiA+IGluZGV4IGQ4ODI4
YTM3ZTQzYS4uNjUzYjI0OTFmZWM4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtLmMNCj4gPiBAQCAtMjcwMCw3ICsyNzAwLDcgQEAgdm9pZCBhbWRncHVfcG1f
cHJpbnRfcG93ZXJfc3RhdGVzKHN0cnVjdA0KPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4N
Cj4gPiAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwNCj4gdWludDMyX3QNCj4gPiAqc211X3ZlcnNpb24pICB7DQo+ID4gLQlpbnQgciA9
IC1FSU5WQUw7DQo+ID4gKwlpbnQgcjsNCj4gPg0KPiA+ICAJaWYgKGFtZGdwdV9zcmlvdl92Zihh
ZGV2KSkNCj4gPiAgCQlyZXR1cm4gMDsNCj4gPiBAQCAtMjcxMyw3ICsyNzEzLDcgQEAgaW50IGFt
ZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwg
dWludDMyX3QgKnNtdV92ZXJzaW8NCj4gPiAgCQl9DQo+ID4gIAkJKnNtdV92ZXJzaW9uID0gYWRl
di0+cG0uZndfdmVyc2lvbjsNCj4gPiAgCX0NCj4gPiAtCXJldHVybiByOw0KPiA+ICsJcmV0dXJu
IDA7DQo+ID4gIH0NCj4gPg0KPiA+ICBpbnQgYW1kZ3B1X3BtX3N5c2ZzX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+IA0KPiANCj4gS2luZCByZWdhcmRzLA0KPiANCj4gUGF1bA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
