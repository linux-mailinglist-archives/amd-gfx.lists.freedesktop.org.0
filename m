Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6AB07B0
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901396EC26;
	Thu, 12 Sep 2019 04:12:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730055.outbound.protection.outlook.com [40.107.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4CA6E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 01:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzO9DEtmmXO7+Hk1O+Xk/DTMdpHgwfOYb2mrOl3Gr8yX6YgdbXG3FegNJ90/POxFFQiZ8B5g3zXwhqSpR4PakeypFDA3AHmaiiFk1Qn9SUhY+qP9ZR8k3UQBRxXu7P+yhmma+Sy6CeDbaTsreHK3VhabNIAiOwI2OoZdsQEb6Ycev+HxvImW95FDCLu5oHRNqoPWfY/E6Zf5+6A2w600Xpk4E8kaVgj1EmTbP+TlIjxyeQqIfscW9n5YaRX81zwpNYK5+H7+j+vOTBlSnQlrCf+ZhJVZLYleoedLr9MfxORPWqHMAsRlV+Yz/AAd+1FzLInutEiuR7d1t9sA+QhG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du8gdLz43AQh7Em2zrnWNnyLEXIqBa9PegyerqoWSyw=;
 b=aw1RSKSxXb+BLobXkNPmp16mZ/uaPlIvcLX+M8ZRfoHdqcIdeJCTrit6DtZM/n2NvvDKZ5tZ8/BWZ37cgCtTSh5UCy6UCCkl0jalHJMi2WmXnSRFAy92Yh1lhw8ZqCn5OIioa4PyiL2EuNcMQRLS4bbDSNLs7j7LeHurF2KFIUdbMJ7Wzl4m9OCE22kOzhXj25Fre8wVjVI4fcAulYI1roxtSofwyW6bobQx/qZ7goa/1J3IPvilEZNxSmBSVR1CK2U7tHKXFCCCn8haT9tojagEfdmeKBCOANsFZljJ+VYGbyCL3IdjYjsXgTiFqGulpeN2o/L0msfXNUlse7dIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2768.namprd12.prod.outlook.com (52.135.107.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 01:53:04 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::eca8:92f5:cd16:fbc2]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::eca8:92f5:cd16:fbc2%7]) with mapi id 15.20.2263.015; Thu, 12 Sep 2019
 01:53:04 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Topic: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Thread-Index: AQHVaA/AgJcYa7VSXEuMmnK++rrhg6clzGCAgAC7OACAAAYyAIAAulcQ
Date: Thu, 12 Sep 2019 01:53:03 +0000
Message-ID: <SN6PR12MB2813F0DFFE8EC027AAF6D6DAF1B00@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB3054A0B4D399377417213B76B0B10@MN2PR12MB3054.namprd12.prod.outlook.com>
 <d35cc3f6-ff46-175e-3a92-5f7948f97bef@amd.com>
 <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>
