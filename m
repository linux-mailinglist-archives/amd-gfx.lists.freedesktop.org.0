Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5529B742D1
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 03:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD956E51A;
	Thu, 25 Jul 2019 01:17:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A656E51A
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 01:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGNFPoHkQvciQNSGph+i70VYxtEWCe+JiBozeuxLcQ9Qr2l5cAodz4QpvMY3QrTBeU/KhWEoVIlPatnc9sY3px3FYAL7OM9OQeP9ejz81euh94zVXq+hnA5TbW1xSvh3XZOvRSU6puBZSyoE9ufNOmpUGtJWTx/9CYs6xQ2Ka68SAd9inRNq5ZBr2RXmPF2H/fCR+zkh2dkxnGh050paKyo+lDa7bIENv/KIPoyBScdVziNd1cPGoz6GTNGWdE464WVWnp7aeCMSOyVoBkXyFg2Kq356n4nLq665i6Sznlf5UTrs7SUPHzzSofGhyQdc5JWSAolDARX2kdjLAcrkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USOqdTMuTH6L2nLU1uCGBIxuwPBVexOSjLpbPQmIgaU=;
 b=IkitSDdyE4P/OwZiny73VxNp1QbQBSaPomFKfecCTCVG/DRLxxdc9chM0IpTJeUdu1i2psN0DmLhBVKDKwoQ16C0JBzchYyI6Wr7hsVoFDa8pdeDv/ktbUQ8xbpKWf5ktT9S3JerBzAMjWuwWTZdYJKtZ1wMnCpKMdD6Syry65k/BWVk1BZIKygF87S+f9j3e3sMQpsLGfueALWQpAvVhlyAYFBP4ej1yJkAk4bb7mLARTXDHW5Rd1Is7wiO5I3VOGtcEoZBIL+lEDpC3kPT/KG0fZrwqQtuSVkds/ksgUYvX87frmiOgxikdhndOab2ZbQFiIOl/Yg1din/U4YjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3405.namprd12.prod.outlook.com (20.178.242.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 01:17:21 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 01:17:21 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] Revert "drm/amdgpu/powerplay/vega20: call
 PrepareMp1ForUnload in power_off_asic"
Thread-Topic: [PATCH 3/3] Revert "drm/amdgpu/powerplay/vega20: call
 PrepareMp1ForUnload in power_off_asic"
Thread-Index: AQHVQi406adJGZ56JE+8/P8Q5vNrTKbaiPQw
Date: Thu, 25 Jul 2019 01:17:21 +0000
Message-ID: <MN2PR12MB334470E90F71981E53F0AA28E4C10@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190724144333.24047-1-alexander.deucher@amd.com>
 <20190724144333.24047-3-alexander.deucher@amd.com>
In-Reply-To: <20190724144333.24047-3-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dec54821-7313-40c0-773c-08d7109dd7e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3405; 
x-ms-traffictypediagnostic: MN2PR12MB3405:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3405E8E785265A79CA66BDB3E4C10@MN2PR12MB3405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(189003)(199004)(13464003)(7736002)(9686003)(8676002)(81156014)(14444005)(8936002)(229853002)(71200400001)(305945005)(5660300002)(4326008)(53936002)(33656002)(71190400001)(81166006)(14454004)(74316002)(256004)(99286004)(486006)(53546011)(2501003)(68736007)(6506007)(6246003)(55016002)(102836004)(6436002)(66946007)(19627235002)(446003)(64756008)(76176011)(7696005)(66066001)(966005)(25786009)(478600001)(476003)(66476007)(76116006)(186003)(2906002)(6116002)(3846002)(316002)(6306002)(11346002)(86362001)(110136005)(66446008)(26005)(52536014)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3405;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4lUBGmg/1wJdVp3+T8TgDf8vbizYGJPAUy5qLGNxXAa7uPW0kbeXTNEW5m8DMf9FuhEfq5arDwfLkivE1H++skB1yWWS2bM4Ov2blPRJyO9LHo1I8pGeAtAmwJuYQJlxxanBEpn/GlyMdt+u2TnrIo/HEg6W33SlomdCgUckSFTjaEE0mGYBWBBslUVAeRtvqLqbD2DQmthVSK/6hJflRpAaSaZ5T8cpDtt4K/vY4dJuC15EQg1tPJs1VTf8AePD5kRaiT3/BdkyPs1u0ais6EXoHWuWklEcfdO96Aqww/WwQNmV+Rn6diKNOCGh/rkTU/PjCOfLYDi1eU5ynJvyAAi+dPmoSBMbtghD8aV96l5+aMrC/GDUS1ZEJLAvBvp4fadsHiX08D7xbPO70vON0xN23ItR+xfAsKqIb5A1I3Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec54821-7313-40c0-773c-08d7109dd7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 01:17:21.3108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USOqdTMuTH6L2nLU1uCGBIxuwPBVexOSjLpbPQmIgaU=;
 b=Viy0Oe45Lt15njm8zS28Ld0YkSMLBfJc1vETMyFzwzGQfmUfP6ZBy3O5ZbUNNkJ4rd5Ny4zXAYXhOavCX2feoQpzwaEP9oQYbUqmhZH+5PjQW3o+5r4xrLf1ojqiBCFgFtq0d8Ct4kpbolQeQ34bvxUcChuAdAIC+x6Snvjl6jo=
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

U2VyaWVzIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+IERldWNoZXIN
Cj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDI0LCAyMDE5IDEwOjQ0IFBNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSBSZXZlcnQgImRybS9h
bWRncHUvcG93ZXJwbGF5L3ZlZ2EyMDogY2FsbA0KPiBQcmVwYXJlTXAxRm9yVW5sb2FkIGluIHBv
d2VyX29mZl9hc2ljIg0KPiANCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBjM2IwOTlmMThjNDViZDhk
NzhhNTFhNzA2YzY0OGQ1ODgzMjFjMTljLg0KPiANCj4gUmV2ZXJ0IGZvciBub3cgcGVuZGluZyBm
dXJ0aGVyIGRpc2N1c3Npb25zIHdpdGggcG93ZXIgdGVhbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyB8IDUgLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMNCj4gaW5kZXgg
ZTE2ZDY2NTQ2OTJmLi5mMjdjNmZiYjE5MmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jDQo+IEBAIC0zNzY0LDExICsz
NzY0LDYgQEAgc3RhdGljIGludCB2ZWdhMjBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0DQo+IHBwX2h3
bWdyICpod21ncikNCj4gIAkJCSk7DQo+ICAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICY9IH4o
V2F0ZXJNYXJrc0xvYWRlZCk7DQo+IA0KPiAtCVBQX0FTU0VSVF9XSVRIX0NPREUoKHJlc3VsdCA9
IHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLA0KPiAtCQkJUFBTTUNfTVNHX1ByZXBhcmVNcDFG
b3JVbmxvYWQpKSA9PSAwLA0KPiAtCQkJIltQcmVwYXJlTXAxRm9yVW5sb2FkXSBGYWlsZWQhIiwN
Cj4gLQkJCXJldHVybiByZXN1bHQpOw0KPiAtDQo+ICAJcmV0dXJuIHJlc3VsdDsNCj4gIH0NCj4g
DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
