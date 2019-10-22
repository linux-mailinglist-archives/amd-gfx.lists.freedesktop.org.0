Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9DE0532
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 15:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BDC6E7CD;
	Tue, 22 Oct 2019 13:36:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DCD6E7CD
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 13:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2pzgflX1qVA70F4n1vnBWlkuv+hpYmtU/DkbTxEgixSNDq3eq60RAPGUvY3HO879ZCQs+X1Owzga6yRon8mENUIgkd33D+jHZLcV3IPiMi/WBLUdO9G9l+Sf5x+r0KEaaGftunqKO0s/8k1ZhVdn/5zN8YGAW5U1H1M1QFkmqvbETPui5zohSQHUDeD07JDO0AUTJOwIYsVoNN2yxlrMDbohfmKtTB7FmfXVbopDXhk8ujEJjDtoR/nIUqxbWbBLFuBSx90btb5NHwM0C4QELaPv23k4XGKkElNZo1bdzZbj5KrBe7BipkZZbuuAqwpT6t7OvQztfkjQ9xzfISLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z/Tr8nBKUq0XiKqpYwWnDehQSgHiI+Du9WmGXNeECI=;
 b=GVLiKS6tW4D8mMlWovC7iFC4DVq9iid62FjWAIuBfDlxChTyCPuKRWUgLuE44xzSd7pxhiDGWGv0QlwNL1weJfoN6+MmiET4apg+TL+RyUUXorIhtFm0VhMAh53uIHIoJHqdVSSfsmRX9QyfLj2jYhx6Fe3y+xsbbbK3ah/8A+BCHwfrbGDoa8dTKxKZuUyqK42bq/HwbwQYGcmQZeu3TFN9hgTDlgnCoxcbXSFkktOw31BcS9MozZxqOBoMcVW6ex9YIb3An40CWcY/Y7Y2Potcev/XOghZ5EK5dGEmuubOsqNALAfExc5GLjIJ65Kzbb6HiP5fKFFhGyf7DUlX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1266.namprd12.prod.outlook.com (10.168.223.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 22 Oct 2019 13:36:41 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.029; Tue, 22 Oct
 2019 13:36:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH] drm/amdgpu: define macros for retire page reservation
Thread-Topic: [PATCH] drm/amdgpu: define macros for retire page reservation
Thread-Index: AQHViIrX0lOx6dcy6EyYgsJ+qBQV6qdmqjgg
Date: Tue, 22 Oct 2019 13:36:40 +0000
Message-ID: <BN6PR12MB18095A3C4308C54C8F22E659F7680@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191022034256.30266-1-guchun.chen@amd.com>
In-Reply-To: <20191022034256.30266-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f823209c-81fb-4f92-daa6-08d756f4df07
x-ms-traffictypediagnostic: BN6PR12MB1266:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12668AEFCE82A73A2F5050CCF7680@BN6PR12MB1266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(13464003)(25786009)(110136005)(256004)(14454004)(7696005)(14444005)(316002)(99286004)(76176011)(478600001)(66066001)(52536014)(966005)(71190400001)(74316002)(33656002)(71200400001)(7736002)(305945005)(6636002)(186003)(486006)(2906002)(446003)(6246003)(11346002)(76116006)(3846002)(86362001)(66476007)(66946007)(6306002)(66446008)(6436002)(6116002)(66556008)(64756008)(81166006)(102836004)(4326008)(53546011)(6506007)(2501003)(5660300002)(8936002)(26005)(229853002)(8676002)(476003)(9686003)(55016002)(81156014)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +JHa8pRAysvRRBGVJ7vw8cCZtK7SBVhbNgr7NIzFoiwVY5UCmcmVYDXtW9nC6xtxfjXUcgR6HRFu3oQ3tccGcchh4XcgLPaHAqocq0t6wX+XblMTMjl4BNp/YnuDyDj8DZvRkJg3RmelrIG6FquzO8LWdwh2FHE0/0EVJ1HZKT9hZDr1LWl3zL+d3nmnfSNRMX67Q9g6OAkhJN6tyFvpViRp4R3Lfx7JIlIQoOaHs7xOiNZ1LYeAFksOVv1U0fDC4P5PMf/bkLNu6XF34F8JY4WUHq44kaxujU3ceK1kxXle9mbqINzzCJO0o5C7aXR+ZbSSTvVUB7rCIXK66brHLH1w2Bc53QICN45QuRpQ+R8VSxP3XH0AjSqMV4OVfSt+8kPXTLXxRAQ3aB5L2Zw3Wtga/ZkLFUfylYSy7OBO28+pQ9N8bYsVxgnNR86uAgUbemwSTRtqhB3VIFZNM+MwYzaN8evv0VfREwzTFJx5CxE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f823209c-81fb-4f92-daa6-08d756f4df07
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 13:36:40.9447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o59GF2KKWgrMzmoQQ8phz4AhSOGDADcYeK8e2Mw2ICfbqqMUJX5n0dsyorfj7ZbKt81OcfMs+41dm2B68PCThA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z/Tr8nBKUq0XiKqpYwWnDehQSgHiI+Du9WmGXNeECI=;
 b=o6PGH2QMn1ZLGrxguSvb1lkd99Ub2+VvQpcQlTdQA6Yciw+BRXNZkCtJmoWuiplJP9psSoMHmDU09JiKFbrKYg7t9f0Cp06TIHLTAd6vPJf64EZaiZLwurznr/BO2dZBMylJ0sZGeoaACPeEC1cJT7EnonJEnIVFDWMSDbHgobw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQ2hlbiwgR3VjaHVu
DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMSwgMjAxOSAxMTo0MyBQTQ0KPiBUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47DQo+IEdyb2R6b3Zza3ks
IEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IFpob3UxLCBUYW8NCj4gPFRhby5a
aG91MUBhbWQuY29tPg0KPiBDYzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRlZmluZSBtYWNyb3MgZm9yIHJldGlyZSBw
YWdlIHJlc2VydmF0aW9uDQo+IA0KPiBFYXN5IGZvciBtYWludGFpbmFuY2UuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDE3ICsrKysrKysrKysr
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gaW5k
ZXggMmQ5ZTEzZDJhNzFhLi43OTYzMjZiMzZlMDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTY4LDYgKzY4LDExIEBAIGNvbnN0IGNoYXIgKnJh
c19ibG9ja19zdHJpbmdbXSA9IHsNCj4gIC8qIGluamVjdCBhZGRyZXNzIGlzIDUyIGJpdHMgKi8N
Cj4gICNkZWZpbmUJUkFTX1VNQ19JTkpFQ1RfQUREUl9MSU1JVAkoMHgxVUxMIDw8IDUyKQ0KPiAN
Cj4gK2VudW0gYW1kZ3B1X3Jhc19yZXRpcmVfcGFnZV9yZXNlcnZhdGlvbiB7DQo+ICsJQU1ER1BV
X1JBU19SRVRJUkVfUEFHRV9SRVNFUlZFRCwNCj4gKwlBTURHUFVfUkFTX1JFVElSRV9QQUdFX1BF
TkRJTkcsDQo+ICsJQU1ER1BVX1JBU19SRVRJUkVfUEFHRV9GQVVMVCwNCj4gK307DQo+IA0KPiAg
YXRvbWljX3QgYW1kZ3B1X3Jhc19pbl9pbnRyID0gQVRPTUlDX0lOSVQoMCk7DQo+IA0KPiBAQCAt
ODA5LDExICs4MTQsMTEgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2JhZHBhZ2VzX3JlYWQoc3Ry
dWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsICBzdGF0aWMgY2hhcg0KPiAqYW1kZ3B1X3Jhc19i
YWRwYWdlX2ZsYWdzX3N0cih1bnNpZ25lZCBpbnQgZmxhZ3MpICB7DQo+ICAJc3dpdGNoIChmbGFn
cykgew0KPiAtCWNhc2UgMDoNCj4gKwljYXNlIEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfUkVTRVJW
RUQ6DQo+ICAJCXJldHVybiAiUiI7DQo+IC0JY2FzZSAxOg0KPiArCWNhc2UgQU1ER1BVX1JBU19S
RVRJUkVfUEFHRV9QRU5ESU5HOg0KPiAgCQlyZXR1cm4gIlAiOw0KPiAtCWNhc2UgMjoNCj4gKwlj
YXNlIEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfRkFVTFQ6DQo+ICAJZGVmYXVsdDoNCj4gIAkJcmV0
dXJuICJGIjsNCj4gIAl9Ow0KPiBAQCAtMTI5NCwxMyArMTI5OSwxMyBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
IAkJKCpicHMpW2ldID0gKHN0cnVjdCByYXNfYmFkcGFnZSl7DQo+ICAJCQkuYnAgPSBkYXRhLT5i
cHNbaV0ucmV0aXJlZF9wYWdlLA0KPiAgCQkJLnNpemUgPSBBTURHUFVfR1BVX1BBR0VfU0laRSwN
Cj4gLQkJCS5mbGFncyA9IDAsDQo+ICsJCQkuZmxhZ3MgPSBBTURHUFVfUkFTX1JFVElSRV9QQUdF
X1JFU0VSVkVELA0KPiAgCQl9Ow0KPiANCj4gIAkJaWYgKGRhdGEtPmxhc3RfcmVzZXJ2ZWQgPD0g
aSkNCj4gLQkJCSgqYnBzKVtpXS5mbGFncyA9IDE7DQo+ICsJCQkoKmJwcylbaV0uZmxhZ3MgPQ0K
PiBBTURHUFVfUkFTX1JFVElSRV9QQUdFX1BFTkRJTkc7DQo+ICAJCWVsc2UgaWYgKGRhdGEtPmJw
c19ib1tpXSA9PSBOVUxMKQ0KPiAtCQkJKCpicHMpW2ldLmZsYWdzID0gMjsNCj4gKwkJCSgqYnBz
KVtpXS5mbGFncyA9DQo+IEFNREdQVV9SQVNfUkVUSVJFX1BBR0VfRkFVTFQ7DQo+ICAJfQ0KPiAN
Cj4gIAkqY291bnQgPSBkYXRhLT5jb3VudDsNCj4gLS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
