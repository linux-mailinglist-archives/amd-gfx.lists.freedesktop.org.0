Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4B646FA
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 15:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB1089E0D;
	Wed, 10 Jul 2019 13:28:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158789E0D
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 13:28:04 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3581.namprd12.prod.outlook.com (20.178.242.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 13:28:00 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 13:28:00 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwICP4tqAlh7jkKqyySuqTVOI6bD2HSA
Date: Wed, 10 Jul 2019 13:27:59 +0000
Message-ID: <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:203:2f::24) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6757575-ab37-4fc6-f3bf-08d7053a6d34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3581; 
x-ms-traffictypediagnostic: MN2PR12MB3581:
x-microsoft-antispam-prvs: <MN2PR12MB3581062F0B75828958BAD544B4F00@MN2PR12MB3581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(76176011)(52116002)(66556008)(11346002)(476003)(26005)(71200400001)(71190400001)(2616005)(66066001)(66946007)(446003)(64756008)(66476007)(66446008)(102836004)(6486002)(8936002)(6116002)(486006)(14444005)(478600001)(99286004)(256004)(305945005)(186003)(6246003)(386003)(6512007)(2906002)(36756003)(316002)(6436002)(2501003)(31696002)(14454004)(53936002)(229853002)(3846002)(5660300002)(110136005)(81166006)(7736002)(8676002)(81156014)(31686004)(6506007)(68736007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3581;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IYbfKxzeFVAKOZy6U0tFSckG49y3HnOhqIvwhr6K5TFrL8vPZypNXkZlX0Y7dXKAa3fYEuWIMpja7fjtnY163ke9yVibcxRDqw7rczINZeoq9V0QOxVvu/vXr7IL7/ZGwzGKd0VB6BIvZ2pd7sCUVMjzx70iQV1sOE/5p4TtLfqHdFvg7G+oxvWUZlhdFm6grfH+kgbUox8M5/hNn6eJP6gqkz5WvCOGiMSj1JJCYm2gNWDQkD5R3Ejd/E1GVN5E4ZGheDLlPATJoIx6TYQNTouhQB3sCWKIqkExtHcdAl24WaWnJWLcEjK4bKBskjAlrdk2tpClSa7KM99hfJmWUOmB0KrArvFcXBw6A9k5PNxsW+zqN3sclkdoYQNV2JXB3h3OCIlCF0GnveiDAgoTXO2fbI4TTNa1Isp1maS8U+8=
Content-ID: <09070F132F963542A3D5E892EBBD7455@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6757575-ab37-4fc6-f3bf-08d7053a6d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 13:28:00.0190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bdF3HoyehZOQq9GuINspLWEsqPeGFHC8/ijPws6o9A=;
 b=JZXRNgc27i4VdJqIFvUuoX9D14GF2mFu3W0x7Zr9PCorPJiE0eXX0tIJrhDLQA9twOx9cdzT918ITr5MGrGscp0OxeIRqzGFQSmoCN5Rs1ardmcYdBcZ9lQxhJSerFjHY8rshswdu3RTJIo4o2+x+6sean3D/Y8gFj9u/rIQs1A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

SXQgZG9lc24ndCBtYWtlIHNlbnNlIHRoYXQgZnJlZWluZyBCTyBzdGlsbCB1c2VzIHBlci12bSBy
ZXN2Lg0KDQpJIHJlbWVtYmVyIHdoZW4gQk8gaXMgaW4gcmVsZWFzZSBsaXN0LCBpdHMgcmVzdiB3
aWxsIGJlIGZyb20gcGVyLXZtIHJlc3YgDQpjb3B5LiBDb3VsZCB5b3UgY2hlY2sgaXQ/DQoNCi1E
YXZpZA0KDQrlnKggMjAxOS83LzEwIDE3OjI5LCBFbWlseSBEZW5nIOWGmemBkzoNCj4gRm9yIHZ1
bGthbiBjdHMgYWxsb2NhdGlvbiB0ZXN0IGNhc2VzLCB0aGV5IHdpbGwgY3JlYXRlIGEgc2VyaWVz
IG9mIGJvcywgYW5kIHRoZW4gZnJlZQ0KPiB0aGVtLiBBcyBpdCBoYXMgbG90cyBvZiBhbGxvY3Rp
b24gdGVzdCBjYXNlcyB3aXRoIHRoZSBzYW1lIHZtLCBhcyBwZXIgdm0NCj4gYm8gZmVhdHVyZSBl
bmFibGUsIGFsbCBvZiB0aG9zZSBib3MnIHJlc3YgYXJlIHRoZSBzYW1lLiBCdXQgdGhlIGJvIGZy
ZWUgaXMgcXVpdGUgc2xvdywNCj4gYXMgdGhleSB1c2UgdGhlIHNhbWUgcmVzdiBvYmplY3QsIGZv
ciBldmVyeSB0aW1lLCBmcmVlIGEgYm8sDQo+IGl0IHdpbGwgY2hlY2sgdGhlIHJlc3Ygd2hldGhl
ciBzaWduYWwsIGlmIGl0IHNpZ25hbCwgdGhlbiB3aWxsIGZyZWUgaXQuIEJ1dA0KPiBhcyB0aGUg
dGVzdCBjYXNlcyB3aWxsIGNvbnRpbnVlIHRvIGNyZWF0ZSBibywgYW5kIHRoZSByZXN2IGZlbmNl
IGlzIGluY3JlYXNpbmcuIFNvIHRoZQ0KPiBmcmVlIGlzIG1vcmUgc2xvd2VyIHRoYW4gY3JlYXRp
bmcuIEl0IHdpbGwgY2F1c2UgbWVtb3J5IGV4aGF1c3RpbmcuDQo+DQo+IE1ldGhvZDoNCj4gV2hl
biB0aGUgcmVzdiBzaWduYWwsIHJlbGVhc2UgYWxsIHRoZSBib3Mgd2hpY2ggYXJlIHVzZSB0aGUg
c2FtZQ0KPiByZXN2IG9iamVjdC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1p
bHkuRGVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+
IGluZGV4IGY5YTNkNGMuLjU3ZWM1OWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiBAQCAt
NTQzLDYgKzU0Myw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLA0KPiAgIHsNCj4gICAJc3RydWN0IHR0bV9ib19nbG9iYWwgKmds
b2IgPSBiby0+YmRldi0+Z2xvYjsNCj4gICAJc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVz
djsNCj4gKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnJlc3ZfYm8sICpyZXN2X2JvX25leHQ7
DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICAgCWlmICh1bmxpa2VseShsaXN0X2VtcHR5KCZiby0+
ZGRlc3Ryb3kpKSkNCj4gQEAgLTU2NiwxMCArNTY3LDE0IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2Ns
ZWFudXBfcmVmcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPiAgIAkJCQkJCQkgICBp
bnRlcnJ1cHRpYmxlLA0KPiAgIAkJCQkJCQkgICAzMCAqIEhaKTsNCj4gICANCj4gLQkJaWYgKGxy
ZXQgPCAwKQ0KPiArCQlpZiAobHJldCA8IDApIHsNCj4gKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9r
cmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4gICAJCQlyZXR1cm4gbHJldDsNCj4gLQkJZWxz
ZSBpZiAobHJldCA9PSAwKQ0KPiArCQl9DQo+ICsJCWVsc2UgaWYgKGxyZXQgPT0gMCkgew0KPiAr
CQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPiAgIAkJ
CXJldHVybiAtRUJVU1k7DQo+ICsJCX0NCj4gICANCj4gICAJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1
X2xvY2spOw0KPiAgIAkJaWYgKHVubG9ja19yZXN2ICYmICFrY2xfcmVzZXJ2YXRpb25fb2JqZWN0
X3RyeWxvY2soYm8tPnJlc3YpKSB7DQo+IEBAIC01ODIsNiArNTg3LDcgQEAgc3RhdGljIGludCB0
dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+ICAgCQkJ
ICogaGVyZS4NCj4gICAJCQkgKi8NCj4gICAJCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2sp
Ow0KPiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0K
PiAgIAkJCXJldHVybiAwOw0KPiAgIAkJfQ0KPiAgIAkJcmV0ID0gMDsNCj4gQEAgLTU5MSwxNSAr
NTk3LDI5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLA0KPiAgIAkJaWYgKHVubG9ja19yZXN2KQ0KPiAgIAkJCWtjbF9yZXNlcnZh
dGlvbl9vYmplY3RfdW5sb2NrKGJvLT5yZXN2KTsNCj4gICAJCXNwaW5fdW5sb2NrKCZnbG9iLT5s
cnVfbG9jayk7DQo+ICsJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9s
aXN0KTsNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgCX0NCj4gICANCj4gICAJdHRtX2JvX2RlbF9m
cm9tX2xydShibyk7DQo+ICAgCWxpc3RfZGVsX2luaXQoJmJvLT5kZGVzdHJveSk7DQo+ICAgCWty
ZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVmX2J1Zyk7DQo+IC0NCj4gICAJc3Bpbl91
bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4gICAJdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2Uo
Ym8pOw0KPiArCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsN
Cj4gKw0KPiArCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPiArCWxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZShyZXN2X2JvLCByZXN2X2JvX25leHQsICZiby0+YmRldi0+ZGRlc3Ryb3ksIGRk
ZXN0cm95KSB7DQo+ICsJCWlmIChyZXN2X2JvLT5yZXN2ID09IGJvLT5yZXN2KSB7DQo+ICsJCQl0
dG1fYm9fZGVsX2Zyb21fbHJ1KHJlc3ZfYm8pOw0KPiArCQkJbGlzdF9kZWxfaW5pdCgmcmVzdl9i
by0+ZGRlc3Ryb3kpOw0KPiArCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4gKwkJ
CXR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNlKHJlc3ZfYm8pOw0KPiArCQkJa3JlZl9wdXQoJnJl
c3ZfYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+ICsJCQlzcGluX2xvY2so
Jmdsb2ItPmxydV9sb2NrKTsNCj4gKwkJfQ0KPiArCX0NCj4gKwlzcGluX3VubG9jaygmZ2xvYi0+
bHJ1X2xvY2spOw0KPiAgIA0KPiAgIAlpZiAodW5sb2NrX3Jlc3YpDQo+ICAgCQlrY2xfcmVzZXJ2
YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVzdik7DQo+IEBAIC02MzksOSArNjU5LDggQEAgc3Rh
dGljIGJvb2wgdHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LCBib29sIHJlbW92ZV9hbGwpDQo+ICAgCQkJdHRtX2JvX2NsZWFudXBfcmVmcyhibywgZmFsc2Us
ICFyZW1vdmVfYWxsLCB0cnVlKTsNCj4gICAJCX0gZWxzZSB7DQo+ICAgCQkJc3Bpbl91bmxvY2so
Jmdsb2ItPmxydV9sb2NrKTsNCj4gKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9f
cmVsZWFzZV9saXN0KTsNCj4gICAJCX0NCj4gLQ0KPiAtCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3Jl
ZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+ICAgCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2Nr
KTsNCj4gICAJfQ0KPiAgIAlsaXN0X3NwbGljZV90YWlsKCZyZW1vdmVkLCAmYmRldi0+ZGRlc3Ry
b3kpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
