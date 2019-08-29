Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEDFA113C
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 07:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058DC891E1;
	Thu, 29 Aug 2019 05:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE87891E1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 05:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W56ibaWeUcLihuIXasRzCGK3TPPB3RsDRJRJBdwaVDMImpGqSDVrnYI1qTmGAWnkKRPAMCSPpid+K1I0a7Bd8N6dg2UJqHtNToe6lzRiX+g+g8RSRptHHgCoffnsFXBPErYc7o6Dfm7hkeqkivldzYfIiZyyCXS6YxWmVwCzy6KuxQDxfQcXp8modtjQPeSVG96mLJd59EkBgORyKXg6Hz4fmWYJRloLgULpGxKikRT3NILfg4ctjPumBYyUAttKRwtJEq5/fwiwiBmgUESpYpc5wjsiXp50bG07hPkdlxYAV1g0R4i0a+K+forWHZLeMcQ6los050NIjH5IHIXUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kgb+vROlFjbKUGqr3b2kxUSJFQQVeaaOEtj5UJwDRjA=;
 b=GTPB1eYgsvA11jXw36FanpzZMh2W8BpG07EiuuVyJ0/HF9PLWTKVjv+0hT+sCrxy5FmIsGescXFSpy3xmfm1HDhX8ug8tTLnOrXP41B9uGRJmKNabVxBtHduztSW89XTcjOAzKZ3YsUvbi21MxBqhgvsC6OE5c4LCDI5RJCkNcH0bObhaIdQJBnK9fhvPL0TuCzU4uIbUATE+auzZrIAE6sY+RkrEx27XnVzs1sfPQD+yN56Y17406KdMme7/DG1OkqBCKsLNsTfWTMX+MHcEeJmub24rfOklBFNp28ajgEfjjyE4m3DeCAEvp1K79rphY9runWBcvRhyWB5lxxxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2583.namprd12.prod.outlook.com (52.132.141.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 05:52:18 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 05:52:18 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for
 nbio v7_4
Thread-Topic: [PATCH 6/7] drm/amdgpu: add ras_late_init callback function for
 nbio v7_4
Thread-Index: AQHVXaEMQX8M/4T+xEG7gxH+FJxfx6cRfgmAgAAh/4A=
Date: Thu, 29 Aug 2019 05:52:18 +0000
Message-ID: <DM5PR12MB1418541F4A70C0775EAD7604FCA20@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-6-git-send-email-Hawking.Zhang@amd.com>
 <MN2PR12MB30542D58869DF3B4883459C0B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB30542D58869DF3B4883459C0B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 945de7c8-7d9f-4cee-f8c9-08d72c450d4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2583; 
x-ms-traffictypediagnostic: DM5PR12MB2583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25839293EC7852BBFEA48B52FCA20@DM5PR12MB2583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(13464003)(189003)(199004)(66066001)(486006)(9686003)(66556008)(7696005)(6246003)(74316002)(7736002)(11346002)(6636002)(446003)(305945005)(476003)(76176011)(55016002)(52536014)(66476007)(256004)(66446008)(66946007)(14444005)(76116006)(64756008)(2906002)(478600001)(5660300002)(33656002)(99286004)(6116002)(229853002)(102836004)(14454004)(8936002)(6436002)(316002)(81166006)(71200400001)(53936002)(81156014)(8676002)(186003)(2501003)(25786009)(110136005)(53546011)(6506007)(26005)(86362001)(3846002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2583;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GZLSQk+cZjCbIPI0mrt1CJ3LlV6cEehDWS2lfihvKwk5pxWnU1ZDHjlyJUxbb8echeY2GMaznHuz+fGrn7GEOzXK4NCdXoWi3eGjJwA/zEbBuPItQoWzrgdC74cfoutMGkHW7Rd7ejM1ZOXShDNU3uix3g6mgi2MvuqrS4edfcQyRZ28/UTfW9Y2ngrB3lLwrrn03XJG3QuCk+nkImlxooLcHk0Tcxv2XM0uAGkDqHD+8n9wsFYxFKwlFrIlI9zHPbWNV5zF773TN0OxjYxdThRhW8QRdg0f8SX4J4cnJ4h6Xae5V8k5qvNC8Fc4ZChkswGZ4gdDE9lUsHFaiFg1/lCVg5bnyROzUHlMJ4f6kcOE4q230z331C9ZYiOyM6OHDYB6j2M4kSxAZ6CpYv5O4tE5vAZSJlNLzgkzkw8i+mQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945de7c8-7d9f-4cee-f8c9-08d72c450d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 05:52:18.2724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vX4pidYAm5jSmOm35a8+yQDsNvtFpcAElz5Y74tkEpv5EjHzxZsrVdTjzd5Gxzs2clQOTNAXU2na9rJ835mgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kgb+vROlFjbKUGqr3b2kxUSJFQQVeaaOEtj5UJwDRjA=;
 b=aKRmF+rpQx29G3VASN2greqpWMCjmdYw4xzuhoSwkSK0WixUbBm3cRW8r5fj9CH9Di750tpzBcdmyP6Y+2bub5NWqXaanIwhCTJT7IdWOktNK1OM+TRFEqz7nIhSQUAz91jDcMCjW16MTM6601moD8DH2fqEyfauEtRFJQ+cg1I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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

UkUgLSBbVGFvXSBUaGUgcmFzIGJsb2NrIG5hbWUgaXMgQU1ER1BVX1JBU19CTE9DS19QQ0lFX0JJ
RiBhbmQgaXRzIHN0cmluZyBuYW1lIGlzIHBjaWVfYmlmIGluIHJhc19ibG9ja19zdHJpbmcsIFFB
IG1heSBiZSBjb25mdXNlZCBpbiB0aGUgZnV0dXJlLg0KDQpJIGhhdmUgbm8gc3Ryb25nIG9waW5p
b24gb24gdGhlIG5hbWluZy4gYnV0IGl0J3MgZ29vZCB0byBhbGlnbiB3aXRoIHRoZSBibG9jayBz
dHJpbmcgdG8gYXZvaWQgY29uZnVzaW5nLiBXaWxsIHVwZGF0ZSBpbiB2Mi4NCg0KUmVnYXJkcywN
Ckhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBaaG91MSwgVGFvIDxU
YW8uWmhvdTFAYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDI55pelIDExOjQ5DQpUbzogWmhh
bmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+
DQpDYzogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NClN1YmplY3Q6IFJF
OiBbUEFUQ0ggNi83XSBkcm0vYW1kZ3B1OiBhZGQgcmFzX2xhdGVfaW5pdCBjYWxsYmFjayBmdW5j
dGlvbiBmb3IgbmJpbyB2N180DQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU2VudDogMjAx
OeW5tDjmnIgyOOaXpSAyMTowMw0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgDQo+IERldWNoZXIsIEFsZXhhbmRlciA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCA2LzddIGRybS9hbWRncHU6IGFkZCBy
YXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZ1bmN0aW9uIA0KPiBmb3IgbmJpbyB2N180DQo+IA0KPiBy
YXNfbGF0ZV9pbml0IGNhbGxiYWNrIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCB0byBkbyBjb21tb24g
cmFzIGluaXQgaW4gDQo+IGxhdGUgaW5pdCBwaGFzZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhh
d2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oIHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jICAgfCA0MQ0KPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaA0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgNCj4gaW5kZXggYTA0YzVl
YS4uNTEwNzhkYTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9uYmlvLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25i
aW8uaA0KPiBAQCAtODEsMTIgKzgxLDE0IEBAIHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyB7DQo+
ICAJdm9pZCAoKmhhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZykoc3Ry
dWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgCWludCAoKmluaXRfcmFzX2NvbnRyb2xs
ZXJfaW50ZXJydXB0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAJaW50ICgqaW5p
dF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgDQo+
ICphZGV2KTsNCj4gKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7DQo+ICB9Ow0KPiANCj4gIHN0cnVjdCBhbWRncHVfbmJpbyB7DQo+ICAJY29uc3Qgc3Ry
dWN0IG5iaW9faGRwX2ZsdXNoX3JlZyAqaGRwX2ZsdXNoX3JlZzsNCj4gIAlzdHJ1Y3QgYW1kZ3B1
X2lycV9zcmMgcmFzX2NvbnRyb2xsZXJfaXJxOw0KPiAgCXN0cnVjdCBhbWRncHVfaXJxX3NyYyBy
YXNfZXJyX2V2ZW50X2F0aHViX2lycTsNCj4gKwlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lm
Ow0KPiAgCWNvbnN0IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyAqZnVuY3M7ICB9Ow0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4gaW5kZXggZmFmOTMwMC4u
MzY3ZjlkNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192
N180LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCj4g
QEAgLTIzLDYgKzIzLDcgQEANCj4gICNpbmNsdWRlICJhbWRncHUuaCINCj4gICNpbmNsdWRlICJh
bWRncHVfYXRvbWJpb3MuaCINCj4gICNpbmNsdWRlICJuYmlvX3Y3XzQuaCINCj4gKyNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiDQo+IA0KPiAgI2luY2x1ZGUgIm5iaW8vbmJpb183XzRfb2Zmc2V0Lmgi
DQo+ICAjaW5jbHVkZSAibmJpby9uYmlvXzdfNF9zaF9tYXNrLmgiDQo+IEBAIC00NjgsNiArNDY5
LDQ1IEBAIHN0YXRpYyBpbnQNCj4gbmJpb192N180X2luaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9p
bnRlcnJ1cHQgKHN0cnVjdCBhbWRncHVfZGV2aWNlICphDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+
IA0KPiArc3RhdGljIGludCBuYmlvX3Y3XzRfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikgew0KPiArCWludCByOw0KPiArCXN0cnVjdCByYXNfaWhfaWYgaWhfaW5mbzsN
Cj4gKwlzdHJ1Y3QgcmFzX2ZzX2lmIGZzX2luZm8gPSB7DQo+ICsJCS5zeXNmc19uYW1lID0gIm5i
aW9fZXJyX2NvdW50IiwNCj4gKwkJLmRlYnVnZnNfbmFtZSA9ICJuYmlvX2Vycl9pbmplY3QiLA0K
W1Rhb10gVGhlIHJhcyBibG9jayBuYW1lIGlzIEFNREdQVV9SQVNfQkxPQ0tfUENJRV9CSUYgYW5k
IGl0cyBzdHJpbmcgbmFtZSBpcyBwY2llX2JpZiBpbiByYXNfYmxvY2tfc3RyaW5nLCBRQSBtYXkg
YmUgY29uZnVzZWQgaW4gdGhlIGZ1dHVyZS4NCg0KPiArCX07DQo+ICsNCj4gKwlpZiAoIWFkZXYt
Pm5iaW8ucmFzX2lmKSB7DQo+ICsJCWFkZXYtPm5iaW8ucmFzX2lmID0ga21hbGxvYyhzaXplb2Yo
c3RydWN0IHJhc19jb21tb25faWYpLA0KPiBHRlBfS0VSTkVMKTsNCj4gKwkJaWYgKCFhZGV2LT5u
YmlvLnJhc19pZikNCj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPiArCQlhZGV2LT5uYmlvLnJhc19p
Zi0+YmxvY2sgPSBBTURHUFVfUkFTX0JMT0NLX19QQ0lFX0JJRjsNCj4gKwkJYWRldi0+bmJpby5y
YXNfaWYtPnR5cGUgPQ0KPiBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOw0K
PiArCQlhZGV2LT5uYmlvLnJhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsNCj4gKwkJc3RyY3B5
KGFkZXYtPm5iaW8ucmFzX2lmLT5uYW1lLCAibmJpbyIpOw0KPiArCX0NCj4gKwlpaF9pbmZvLmhl
YWQgPSBmc19pbmZvLmhlYWQgPSAqYWRldi0+bmJpby5yYXNfaWY7DQo+ICsJciA9IGFtZGdwdV9y
YXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPm5iaW8ucmFzX2lmLA0KPiArCQkJCSAmZnNfaW5mbywg
JmloX2luZm8pOw0KPiArCWlmIChyKQ0KPiArCQlnb3RvIGZyZWU7DQo+ICsNCj4gKwlpZiAoYW1k
Z3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgYWRldi0+bmJpby5yYXNfaWYtPmJsb2NrKSkgew0K
PiArCQlyID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPm5iaW8ucmFzX2NvbnRyb2xsZXJf
aXJxLCAwKTsNCj4gKwkJaWYgKHIpDQo+ICsJCQlnb3RvIGZyZWU7DQo+ICsJCXIgPSBhbWRncHVf
aXJxX2dldChhZGV2LCAmYWRldi0NCj4gPm5iaW8ucmFzX2Vycl9ldmVudF9hdGh1Yl9pcnEsIDAp
Ow0KPiArCQlpZiAocikNCj4gKwkJCWdvdG8gZnJlZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gK2ZyZWU6DQo+ICsJa2ZyZWUoYWRldi0+bmJpby5yYXNfaWYpOw0KPiArCXJldHVybiBy
Ow0KPiArfQ0KPiArDQo+ICBjb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3MgbmJpb192N180
X2Z1bmNzID0gew0KPiAgCS5nZXRfaGRwX2ZsdXNoX3JlcV9vZmZzZXQgPSBuYmlvX3Y3XzRfZ2V0
X2hkcF9mbHVzaF9yZXFfb2Zmc2V0LA0KPiAgCS5nZXRfaGRwX2ZsdXNoX2RvbmVfb2Zmc2V0ID0N
Cj4gbmJpb192N180X2dldF9oZHBfZmx1c2hfZG9uZV9vZmZzZXQsDQo+IEBAIC00OTMsNCArNTMz
LDUgQEAgY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIG5iaW9fdjdfNF9mdW5jcyA9IHsN
Cj4gIAkuaGFuZGxlX3Jhc19lcnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nID0gDQo+IG5i
aW9fdjdfNF9oYW5kbGVfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcsDQo+ICAJ
LmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0ID0NCj4gbmJpb192N180X2luaXRfcmFzX2Nv
bnRyb2xsZXJfaW50ZXJydXB0LA0KPiAgCS5pbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJy
dXB0ID0gDQo+IG5iaW9fdjdfNF9pbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0LA0K
PiArCS5yYXNfbGF0ZV9pbml0ID0gbmJpb192N180X3Jhc19sYXRlX2luaXQsDQo+ICB9Ow0KPiAt
LQ0KPiAyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
