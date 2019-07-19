Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2906E3AE
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 11:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4E8994D;
	Fri, 19 Jul 2019 09:47:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913DB6E492
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 09:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoCQClJFy3OHB/QgklFKIsKRGlgB/hg+7glaHu77Hya8zQyw73dA4PJxQC7DgYOSpGggaraY6a07KNUC5YPkoviJMWZZRW6O/uAJPr2LEcPd68gGbav7qBuuMa6ghunfr+NiJfWqcIoLWzcHeVWBap8ZLbPXFfYEnSiEwUn/3Zv6cEvHG5f0F+R67sb9I7bEK9SvZ/C/qnbFbE2UTTxKJDl2RsXRTmRFMJDUw+JLIDyxGv0mpNG9SxQvQo55Y5q6vwggFMlaUXwvyaVYC7DOK/RdhB9qjBCOtgcebFm/+RG0n9Ep3qxkakRYb8ZBWmvtX26W1XFhJiPdkNatPZnndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsJIgoEC/VQQ8aRTBf97VoIgknC9tptKclBYVp9Qp48=;
 b=SLYLBlUFlnAMkZUDG6Lg9R9mtgcP7nDXGJFp7sCb3TBSVPulbpQWS9NMkzHIsJEN906OcaTHNbD1iKsy2d7xlxv+tFJwqckfPUcfrovBhRq1CJRrkjVtLs3HftMrASU3qhOfjY32EzXcy9hI7HYVE2QzAIgh6ReM5hWkRNaA1MIgdh9rzkfvXA5Hl07nyrQGrvg1V9cf0R7M8xBDs9EyHDnidfFuGC377mXwK5rulni8imEc3fDf9i7YCRu0zU1PlYJkn1rnDHthqK2aCXC8Y1IwoHy2CoMuZc26nl8jciaBTO/NMvEyn0YSAE6Moc9Knnva2Rsj69qm3nd2LlsGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3470.namprd12.prod.outlook.com (20.178.244.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 09:47:47 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 09:47:47 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Topic: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Index: AQHVPg9R1DRZmp3QAkyaJ97hyNxnA6bRqlSAgAAGyXA=
Date: Fri, 19 Jul 2019 09:47:46 +0000
Message-ID: <MN2PR12MB3344010A9F4F9108DD54ED7EE4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190719085145.27515-1-evan.quan@amd.com>
 <MN2PR12MB3309184F93F4EF2E0353AE82ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309184F93F4EF2E0353AE82ECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc6f01cd-f6d7-4327-907d-08d70c2e27bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3470; 
x-ms-traffictypediagnostic: MN2PR12MB3470:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3470AFE6B57A18A3A7E2DAC0E4CB0@MN2PR12MB3470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(13464003)(52314003)(199004)(189003)(68736007)(53936002)(33656002)(186003)(110136005)(229853002)(102836004)(99286004)(9686003)(316002)(26005)(11346002)(446003)(6636002)(476003)(55016002)(6306002)(76176011)(53546011)(305945005)(7696005)(6506007)(486006)(66066001)(7736002)(5660300002)(8936002)(52536014)(71200400001)(71190400001)(8676002)(74316002)(6246003)(6436002)(66946007)(478600001)(2906002)(66476007)(14444005)(256004)(966005)(6116002)(3846002)(81156014)(81166006)(25786009)(2501003)(14454004)(76116006)(86362001)(66446008)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3470;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F3tZrlvM00r7wqP0xjaHYjYio4BvwQvadsOSQfcLvpWuSL8xSXRz5fBYw2dZ1MMvsRkGjKKzXBRmCGzjbpPXfHZlCmUEXDuLv7KLdBia76fN+UQVpJsxxa5rF/h0Nh1FX/Eet1KRh4EiRb9dfzdHUReBgUEjgPY2aORWWXiXK1dOlBPrzn4IkZ6untg+QPeJPydxbrgPzdWJZjVIg1SK14xIbpU9rIdD86bBgcEHIicPdSEgX+2Hkifjavc/7j0t4qrrJxA2anrQGrn8iJDqOTC6Ov6qVwdnCd7qB5cPvNO4sW8k5rYqwnmiQhlqYvIpoPwPI7inz/oCcmzsIHoNFiW93Tvl6TSoGMEAE7NfDRNMLIzH3h7Bza0C5XikAvoSG8onYgK/k2JnzuHXaYYvu4vsAIL3bA5yflGzICrH7Ww=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6f01cd-f6d7-4327-907d-08d70c2e27bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:47:47.0358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsJIgoEC/VQQ8aRTBf97VoIgknC9tptKclBYVp9Qp48=;
 b=0CK12585ypw6k8MVw50F9aw4WD1Ho5Bwpc61+DnersKXrrM9fz2pOti60khMF90DCZmIOY4B9e8NrB/uZk+cPx1FUToyKNlwdOu5xWMrZytu3FGOaqoxf+wZdTpYe9tO5H/nr+pY/+G5qzvgxQ7bMaDp1HOmFKJPzmvQ2BbBzHs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29uc2lkZXJpbmcgdGhpcyBpcyBhY3R1YWxseSBkaWZmZXJlbnQgZnJvbSB0cmFkaXRpb25hbCBV
VkQsIG1heWJlIGl0J3MgYmV0dGVyIHRvIGFkZCBhIG5ldyBmbGFnIGxpa2UgQU1ER1BVX1BQX1NF
TlNPUl9WQ05fUE9XRVIuDQpARGV1Y2hlciwgQWxleGFuZGVyIGFueSBjb21tZW50Pw0KDQpSZWdh
cmRzLA0KRXZhbg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDE5LCAyMDE5IDU6
MjEgUE0NCj4gVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0K
PiBTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogY29ycmVjdCB0aGUgYml0
IG1hc2sgZm9yIGNoZWNraW5nDQo+IFZDTiBwb3dlciBzdGF0dXMNCj4gDQo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPiBFdmFuIFF1YW4NCj4gPiBTZW50
OiBGcmlkYXksIEp1bHkgMTksIDIwMTkgNDo1MiBQTQ0KPiA+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NCj4g
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBjb3JyZWN0IHRoZSBiaXQgbWFz
ayBmb3IgY2hlY2tpbmcNCj4gPiBWQ04gcG93ZXIgc3RhdHVzDQo+ID4NCj4gPiBGb3IgTmF2aTEw
IG9yIGxhdGVyIEFTSUNzLCBhIGRpZmZlcmVudCBiaXQgbWFzayBpcyB1c2VkIGZvciBjaGVja2lu
Zw0KPiA+IFZDTiBwb3dlciBzdGF0dXMuDQo+ID4NCj4gPiBDaGFuZ2UtSWQ6IElhYTQ5ZTVhMzM5
YzM4ZjQ2ZTNlNzEyNGQyMWFlYjY1ZjY2MzMzMjVlDQo+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgOCArKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gPiBpbmRleCA2ZTJmN2RmODI2
ZjAuLjg4NzU3N2M0NzU2OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMNCj4gPiBAQCAtMjcxLDYgKzI3MSw4IEBAIGludCBzbXVfZ2V0X3Bv
d2VyX251bV9zdGF0ZXMoc3RydWN0DQo+IHNtdV9jb250ZXh0DQo+ID4gKnNtdSwgIGludCBzbXVf
Y29tbW9uX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtDQo+ID4gYW1k
X3BwX3NlbnNvcnMgc2Vuc29yLA0KPiA+ICAJCQkgICB2b2lkICpkYXRhLCB1aW50MzJfdCAqc2l6
ZSkNCj4gPiAgew0KPiA+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7
DQo+ID4gKwl1aW50MzJfdCB1dmRfYml0X21hc2sgPSAweEZGRkZGRkZGOw0KPiA+ICAJaW50IHJl
dCA9IDA7DQo+ID4NCj4gPiAgCXN3aXRjaCAoc2Vuc29yKSB7DQo+ID4gQEAgLTI4Nyw3ICsyODks
MTEgQEAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0DQo+IHNtdV9jb250ZXh0DQo+
ID4gKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsDQo+ID4gIAkJKnNpemUgPSA4Ow0K
PiA+ICAJCWJyZWFrOw0KPiA+ICAJY2FzZSBBTURHUFVfUFBfU0VOU09SX1VWRF9QT1dFUjoNCj4g
PiAtCQkqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LA0KPiA+
IFNNVV9GRUFUVVJFX0RQTV9VVkRfQklUKSA/IDEgOiAwOw0KPiA+ICsJCWlmIChhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9WRUdBMjApDQo+ID4gKwkJCXV2ZF9iaXRfbWFzayA9IFNNVV9GRUFUVVJF
X0RQTV9VVkRfQklUOw0KPiA+ICsJCWVsc2UNCj4gPiArCQkJdXZkX2JpdF9tYXNrID0gU01VX0ZF
QVRVUkVfVkNOX1BHX0JJVDsNCj4gDQo+IEFmdGVyIHZlZ2EyMCwgd2UgYWN0dWFsbHkgd2lsbCB1
c2UgVkNOIGluc3RlYWQgb2YgVVZELiBCZWxvdyBpbmRpY2F0ZXMgdGhlDQo+IGRlc2lnbiBmb3Ig
dGhpcy4NCj4gDQo+IHV2ZF9iaXRfbWFzayA9IChhZGV2LT5hc2ljX3R5cGUgPiBDSElQX1ZFR0Ey
MCkgPw0KPiBTTVVfRkVBVFVSRV9WQ05fUEdfQklUIDogU01VX0ZFQVRVUkVfRFBNX1VWRF9CSVQN
Cj4gDQo+IEFueXdheSwgcGF0Y2ggbG9va3MgZ29vZCBmb3IgbWUuDQo+IFJldmlld2VkLWJ5OiBI
dWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPiANCj4gDQo+IFRoYW5rcywNCj4gUmF5DQo+
IA0KPiA+ICsJKih1aW50MzJfdCAqKWRhdGEgPSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwN
Cj4gPiB1dmRfYml0X21hc2spID8gMSA6DQo+ID4gKzA7DQo+ID4gIAkJKnNpemUgPSA0Ow0KPiA+
ICAJCWJyZWFrOw0KPiA+ICAJY2FzZSBBTURHUFVfUFBfU0VOU09SX1ZDRV9QT1dFUjoNCj4gPiAt
LQ0KPiA+IDIuMjIuMA0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiA+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
