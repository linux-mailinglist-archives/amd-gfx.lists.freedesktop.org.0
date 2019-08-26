Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E779C6EF
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 03:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FE76E08A;
	Mon, 26 Aug 2019 01:11:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF556E08A
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 01:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H33r/zLz8wcs0fq5i1zJ3JUn11wbaEaK8tk/CQnNajIG2654WHA7dHYYXevmF3oZbOBNSVgHXDuKz1C5IYsTqiXKyKslzACktul6skWaTTs0eD9KiJr2d75pAYkC4VG26aG/ZKsS+2n02cEOgIpWl2XyU19jYh4PtA3jnTt8yKYRCrJRgghNafX/V9VQBA84/RZUl6P9HBHQXysWOM8kZf6o/rbaKH/NS85qUfTMymYkrQpxzmCCWSAlf2O829VzW2X2+9dOVzjNdEh3mOC2TcyNEtRqTGTVen7wGJ6mc81rbM9kLAQAqV913AwR/0RwOOiqyhCbN9J8fWPDPaSUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0IRiRGRbgzEpjxSH5HL8cZqvuwAAp9beWvHxlGKVM=;
 b=CUcsFPJG5QNPN09cvoKV72if1KnEre6p4WXlCm/ZEad3cHiz6kr0kb+uRnn88XLw+UPr5PzxdSChJ5+BB6DCXnZYQVdQ/lHCv4VzhPCQD+BmF6pAoFR6VFPlmretAEAKCMcxNIsudZYh6guYpWXF5h2rnjYYInt5WfusKtLQXseZOey9lRiizT+pwZQnzf2klQvQ0PUdg1/ZRszUrhENn5bSU/Z7DK3UdsE8AvUyQYiyIznnHDF2q29zty4/C1FalM1RRObwmjgEriEkI4tjUy1xG/VgDfov6rY0KWwp7ZsaNlJSJrvw2vAKvdJE8E3Vnegsdmxx40wiRKvwSgLmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2893.namprd12.prod.outlook.com (20.179.83.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 01:11:06 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2199.020; Mon, 26 Aug 2019
 01:11:05 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Index: AQHVWbfcVzHz3YyhgEiNFpFyEd6YVacMosAw
Date: Mon, 26 Aug 2019 01:11:05 +0000
Message-ID: <MN2PR12MB3344FA7800646413BBE44B00E4A10@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190823133652.31774-1-kent.russell@amd.com>
In-Reply-To: <20190823133652.31774-1-kent.russell@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8655f9f7-866e-4638-48c7-08d729c24555
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2893; 
x-ms-traffictypediagnostic: MN2PR12MB2893:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2893993174F34A519019BAE6E4A10@MN2PR12MB2893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(13464003)(189003)(199004)(81166006)(71200400001)(71190400001)(66446008)(66556008)(64756008)(66476007)(66946007)(52536014)(2906002)(966005)(14454004)(256004)(76116006)(305945005)(66066001)(5660300002)(74316002)(7736002)(478600001)(26005)(316002)(186003)(446003)(486006)(11346002)(86362001)(476003)(2501003)(6436002)(4326008)(55016002)(9686003)(6116002)(76176011)(102836004)(110136005)(53546011)(6506007)(25786009)(7696005)(8936002)(99286004)(229853002)(6246003)(8676002)(3846002)(6306002)(53936002)(33656002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2893;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i0bAaWi8pJU4WKS3eyHGUfyI0V/kIWU34nbpPVtioVM2oRfzR+HtJJ2wtIEOdKqIvvYM/4Wlb5++HTsvwOedDvEqOmfrfUkmAwn7Upl6huOflAnoWl/fUP/GGyFclOfgn6Mm4hZg63ymvHKO2gXB0w26taajFxMBzMIUiNfag6jsqkjgVXyrHN+xCSUo8qgoEcv8t+JnLeMjqS1t5D+x+57C2h9JN0rlAW0+xvYmMQFPJWHrzu7aeOLtt6Dl/u7YK33psg07q9fY9J1QhepT9wPQr+eiWM/s1GlPr9P6VdxGsuQfGAsVaHgyP8c5i0H+16FdWhm8XiLkN3o7atq7ycul697gHWB6JnSzDYW+MEpv1IgIQM5SZ/LtXfMhJCH6ScBKtNUJW0itpHGgpQIrzrm2XxXpTbLUaoBtSgXv+eE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8655f9f7-866e-4638-48c7-08d729c24555
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 01:11:05.8826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzyPH6IprUsx1zdcxO5+/rWRVc94OEIC6XmYdTeWppDAC0iO8hnzoTpIQzsqEefj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0IRiRGRbgzEpjxSH5HL8cZqvuwAAp9beWvHxlGKVM=;
 b=xuRY7tg83UCKr/tcJcpYLQ29Ss8XLkBfaeWpYDseGpAzXkFuI5shBWPm0aPOgRzTi49aTRwsmNiAarj8SAWKrySu0X8jhr1B5WBevjeYHas3izqN8Og9ttppbGnCl6hvEFjBvHGICVGaSza4rctU3jCYeC3SfwmlgyqVUloV0QI=
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFJ1c3NlbGwsIEtlbnQNCj4gU2VudDog
RnJpZGF5LCBBdWd1c3QgMjMsIDIwMTkgOTozNyBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IFJ1c3NlbGwsIEtlbnQgPEtlbnQuUnVzc2VsbEBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9wb3dlcnBsYXk6IEZpeCBWZWdhMjAgcG93ZXIgcmVhZGlu
ZyBhZ2Fpbg0KPiANCj4gRm9yIHRoZSA0MC40NiBTTVUgcmVsZWFzZSwgdGhleSBjaGFuZ2VkIEN1
cnJTb2NrZXRQb3dlciB0bw0KPiBBdmVyYWdlU29ja2V0UG93ZXIsIGJ1dCB0aGlzIHdhcyBjaGFu
Z2VkIGJhY2sgaW4gNDAuNDcgc28ganVzdCBjaGVjayBpZg0KPiBpdCdzIDQwLjQ2IGFuZCBtYWtl
IHRoZSBhcHByb3ByaWF0ZSBjaGFuZ2UNCj4gDQo+IFRlc3RlZCB3aXRoIDQwLjQ1LCA0MC40NiBh
bmQgNDAuNDcgc3VjY2Vzc2Z1bGx5DQo+IA0KPiBDaGFuZ2UtSWQ6IEljYmJlNmZkMzM4MWI4YWQ2
Mjk4YzJkMDg1MmE3MjZmZmFjOThmOTNhDQo+IFNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8
a2VudC5ydXNzZWxsQGFtZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCA3ICsrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICAgICAgIHwgNyArKysrLS0tDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3Iu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5j
DQo+IGluZGV4IDlmNTBhMTJmNWMwMy4uOThhNmY1MzA1OTc0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYw0KPiBAQCAt
MjEwMSwxMCArMjEwMSwxMSBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVj
dA0KPiBwcF9od21nciAqaHdtZ3IsDQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4g
DQo+IC0JaWYgKGh3bWdyLT5zbXVfdmVyc2lvbiA8IDB4MjgyZTAwKQ0KPiAtCQkqcXVlcnkgPSBt
ZXRyaWNzX3RhYmxlLkN1cnJTb2NrZXRQb3dlciA8PCA4Ow0KPiAtCWVsc2UNCj4gKwkvKiBGb3Ig
dGhlIDQwLjQ2IHJlbGVhc2UsIHRoZXkgY2hhbmdlZCB0aGUgdmFsdWUgbmFtZSAqLw0KPiArCWlm
IChod21nci0+c211X3ZlcnNpb24gPT0gMHgyODJlMDApDQo+ICAJCSpxdWVyeSA9IG1ldHJpY3Nf
dGFibGUuQXZlcmFnZVNvY2tldFBvd2VyIDw8IDg7DQo+ICsJZWxzZQ0KPiArCQkqcXVlcnkgPSBt
ZXRyaWNzX3RhYmxlLkN1cnJTb2NrZXRQb3dlciA8PCA4Ow0KPiANCj4gIAlyZXR1cm4gcmV0Ow0K
PiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIw
X3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+
IGluZGV4IDBmYWM4MjQ0OTBkNy4uODk5YmY5NmIyM2UxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jDQo+IEBAIC0yOTMyLDEwICsyOTMyLDExIEBA
IHN0YXRpYyBpbnQgdmVnYTIwX2dldF9ncHVfcG93ZXIoc3RydWN0DQo+IHNtdV9jb250ZXh0ICpz
bXUsIHVpbnQzMl90ICp2YWx1ZSkNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAN
Cj4gLQlpZiAoc211X3ZlcnNpb24gPCAweDI4MmUwMCkNCj4gLQkJKnZhbHVlID0gbWV0cmljcy5D
dXJyU29ja2V0UG93ZXIgPDwgODsNCj4gLQllbHNlDQo+ICsJLyogRm9yIHRoZSA0MC40NiByZWxl
YXNlLCB0aGV5IGNoYW5nZWQgdGhlIHZhbHVlIG5hbWUgKi8NCj4gKwlpZiAoc211X3ZlcnNpb24g
PT0gMHgyODJlMDApDQo+ICAJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVNvY2tldFBvd2VyIDw8
IDg7DQo+ICsJZWxzZQ0KPiArCQkqdmFsdWUgPSBtZXRyaWNzLkN1cnJTb2NrZXRQb3dlciA8PCA4
Ow0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
