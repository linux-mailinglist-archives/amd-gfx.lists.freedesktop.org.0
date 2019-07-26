Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86F75CE6
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 04:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2CB6E85D;
	Fri, 26 Jul 2019 02:20:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720061.outbound.protection.outlook.com [40.107.72.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC406E85D
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 02:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KskciRPGBGZ2LMmbEQxOGMAc4cunf0RDH0zHeDI6ZItknV3daTE3hQsnT9nYR3qVlkGOhSP7Sdiu3J3nWD7wp+QrLtbLXrhqp2L1vnlgzL/OIBtQ+5qoc9+uJqqpulSrVhwNq/O8801YmsDQYV18zB4TCMzNUquNJGnjP8s7aBTygBl4DmULWww8yhfzMZ/3DKHZcPgCznTqSa094e80gknIS5XsEUYZgykiUXvXGgxr4J0r/4XeDh7rGjPxcPKwZlBWZ0o2I6kFGV3EDyBq0s7pI0l0DlgAYoWN32ExFIAesv0m6t5XFa9f8TMWJI0Vv2+v5i8Sc5vNKcOLOIVhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDV/ymogZ9JMCRVWFB/qJUmsN6XhOEYB1LFtOePBJGk=;
 b=aUuV8hS+bD7LEe5bKzovlfh/csv0z9JCrB5FVSX4sB/MCZeSqzvL9j/AoP2bVhgf2J3hWkI54G3AZeSReZtcQ1EG/A0Y8J/VT9h7JxVcrQpDNshvdp/kiyRa13ue96iVZhEipXhYxTUxWH6qGf9Y39RVXFV2veFw6ftEuCmzgZ61n5yElC+p+txbQl5TL3ak7zVARuM5DGG4fjpm0dCgdry9OpyeLvSDz63aUAWUSWf1C71fTIpgDeupj904+emmBZ69Ys8xyj3p4IGuYvCQw4yD4p4pDqHffyWvw+0D2jrSUmvmJeRt/yIL4mbH8sWdgIrpaCXlibSENjOegBGqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 02:20:44 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 02:20:44 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 12/12] drm/amdgpu: put the SMC into the proper state on
 suspend
Thread-Topic: [PATCH 12/12] drm/amdgpu: put the SMC into the proper state on
 suspend
Thread-Index: AQHVQwopPJ0KdX+kWUiPKAODxLRAxKbcKABQ
Date: Fri, 26 Jul 2019 02:20:43 +0000
Message-ID: <MN2PR12MB33447331E5106CE7A8BC7786E4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
 <20190725165758.16928-12-alexander.deucher@amd.com>
