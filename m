Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652FBE25E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 18:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1776EBFB;
	Wed, 25 Sep 2019 16:20:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF326EBFB
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 16:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv8WDnc2/MIfjsCLWlRv5Uw3Culy6LjI/GwD345DoCrUpWkvKJyeqcmzsPI7ix3PhKJUOP2qtZae+3+cPBbsELeCTU/Xngv8MAMKdmzde7hn1ZUtjV44CNPJ6yj+9gI773qFt0VwHRq4b4dEHqs/aPXbJGz87Mfeqwt3P+l8QRz6ILa0NN2RQp+EruHgp7SxKZr8pK4tt3lyvmiUX0whDuWQL95wAnMuamsV4MLgNuEdRyrVEhyRN2dQK4oLMngzt5Q5uRHZH8aqj6j90Ep1SuQpqkUjkJfD3Ic1g3yvYukGEMLSAm6hMjxAJtturqWemE1nhwkCyeF9f7mSSNBrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kpRYdG1OBfkYZ0iGxfYWw4w39AT1dqtgprF6kXzQ+I=;
 b=CWwGOy6AEOEKwvKUO+xP3j0qcKnoG55w+/TDajAoY4nFao+HC+hmjpfS5bL+0SfpEzOxTOGO5VRGwzdh7Cq8cYePHEH8vi4Uh+6/EjjykuooeOyxYrifqW9QH/uWlYDVF3HwGlwpoajrgyLapO6W3u1n8dlKWTpB4lQK9FYsNK2P5yxqElh9NHyNraLElDTNIUOg3vGvVF1O5lyc5DUcophhky5VlWBVCYg3gnfylLZH/OIfYz8KZ2+2QjdEwZoQ2yfdmAfoJPgfhCcOuGZknjCzjRizBjhg23Ra3Q6EjRetRgysg8R3SEN21EcZ+ln+QyYo2k3wJietzyUX6va6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Wed, 25 Sep 2019 16:20:06 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 16:20:06 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBac8k7WA
