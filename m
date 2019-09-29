Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8EAC13E1
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 10:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCA06E2DA;
	Sun, 29 Sep 2019 08:03:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0C76E2DA
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 08:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZURJMHdBjX4pf7yct1RVtFxUbEGmyJoDIibHTjRC7f1Puzb0Q7VfOXOo1I4Ib1qmNM+eakOOFk/jgXFvdXmd3KUjWCKbIz/aMelKWsMdtgF26zUZ6YxFmNZmLjHj5Q/5jopDD2Ru8+dYtgaSjJUEAo60wfmKWCde+e1nS3h23whuSgm/qoM13/t3HpOgkmCoDsWlAj0WdEIDMkWdvIdbfCsVpsgdI41dlhDQa/mo1Zt5ygjpGPKarH2hG0UQdoEOsFIzZc9QSjmDHl5kY6ULTaieY13lOzstdVuxjadJ8Hur8bwfW4uKNFXx5uZvASHkabvl0V3ki9dZD9v1fEjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOBe16wC5UoTIj1lLU/4FE2B387wJiFMnA+DSg2lbfI=;
 b=fdEf6NkB5eiNpho5kF/tj44JDu1XRUgmHzW38BLt7D9pHPwHTI0jEWpdL68qSM4gkq+mdbRHUE5J6ivQv1IKxQ0r9Bdng9A8Ia1M4k6RYV3XqQtYNOpYRcLQHUVpWng/MSfmOHj0EmWgUqNNhy5vulLBxA8O3RC2K+e43QJayj2OnLZniHVnTZLgbarZ1SfOMWc+jNvNZ1ZWoknjRfi/IsqD+tqZGmERzDyqPf4r1An9iOzktWnv8+bSzxNcLl4TxTOgtI7xAMFlZVCm+zEWk64kJYyu/4t5ObpWv+XbETF2/eZB2qsCy7OSDezLAFNWhMauS+c6SdegMvsS+ss5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3278.namprd12.prod.outlook.com (20.179.81.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Sun, 29 Sep 2019 08:03:49 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 08:03:49 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Topic: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Index: AQHVdpAH0YHtJ1rQtUyHA9LTmpURqKdCOkoQgAAQluA=
Date: Sun, 29 Sep 2019 08:03:48 +0000
Message-ID: <MN2PR12MB30544DB1F75A9CCB4B745CCFB0830@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190929063438.10827-1-tao.zhou1@amd.com>
 <BYAPR12MB28066811DC887C3146D3AA2DF1830@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB28066811DC887C3146D3AA2DF1830@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b5de86e-a672-4316-ddc7-08d744b38f4f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3278; 
x-ms-traffictypediagnostic: MN2PR12MB3278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3278BA337268A34A8E0F9570B0830@MN2PR12MB3278.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(13464003)(199004)(189003)(99286004)(81166006)(33656002)(26005)(66066001)(2501003)(8936002)(66446008)(86362001)(66556008)(305945005)(66476007)(7736002)(478600001)(52536014)(64756008)(76116006)(66946007)(25786009)(2906002)(5660300002)(6246003)(6116002)(81156014)(110136005)(3846002)(11346002)(9686003)(7696005)(446003)(8676002)(74316002)(76176011)(55016002)(486006)(6636002)(229853002)(14454004)(102836004)(6506007)(71190400001)(53546011)(316002)(476003)(14444005)(256004)(71200400001)(6436002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3278;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YRNrJnwYjxXEKLcx8yPHOSYS55bZzvsRwPyL0g02EYxQB7ONuWFClXosu4ZF9+e5Y2NNuPP2WwaNbaFacwUFwYqHl7sdMgs2Z0Nx9wG7d/MuHbzdn0MsuhUT4zGsbub3amLFPx8jWXL8z1gTL0vxoNYqxjKBfjGQBTAsCfYZSXqvTFyNxT/qixkLG1P49teagpYIYpavXwCyUKNRFM/Z21fYPfbpwvgPfUXsgbluUxwre0cBvING12e9nt67X4+/x0o98HLfzFvguHZZ4H+o2MR/21/Gy1YldDAQklAw7IOj8eB4tOvP5VmgNMbo3bKUdWsx7l9pOTXuJqtC1JeyVNzUKWxlzGWGY0PiBugta6vZ6ep68seCck/Y1yzdrpA2aHHpqGEEJUvvJLFwoN/dTEgx6wfkkzsSw7RMqle6AyM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5de86e-a672-4316-ddc7-08d744b38f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 08:03:48.9555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XMLwHN0Zggen95/Uxi0l5D/Bqwx9iVpkhjN3ohU2kMcrpMgvbSonJXPyXwl2oWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOBe16wC5UoTIj1lLU/4FE2B387wJiFMnA+DSg2lbfI=;
 b=jTS3xBeN2y6Ur4KVq6wRVbc6IWAK9s7XnMGaQIUgKQlRyKsapo2DKjOfGzFvN7Jy0F31ihHoQbt4q3ZFpTIJ8psTykgTZGZK4ob9ngINT4G1+DyZ3qj19dgWBzJaC2ikz7Z3P/jZzMtCl/5VCMLVXu6TS1lkjm9n4w4a/LX3tX0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDI55pelIDE1OjA2DQo+IFRv
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+
OyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBS
RTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZWNyZWF0ZSByZXRpcmVkIHBhZ2UncyBibyBpZiB2cmFt
IGdldCBsb3N0DQo+IGluIGdwdSByZXNldA0KPiANCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTZW50OiBT
dW5kYXksIFNlcHRlbWJlciAyOSwgMjAxOSAyOjM1IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgR3JvZHpvdnNreSwgQW5kcmV5DQo+IDxBbmRyZXkuR3JvZHpvdnNreUBh
bWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsNCj4gWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91
MUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlY3JlYXRlIHJldGly
ZWQgcGFnZSdzIGJvIGlmIHZyYW0gZ2V0IGxvc3QgaW4NCj4gZ3B1IHJlc2V0DQo+IA0KPiB0aGUg
aW5mbyBvZiByZXRpcmVkIHBhZ2UncyBibyBtYXkgYmUgbG9zdCBpZiB2cmFtIGxvc3QgaXMgZW5j
b3VudGVyZWQgaW4gZ3B1DQo+IHJlc2V0IChncHUgcGFnZSB0YWJsZSBpbiB2cmFtIG1heSBiZSBs
b3N0KSwgZm9yY2UgdG8gcmVjcmVhdGUgYWxsIGJvcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFv
IFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiBTdWdnZXN0ZWQtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgICB8IDQ0DQo+ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICB8ICAxICsNCj4g
IDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCA2Mjk1NTE1NjY1M2MuLmE4
OWY2ZDA1M2IzZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KPiBAQCAtMzY3NSw2ICszNjc1LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNp
Y19yZXNldChzdHJ1Y3QNCj4gYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwNCj4gIAkJCQlpZiAodnJh
bV9sb3N0KSB7DQo+ICAJCQkJCURSTV9JTkZPKCJWUkFNIGlzIGxvc3QgZHVlIHRvIEdQVQ0KPiBy
ZXNldCFcbiIpOw0KPiAgCQkJCQlhbWRncHVfaW5jX3ZyYW1fbG9zdCh0bXBfYWRldik7DQo+ICsN
Cj4gCWFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQodG1wX2FkZXYpOw0KPiAgCQkJCX0NCj4gDQo+
ICAJCQkJciA9IGFtZGdwdV9ndHRfbWdyX3JlY292ZXIoDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5kZXggNDg2NTY4ZGVkNmQ2Li4xYjNiNTk3YWE5NzMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTE1
NzMsNiArMTU3Myw1MCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfZmluaShzdHJ1
Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldikNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICsN
Cj4gKy8qDQo+ICsgKiB0aGUgaW5mbyBvZiByZXRpcmVkIHBhZ2UncyBibyBtYXkgYmUgbG9zdCBp
ZiB2cmFtIGxvc3QgaXMNCj4gK2VuY291bnRlcmVkDQo+ICsgKiBpbiBncHUgcmVzZXQgKGdwdSBw
YWdlIHRhYmxlIGluIHZyYW0gbWF5IGJlIGxvc3QpLCBmb3JjZSB0byByZWNyZWF0ZQ0KPiArICog
YWxsIGJvcw0KPiArICovDQo+ICt2b2lkIGFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1k
Z3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsNCj4gKwlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2Rh
dGEgKmRhdGE7DQo+ICsJdWludDY0X3QgYnA7DQo+ICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBO
VUxMOw0KPiArCWludCBpOw0KPiArDQo+ICsJaWYgKCFjb24pDQo+ICsJCXJldHVybjsNCj4gKw0K
PiArCWRhdGEgPSBjb24tPmVoX2RhdGE7DQo+ICsJaWYgKCFkYXRhKQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwkvKiBmb3JjZSB0byByZXNlcnZlIGFsbCByZXRpcmVkIHBhZ2UgYWdhaW4gKi8NCj4g
KwlkYXRhLT5sYXN0X3Jlc2VydmVkID0gMDsNCj4gKw0KPiArCWZvciAoaSA9IGRhdGEtPmxhc3Rf
cmVzZXJ2ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7DQo+ICsJCWJwID0gZGF0YS0+YnBzW2ld
LnJldGlyZWRfcGFnZTsNCj4gKw0KPiArCQkvKiBUaGVyZSBhcmUgdGhyZWUgY2FzZXMgb2YgcmVz
ZXJ2ZSBlcnJvciBzaG91bGQgYmUgaWdub3JlZDoNCj4gKwkJICogMSkgYSByYXMgYmFkIHBhZ2Ug
aGFzIGJlZW4gYWxsb2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOw0KPiArCQkgKiAyKSBhIHJhcyBi
YWQgcGFnZSBoYXMgYmVlbiByZXNlcnZlZCAoZHVwbGljYXRlIGVycm9yDQo+IGluamVjdGlvbg0K
PiArCQkgKiAgICBmb3Igb25lIHBhZ2UpOw0KPiArCQkgKiAzKSBibyBpbmZvIGlzbid0IGxvc3Qg
aW4gZ3B1IHJlc2V0DQo+ICsJCSAqLw0KPiArCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxf
YXQoYWRldiwgYnAgPDwNCj4gQU1ER1BVX0dQVV9QQUdFX1NISUZULA0KPiArCQkJCQkgICAgICAg
QU1ER1BVX0dQVV9QQUdFX1NJWkUsDQo+ICsJCQkJCSAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9W
UkFNLA0KPiArCQkJCQkgICAgICAgJmJvLCBOVUxMKSkNCj4gKwkJCURSTV9OT1RFKCJSQVMgTk9U
RTogcmVjcmVhdGUgYm8gZm9yIHJldGlyZWQgcGFnZQ0KPiAweCVsbHggZmFpbFxuIiwgYnApOw0K
PiArCQllbHNlDQo+ICsJCQlkYXRhLT5icHNfYm9baV0gPSBibzsNCj4gKwkJZGF0YS0+bGFzdF9y
ZXNlcnZlZCA9IGkgKyAxOw0KPiArCQlibyA9IE5VTEw7DQo+ICsJfQ0KPiBbR3VjaHVuXSBJbiBh
bWRncHVfcmFzLmMsIHdlIGhhdmUgYW5vdGhlciBmdW5jdGlvbg0KPiBhbWRncHVfcmFzX3Jlc2Vy
dmVfYmFkX3BhZ2VzLCB3aGljaCBoYXMgdGhlIHNhbWUgYm8gY3JlYXRpb24gY29kZSBhcw0KPiBh
Ym92ZS4NCj4gU28gY2FuIHdlIHB1dCB0aGVzZSBjb21tb24gY29kZXMgaW50byBhbm90aGVyIGlu
dGVybmFsIGZ1bmMgZGVkaWNhdGVkIGZvcg0KPiBibyBjcmVhdGluZyBqb2JzIHRvIHJlZHVjZSBj
b2RlIGxpbmVzIGFuZCBnZXQgdGhpcyBpbnRlcm5hbCBmdW5jIGJlaW5nIGNhbGxlZCBieQ0KPiBh
bWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzIGFuZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0
DQo+IHJlc3BlY3RpdmVseT8NCg0KW1Rhb10gVGhlcmUgYXJlIHNvbWUgbWlub3IgZGlmZmVyZW5j
ZXMsIEknbGwgYWRkIGEgbmV3IHBhdGNoIGlmIHRoZSBmb3IgbG9vcCBjYW4gYmUgcmV1c2VkLg0K
DQo+ICt9DQo+ICAvKiByZWNvdmVyeSBlbmQgKi8NCj4gDQo+ICAvKiByZXR1cm4gMCBpZiByYXMg
d2lsbCByZXNldCBncHUgYW5kIHJlcG9zdC4qLyBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5oDQo+IGluZGV4IGY4MGZkMzQyOGM5OC4uN2E2MDZkM2JlODA2IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+IEBAIC00NzksNiAr
NDc5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoc3RydWN0
DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsICB9DQo+IA0KPiAgaW50IGFtZGdwdV9yYXNfcmVjb3Zl
cnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICt2b2lkIGFtZGdwdV9yYXNf
cmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgaW50IGFtZGdw
dV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
PiAgCQl1bnNpZ25lZCBpbnQgYmxvY2spOw0KPiANCj4gLS0NCj4gMi4xNy4xDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
