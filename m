Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB9A9F67
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 12:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9B6E02F;
	Thu,  5 Sep 2019 10:17:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFEB6E02F
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 10:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9GWarVS5v07AYJHtZ1TpKjguvy0iFsagSnZPiwWc7JMYAWqWe7jidr8Vb+4FL31P+ldlmazQPM+vr2BFoxYnrGELct1nSPwrt61YdPOPljWiIFEnEhK9Y68UkU3v52KGeEbeaKMFVw4xNDg/qJ2QQ9EgPBrcQ3HGWbEnUsMhqeCbYge0go2AXzo3FUq0smkwDh0f3itpCJZyyTylzUPGqTDXB9AaRWyUkuIAGobvHHsgseYvha5J7kQpXqlFZ1w95XiB0zI1qCKTw++9VeYVuom8kGTAfmAYa9Gr0hgxU7jOHRZkysAF37yUfV5wyIWOLAP+BgNYWgNACihK9cx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzxGWTQEJQ5lw3yIy+Rp/zFwiz8esDkdy6596tzcaok=;
 b=fz0kM0VL0G73hcS+Ba1pAxTxa9ZzjqkRzCmFdmOHV4o8WwKgLrdSfIXdpQI/Vgs82yLoXS+qAHpHYhak6aMscL4u3sIWQGTTp7anLyIsGgjn6Zs6oum80PIM7UFvdjZE2SoHmCXXzf9r9lY8tmM0JprUqMPOj9i+Tvikt6WxcJq4AQdDaPyIV5naVlnoelY93BS4v+zXDrNVmUbk4N1alQE29SnAQRIbw4CGk4tewHUjwDlHxT1eJG8aoSzeqPDziWVeaJdFzzr7qYWEYyy2YYJL9R4E6j8r3EwcgSKYeUpjowbxBo8HuPA26zmMEolEtWaoT7UcbsV29tptemx86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3997.namprd12.prod.outlook.com (10.255.239.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 10:17:08 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 10:17:08 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Topic: [PATCH] drm/amd/powerplay: fix 'unusedd variable' compile warning
Thread-Index: AQHVY8vluvawTcHLNEugyERMvsFgP6cc0UlAgAANOwA=
Date: Thu, 5 Sep 2019 10:17:08 +0000
Message-ID: <c4ae8e9f-86fa-12f2-8a1e-2f47278d1433@amd.com>
References: <20190905092526.5962-1-xiaojie.yuan@amd.com>
 <MN2PR12MB3344F3C71E62E09B8FE203BBE4BB0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344F3C71E62E09B8FE203BBE4BB0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::25) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5b20864-99a5-4d33-81ec-08d731ea350e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3997; 
