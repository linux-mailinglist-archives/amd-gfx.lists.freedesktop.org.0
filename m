Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5AA100A
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A810F89F33;
	Thu, 29 Aug 2019 03:48:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFE89F45
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgYFGnMl53OlEOMEm11v4aBr5rKT98pA1LOwxfatJzIn3mV0Sx4sc4JFXpYquYJlfkf84xNE0q9EWsMAtcQiahIPOHMOhoNczYYSj+a1GIoSnWlzBZt2EzMAIpgAAQdoRzVkG0En6RB1b2tQQQKUEZIS/H5Oe8UpBKkFaCPQm60QanZulJSWelZ7bvFKR/bzBIPDurJGGk7M4EK9yg7QGrR8673mA0R0L0UoqNn2bAsieKAWpmsxjyfgwkAOyahE8fZRSf8Z9eEra1NSv146QF5BueXeJL1nj1EBmh2VaMJ2QKT2QYGy+KeCMMplD6K+7ABjDR8yK47oYp58fkylxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZznHB+6qjOWjkC0s6Hllo4pZnyAgYlelnQXfHcGzTQ=;
 b=HyI/cxSRFmBXuuKPH77WR/uzrRYE9d7FEcCZ93IhQ8t/k79udKMAt+9f4r6YsfGBtdTN8e792dWj12gQaT7t9ps709e0v+1uP3P81QaSzUKh8tPmvFUN19+tnhJhwxQiUlf5YWSyAUCm4nilx//VG476Ha1IyPkB3D3gkunxULr6/9J49H8Psd+sMxjdCYMQjMfdi+FT6cZT7+YiEUshSbOVpCmRQd19EcU7ycX512DWSb0Rpik5mImq0t5eFS2Qw/aN8l3U0OqeUKCibfQxjQGBzh56IAiOKGRz1/kmbtqtgWHxj8t4AUSRCaPhxB930Y4AWS3rpDlfy9gyDPCVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3231.namprd12.prod.outlook.com (20.179.83.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 03:48:42 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:48:42 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for
 nbio v7_4
Thread-Topic: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for
 nbio v7_4
Thread-Index: AQHVXaEM/8KJV1wXokGq4RtfVuSpzqcRfJnw
Date: Thu, 29 Aug 2019 03:48:41 +0000
Message-ID: <MN2PR12MB30542D58869DF3B4883459C0B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-6-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-6-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be4c0216-53e2-4978-1e0b-08d72c33c8db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3231; 
x-ms-traffictypediagnostic: MN2PR12MB3231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB323125458AE9027577533597B0A20@MN2PR12MB3231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(13464003)(189003)(199004)(5660300002)(305945005)(3846002)(6116002)(53546011)(6506007)(476003)(53936002)(74316002)(33656002)(71190400001)(6636002)(6246003)(71200400001)(25786009)(14454004)(52536014)(11346002)(9686003)(446003)(55016002)(6436002)(86362001)(4326008)(478600001)(7736002)(76176011)(76116006)(256004)(26005)(102836004)(81166006)(486006)(8676002)(81156014)(66556008)(110136005)(64756008)(7696005)(66446008)(66476007)(316002)(66946007)(8936002)(99286004)(229853002)(66066001)(2501003)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3231;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z3e0GZZlYY97+7yxsVxPfbFozYPjnLrIv608kn85QQ/p0Pp8X3VsPi+KLbxxPYP/2dUkBCdOT7M8qLEupMVL34Z8xUU0fScinKV4eKUh2fa2NIgh0qgYjfwMwRITntg5dArmvt0BgNSzeq4NqYMQbrCbtrf+FaZGb+No+UWmLpDWus0/MBNOBy+PBCPjHdJgsmu/QVBZwlgtUhoAywoLujHV9EGBHR823j5pUscQ2qcylB7XjdJdEMDwilCSFantOToC1EB07K+TapSaz5UekMr8Z8pyCw0mKPugrH5h794XXpfbIotVUfcksN3f/FOSPPqRp+aqvzbZUytQvkvR3/cubjNnhnUI7OebF9YtsqmEuJHnyB7AGEtdrkv/VINCNLqDBn5OBGb7QGT01m2AOIlON5LQcAUqw7TkgOTE2i0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4c0216-53e2-4978-1e0b-08d72c33c8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:48:41.9782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ynt7ZnbHrKIugxV1URNku56mTKSrK9PEwNrM0PnJ8zHPyLYCgyh0J4g5PjJAxj5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZznHB+6qjOWjkC0s6Hllo4pZnyAgYlelnQXfHcGzTQ=;
 b=U9LAb49uTDCMu5rCaao9CvzwtG3stnrOKuPphWudqHYA3KxVYx106pA1jNnSjNoOu+OzTXqmesdCqTYc2BNw3xR0Dh5/mYQHk2vyQ9t6CiE6KrcsR9f+ufBeqQkuEK0+RSz/StioLTCIatBJqtjrYWl7sUbb7NwDOBgtXOOpqUc=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDI45pelIDIxOjAzDQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+Ow0KPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+DQo+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggNi83XSBkcm0vYW1kZ3B1OiBhZGQgcmFzX2xhdGVfaW5pdCBjYWxsYmFjayBm
