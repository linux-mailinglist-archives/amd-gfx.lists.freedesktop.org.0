Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98C419EC
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 03:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EA2891CC;
	Wed, 12 Jun 2019 01:20:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B51891CC
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 01:20:13 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2957.namprd12.prod.outlook.com (20.179.82.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 01:15:24 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::18c6:70fa:9f7e:7018%2]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 01:15:24 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: return 0 by default in
 amdgpu_pm_load_smu_firmware
Thread-Topic: [PATCH] drm/amdgpu: return 0 by default in
 amdgpu_pm_load_smu_firmware
Thread-Index: AQHVIGUfhkDpaIswB0OUJz8NqMk+BaaXN5jw
Date: Wed, 12 Jun 2019 01:15:24 +0000
Message-ID: <MN2PR12MB3344625CE58671CC7FB52492E4EC0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190611145103.621-1-alexander.deucher@amd.com>
In-Reply-To: <20190611145103.621-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d07f39b-b8e5-41cf-2a74-08d6eed37296
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2957; 
x-ms-traffictypediagnostic: MN2PR12MB2957:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB2957448A8680DD2E7DD82CBDE4EC0@MN2PR12MB2957.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(366004)(376002)(346002)(13464003)(199004)(189003)(66946007)(73956011)(229853002)(76116006)(5660300002)(66066001)(256004)(110136005)(316002)(66476007)(86362001)(52536014)(2501003)(99286004)(76176011)(9686003)(66446008)(64756008)(66556008)(7696005)(486006)(102836004)(72206003)(4326008)(6246003)(305945005)(6506007)(7736002)(53936002)(74316002)(11346002)(476003)(33656002)(14454004)(186003)(26005)(966005)(6306002)(25786009)(446003)(478600001)(8676002)(55016002)(2906002)(81156014)(81166006)(71200400001)(71190400001)(3846002)(6116002)(8936002)(68736007)(53546011)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2957;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: suieFOdvlRgT6wlZ1rnK9S67BFiIZWOrK6LIzE5uVZ3aNWCNCz3gVb8Jpmvieyo7NxGcPlVOZIVCKbekz4ld/m2f0k+nrGMTlMb3yEj+aWTG3YzmS5eDaqZE2g9U75Fg/75L5qzZ4GDZxYGWXWZWk+oUJerzmXBNk/SD8pf3/1ZTJ1H3Pnygq0XwocpxWftZ20KUj/jgP3Jx97HmB/8TZHFQuGkeA3G9HpRUbmTFMvi+wr7cC+G/a6HY7EIuV/AVbVXbdsXIouv8csRX4HPV7nd1+2BuU0O9S6t1jnf2CtGhJDhtGjC9QvV+IoTyB1Be13l0qzAA0N8n+kieHSKzc+AO0tlw7DAYDgIj/uN45dsi7XvSSoeVWeX5ep4dHGCzJaMIxL6icTB+Jsq1VzSF/LXvxzmgDMteLFG3UhaZWb4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d07f39b-b8e5-41cf-2a74-08d6eed37296
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 01:15:24.4949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2957
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez6eC7WdMvibyYqbPFminGU8jwKn6eBEe2fMC69oAaQ=;
 b=nv44TcNtYzUe8NvCqMn/xLOzzEj7ukMJbEC3m1Q35Ljm+EMHWvwcZ3nLmmQAc3ydL1hsjb/Yrv64qrJ4Mr25HNrPAbaiXdi+d1htI0WUBe8GxsfB6JGXxV9XucYctqkKDFyHFqWOImG/sCGvouLGPCwVotnuK/JHmjceAquk9F8=
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
dWVzZGF5LCBKdW5lIDExLCAyMDE5IDEwOjUxIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJldHVybiAwIGJ5IGRlZmF1
bHQgaW4NCj4gYW1kZ3B1X3BtX2xvYWRfc211X2Zpcm13YXJlDQo+IA0KPiBGaXhlcyBTSSBjYXJk
cyBydW5uaW5nIG9uIGFtZGdwdS4NCj4gDQo+IEZpeGVzOiAxOTI5MDU5ODkzMDIyICgiZHJtL2Ft
ZC9hbWRncHU6IGFkZCBSTEMgZmlybXdhcmUgdG8gc3VwcG9ydA0KPiByYXZlbjEgcmVmcmVzaCIp
DQo+IEJ1ZzogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEw
ODgzDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8
IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cG0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IGluZGV4
IGQ4ODI4YTM3ZTQzYS4uNjUzYjI0OTFmZWM4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcG0uYw0KPiBAQCAtMjcwMCw3ICsyNzAwLDcgQEAgdm9pZCBhbWRncHVfcG1f
cHJpbnRfcG93ZXJfc3RhdGVzKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiANCj4g
IGludCBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsDQo+IHVpbnQzMl90ICpzbXVfdmVyc2lvbikgIHsNCj4gLQlpbnQgciA9IC1FSU5WQUw7DQo+
ICsJaW50IHI7DQo+IA0KPiAgCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpDQo+ICAJCXJldHVy
biAwOw0KPiBAQCAtMjcxMyw3ICsyNzEzLDcgQEAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJt
d2FyZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8N
Cj4gIAkJfQ0KPiAgCQkqc211X3ZlcnNpb24gPSBhZGV2LT5wbS5md192ZXJzaW9uOw0KPiAgCX0N
Cj4gLQlyZXR1cm4gcjsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBpbnQgYW1kZ3B1X3Bt
X3N5c2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+IC0tDQo+IDIuMjAuMQ0K
PiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
