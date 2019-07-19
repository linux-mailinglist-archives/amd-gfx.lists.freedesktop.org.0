Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7F6E1FB
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D6B6E5BB;
	Fri, 19 Jul 2019 07:52:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780070.outbound.protection.outlook.com [40.107.78.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD2F6E5BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc8IsZuHgmZU1uS7eeiCinxwZJMn6lbB0AM5RXBcFxN40LqVYMO/kWutyoA+zcOeNiQpTlxKgzqcn+7IDvhgoEIJgK9yIeiZeVX71PnZaZwyeZSkHNhUXEbfxqvre1y4NbAxTIE84BhI5fYhkvqYUeixhAR41gFbmchNsvIYksEnJxC3DCDQtxqbPR3ZZufWBTHVBP6muUj0LkQgunUF1n8NIdRc4hDbLAZd15yqAXesJS/8/mbkJuHbQcuWKXZcdMd7Xt5FRy+ut4RtWoAcEzPh9YyfGOqKbJdnMzJJR22jVVO9lxWdr+dbx672XOj19wjzyNbbHM4UUh27dHyJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbRcZ6Yqn3wze35ImibVWu+f3VT3y5OXaHAeO8BUjnk=;
 b=S7PZbJAoN3FXUEhSZvuJ2aFrIUfadhHfbVEk6dqR0r4SbpVxYMfPek/9+RqtABl90/7CrAt688+thd2RVFsSOKRsfXKkVaIu/Y8x5lLfwj++/M1jFeeT3uO81zpQBb/MiPRGX0xnhNj1GDLlf9fREV/219D8s+nt4eGsk6KhHCAjk4lY0vqr/lGYziY2kmO9J5CNysIQL/ouk/wsC1bcgfZ17xX8TedblICAYwpQ0LjOdI3cX/bhP3gFWDucD0gHgEI+DABJ3yRpYP47uAsP9F/7/ktb9D0Kx+okZPr1IYH3C/5xgvw8BcsXRSJejcaAI5JRmDK5cZKZtAhSq/wWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 07:52:40 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 07:52:40 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Topic: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
Thread-Index: AQHVPYB6yYJz3cuPKECZQ4KnHJ5BFqbRkhLg
Date: Fri, 19 Jul 2019 07:52:40 +0000
Message-ID: <MN2PR12MB3309CD61FE2B6AE068997591ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190718154616.14841-1-leo.liu@amd.com>
 <20190718154945.15004-1-leo.liu@amd.com>
In-Reply-To: <20190718154945.15004-1-leo.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ed297a1-82a8-4dea-500e-08d70c1e12e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3887A93B2545116788A30D05ECCB0@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(13464003)(316002)(55016002)(9686003)(3846002)(2906002)(4326008)(5660300002)(6246003)(6306002)(6116002)(486006)(966005)(446003)(53936002)(11346002)(305945005)(229853002)(99286004)(52536014)(54906003)(66066001)(6436002)(110136005)(66476007)(71200400001)(71190400001)(66946007)(66446008)(64756008)(66556008)(102836004)(76116006)(68736007)(8676002)(76176011)(86362001)(186003)(26005)(256004)(7696005)(8936002)(81156014)(7736002)(2501003)(74316002)(81166006)(14454004)(476003)(25786009)(53546011)(6506007)(478600001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JAE82uDTjHS4Q5sXas2ab/0czDgRgV3ad4sByRM92lKsSGNNGcdGEwmS7od0oDybqMgDRfl3ljeINEAlPY4sF4QRclLKHP1+OR1SsSKmVNUOQ9v8FPz2slhceMFY4x361E886B9Lp4l13Fd9A3kxA4yQkzUTgOp7OANNualkwp69Vid9Vdfm2ZEKnjfHluWBLJPu5TrOOwGHm5b+hx0/tBb03HKEu/hs8zUDriyt6iBubUokIUAwLK62c4k986PfHwRf2LcnlNkGCfa9aj8Uz1enjZUPCwnUB8jfMOYU5wTFimypx0e7hxho1oHoG+RCYMj48d60dwtgPiQCKpARzL27BwQRj/4xp8iKca3X/4wr3dHoy/S8t/n4pAnZKCZQij9sx3UvRtYmh9xT/7d0IKEQxlwtjfd8ZVC2NRg6qc8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed297a1-82a8-4dea-500e-08d70c1e12e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:52:40.0214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbRcZ6Yqn3wze35ImibVWu+f3VT3y5OXaHAeO8BUjnk=;
 b=b3QN8v/H2cOCxvcvIQmqefEUcVSO/Z65R9X9HBcvr5irGGq0zxdLfuMW7kztiP8SCb/wgr++eS59NizXeoST+3TtTu8b4RMZ+r+HP2gJz5ksMAoUweDA5azEeti/ueZ9XOpccJ/nLB24hUYBdZuyD7Nln71Z+kVQlGFt/ZZvQUc=
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGl1LA0KPiBMZW8NCj4g
U2VudDogVGh1cnNkYXksIEp1bHkgMTgsIDIwMTkgMTE6NTAgUE0NCj4gVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaXUsIExlbyA8TGVvLkxpdUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVzZSBWQ04gZmlybXdhcmUgb2Zmc2V0IGZvciBj
YWNoZSB3aW5kb3cNCj4gDQo+IFNpbmNlIHdlIGFyZSB1c2luZyB0aGUgc2lnbmVkIEZXIG5vdywg
YW5kIGFsc28gdXNpbmcgUFNQIGZpcm13YXJlIGxvYWRpbmcsDQo+IGJ1dCBpdCdzIHN0aWxsIHBv
dGVudGlhbCB0byBicmVhayBkcml2ZXIgd2hlbiBsb2FkaW5nIEZXIGRpcmVjdGx5IGluc3RlYWQg
b2YgUFNQLA0KPiBzbyB3ZSBzaG91bGQgYWRkIG9mZnNldC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4NCg0KVGhhbmtzIExlbyENCisgQWFyb24gdG8gZ2l2
ZSBhIHRlc3QgaW4gb3VyIHNpZGUuDQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYyB8IDMgLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYw0KPiBpbmRleCAzY2I2MmU0NDhhMzcu
Ljg4ZTNkZWRjZjkyNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YyXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5j
DQo+IEBAIC0zNzksMTEgKzM3OSw4IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX21jX3Jlc3VtZShz
dHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gIAkJV1JFRzMyX1NPQzE1KFVWRCwgMCwN
Cj4gbW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gsDQo+ICAJCQl1cHBlcl8zMl9i
aXRzKGFkZXYtPnZjbi5pbnN0LT5ncHVfYWRkcikpOw0KPiAgCQlvZmZzZXQgPSBzaXplOw0KPiAt
CQkvKiBObyBzaWduZWQgaGVhZGVyIGZvciBub3cgZnJvbSBmaXJtd2FyZQ0KPiAgCQlXUkVHMzJf
U09DMTUoVVZELCAwLCBtbVVWRF9WQ1BVX0NBQ0hFX09GRlNFVDAsDQo+ICAJCQlBTURHUFVfVVZE
X0ZJUk1XQVJFX09GRlNFVCA+PiAzKTsNCj4gLQkJKi8NCj4gLQkJV1JFRzMyX1NPQzE1KFVWRCwg
MCwgbW1VVkRfVkNQVV9DQUNIRV9PRkZTRVQwLA0KPiAwKTsNCj4gIAl9DQo+IA0KPiAgCVdSRUcz
Ml9TT0MxNShVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVfU0laRTAsIHNpemUpOw0KPiAtLQ0KPiAy
LjIwLjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
