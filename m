Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9927C3C8EA
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 12:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6DD8919E;
	Tue, 11 Jun 2019 10:28:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA7E8919E
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 10:28:47 +0000 (UTC)
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3200.namprd12.prod.outlook.com (20.179.82.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 10:28:45 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::5558:8fd7:ffbc:262b%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:28:45 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix pm_load_smu_firmware for SR-IOV
Thread-Topic: [PATCH] drm/amdgpu: fix pm_load_smu_firmware for SR-IOV
Thread-Index: AQHVIAtpDJXJjOm+rUiN9GA4TTLQRqaWPgDw
Date: Tue, 11 Jun 2019 10:28:45 +0000
Message-ID: <MN2PR12MB33099788C0C7ED03AFB303BFECED0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1560226110-10201-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1560226110-10201-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed7d7a4-0bb7-4bfc-4384-08d6ee579599
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3200; 
x-ms-traffictypediagnostic: MN2PR12MB3200:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3200ADA048C00DAFA2FAAD3EECED0@MN2PR12MB3200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(376002)(366004)(136003)(13464003)(199004)(189003)(81166006)(7696005)(8936002)(52536014)(81156014)(2906002)(68736007)(99286004)(26005)(76176011)(25786009)(33656002)(2501003)(8676002)(305945005)(14454004)(7736002)(186003)(6506007)(53546011)(4326008)(102836004)(6116002)(3846002)(229853002)(966005)(54906003)(478600001)(110136005)(6246003)(72206003)(71190400001)(71200400001)(316002)(6436002)(73956011)(53936002)(256004)(64756008)(66556008)(76116006)(86362001)(5660300002)(66946007)(74316002)(66066001)(66446008)(9686003)(11346002)(66476007)(55016002)(486006)(6306002)(476003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3200;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ya9gBNEGyAYGNVTi18XOc6XydlVOUTS/OtzQcEzila8KI+XSdxg83S9lBsnrB/ymLOjaXJjKVKymq/WUnnGf6PD+rKH82dMSCZ2lLoMqbGcy5ezcTqfK73Rtfk8nHmwM+cI1TixgZPEIOVOfd4p98YxqJqr7xY+qe1NPDlDMp6clb1657B92gB0/cnlnQN/TjMe6LfesW5QY6bH8j1n+DXju3YbNKmm6jpzVNmFi6hKewKEUqPHUf3X4o9YvZr8vlk3hLJLqzbn9vobj7lh4rIfExJZmE2tKh8tB+SYGOu0FDHld4MOFt6uA5/8R0XYF9fsTNme/UBSkqkbs0wxdeAo2/uANRUd/qmQsBAQSG/t1NUXTTIj8jmYZAdyFgFZ3PKwSWN4tsyQWafLyoTStycq8QMnuSDvdbCHKZjpLfo4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed7d7a4-0bb7-4bfc-4384-08d6ee579599
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:28:45.7379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVDl7LGnx62+m4JyITl5Lk/seZQtEti5XIrBaWRd194=;
 b=nBv0T8RXZWnDY0cnIkQg21j2eFYsBoQ0RNItF7r0Emh/XxGfQ2JB3x/YJgOIB6/tCot7L919HjzakY/z/GvjI2ZZX5YyXINWF9VaGX50u49X4imjhibIEjvwwhiez1cP9qePq42BVSR1vAcqGM+hJZnOPRgT/mxkuwGC/j4tl6E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Liang, Prike" <Prike.Liang@amd.com>, "Huang,
 Trigger" <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gVHJpZ2dlciBIdWFu
Zw0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDExLCAyMDE5IDEyOjA5IFBNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFuZ0Bh
bWQuY29tPjsgSHVhbmcsIFRyaWdnZXINCj4gPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggcG1fbG9hZF9zbXVfZmlybXdhcmUgZm9yIFNS
LUlPVg0KPiANCj4gRm9yIFNSLUlPViBWRiwgcG93ZXJwbGF5IG1heSBub3QgYmUgc3VwcG9ydGVk
LCBpbiB0aGlzIGNhc2UsIGVycm9yICctRUlOVkFMJw0KPiBzaG91bGQgbm90IGJlIHJldHVybmVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwg
MyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IGluZGV4IDIxYjViZTEuLjQyNzZkNjMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQo+IEBAIC0yNzA5
LDcgKzI3MDksMTAgQEAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1Y3QNCj4g
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8NCj4gIAkJCXJldHVybiBy
Ow0KPiAgCQl9DQo+ICAJCSpzbXVfdmVyc2lvbiA9IGFkZXYtPnBtLmZ3X3ZlcnNpb247DQo+ICsJ
fSBlbHNlIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsNCj4gKwkJciA9IDA7DQoNCkNvdWxk
IHlvdSBwbGVhc2UgYWRkIHRoZSBjaGVja2luZyBhdCB0aGUgc3RhcnQgb2YgdGhpcyBmdW5jdGlv
bjoNCg0KaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkNCglyZXR1cm4gMDsNCg0KVGhlIGNvZGUg
bG9va3MgYmV0dGVyIHRoYW4gYWRkaW5nIGEgImVsc2UiIGhlcmUuDQoNCldpdGggdGhhdCBmaXhl
ZCwgcGxlYXNlIGFkZA0KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
DQoNCj4gIAl9DQo+ICsNCj4gIAlyZXR1cm4gcjsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNy40DQo+
IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
