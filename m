Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A62D0214
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 22:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD666E201;
	Tue,  8 Oct 2019 20:25:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04olkn0822.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::822])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECDA6E201
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 20:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkh12i/C9fYBrabRgmnSXHi2Gkl7P0DchtHF36DUvmFlCON/pRcoYvZZvSzAcnibwZVcOXD2M9sT9/Fc3PqAqLWyRPMBo1U+gcmFOSrBdr4kMfRbeWyFO1SPTou0a+qR6a0rS4KC3MYVfrotf+7s4Ik0tpw4pgxL4VrJDj4GcSVQWKgeCxvte/A+H4cj8HTEoaba9s4/8onyL+T+7pBs0T79Tcj67rK1+EAOJ+jss+NfZikanxP7wrrl1soWIzXMqoyaZSyaLPylh4L13iQN7rcsGU+38gNq8xt3711ms5K0V8J0YG8xSK1fgqRcllO7vOeQDjk5PRsK79g7luxEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zGLLA0NR6CLmLT0ef86Otztd5ID72QDVAsVtA7w1Is=;
 b=Uuh97vvdTWasTBFm5+pjwF+OKdlmn8PHQHlKss2gzM/QclpKfTKmx7coE3c1CiTVEB2B2lSPPkJW07EI+lBJBoyUXGZmdxhlcemTtwUVNUbvER8D4byOp2UZXxeWS1HDCAbEfC8B6N9JF2LCkkjpU4PdpettrVUxOGUXWCffYsoGqdcBkZfql/Pgj5jg3GxhtAexnQcShsMRI1dL0h2AF5hkz3SrHp8Toq9a3ztcqbOVPAzPNrr1p7+zjo7uraU0EuLJ9ELRUY6ZclEd8fxYm9P5Ar8oFtf7k3TSFm7ed98pW8hspZCtsXGY3WD1yn+ipgx70dI2oZXGOdlxf8zyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM04FT059.eop-NAM04.prod.protection.outlook.com
 (10.152.90.60) by CO1NAM04HT203.eop-NAM04.prod.protection.outlook.com
 (10.152.91.156) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.20; Tue, 8 Oct
 2019 20:25:32 +0000