Date: Wed, 25 Sep 2019 16:20:06 +0000
Message-ID: <MN2PR12MB33092AF63CB063654D8B1935EC870@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d479ef-c17f-406c-8e72-08d741d43a41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB344068FB76A86D10B7048836EC870@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(13464003)(199004)(189003)(81166006)(8676002)(81156014)(33656002)(53546011)(6506007)(478600001)(64756008)(66446008)(26005)(66556008)(25786009)(76116006)(2501003)(66476007)(52536014)(66946007)(76176011)(74316002)(486006)(305945005)(229853002)(7696005)(476003)(446003)(11346002)(8936002)(102836004)(186003)(7736002)(5660300002)(86362001)(99286004)(55016002)(66066001)(256004)(6436002)(4326008)(6306002)(6246003)(9686003)(316002)(6116002)(3846002)(110136005)(14454004)(71190400001)(966005)(71200400001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hUIB1KXHmB3PAjrUvx21rzj4F4m/KNF5fPcf3qAi2MYTJY+Of9yCDjzud3ow6qOgfiz1O2z4E4jbJs0stVSUBi+L4i3TbjctovIipOZ6AdPdkFcY/DC+C+wVf/Ubmmna2I/QVjU1euMXjeUE7iSyUUdh5BkIJS2/anbpBJZ89wiZzJs4qUXZKIslTqKnwXfk1935YHlbjIGHGfSeohFGtIPQj3xeXnDVc2coDA8APTCuXQhewcTI5AI8LosCPkNc4oyuTftByJWLEqB09EHhTiPA3VfhGJ9SSt5gP9YXFA2ZH4XaBf/sXfK4XMmfxc6Or0hQUSe3ykv4ARqpJWIkZu0gUpv8Ev/NjVuRpCjsCrNXADNLyIYe1auKvay39hxHoH3kFHwJh/zGGSSumikTnvzR6Y+wAchwhzsJTRbAbfs7WPIK1l6AAiKZrUoqGqQrsKW/bhncm8ch/oSAK3xylg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d479ef-c17f-406c-8e72-08d741d43a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 16:20:06.1022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hqkfwj0S8ZP6JnhSUJnb560xAIvBITsOUk2tV+v1wsMMM+faPWBCsc1sJozyl6DqijeOFctNuNDw74xcpMS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kpRYdG1OBfkYZ0iGxfYWw4w39AT1dqtgprF6kXzQ+I=;
 b=i6pu7TCTmffo6tFu7GpNmuXkzrug82kXm2pCT8zkSSSEct0DpNtc1EPf+ruYLkZuZsm7uCn189ZTliCrZEDHNHcVwWISMuubf+0K7ED+dof0U3pI0L+GBnpQrBmcaWkiNWa2dE5f2lQu65J6P0A7wnuZqy8UrpqIz0Elkv68aMM=
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGl1LA0KPiBTaGFveXVu
DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDE5IDY6MTQgQU0NCj4gVG86IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaXUsIFNoYW95dW4gPFNoYW95dW4u
TGl1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogQWRkIE5BVkkxMiBz
dXBwb3J0IGZyb20ga2ZkIHNpZGUNCj4gDQo+IEFkZCBkZXZpY2UgaW5mbyBmb3IgYm90aCBuYXZp
MTIgUEYgYW5kIFZGDQo+IA0KPiBDaGFuZ2UtSWQ6IElmYjQwMzVlNjVjMTJkMTUzZmMzMGU1OTNm
ZTEwOWY5YzdlMDU0MWY0DQo+IFNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBh
bWQuY29tPg0KDQpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDE5ICsr
KysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IGluZGV4IGYz
MjliODIuLmVkZmJhZTVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jDQo+IEBAIC0zODcsNiArMzg3LDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2Rl
dmljZV9pbmZvDQo+IG5hdmkxMF9kZXZpY2VfaW5mbyA9IHsNCj4gIAkubnVtX3NkbWFfcXVldWVz
X3Blcl9lbmdpbmUgPSA4LA0KPiAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9k
ZXZpY2VfaW5mbyBuYXZpMTJfZGV2aWNlX2luZm8gPSB7DQo+ICsJLmFzaWNfZmFtaWx5ID0gQ0hJ
UF9OQVZJMTIsDQo+ICsJLmFzaWNfbmFtZSA9ICJuYXZpMTIiLA0KPiArCS5tYXhfcGFzaWRfYml0
cyA9IDE2LA0KPiArCS5tYXhfbm9fb2ZfaHFkICA9IDI0LA0KPiArCS5kb29yYmVsbF9zaXplICA9
IDgsDQo+ICsJLmloX3JpbmdfZW50cnlfc2l6ZSA9IDggKiBzaXplb2YodWludDMyX3QpLA0KPiAr
CS5ldmVudF9pbnRlcnJ1cHRfY2xhc3MgPSAmZXZlbnRfaW50ZXJydXB0X2NsYXNzX3Y5LA0KPiAr
CS5udW1fb2Zfd2F0Y2hfcG9pbnRzID0gNCwNCj4gKwkubXFkX3NpemVfYWxpZ25lZCA9IE1RRF9T
SVpFX0FMSUdORUQsDQo+ICsJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLA0KPiArCS5zdXBw
b3J0c19jd3NyID0gdHJ1ZSwNCj4gKwkubmVlZHNfcGNpX2F0b21pY3MgPSBmYWxzZSwNCj4gKwku
bnVtX3NkbWFfZW5naW5lcyA9IDIsDQo+ICsJLm51bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsDQo+
ICsJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gOCwNCj4gK307DQo+ICsNCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxNF9kZXZpY2VfaW5mbyA9IHsNCj4g
IAkuYXNpY19mYW1pbHkgPSBDSElQX05BVkkxNCwNCj4gIAkuYXNpY19uYW1lID0gIm5hdmkxNCIs
DQo+IEBAIC00MjUsNiArNDQzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2lu
Zm8NCj4gKmtmZF9zdXBwb3J0ZWRfZGV2aWNlc1tdWzJdID0gew0KPiAgCVtDSElQX1JFTk9JUl0g
PSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVMTH0sDQo+ICAJW0NISVBfQVJDVFVSVVNdID0geyZh
cmN0dXJ1c19kZXZpY2VfaW5mbywNCj4gJmFyY3R1cnVzX2RldmljZV9pbmZvfSwNCj4gIAlbQ0hJ
UF9OQVZJMTBdID0geyZuYXZpMTBfZGV2aWNlX2luZm8sIE5VTEx9LA0KPiArCVtDSElQX05BVkkx
Ml0gPSB7Jm5hdmkxMl9kZXZpY2VfaW5mbywgJm5hdmkxMl9kZXZpY2VfaW5mb30sDQo+ICAJW0NI
SVBfTkFWSTE0XSA9IHsmbmF2aTE0X2RldmljZV9pbmZvLCBOVUxMfSwgIH07DQo+IA0KPiAtLQ0K
PiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
