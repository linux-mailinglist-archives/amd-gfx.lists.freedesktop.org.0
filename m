Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F00219F9
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 16:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB77889624;
	Fri, 17 May 2019 14:47:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1589624
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 14:47:36 +0000 (UTC)
Received: from BN6PR12MB1364.namprd12.prod.outlook.com (10.168.228.22) by
 BN6PR12MB1315.namprd12.prod.outlook.com (10.168.228.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 14:47:34 +0000
Received: from BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a]) by BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a%11]) with mapi id 15.20.1900.010; Fri, 17 May
 2019 14:47:34 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/soc15: skip reset on init
Thread-Topic: [PATCH] drm/amdgpu/soc15: skip reset on init
Thread-Index: AQHVDLyYTJsvNeMdgU+XI4QzC33zqaZvZXAA
Date: Fri, 17 May 2019 14:47:34 +0000
Message-ID: <a986c8b7-4255-e70b-4e39-102cc57cda92@amd.com>
References: <20190517142647.26034-1-alexander.deucher@amd.com>
In-Reply-To: <20190517142647.26034-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To BN6PR12MB1364.namprd12.prod.outlook.com
 (2603:10b6:404:1e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a98235-5cf6-4b8f-74e0-08d6dad698da
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1315; 
x-ms-traffictypediagnostic: BN6PR12MB1315:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB13156BBA13EE7CBDE13E1E66E10B0@BN6PR12MB1315.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(81156014)(446003)(81166006)(68736007)(5660300002)(71190400001)(102836004)(71200400001)(229853002)(2616005)(26005)(11346002)(6916009)(8676002)(5640700003)(76176011)(486006)(476003)(99286004)(6436002)(53546011)(36756003)(386003)(6506007)(316002)(256004)(8936002)(52116002)(186003)(25786009)(6486002)(305945005)(2501003)(478600001)(966005)(7736002)(31686004)(66066001)(73956011)(14454004)(72206003)(31696002)(53936002)(6116002)(6246003)(66946007)(66446008)(64756008)(66556008)(66476007)(6512007)(86362001)(3846002)(2906002)(6306002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1315;
 H:BN6PR12MB1364.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lZc5m92gQPPJs6BjpYC5lfzKMevj5vLqY8+jOstm2nQKbkjtVW72NuG921x4dxw+HZ5p5ORzksPsUVOWVD/ZBlvH73G11JpXjvA7GlcFau3jjj4sAuWpKxX8BybspPj29Hzn8G+qWkvm6ffcBHSJrmYsAAVp+HOux5xl2yxUZRC5kFcHvB3o00dIVhB15vY6xIeGwp1uyZNQt8W2zeVhg5bT6iJA+b4runEy8uc7O+1uG9hpuNmdRremc0PqbVjgfdtYGiNyXEd0/nex95eaFFyfhsLLxQgcGLpA5k5wFigCrHtJh5guOd2NXI2WN0FNq9rSxOTALGhx4S2h76pWCaQcvtF3nMOUlIExrkumg8bR/rE+jAh3nk9LFlnEz91gLUsvpv+AWkW6bq6ZgEwwiMyMv27prlFIPsfC8VA88yk=
Content-ID: <B78FE5AE2910CF499D64F6DED44FFA60@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a98235-5cf6-4b8f-74e0-08d6dad698da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 14:47:34.5767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1315
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYJi0OoMETmw0mN+zVdML7a1jscJei5DTzVjxU8g3Io=;
 b=KkbNnVeRCGIL9ymgnMEkWs0zGxPEJkjIhI/hjhjXoHakILWiXDhAEJh06iiqfNYuv4Jvn4nTJdyNZkDrL9IeYDuuUqtNwa07IXn1FBngb9YkOA3eG7J6U7aoh9Br8JSPMEpr+fcqcTUy/7AQhWIECkkqzrEVNI7iSY3AhBBi0bU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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

DQoNCk9uIDIwMTktMDUtMTcgMTA6MjYgYS5tLiwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IE5vdCBuZWNlc3Nhcnkgb24gc29jMTUgYW5kIGJy
ZWFrcyBkcml2ZXIgcmVsb2FkIG9uIHNlcnZlciBjYXJkcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZw0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+IGluZGV4IDMyZGM1YTEyODI0OS4uNzhiZDRm
YzA3YmFiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCj4gQEAgLTc2MSw2
ICs3NjEsMTEgQEAgc3RhdGljIGJvb2wgc29jMTVfbmVlZF9yZXNldF9vbl9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gICAgICAgICAgdTMyIHNvbF9yZWc7DQo+DQo+
ICsgICAgICAgLyogSnVzdCByZXR1cm4gZmFsc2UgZm9yIHNvYzE1IEdQVXMuICBSZXNldCBkb2Vz
IG5vdCBzZWVtIHRvDQo+ICsgICAgICAgICogYmUgbmVjZXNzYXJ5Lg0KPiArICAgICAgICAqLw0K
PiArICAgICAgIHJldHVybiBmYWxzZTsNCj4gKw0KPiAgICAgICAgICBpZiAoYWRldi0+ZmxhZ3Mg
JiBBTURfSVNfQVBVKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNClNob3VsZCBy
ZW1vdmUgdGhlIHJlc3Qgb2YgY29kZSBpbiB0aGlzIGZ1bmN0aW9uIGFuZCBzb2xfcmVnIGFzIHdl
bGw/IA0KU2ltcGx5IHJldHVybiBmYWxzZT8NCj4NCj4gLS0NCj4gMi4yMC4xDQo+DQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFp
bGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