In-Reply-To: <20190725165758.16928-12-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61b7a51a-0cd1-4669-0458-08d7116fdcde
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB28947E4D5CB2B704C352B588E4C00@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(13464003)(229853002)(86362001)(8936002)(66066001)(316002)(486006)(71190400001)(81166006)(52536014)(110136005)(81156014)(14454004)(3846002)(6116002)(5660300002)(68736007)(14444005)(476003)(102836004)(7736002)(9686003)(305945005)(2501003)(256004)(2906002)(53936002)(6506007)(6436002)(6306002)(478600001)(446003)(76116006)(25786009)(26005)(4326008)(53546011)(186003)(66556008)(7696005)(66446008)(55016002)(64756008)(66946007)(99286004)(6246003)(74316002)(66476007)(33656002)(76176011)(71200400001)(11346002)(8676002)(15650500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WYQvWqIB3Eh1Y/OQdSxil4d0zHFtpVaJgC+DAI16vL552ZsX5bIdjcK4SaimCHFKPGTAGRoGaQGkWdLZ740MqOa4qyg/JbPYhA1i5wRoT46E5asm33U/h0riKXreWYwtFixL7Z/U4P3D80XCWhUreDd9F2pImjbcf23lHvErNuVcmpfXijKdh3PHQqGDu+abA2TS4/XvFRNmYLd1SHwNpt8yCHqlz14qaLDq0SQpHm/ccl7Nj0P0l7QQm7HzN/cEwokU0BomEUSAHigiXP8Wy/2/FhkpHTUzaIdR/3voksXxYTgDqYQPS6UpufPoUafsWYcfYBXJ3vhRyoasRZENDEvAMNxY+0xRw9zx/A0mNXeuLvpv+9DxaANbCdxUOXRctKNHBfTpBQbvCKjKD5w6Bs4eUEyW5a6n3w0ZS2LGV0w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b7a51a-0cd1-4669-0458-08d7116fdcde
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 02:20:43.8035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDV/ymogZ9JMCRVWFB/qJUmsN6XhOEYB1LFtOePBJGk=;
 b=ewovGXcQWAS/ut2HC96W08SkRK7fUV75zGmSIctkgM+prPEBHBg4dGFtaXqjrpTOT6GRzKtzsY2r9oRTGSKH7C31jer9/tDj5nhDBjD2Lzj5M/J1Hopeu0aN19mZX1q5n0Nwa1YI5W43fbHWvlcj0sdjgQSuBuU/i6mm096P26o=
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

UGF0Y2gxIC0gcGF0Y2gxMTogUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+DQoNCkZvciBwYXRjaDEyLCBjb21tZW50IGlubGluZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+IERldWNoZXINCj4gU2VudDogRnJpZGF5LCBK
dWx5IDI2LCAyMDE5IDEyOjU4IEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMTIvMTJdIGRybS9hbWRncHU6IHB1dCB0aGUgU01DIGludG8gdGhl
IHByb3BlciBzdGF0ZSBvbg0KPiBzdXNwZW5kDQo+IA0KPiBTdXNwZW5kIGlzIHVzZWQgZm9yIFMz
L1M0LCBHUFUgcmVzZXQsIGFuZCBQQ0kgc2h1dGRvd24uICBJbiBlYWNoIGNhc2UsIHdlDQo+IG5l
ZWQgdG8gcHV0IHRoZSBTTUMgaW50byB0aGUgcHJvcGVyIHN0YXRlIGluIG9yZGVyIHRvIHJlc3Vt
ZSBvciByZWxvYWQNCj4gY29ycmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDMzDQo+ICsrKysrKysrKysrKysrKysrKysr
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IDQ0MjVmZjA2ZWNj
NC4uYmI0MjYwNjQ4YTk3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQo+IEBAIC0yMTc0LDYgKzIxNzQsMzkgQEAgc3RhdGljIGludA0KPiBhbWRn
cHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiAgCQkJRFJNX0VSUk9SKCJzdXNwZW5kIG9mIElQIGJsb2NrIDwlcz4gZmFpbGVkICVkXG4iLA0K
PiAgCQkJCSAgYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPmZ1bmNzLT5uYW1lLA0KPiByKTsN
Cj4gIAkJfQ0KPiArCQkvKiBoYW5kbGUgcHV0dGluZyB0aGUgU01DIGluIHRoZSBhcHByb3ByaWF0
ZSBzdGF0ZSAqLw0KPiArCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0N
Cj4gQU1EX0lQX0JMT0NLX1RZUEVfU01DKSB7DQo+ICsJCQllbnVtIHBwX21wMV9zdGF0ZSBtcDFf
c3RhdGUgPQ0KPiBQUF9NUDFfU1RBVEVfTk9ORTsNCj4gKw0KPiArCQkJaWYgKGFkZXYtPmluX2dw
dV9yZXNldCkgew0KPiArCQkJCXN3aXRjaCAoYW1kZ3B1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYp
KSB7DQo+ICsJCQkJY2FzZSBBTURfUkVTRVRfTUVUSE9EX01PREUxOg0KPiArCQkJCWNhc2UgQU1E
X1JFU0VUX01FVEhPRF9CQUNPOg0KPiArCQkJCQltcDFfc3RhdGUgPQ0KPiBQUF9NUDFfU1RBVEVf
U0hVVERPV047DQpbUXVhbiwgRXZhbl0gRm9yIEFNRF9SRVNFVF9NRVRIT0RfQkFDTywgaXQgc2hv
dWxkIGJlIFBQX01QMV9TVEFURV9VTkxPQUQuDQo+ICsJCQkJCWJyZWFrOw0KPiArCQkJCWNhc2Ug
QU1EX1JFU0VUX01FVEhPRF9NT0RFMjoNCj4gKwkJCQkJbXAxX3N0YXRlID0gUFBfTVAxX1NUQVRF
X1JFU0VUOw0KPiArCQkJCQlicmVhazsNCj4gKwkJCQlkZWZhdWx0Og0KPiArCQkJCQltcDFfc3Rh
dGUgPSBQUF9NUDFfU1RBVEVfTk9ORTsNCj4gKwkJCQkJYnJlYWs7DQo+ICsJCQkJfQ0KPiArCQkJ
fSBlbHNlIGlmIChhZGV2LT5pbl9ncHVfc2h1dGRvd24pIHsNCj4gKwkJCQltcDFfc3RhdGUgPSBQ
UF9NUDFfU1RBVEVfVU5MT0FEOw0KPiArCQkJfQ0KW1F1YW4sIEV2YW5dIEhhbmRsaW5nIGZvciBz
dXNwZW5kIG9ubHkgY2FzZSBzZWVtcyBtaXNzaW5nLg0KPiArCQkJaWYgKGlzX3N1cHBvcnRfc3df
c211KGFkZXYpKSB7DQo+ICsJCQkJLyogdG9kbyAqLw0KPiArCQkJfSBlbHNlIGlmIChhZGV2LT5w
b3dlcnBsYXkucHBfZnVuY3MgJiYNCj4gKwkJCQkgICBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3Mt
DQo+ID5zZXRfbXAxX3N0YXRlKSB7DQo+ICsJCQkJciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5j
cy0NCj4gPnNldF9tcDFfc3RhdGUoDQo+ICsJCQkJCWFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUs
DQo+ICsJCQkJCW1wMV9zdGF0ZSk7DQo+ICsJCQkJaWYgKHIpIHsNCj4gKwkJCQkJRFJNX0VSUk9S
KCJTTUMgZmFpbGVkIHRvIHNldCBtcDENCj4gc3RhdGUgJWQsICVkXG4iLA0KPiArCQkJCQkJICBt
cDFfc3RhdGUsIHIpOw0KPiArCQkJCX0NCj4gKwkJCX0NCj4gKwkJfQ0KW1F1YW4sIEV2YW5dIEJh
Y28gcmVzZXQgd2lsbCBiZSB0cmlnZ2VyZWQgaW4gc29jMTVfYXNpY19yZXNldC4gQW5kIHRoZXJl
IHdpbGwgYmUgU01VIG1lc3NhZ2UgaXNzdWVkIHRoZW4gYW5kIG5lZWRzIHRoZSBTTVUgcHJlcGFy
ZWQuDQpJZiB3ZSBzdGFsbCB0aGUgU01VIGVuZ2luZSBoZXJlKGJlZm9yZSBzb2MxNV9hc2ljX3Jl
c2V0KSwgd2UgbWF5IGZhaWwgdG8gaXNzdWUgQkFDTyBtZXNzYWdlcy4NCj4gIAl9DQo+IA0KPiAg
CXJldHVybiAwOw0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