Received: from MN2PR15MB3134.namprd15.prod.outlook.com (10.152.90.56) by
 CO1NAM04FT059.mail.protection.outlook.com (10.152.91.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.20 via Frontend Transport; Tue, 8 Oct 2019 20:25:32 +0000
Received: from MN2PR15MB3134.namprd15.prod.outlook.com
 ([fe80::64ef:f5bf:c42a:bc28]) by MN2PR15MB3134.namprd15.prod.outlook.com
 ([fe80::64ef:f5bf:c42a:bc28%6]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 20:25:32 +0000
From: William Lewis <minutemaidpark@hotmail.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Topic: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Index: AQHVfg7CYkJH95za9ESSJdhnGQc3c6dRMO+A
Date: Tue, 8 Oct 2019 20:25:32 +0000
Message-ID: <MN2PR15MB31341203F812D0002E151EEBC89A0@MN2PR15MB3134.namprd15.prod.outlook.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-5-alexander.deucher@amd.com>
In-Reply-To: <20191008192934.5481-5-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0401CA0033.namprd04.prod.outlook.com
 (2603:10b6:803:2a::19) To MN2PR15MB3134.namprd15.prod.outlook.com
 (2603:10b6:208:ea::20)
x-incomingtopheadermarker: OriginalChecksum:B43EA401A4CE3731B7C2F0889AC234CA45D44781199CC871A31DE271908FAD7A;
 UpperCasedChecksum:9EB401C5188CF4021E9BF837701AF02D8ADCA3DDA7990417B41E0CDC5F5C235A;
 SizeAsReceived:7633; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [kTk14KVFU4i4Aead+KHoUtrYxXUu4Lh1]
x-microsoft-original-message-id: <27432f37-ed91-77a2-44a5-4ddc39f35aaf@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: CO1NAM04HT203:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Cpu4pKjPJjZ3GMIdjMROqxsuttb0Uor3q6tyxRi10Wdp655LOiBWNbyuYx/jV9c4+NUDFohF5WyP9lr+wiiogOMjGMEklTclBDZSFL2bvjsQ9M8xaAivvYowll4wqfu3rsMgyB6URwHCeOwrwl2NPiTdQombkbJbLR61YlJdaL26Uczd1zWImi5gZ4ggLlg
x-ms-exchange-transport-forked: True
Content-ID: <3ADB2CEEB6007F4588C3B7D4AE4F5A4A@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 957b7f96-8694-43a8-2625-08d74c2daa40
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 20:25:32.2387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zGLLA0NR6CLmLT0ef86Otztd5ID72QDVAsVtA7w1Is=;
 b=bhlGUgzxTy0U63s6rQaIrihX5PmU9tw5MIdqmNQHlygqaPZaLBbuw14LsxXWK6591GzidZHaiu575bQi13B1+CIpaIKOn+U+spq20x1ubw8dhJHCoTwpWB/5l/rTe4UVfpC3cofHLOmu29y2Yndrru+2ftjHK8NXdR3Mz/7iQMDSSfzAmFsK25xPJO69uSeoULp/Yxm6YnO/DocM0K6xItHKoPW3CLPoQ188kcNvtk8nCSHlRoU4Y3brg4NAQYxTNrvNOyx3DpHAA8qZDFriJBotdGKmRNWDd7rRyC5/6RVZ592Jd2r0jqhX1VyGym8qDZu8wkOjmpe7WgEkKhf+iw==
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

DQpPbiAxMC84LzE5IDI6MjkgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gRnJvbTogIlRpYW5j
aS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+DQo+DQo+IGFkZCBuZXcgdnJhbV9yZXNlcnZlX2Js
b2NrIHN0cnVjdHVyZSBhbmQgYXRvbWZpcm13YXJlX2ludGVybmFsX2NvbnN0YW50cyBlbnVtZXJh
dGlvbg0KPg0KPiBDaGFuZ2UtSWQ6IEk2YmE2NDJlY2Q3YWQ5NDI1MDE2MmFlNWMzMjJlZDhkODVk
ZTljMzVhDQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oIHwg
MTUgKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdh
cmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaA0KPiBpbmRl
eCBlODg1NDFkNjdhYTAuLjUxOTZiOTQwOTdmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9hdG9tZmlybXdhcmUuaA0KPiBAQCAtNDk4LDYgKzQ5OCw3IEBAIGVudW0gYXRv
bWJpb3NfZmlybXdhcmVfY2FwYWJpbGl0eQ0KPiAgICAgQVRPTV9GSVJNV0FSRV9DQVBfSFdFTVVf
RU5BQkxFICA9IDB4MDAwMDAwODAsDQo+ICAgICBBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9VTUNf
Q0ZHID0gMHgwMDAwMDEwMCwNCj4gICAgIEFUT01fRklSTVdBUkVfQ0FQX1NSQU1fRUNDICAgICAg
PSAweDAwMDAwMjAwLA0KPiArICBBVE9NX0ZJUk1XQVJFX0NBUF9FTkFCTEVfMlNUQUdFX0JJU1Rf
VFJBSU5JTkcgID0gMHgwMDAwMDQwMCwNCj4gICB9Ow0KPiAgIA0KPiAgIGVudW0gYXRvbV9jb29s
aW5nX3NvbHV0aW9uX2lkew0KPiBAQCAtNjcxLDYgKzY3MiwyMCBAQCBzdHJ1Y3QgdnJhbV91c2Fn
ZWJ5ZmlybXdhcmVfdjJfMQ0KPiAgICAgdWludDE2X3QgIHVzZWRfYnlfZHJpdmVyX2luX2tiOw0K
PiAgIH07DQo+ICAgDQo+ICsvKiBUaGlzIGlzIHBhcnQgb2YgdnJhbV91c2FnZWJ5ZmlybXdhcmVf
djJfMSAqLw0KPiArc3RydWN0IHZyYW1fcmVzZXJ2ZV9ibG9jaw0KPiArew0KPiArICAgIHVpbnQz
Ml90ICBzdGFydF9hZGRyZXNzX2luX2tiOw0KPiArICAgIHVpbnQxNl90ICB1c2VkX2J5X2Zpcm13
YXJlX2luX2tiOw0KPiArICAgIHVpbnQxNl90ICB1c2VkX2J5X2RyaXZlcl9pbl9rYjsNCj4gK307
DQo+ICsNCj4gKy8qIERlZmluaXRpb25zIGZvciBjb25zdGFuY2UgKi8NCg0Kcy9jb25zdGFuY2Uv
Y29uc3RhbnRzLw0KDQpXb3VsZCBpdCBub3QgYmUgYmV0dGVyIGFsc28gdG8gd2lkZW4gdGhlIGVu
dW0gY29uc3RhbnRzIGJlbG93IGV4cGxpY2l0bHkgDQpmb3IgbGVnaWJpbGl0eSwgaS5lLg0KDQpP
TkVfSyDCoCA9IDB4MDAwMDA0MDAsDQpPTkVfTUVHID0gMHgwMDEwMDAwMCwNCk9ORV9HwqDCoCA9
IDB4NDAwMDAwMDANCg0KPiArZW51bSBhdG9tZmlybXdhcmVfaW50ZXJuYWxfY29uc3RhbnRzIHsN
Cj4gKyAgICBPTkVfSwk9IDB4NDAwLA0KPiArICAgIE9ORV9NRUcJPSAweDEwMDAwMCwNCj4gKyAg
ICBPTkVfRwk9IDB4NDAwMDAwMDAsDQo+ICt9Ow0KPiAgIA0KPiAgIC8qDQo+ICAgICAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
