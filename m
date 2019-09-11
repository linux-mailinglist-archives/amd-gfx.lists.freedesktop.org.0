Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F1AF62E
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 08:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1342A6E140;
	Wed, 11 Sep 2019 06:54:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDBD89EEB
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 06:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV4WJ3r/BFlyfvZxphAT5U8NjYGA95qpm1uWtoaYZWQk4rXVpdtr4ZTJ2hkpm6TfRY866SxO27mXFsZKb7TNOq8Qm2C0aa4JFv/ltCYnhSD6c1oq9c3wU84/uAacEWEmgqdtksWHbxMQTRj75p4SeUAF8VFLlnw3H/A46K5y99L3FJtHTMA64ZPJ/eq8aM3AJ/J6Hi6KMYxTXPWzh9wKAV4QuoWaAwr512yvp2jKUetWl+BcaKFlmVwxLwkj5QZQNFhbsQo7Q7ULT3jmvAsTg+SYgl5L8VHjVj2OFqBJgHV9I5w3RkvrOVkarg96Wr+1vZm9z8qmUCv4cq/rl+slQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyTwle2VxQ+QQ5bDvkYxFSDX9wvri5FSk1jk6WWCQys=;
 b=PxVUdmDHt1K1nJQRWLK/cZn+syYdSEXs94g1S1vehwWRPeUISFzmm+nmCZoPtSfOS/+95GwZs2H/6ExLzR7jtpiD68dNODAQP1EMgB1GizBHnLJzId7B2XyOiGsO/dxEapkESqzSUa4qYOHEjxAWIzOrFkn1WZKN6QclBJjqiqF2PygoLtbGUB70RdHcaITBDuJCire/p83onxyt17AgthCiGrP1mEu+mNbh1l19lmz7xeQCS3syH7HLzktLslpj/+yk9YV+7jgiKqyJglYxqoCg1uXwIH/Ljj/+xFvXgTmMVry3/8AdFsUTfIqOPBtMtrhPm9XWlwTsk9kiM8ZiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 06:54:38 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 06:54:38 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Index: AQHVZ6zZSGP4wbr8DUmv4JsslOgvO6ckj2HwgAFGHACAADeOgA==
Date: Wed, 11 Sep 2019 06:54:37 +0000
Message-ID: <MN2PR12MB3248AAFEEEC7E7E8CB22D917F2B10@MN2PR12MB3248.namprd12.prod.outlook.com>
References: <20190910075312.17108-1-shirish.s@amd.com>
 <MN2PR12MB33099B938972C6AF2437C92BECB60@MN2PR12MB3309.namprd12.prod.outlook.com>
 <67422930-9dbe-bac2-1636-c0b71a814acb@amd.com>
