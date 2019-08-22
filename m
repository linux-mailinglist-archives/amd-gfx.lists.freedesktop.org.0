Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A398AD8
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 07:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5306E370;
	Thu, 22 Aug 2019 05:34:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7E66E370
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 05:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsbP0/Pq8hEuFNTNr5bk+JaiVsDJ3dUvtduRZZtGlBBAng03rqNxYyQb1QAPOhTN1ux97Vwy6YQRBJ4c8bt3U2Id1eYYuqsVsCFsqlgFKEJP1zY5k11HW7UXIqd9ezfKcw0OUSuOahoS3i/Svvhw64aWfyWog3neFlldQX/C/hGs/wNk3e5U7gzCfQN9FQZfuWH+QT5u9TDt2K2Ljm/yGwErUKQ/PfkxEsUbbE1QyWDF8fNX4A5VJ4sBepx0JMk3WaqDmwgCUhC7aC0VUDRsC7VAE2FXUJ2vZOulQfaZUuyQYv03jbgencpKzwX/KnAida6RX42POdInDSBjVkJuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUFNL5E8dcbzsUiKxeramOUZOUowj9fRLXUqflOCkNU=;
 b=N3FTn+UkfhIqe4fImXncH0LAaofj6kg5FskJxA8eaqETw4EDVIthlajtZBoe1zAE7YNOHl6vlqiUsrjUddOXfC35RkcrIXa7UAd2NePeczdou7WEKMfpaXUtsmPvWNIPzTLgmz67AdCf8GAuF7eK1EBtBe/SQt2Br+nTVDbyaeQ/oXecbwTaZc5KBmsiXQohJM6z2qPiWp/kW4aof5x0TjgnECPJt8AJoHgtg59CFT+ARZTutfp4U9koy7eJYtJI59fKvjY5GxB6jycyF9pPUGlNzRhvJFPGOO0JOUhw8Wv0kOWXQ4VV8d9XESxOE32SePfg+R+0cj4n9kBwLIDVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4254.namprd12.prod.outlook.com (10.255.224.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 05:34:36 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 05:34:36 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: silence a warning in
 smu_v11_0_setup_pptable
Thread-Topic: [PATCH] drm/amdgpu/powerplay: silence a warning in
 smu_v11_0_setup_pptable
Thread-Index: AQHVWJlHDcUElldpnECTCnkbc1GCM6cGpT/A
Date: Thu, 22 Aug 2019 05:34:36 +0000
Message-ID: <MN2PR12MB33443648BA233BD01EA792D1E4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190822032527.1376-1-alexander.deucher@amd.com>
In-Reply-To: <20190822032527.1376-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6386a191-a2b0-4b78-dc84-08d726c26b7b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4254; 
x-ms-traffictypediagnostic: MN2PR12MB4254:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42544334E5747D327644F0B7E4A50@MN2PR12MB4254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(13464003)(199004)(189003)(6116002)(76176011)(14444005)(3846002)(66446008)(66476007)(76116006)(64756008)(2906002)(229853002)(25786009)(6246003)(4326008)(9686003)(53546011)(6436002)(66946007)(66556008)(6506007)(26005)(966005)(86362001)(102836004)(186003)(71190400001)(71200400001)(74316002)(55016002)(316002)(110136005)(305945005)(256004)(8936002)(478600001)(476003)(486006)(7736002)(2501003)(99286004)(11346002)(446003)(53936002)(33656002)(14454004)(5660300002)(8676002)(52536014)(66066001)(81156014)(6306002)(7696005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4254;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jQSJElGU1RtAwD1u89cq2zzZAwy49wt3z2C5MP95gP1X4BsygqpxglDn9SOcug+d0I/xl6LPUMAmdi9SDkwJ6JX4S2s226j8WhK1KvVLD+WrLiYDcAEB1E4AAqb+NKZ1KdtSI4DMiFr69obtR0TgSoRdDV6QMslRqfcZr+CQb5rlroZWa8Ls5dPlZe4s9/IKmSvnWyLKoVXuENUscULcGScg/uwKOOIB1FKTVXDWVZtjFrSL+ontmjpKTBxjVYPvfyjIcXy+wPCTITtWO+UYwu6kWoi8YlIDNZxTTDb5XtjfIbLbahHXeVZxzNcRTo6fNgPhFvUjQfgXA4xJD+xgcSUUDR8kL04hatAB/0PfGHMPfyGG0ERtVyZTNtqEp6lNxAYTaftF1P2WziYFhJGaadM+L/+GxiFImNMUrrjsWSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6386a191-a2b0-4b78-dc84-08d726c26b7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 05:34:36.3215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nT9j8R/pVQO5Q+Cte614xQUZ+PwlRj3Xt5r1DVRznsCZbYRwm+wdl1cbjLtCjo/e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUFNL5E8dcbzsUiKxeramOUZOUowj9fRLXUqflOCkNU=;
 b=3YrOckQ53IID2EQpmYLQCmBmm64UpmYD7NXiy//MiXbdnVDZ1UMKg04/TT1muGZ7ynkn9JKaASrRT0d67/9mrraUxwBk4FXkJ6mNl/8CMxBZRVydlpRhgJbdx6MCKXZ2bcIiuJq0QIrh+wUIdgi28IdSAxssg8flaqb5TmqSbbQ=
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

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDIyLCAyMDE5IDExOjI1IEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvcG93ZXJwbGF5OiBzaWxl
bmNlIGEgd2FybmluZyBpbg0KPiBzbXVfdjExXzBfc2V0dXBfcHB0YWJsZQ0KPiANCj4gSSB0aGlu
ayBnY2MgaXMgY29uZnVzZWQgYXMgSSBkb24ndCBzZWUgaG93IHNpemUgY291bGQgYmUgdXNlZCB1
bml0aWFsaXplZCwgYnV0IGdvDQo+IGFoZWFkIGFuZCBzaWxlbmNlIHRoZSB3YXJuaW5nLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KPiBpbmRl
eCA1ZmYwYWQ0MzljZGMuLjk3NTBjNDE5NDgwOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTM1OSw3ICszNTksNyBAQCBzdGF0aWMgaW50
IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlKHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc211KQ0KPiAg
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2Ow0KPiAgCWNvbnN0IHN0cnVj
dCBzbWNfZmlybXdhcmVfaGVhZGVyX3YxXzAgKmhkcjsNCj4gIAlpbnQgcmV0LCBpbmRleDsNCj4g
LQl1aW50MzJfdCBzaXplOw0KPiArCXVpbnQzMl90IHNpemUgPSAwOw0KPiAgCXVpbnQxNl90IGF0
b21fdGFibGVfc2l6ZTsNCj4gIAl1aW50OF90IGZyZXYsIGNyZXY7DQo+ICAJdm9pZCAqdGFibGU7
DQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