x-ms-traffictypediagnostic: MN2PR12MB3997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39979B68AC913BA0185C2952A2BB0@MN2PR12MB3997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(13464003)(31696002)(7736002)(31686004)(3846002)(26005)(256004)(66446008)(66946007)(64756008)(66556008)(5660300002)(6486002)(66066001)(14444005)(305945005)(186003)(386003)(6116002)(4326008)(52116002)(6506007)(53546011)(99286004)(316002)(8936002)(76176011)(2906002)(71200400001)(54906003)(110136005)(66476007)(36756003)(478600001)(102836004)(8676002)(53936002)(486006)(2616005)(11346002)(446003)(81166006)(81156014)(476003)(6436002)(71190400001)(6246003)(25786009)(6512007)(229853002)(14454004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3997;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ykTY4xXWvwvQQkhlxMjWaLBCauBMjxSyZhLSZkdUWVbfJ64p5MNGQwZfPg6o5ZkoSx1nVruHoX5IhPElGM3O6wcx5h+j+SzZBkAHL4PKfkaHUdLU2diTIEflKfvtEIR0DgXi21oJtDeTVhXmWAex604a06kRh68ToH7r5B/1VpCavx1Sncu+kT7ubjt2/r4s06Lm33HpnlArg+qhaa+m9SrG+eDHGbSUHZgX35Ylynm+QYK0THfjck7b/p3tUVMSigyvSGCvRnhHhAigCTj9fVvJY66cONvVCDBiha65ewTHaFNkFMZrAA9JDERG14rhuS9sUZwWW4Z234rO1Maxa+6DRvtpq3e+3HDV9HiE/N1XGQJtVO58mgVPsoTGJIadT5zRVsQTrtIgjZuK64oUtzDFSH5Acr3RtskChUW72n8=
Content-ID: <2E0B83CB60962649B58CECD4B0A8EB6F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b20864-99a5-4d33-81ec-08d731ea350e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 10:17:08.1604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yU8CSjvDu1OmUYa6T1BtfSKn2YJLpX6qq4Rvgcr9U8XsOQRMiUqLYmCns3Tful5v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzxGWTQEJQ5lw3yIy+Rp/zFwiz8esDkdy6596tzcaok=;
 b=PgADed9yx/x5x5skcOE8Z7VuzJidaMNUhjPIKHCCLWL9+zC7r3MgLJdr+lsvX6pabaZgdZZnYRmyU2cxdMVTRUxz5rav9vgKYRSwhaoeW9i4hmuel1SnPQ06uDw0H6pGUapFQUBl+fw33T5bC9EmKEXZEnLP+elgYqbrltVAkKo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCk9uIDkvNS8x
OSA1OjMwIFBNLCBRdWFuLCBFdmFuIHdyb3RlOg0KPiBSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4NCj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBG
cm9tOiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4NCj4+IFNlbnQ6IDIwMTnl
ubQ55pyINeaXpSAxNzoyNg0KPj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
PiBDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuDQo+
PiA8RXZhbi5RdWFuQGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1k
LmNvbT47DQo+PiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4NCj4+IFN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGZpeCAndW51c2VkZCB2YXJpYWJsZScgY29t
cGlsZQ0KPj4gd2FybmluZw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlh
b2ppZS55dWFuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMgfCAyIC0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYyAgIHwgMiAtLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9yZW5vaXJfcHB0LmMgICB8IDIgLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgfCAyIC0tDQo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YXJjdHVydXNfcHB0LmMNCj4+IGluZGV4IDZlOGViMGY5NGM4Yi4uMWM2NzMyODQ3MTg1IDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jDQo+
PiBAQCAtMTkzMSw3ICsxOTMxLDUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
DQo+PiBhcmN0dXJ1c19wcHRfZnVuY3MgPSB7DQo+Pg0KPj4gICB2b2lkIGFyY3R1cnVzX3NldF9w
cHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQo+PiAtCXN0cnVjdCBzbXVfdGFi
bGVfY29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOw0KPj4gLQ0KPj4gICAJc211
LT5wcHRfZnVuY3MgPSAmYXJjdHVydXNfcHB0X2Z1bmNzOw0KPj4gICB9DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KPj4gaW5kZXggZTNhZGQ4YjU5
MjkxLi4xNjYzNGU2NTc1ODkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYw0KPj4gQEAgLTE2MzAsNyArMTYzMCw1IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzDQo+PiA9IHsNCj4+DQo+PiAgIHZv
aWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQo+PiAt
CXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOw0K
Pj4gLQ0KPj4gICAJc211LT5wcHRfZnVuY3MgPSAmbmF2aTEwX3BwdF9mdW5jczsNCj4+ICAgfQ0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQu
Yw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMNCj4+IGlu
ZGV4IGI3ZmE4YjE1OGZmMi4uYTVjZjg0NmI1MGQ0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMNCj4+IEBAIC0yNTcsOCArMjU3LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHJlbm9pcl9wcHRfZnVuY3MgPSB7DQo+Pg0K
Pj4gICB2b2lkIHJlbm9pcl9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KSAg
ew0KPj4gLQlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90
YWJsZTsNCj4+IC0NCj4+ICAgCXNtdS0+cHB0X2Z1bmNzID0gJnJlbm9pcl9wcHRfZnVuY3M7DQo+
PiAgIAlzbXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTJfRFJJVkVSX0lGX1ZFUlNJT047ICB9IGRp
ZmYgLS1naXQNCj4+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5j
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYw0KPj4gaW5k
ZXggMThkMWI0MzJmNzE5Li45MjlmNjE4OTFkZmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYw0KPj4gQEAgLTMxODAsNyArMzE4MCw1IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB2ZWdhMjBfcHB0X2Z1bmNzDQo+PiA9IHsN
Cj4+DQo+PiAgIHZvaWQgdmVnYTIwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUpICB7DQo+PiAtCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+
c211X3RhYmxlOw0KPj4gLQ0KPj4gICAJc211LT5wcHRfZnVuY3MgPSAmdmVnYTIwX3BwdF9mdW5j
czsNCj4+ICAgfQ0KPj4gLS0NCj4+IDIuMjAuMQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