dW5jdGlvbiBmb3INCj4gbmJpbyB2N180DQo+IA0KPiByYXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZ1
bmN0aW9uIHdpbGwgYmUgdXNlZCB0byBkbyBjb21tb24gcmFzIGluaXQgaW4gbGF0ZSBpbml0DQo+
IHBoYXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9u
YmlvLmggfCAgMiArKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMg
ICB8IDQxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X25iaW8uaA0KPiBpbmRleCBhMDRjNWVhLi41MTA3OGRhNiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oDQo+IEBAIC04MSwxMiArODEsMTQg
QEAgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIHsNCj4gIAl2b2lkICgqaGFuZGxlX3Jhc19lcnJf
ZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nKShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRl
dik7DQo+ICAJaW50ICgqaW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsNCj4gIAlpbnQgKCppbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50
ZXJydXB0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldik7DQo+ICsJaW50ICgqcmFzX2xh
dGVfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgfTsNCj4gDQo+ICBzdHJ1
Y3QgYW1kZ3B1X25iaW8gew0KPiAgCWNvbnN0IHN0cnVjdCBuYmlvX2hkcF9mbHVzaF9yZWcgKmhk
cF9mbHVzaF9yZWc7DQo+ICAJc3RydWN0IGFtZGdwdV9pcnFfc3JjIHJhc19jb250cm9sbGVyX2ly
cTsNCj4gIAlzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgcmFzX2Vycl9ldmVudF9hdGh1Yl9pcnE7DQo+
ICsJc3RydWN0IHJhc19jb21tb25faWYgKnJhc19pZjsNCj4gIAljb25zdCBzdHJ1Y3QgYW1kZ3B1
X25iaW9fZnVuY3MgKmZ1bmNzOyAgfTsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L25iaW9fdjdfNC5jDQo+IGluZGV4IGZhZjkzMDAuLjM2N2Y5ZDYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+IEBAIC0yMyw2ICsyMyw3IEBADQo+ICAjaW5j
bHVkZSAiYW1kZ3B1LmgiDQo+ICAjaW5jbHVkZSAiYW1kZ3B1X2F0b21iaW9zLmgiDQo+ICAjaW5j
bHVkZSAibmJpb192N180LmgiDQo+ICsjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5oIg0KPiANCj4gICNp
bmNsdWRlICJuYmlvL25iaW9fN180X29mZnNldC5oIg0KPiAgI2luY2x1ZGUgIm5iaW8vbmJpb183
XzRfc2hfbWFzay5oIg0KPiBAQCAtNDY4LDYgKzQ2OSw0NSBAQCBzdGF0aWMgaW50DQo+IG5iaW9f
djdfNF9pbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0IChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyBpbnQgbmJpb192N180
X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsNCj4gKwlpbnQgcjsN
Cj4gKwlzdHJ1Y3QgcmFzX2loX2lmIGloX2luZm87DQo+ICsJc3RydWN0IHJhc19mc19pZiBmc19p
bmZvID0gew0KPiArCQkuc3lzZnNfbmFtZSA9ICJuYmlvX2Vycl9jb3VudCIsDQo+ICsJCS5kZWJ1
Z2ZzX25hbWUgPSAibmJpb19lcnJfaW5qZWN0IiwNCltUYW9dIFRoZSByYXMgYmxvY2sgbmFtZSBp
cyBBTURHUFVfUkFTX0JMT0NLX1BDSUVfQklGIGFuZCBpdHMgc3RyaW5nIG5hbWUgaXMgcGNpZV9i
aWYgaW4gcmFzX2Jsb2NrX3N0cmluZywNClFBIG1heSBiZSBjb25mdXNlZCBpbiB0aGUgZnV0dXJl
Lg0KDQo+ICsJfTsNCj4gKw0KPiArCWlmICghYWRldi0+bmJpby5yYXNfaWYpIHsNCj4gKwkJYWRl
di0+bmJpby5yYXNfaWYgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1vbl9pZiksDQo+
IEdGUF9LRVJORUwpOw0KPiArCQlpZiAoIWFkZXYtPm5iaW8ucmFzX2lmKQ0KPiArCQkJcmV0dXJu
IC1FTk9NRU07DQo+ICsJCWFkZXYtPm5iaW8ucmFzX2lmLT5ibG9jayA9IEFNREdQVV9SQVNfQkxP
Q0tfX1BDSUVfQklGOw0KPiArCQlhZGV2LT5uYmlvLnJhc19pZi0+dHlwZSA9DQo+IEFNREdQVV9S
QVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7DQo+ICsJCWFkZXYtPm5iaW8ucmFzX2lmLT5z
dWJfYmxvY2tfaW5kZXggPSAwOw0KPiArCQlzdHJjcHkoYWRldi0+bmJpby5yYXNfaWYtPm5hbWUs
ICJuYmlvIik7DQo+ICsJfQ0KPiArCWloX2luZm8uaGVhZCA9IGZzX2luZm8uaGVhZCA9ICphZGV2
LT5uYmlvLnJhc19pZjsNCj4gKwlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+
bmJpby5yYXNfaWYsDQo+ICsJCQkJICZmc19pbmZvLCAmaWhfaW5mbyk7DQo+ICsJaWYgKHIpDQo+
ICsJCWdvdG8gZnJlZTsNCj4gKw0KPiArCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2
LCBhZGV2LT5uYmlvLnJhc19pZi0+YmxvY2spKSB7DQo+ICsJCXIgPSBhbWRncHVfaXJxX2dldChh
ZGV2LCAmYWRldi0+bmJpby5yYXNfY29udHJvbGxlcl9pcnEsIDApOw0KPiArCQlpZiAocikNCj4g
KwkJCWdvdG8gZnJlZTsNCj4gKwkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LQ0KPiA+
bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycSwgMCk7DQo+ICsJCWlmIChyKQ0KPiArCQkJZ290
byBmcmVlOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArZnJlZToNCj4gKwlrZnJlZShh
ZGV2LT5uYmlvLnJhc19pZik7DQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4gIGNvbnN0IHN0
cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7DQo+ICAJLmdldF9oZHBf
Zmx1c2hfcmVxX29mZnNldCA9IG5iaW9fdjdfNF9nZXRfaGRwX2ZsdXNoX3JlcV9vZmZzZXQsDQo+
ICAJLmdldF9oZHBfZmx1c2hfZG9uZV9vZmZzZXQgPQ0KPiBuYmlvX3Y3XzRfZ2V0X2hkcF9mbHVz
aF9kb25lX29mZnNldCwNCj4gQEAgLTQ5Myw0ICs1MzMsNSBAQCBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X25iaW9fZnVuY3MgbmJpb192N180X2Z1bmNzID0gew0KPiAgCS5oYW5kbGVfcmFzX2Vycl9ldmVu
dF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcgPQ0KPiBuYmlvX3Y3XzRfaGFuZGxlX3Jhc19lcnJfZXZl
bnRfYXRodWJfaW50cl9ub19iaWZyaW5nLA0KPiAgCS5pbml0X3Jhc19jb250cm9sbGVyX2ludGVy
cnVwdCA9DQo+IG5iaW9fdjdfNF9pbml0X3Jhc19jb250cm9sbGVyX2ludGVycnVwdCwNCj4gIAku
aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCA9DQo+IG5iaW9fdjdfNF9pbml0X3Jh
c19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0LA0KPiArCS5yYXNfbGF0ZV9pbml0ID0gbmJpb192
N180X3Jhc19sYXRlX2luaXQsDQo+ICB9Ow0KPiAtLQ0KPiAyLjcuNA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
