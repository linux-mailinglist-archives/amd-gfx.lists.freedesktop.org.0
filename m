Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD99A0FFD
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2C689F33;
	Thu, 29 Aug 2019 03:40:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8689F33
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8XQRFo5t7qBZsWboaUjxNssYnRFoFLyDDewOM1C9Pp9JoevT7KCytCXND9RoSMVRWsEyayXI8z94j9pyUXutOt9XHkR9Fml1d3X16B5F5T6sW+cTSfvWMIKx95Q7N+3Oz6HOVcO52LKDpBZlilj/+AG7+pvRjTp76/E57aOCTgl4ceA+1WsB6yl9ilQx4Gt1mh7Nbz/x1YQdK+S8jBZPABvDeWRkdPa/TCGW3/3yIcnkQ98Fa+qeQwkXomNFPcO3mSkGQUSA4W+s5jneRIxX8IXz0XCZXHCyOBWsPLTG7XVhLnz+5R1O6F2cJ5AjmsZUPSWXiuywv54mNQb080XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avw1peQULd/NDzYG8RmI/1/jVY6esGe99sGsjIzBeaY=;
 b=U/n1akyaeHCb5A5dny+uVks3hgzLSvprIq5irNVAIEgw2gSXVgvfJGgmLoalJ/ro1sv7/Pw0FiE93WHq0iKHOm+NO/eSH8bTWA/xBQDMJIiRgP4fXizShsy8GHQI4qDYk9sKBJ1ZkdMI7i1L1nrKNWBCrIMj9CqdvaJW/qZ/Pbd1OBE0CJgoyaIYFa5WUX6pnM8kokOP8jmd/gfFDm0rHHxX7pXIWMZG9KWmcgZF2g5X5hLexLyGXgN3eUAguwX0OdvfA2eBTnvMTDXxuyRT1o1cmjStAjmnKQGFFgeZfaFYnFYaJi44xle3qmrjdmYuSZQx1TM1ogetaBLt5ZMsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3263.namprd12.prod.outlook.com (20.179.80.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Thu, 29 Aug 2019 03:40:41 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:40:41 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
Thread-Topic: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
Thread-Index: AQHVXaEHl+sHxLs4EEGDQd7lEUd0y6cRezag
Date: Thu, 29 Aug 2019 03:40:41 +0000
Message-ID: <MN2PR12MB3054E5F6FC389201F8C841A1B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-5-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-5-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aae09b5a-159e-4659-69f3-08d72c32aaa5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3263; 
x-ms-traffictypediagnostic: MN2PR12MB3263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3263EBCCB53C7A8B0741A37AB0A20@MN2PR12MB3263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(13464003)(199004)(189003)(52536014)(7736002)(74316002)(66476007)(66556008)(64756008)(66446008)(6436002)(186003)(76176011)(53936002)(8676002)(5660300002)(446003)(14454004)(86362001)(81166006)(81156014)(11346002)(66946007)(71190400001)(71200400001)(102836004)(110136005)(26005)(53546011)(6506007)(76116006)(256004)(316002)(486006)(229853002)(33656002)(25786009)(99286004)(476003)(7696005)(3846002)(6246003)(6636002)(6116002)(2501003)(305945005)(55016002)(478600001)(66066001)(2906002)(4326008)(9686003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3263;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJG7BRhA97BRK30bFZLCbV+6lscy4LGLPymvZLJFjrOIE44pCuSTaSZ3iUivu7fR1DmSxOk01YKUm+f8XXkN7k4MQlY1iIaOFBNiFcN/XT53GoZvXl3wVUQFuQC81kkZ1PDkHSdmg3PXxMNU/OvyEo6xepNv26IxKxHBlGFP7fGGgTJfXAKL2XvZrwPuJin2JzCEMv0eWBF5GqAL0Ez9rb6CsRwsM50eeGDliMf69MgjtO8zge/AsXBUbAlSelSionVYp+kwz7J8CLwN9j/TtEJiahBhbRusKDR/u1dVFmkEOJaApw8z22Rqj28dCrtILsw36RdjKJeR9kBtMgEKDUVf2r6ea476aniDw+qseCk6jqjmcCNUGxORG3rKSawmxjr9S4A96fX+sSPBMxTw9cBfRTK7q5PK4tej3+qDfs8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae09b5a-159e-4659-69f3-08d72c32aaa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:40:41.7819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxfgYKNi8ArOm15ny/nppK0cjeUCRQjcuj7YSzU32tBQJe/BQwruyMxCFvZq4N35
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3263
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avw1peQULd/NDzYG8RmI/1/jVY6esGe99sGsjIzBeaY=;
 b=vhjXno//q6O5VCL84kdzM9s8yVRJIsM2n+eGgI0yOOQRvEWAMPyXKuGov36pijcxvtrgxCOHAeC+dx1eaFXHSPVZCBAUC+qS9I7UoU3ygn1asA7cipFBTLBeD3RloJ3UsLeVDjAlFe5ElkMW3FMqcq49zS7i6pXoX85brx/dD1E=
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
ZWN0OiBbUEFUQ0ggNS83XSBkcm0vYW1kZ3B1OiBhZGQgbW1odWIgcmFzX2xhdGVfaW5pdCBjYWxs
YmFjaw0KPiBmdW5jdGlvbg0KPiANCj4gVGhlIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGluIGxh
dGUgaW5pdCBwaGFzZSB0byBkbyBtbWh1YiByYXMgaW5pdA0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgfCAyMSArKy0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYyAgIHwgMjgNCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbW1odWIuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9tbWh1Yi5oDQo+IGluZGV4IDJkNzVlY2YuLmRmMDRjNzEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oDQo+IEBAIC0yMyw2ICsyMyw3
IEBADQo+IA0KPiAgc3RydWN0IGFtZGdwdV9tbWh1Yl9mdW5jcyB7DQo+ICAJdm9pZCAoKnJhc19p
bml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICsJaW50ICgqcmFzX2xhdGVfaW5p
dCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgCXZvaWQgKCpxdWVyeV9yYXNfZXJy
b3JfY291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQkJCQl2b2lkICpyYXNf
ZXJyb3Jfc3RhdHVzKTsNCj4gIH07DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYw0KPiBpbmRleCA4ZGMxM2QyLi4yNmE2OTU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTc2Miw3ICs3NjIsNiBAQCBzdGF0aWMgaW50IGdtY192
OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKSAgew0KPiAgCWludCByOw0KPiAgCXN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0K
PiAtCXN0cnVjdCByYXNfaWhfaWYgbW1odWJfaWhfaW5mbzsNCj4gIAlzdHJ1Y3QgcmFzX2ZzX2lm
IHVtY19mc19pbmZvID0gew0KPiAgCQkuc3lzZnNfbmFtZSA9ICJ1bWNfZXJyX2NvdW50IiwNCj4g
IAkJLmRlYnVnZnNfbmFtZSA9ICJ1bWNfZXJyX2luamVjdCIsDQo+IEBAIC03NzAsMTAgKzc2OSw2
IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAJ
c3RydWN0IHJhc19paF9pZiB1bWNfaWhfaW5mbyA9IHsNCj4gIAkJLmNiID0gZ21jX3Y5XzBfcHJv
Y2Vzc19yYXNfZGF0YV9jYiwNCj4gIAl9Ow0KPiAtCXN0cnVjdCByYXNfZnNfaWYgbW1odWJfZnNf
aW5mbyA9IHsNCj4gLQkJLnN5c2ZzX25hbWUgPSAibW1odWJfZXJyX2NvdW50IiwNCj4gLQkJLmRl
YnVnZnNfbmFtZSA9ICJtbWh1Yl9lcnJfaW5qZWN0IiwNCj4gLQl9Ow0KPiANCj4gIAlpZiAoIWFk
ZXYtPmdtYy51bWNfcmFzX2lmKSB7DQo+ICAJCWFkZXYtPmdtYy51bWNfcmFzX2lmID0ga21hbGxv
YyhzaXplb2Yoc3RydWN0DQo+IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsgQEAgLTc5Nywy
NSArNzkyLDEzIEBAIHN0YXRpYyBpbnQNCj4gZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpo
YW5kbGUpDQo+ICAJCQlnb3RvIGZyZWU7DQo+ICAJfQ0KPiANCj4gLQlpZiAoIWFkZXYtPmdtYy5t
bWh1Yl9yYXNfaWYpIHsNCj4gLQkJYWRldi0+Z21jLm1taHViX3Jhc19pZiA9IGttYWxsb2Moc2l6
ZW9mKHN0cnVjdA0KPiByYXNfY29tbW9uX2lmKSwgR0ZQX0tFUk5FTCk7DQo+IC0JCWlmICghYWRl
di0+Z21jLm1taHViX3Jhc19pZikNCj4gLQkJCXJldHVybiAtRU5PTUVNOw0KPiAtCQlhZGV2LT5n
bWMubW1odWJfcmFzX2lmLT5ibG9jayA9DQo+IEFNREdQVV9SQVNfQkxPQ0tfX01NSFVCOw0KPiAt
CQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT50eXBlID0NCj4gQU1ER1BVX1JBU19FUlJPUl9fTVVM
VElfVU5DT1JSRUNUQUJMRTsNCj4gLQkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+c3ViX2Jsb2Nr
X2luZGV4ID0gMDsNCj4gLQkJc3RyY3B5KGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPm5hbWUsICJt
bWh1YiIpOw0KPiAtCX0NCj4gLQltbWh1Yl9paF9pbmZvLmhlYWQgPSBtbWh1Yl9mc19pbmZvLmhl
YWQgPSAqYWRldi0NCj4gPmdtYy5tbWh1Yl9yYXNfaWY7DQo+IC0JciA9IGFtZGdwdV9yYXNfbGF0
ZV9pbml0KGFkZXYsIGFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYsDQo+IC0JCQkJICZtbWh1Yl9mc19p
bmZvLCAmbW1odWJfaWhfaW5mbyk7DQo+ICsJciA9IGFkZXYtPm1taHViX2Z1bmNzLT5yYXNfbGF0
ZV9pbml0KGFkZXYpOw0KW1Rhb10gSXQncyBiZXR0ZXIgdG8gYWRkICJpZiAoYWRldi0+bW1odWJf
ZnVuY3MtPnJhc19sYXRlX2luaXQoYWRldikpIg0KDQo+ICAJaWYgKHIpDQo+IC0JCWdvdG8gZnJl
ZTsNCj4gKwkJcmV0dXJuIHI7DQo+IA0KPiAgCXJldHVybiAwOw0KPiAgZnJlZToNCj4gIAlrZnJl
ZShhZGV2LT5nbWMudW1jX3Jhc19pZik7DQo+IC0Ja2ZyZWUoYWRldi0+Z21jLm1taHViX3Jhc19p
Zik7DQo+ICAJcmV0dXJuIHI7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbW1odWJfdjFfMC5jDQo+IGluZGV4IDA0Y2Q0YjYuLjlmN2Q1ZDEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMNCj4gQEAgLTMxLDYgKzMxLDcgQEANCj4g
ICNpbmNsdWRlICJ2ZWdhMTBfZW51bS5oIg0KPiANCj4gICNpbmNsdWRlICJzb2MxNV9jb21tb24u
aCINCj4gKyNpbmNsdWRlICJhbWRncHVfcmFzLmgiDQo+IA0KPiAgI2RlZmluZSBtbURBR0IwX0NO
VExfTUlTQzJfUlYgMHgwMDhmDQo+ICAjZGVmaW5lIG1tREFHQjBfQ05UTF9NSVNDMl9SVl9CQVNF
X0lEWCAwIEBAIC02MTUsNiArNjE2LDMzIEBADQo+IHN0YXRpYyB2b2lkIG1taHViX3YxXzBfcXVl
cnlfcmFzX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2LA0KPiAgCX0N
Cj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IG1taHViX3YxXzBfcmFzX2xhdGVfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikgew0KPiArCWludCByOw0KPiArCXN0cnVjdCByYXNfaWhfaWYg
bW1odWJfaWhfaW5mbzsNCj4gKwlzdHJ1Y3QgcmFzX2ZzX2lmIG1taHViX2ZzX2luZm8gPSB7DQo+
ICsJCS5zeXNmc19uYW1lID0gIm1taHViX2Vycl9jb3VudCIsDQo+ICsJCS5kZWJ1Z2ZzX25hbWUg
PSAibW1odWJfZXJyX2luamVjdCIsDQo+ICsJfTsNCj4gKw0KPiArCWlmICghYWRldi0+Z21jLm1t
aHViX3Jhc19pZikgew0KPiArCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmID0ga21hbGxvYyhzaXpl
b2Yoc3RydWN0DQo+IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsNCj4gKwkJaWYgKCFhZGV2
LT5nbWMubW1odWJfcmFzX2lmKQ0KPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCWFkZXYtPmdt
Yy5tbWh1Yl9yYXNfaWYtPmJsb2NrID0NCj4gQU1ER1BVX1JBU19CTE9DS19fTU1IVUI7DQo+ICsJ
CWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnR5cGUgPQ0KPiBBTURHUFVfUkFTX0VSUk9SX19NVUxU
SV9VTkNPUlJFQ1RBQkxFOw0KPiArCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT5zdWJfYmxvY2tf
aW5kZXggPSAwOw0KPiArCQlzdHJjcHkoYWRldi0+Z21jLm1taHViX3Jhc19pZi0+bmFtZSwgIm1t
aHViIik7DQo+ICsJfQ0KPiArCW1taHViX2loX2luZm8uaGVhZCA9IG1taHViX2ZzX2luZm8uaGVh
ZCA9ICphZGV2LQ0KPiA+Z21jLm1taHViX3Jhc19pZjsNCj4gKwlyID0gYW1kZ3B1X3Jhc19sYXRl
X2luaXQoYWRldiwgYWRldi0+Z21jLm1taHViX3Jhc19pZiwNCj4gKwkJCQkgJm1taHViX2ZzX2lu
Zm8sICZtbWh1Yl9paF9pbmZvKTsNCj4gKwlpZiAocikNCj4gKwkJa2ZyZWUoYWRldi0+Z21jLm1t
aHViX3Jhc19pZik7DQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4gIGNvbnN0IHN0cnVjdCBh
bWRncHVfbW1odWJfZnVuY3MgbW1odWJfdjFfMF9mdW5jcyA9IHsNCj4gKwkucmFzX2xhdGVfaW5p
dCA9IG1taHViX3YxXzBfcmFzX2xhdGVfaW5pdCwNCj4gIAkucXVlcnlfcmFzX2Vycm9yX2NvdW50
ID0gbW1odWJfdjFfMF9xdWVyeV9yYXNfZXJyb3JfY291bnQsICB9Ow0KPiAtLQ0KPiAyLjcuNA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