In-Reply-To: <67422930-9dbe-bac2-1636-c0b71a814acb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8448b82-ed88-470d-27de-08d73684e9b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3949; 
x-ms-traffictypediagnostic: MN2PR12MB3949:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB394900AFD4CCCE584268DA1AF2B10@MN2PR12MB3949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:88;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(189003)(199004)(13464003)(66066001)(5660300002)(33656002)(52536014)(7696005)(99286004)(26005)(54906003)(76176011)(6506007)(186003)(53546011)(102836004)(476003)(316002)(446003)(486006)(11346002)(6436002)(81166006)(8676002)(53936002)(6636002)(9686003)(6306002)(55016002)(81156014)(14444005)(256004)(7736002)(71200400001)(71190400001)(305945005)(966005)(74316002)(14454004)(478600001)(86362001)(66476007)(66446008)(8936002)(66946007)(66556008)(76116006)(6116002)(6862004)(3846002)(64756008)(2906002)(4326008)(25786009)(229853002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3949;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wsGI+KXpXV+iLdeKHEBVHIPLkGRgCJ5+iTA88JdhRES3xFDFOsvZhthGavSGLKnUZFHQ0DQuzpllO1cECMghUen/u9nqoYG+d74fqO8ZZvIHE2RdmHL150gGQxNJI5NGC1gyOrWxHJgKUem5guOD6x/jdx21hmUkYI1g1XtEBPuh+/kl7DgMgF1pwhlcaB3Y3RbCNypUHo+RGY+v4Wie8UVAg0KHtACO78L7Pqog///1izhQGUVFKG4ae4SJMyWPFNqGB349wvKqUs4YXcEHLOEa044IBHHB34O4tXjBg63mmW0AGlVEjt0mgdxe5+5YuFk38NaHlhTwBaXTPKvWCScR+RwnL9RajpNgXRtHMnkTeHKxlN2I8fQKREUybuFqSCiIJfWojiNMQ53Y4FqnBQDVx4FHT1BRWDa5Hyt+fbg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8448b82-ed88-470d-27de-08d73684e9b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 06:54:37.8193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6jFXb9u4cWqMh1aqm6+lCbcofgYSUBiVdy82P+6qWd3friVLTiftUJs7Hh2Cj0emCUr1Uxc25OjQoPbQgQkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyTwle2VxQ+QQ5bDvkYxFSDX9wvri5FSk1jk6WWCQys=;
 b=2x9OfGnXyucYcRBc/Xf1vJHLX5LOwoHxeoQGSHnUpd/sXpEFaBuBT8GPv8bRhkMhE6hR5z7f/HjVlRg28nYazbkxtrj0d2MuKl5oIEyZDFfDF6GR3Sv/VmTJnU4bTYHVDlyYnIND9orOgDCgaK7IBjdLLfyYtlmrTkGua09OYi4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWdyZWUsIGhhdmUgc2VudCBWMi4NCk15IHBhdGNoIHdhcyBhY3R1YWxseSBpbiBsaW5lIHRvIGFs
cmVhZHkgdXAgc3RyZWFtZWQgcGF0Y2g6DQpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS84LzI2
LzIwMQ0KDQoNCg0KUmVnYXJkcywNClNoaXJpc2ggUw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPiANClNl
bnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDExLCAyMDE5IDk6MDkgQU0NClRvOiBIdWFuZywgUmF5
IDxSYXkuSHVhbmdAYW1kLmNvbT47IFMsIFNoaXJpc2ggPFNoaXJpc2guU0BhbWQuY29tPjsgRGV1
Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IGJ1aWxkIGVy
cm9yIHdpdGhvdXQgQ09ORklHX0hTQV9BTUQNCg0KVGhpcyBpcyBwcmV0dHkgdWdseS4gU2VlIGEg
c3VnZ2VzdGlvbiBpbmxpbmUuDQoNCk9uIDIwMTktMDktMTAgNDoxMiBhLm0uLCBIdWFuZywgUmF5
IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFMsIFNoaXJp
c2ggPFNoaXJpc2guU0BhbWQuY29tPg0KPj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAy
MDE5IDM6NTQgUE0NCj4+IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiANCj4+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT4NCj4+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgUywgU2hpcmlzaCA8U2hpcmlzaC5TQGFtZC5jb20+DQo+PiBTdWJq
ZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGZpeCBidWlsZCBlcnJvciB3aXRob3V0IENPTkZJR19I
U0FfQU1EDQo+Pg0KPj4gSWYgQ09ORklHX0hTQV9BTUQgaXMgbm90IHNldCwgYnVpbGQgZmFpbHM6
DQo+Pg0KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5vOiBJbiBm
dW5jdGlvbg0KPj4gYGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdCc6DQo+PiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6MTYyNjogdW5kZWZpbmVkIHJlZmVyZW5j
ZSANCj4+IHRvIGBzY2hlZF9wb2xpY3knDQo+Pg0KPj4gVXNlIENPTkZJR19IU0FfQU1EIHRvIGd1
YXJkIHRoaXMuDQo+Pg0KPj4gRml4ZXM6IDFhYmI2ODBhZDM3MSAoImRybS9hbWRncHU6IGRpc2Fi
bGUgZ2Z4b2ZmIHdoaWxlIHVzZSBubyBIL1cgDQo+PiBzY2hlZHVsaW5nIHBvbGljeSIpDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4NCj4gKyBGZWxp
eCBmb3IgaGlzIGF3YXJlbmVzcy4NCj4NCj4gUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+DQo+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggICAgICAgIHwgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCA2ICsrKysrLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaA0KPj4gaW5kZXggMTAzMGNiMzA3MjBjLi5hMTUxNmEzYWU5YTggMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+IEBAIC0xNjksNyArMTY5LDkgQEAgZXh0
ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5OyAgZXh0ZXJuIGludCANCj4+IGFtZGdwdV9tZXM7ICBl
eHRlcm4gaW50IGFtZGdwdV9ub3JldHJ5OyAgZXh0ZXJuIGludCANCj4+IGFtZGdwdV9mb3JjZV9h
c2ljX3R5cGU7DQo+PiArI2lmZGVmIENPTkZJR19IU0FfQU1EDQo+PiAgIGV4dGVybiBpbnQgc2No
ZWRfcG9saWN5Ow0KDQojZWxzZQ0Kc3RhdGljIGNvbnN0IGludCBzY2hlZF9wb2xpY3kgPSBLRkRf
U0NIRURfUE9MSUNZX0hXUzsgI2VuZGlmDQoNClRoaXMgd2F5IHlvdSBkb24ndCBuZWVkIGFub3Ro
ZXIgc2V0IG9mIHVnbHkgI2lmZGVmcyBpbiBhbWRncHVfZGV2aWNlLmMuDQoNClJlZ2FyZHMsDQog
wqAgRmVsaXgNCg0KDQo+PiArI2VuZGlmDQo+Pg0KPj4gICAjaWZkZWYgQ09ORklHX0RSTV9BTURH
UFVfU0kNCj4+ICAgZXh0ZXJuIGludCBhbWRncHVfc2lfc3VwcG9ydDsNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiBpbmRleCBiZDQyM2RkNjRl
MTguLjI1MzVkYjI3ZjgyMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jDQo+PiBAQCAtMTYyMyw3ICsxNjIzLDExIEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RldmljZV9pcF9lYXJseV9pbml0KHN0cnVjdA0KPj4gYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4+ICAgCX0NCj4+DQo+PiAgIAlhZGV2LT5wbS5wcF9mZWF0dXJlID0gYW1kZ3B1X3BwX2ZlYXR1
cmVfbWFzazsNCj4+IC0JaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8fCBzY2hlZF9wb2xpY3kg
PT0NCj4+IEtGRF9TQ0hFRF9QT0xJQ1lfTk9fSFdTKQ0KPj4gKwlpZiAoYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpDQo+PiArCSAgICAjaWZkZWYgQ09ORklHX0hTQV9BTUQNCj4+ICsJICAgIHx8IHNjaGVk
X3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUw0KPj4gKwkgICAgI2VuZGlmDQo+PiAr
CSAgICApDQo+PiAgIAkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7DQo+
Pg0KPj4gICAJZm9yIChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgew0KPj4g
LS0NCj4+IDIuMjAuMQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