In-Reply-To: <603add77-1476-ebc8-69f9-2cf88a788a6b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99136eef-97c1-4e90-1cad-08d73723f350
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2768; 
x-ms-traffictypediagnostic: SN6PR12MB2768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB276864616E1EEF57320F0FCAF1B00@SN6PR12MB2768.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(13464003)(189003)(199004)(52314003)(71200400001)(71190400001)(53936002)(52536014)(4326008)(186003)(9686003)(7696005)(256004)(14444005)(76176011)(6436002)(33656002)(478600001)(25786009)(5660300002)(229853002)(6246003)(7736002)(486006)(86362001)(66476007)(76116006)(102836004)(66446008)(64756008)(66556008)(66946007)(446003)(6506007)(11346002)(476003)(2906002)(53546011)(316002)(2501003)(3846002)(6116002)(305945005)(55016002)(81156014)(81166006)(14454004)(99286004)(74316002)(26005)(66066001)(8676002)(8936002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2768;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dXJGes9VA1hr9DyOv50CHNjRS5f5qlFu905YliCsqlkgaYFhnPHMqp1aRkdqGNQSA9I6e4oUvdEBL3k6L682FEyQfRlF2k2lITb2ai/04+IgQkJXs8rTtN2ttsvKczJPAOEItZWHtwahg6uZ+s0HFcC5lOSw1oXE42BOYN0gDDMYvqThzg36ypoUhm3AheiZRzqCexC8RT+JW2aVx3Rl0AGlF0qht//vNnfDw19BswK4A9AOFWtdCkNxIGFHJE+/AMyPCIbc+Yej0n/Fqo3RqxUaVycOrSEo6xxbWEpJlBa3RoPRZ+UsnAhRQ+extxY3Ppt5vouRYFggDbCCZ2sbsreoqnwJP0gaFRZWn5gmPcHgQzD5o5gBBzVeIJNWqnzVpxaC6N0cwsyeeGbxyDPgwx9KuU7MUGYcs7okh9Yfmoc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99136eef-97c1-4e90-1cad-08d73723f350
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 01:53:03.9892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lwHSkoC7NfWzuxsB/glzsDiZFVyoAx7luO0X+u5Wqc8ceEolK2XSxyW5Xc300MzUmggDI//kyk/3k/kKbNoEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du8gdLz43AQh7Em2zrnWNnyLEXIqBa9PegyerqoWSyw=;
 b=Ve09LqTOolSviH2/HYRePeqyhGXWh3DxiMCuj6XAc7QO4VaHjCwbiqn+C2aC/YRw2LK3PH7+EsieBAwQaQ4YNkjp2k7T/T0+cn4fNA/FlCvI0/lEVfh+LeGUBofTj03GyywgvC1b5mTXKjaYdam8OC5y0fYkhFMF1tHVKiTa9xM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

Q29tbWVudCBpbmxpbmUuDQoNClJlZ2FyZHMsDQpHdWNodW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1k
LmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMSwgMjAxOSAxMDo0MSBQTQ0KVG86
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vYW1kZ3B1OiBGaXggbXV0ZXggbG9jayBmcm9tIGF0b21pYyBjb250ZXh0Lg0KDQpPbiBz
ZWNvbmQgdGhvdWdoIHRoaXMgd2lsbCBicmVha8KgIHdoYXQgYWJvdXQgcmVzZXJ2aW5nIGJhZCBw
YWdlcyB3aGVuIHJlc2V0dGluZyBHUFUgZm9yIG5vbiBSQVMgZXJyb3IgcmVhc29uIHN1Y2ggYXMg
bWFudWFsIHJlc2V0ICxTMyBvciByaW5nIHRpbWVvdXQsIChhbWRncHVfcmFzX3Jlc3VtZS0+YW1k
Z3B1X3Jhc19yZXNldF9ncHUpIHNvIGkgd2lsbCBrZWVwIHRoZSBjb2RlIGFzIGlzLg0KDQpBbm90
aGVyIHBvc3NpYmxlIGlzc3VlIGluIGV4aXN0aW5nIGNvZGUgLSBsb29rcyBsaWtlIG5vIHJlc2Vy
dmF0aW9uIHdpbGwgdGFrZSBwbGFjZSBpbiB0aG9zZSBjYXNlIGV2ZW4gbm93IGFzIGFtZGdwdV9y
YXNfcmVzZXJ2ZV9iYWRfcGFnZXMgDQpkYXRhLT5sYXN0X3Jlc2VydmVkIHdpbGwgYmUgZXF1YWwg
dG8gZGF0YS0+Y291bnQgLCBubyA/IExvb2tzIGxpa2UgZm9yDQp0aGlzIGNhc2UgeW91IG5lZWQg
dG8gYWRkIGZsYWcgdG8gRk9SQ0UgcmVzZXJ2YXRpb24gZm9yIGFsbCBwYWdlcyBmcm9tDQowIHRv
IGRhdGEtPmNvdW5udC4NCltHdWNodW5dWWVzLCBsYXN0X3Jlc2VydmVkIGlzIG5vdCB1cGRhdGVk
IGFueSBtb3JlLCB1bmxlc3Mgd2UgdW5sb2FkIG91ciBkcml2ZXIuIFNvIGl0IG1heWJlIGFsd2F5
cyBlcXVhbCB0byBkYXRhLT5jb3VudCwgdGhlbiBubyBuZXcgYmFkIHBhZ2Ugd2lsbCBiZSByZXNl
cnZlZC4NCkkgc2VlIHdlIGhhdmUgb25lIGVlcHJvbSByZXNldCBieSB1c2VyLCBjYW4gd2UgcHV0
IHRoaXMgbGFzdF9yZXNlcnZlZCBjbGVhbiBvcGVyYXRpb24gdG8gdXNlciBpbiB0aGUgc2FtZSBz
dGFjayBhcyB3ZWxsPw0KDQpBbmRyZXkNCg0KT24gOS8xMS8xOSAxMDoxOSBBTSwgQW5kcmV5IEdy
b2R6b3Zza3kgd3JvdGU6DQo+IEkgbGlrZSB0aGlzIG11Y2ggbW9yZSwgSSB3aWxsIHJlbG9jYXRl
IHRvIA0KPiBhbWRncHVfdW1jX3Byb2Nlc3NfcmFzX2RhdGFfY2IgYW4gcHVzaC4NCj4NCj4gQW5k
cmV5DQo+DQo+IE9uIDkvMTAvMTkgMTE6MDggUE0sIFpob3UxLCBUYW8gd3JvdGU6DQo+PiBhbWRn
cHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIGlzIG9ubHkgdXNlZCBieSB1bWMgYmxvY2ssIHNvIGFu
b3RoZXIgDQo+PiBhcHByb2FjaCBpcyB0byBtb3ZlIGl0IGludG8gYW1kZ3B1X3VtY19wcm9jZXNz
X3Jhc19kYXRhX2NiLg0KPj4gQW55d2F5LCBlaXRoZXIgd2F5IGlzIE9LIGFuZCB0aGUgcGF0Y2gg
aXM6DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCj4+
DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4NCj4+PiBTZW50OiAyMDE55bm0OeaciDEx
5pelIDM6NDENCj4+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBDYzog
Q2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhvdTEsIFRhbyANCj4+PiA8VGFv
Llpob3UxQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFt
ZC5jb20+OyANCj4+PiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5j
b20+DQo+Pj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBGaXggbXV0ZXggbG9jayBmcm9t
IGF0b21pYyBjb250ZXh0Lg0KPj4+DQo+Pj4gUHJvYmxlbToNCj4+PiBhbWRncHVfcmFzX3Jlc2Vy
dmVfYmFkX3BhZ2VzIHdhcyBtb3ZlZCB0byBhbWRncHVfcmFzX3Jlc2V0X2dwdSANCj4+PiBiZWNh
dXNlIHdyaXRpbmcgdG8gRUVQUk9NIGR1cmluZyBBU0lDIHJlc2V0IHdhcyB1bnN0YWJsZS4NCj4+
PiBCdXQgZm9yIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBhbWRncHVfcmFzX3Jlc2V0X2dwdSBp
cyBjYWxsZWQgDQo+Pj4gZGlyZWN0bHkgZnJvbSBJU1IgY29udGV4dCBhbmQgc28gbG9ja2luZyBp
cyBub3QgYWxsb3dlZC4gQWxzbyBpdCdzIA0KPj4+IGlycmVsZXZhbnQgZm9yIHRoaXMgcGFydGls
Y3VsYXIgaW50ZXJydXB0IGFzIHRoaXMgaXMgZ2VuZXJpYyBSQVMgDQo+Pj4gaW50ZXJydXB0IGFu
ZCBub3QgbWVtb3J5IGVycm9ycyBzcGVjaWZpYy4NCj4+Pg0KPj4+IEZpeDoNCj4+PiBBdm9pZCBj
YWxsaW5nIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMgaWYgbm90IGluIHRhc2sgY29udGV4
dC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaCB8IDQgKysrLQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4+IGluZGV4IDAxMjAzNGQuLmRkNWRhM2MgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+Pj4gQEAgLTUwNCw3
ICs1MDQsOSBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRncHVfcmFzX3Jlc2V0X2dwdShzdHJ1Y3Qg
DQo+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+PiDCoMKgwqDCoMKgIC8qIHNhdmUgYmFkIHBh
Z2UgdG8gZWVwcm9tIGJlZm9yZSBncHUgcmVzZXQsDQo+Pj4gwqDCoMKgwqDCoMKgICogaTJjIG1h
eSBiZSB1bnN0YWJsZSBpbiBncHUgcmVzZXQNCj4+PiDCoMKgwqDCoMKgwqAgKi8NCj4+PiAtwqDC
oMKgIGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoYWRldik7DQo+Pj4gK8KgwqDCoCBpZiAo
aW5fdGFzaygpKQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3Bh
Z2VzKGFkZXYpOw0KPj4+ICsNCj4+PiDCoMKgwqDCoMKgIGlmIChhdG9taWNfY21weGNoZygmcmFz
LT5pbl9yZWNvdmVyeSwgMCwgMSkgPT0gMCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWR1
bGVfd29yaygmcmFzLT5yZWNvdmVyeV93b3JrKTsNCj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0K
Pj4+IC0tDQo+Pj4gMi43LjQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
