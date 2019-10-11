Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E275ED4A7B
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 00:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619F6ECA3;
	Fri, 11 Oct 2019 22:53:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690045.outbound.protection.outlook.com [40.107.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4F66ECA3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 22:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhTLYkEszers/qfux7YBXHkuHer4Ut/97ZbHt7nUNXjal92gU+Hw+FjRAY3ya6Oiuy2/1imHuLfP9Tp7LqbpSboKso7WXwV4MK4jxwZCcfvcsVuAxSORHCdUOEqN7+902nvMPn9P1vlvAM3S3Fv5XtlPY1LGCFDUTMOxwiukf8K1Gk+CC/xLHT49FlE9BTZKoLzaEvnVAYDQ3i/duNElNbK8PNbKyd/SRrXJCN5wXWtU2Wg60zqqtqBoLpQ6XEJW5UzPh3AbxxVh2vVL9ki9S17QKI44cE2Bba0bumT2VpHeP/byQ5ua/M6HPtmjU6SMyZtosO/qZ6mQSSeYETSLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3yQwvYSqeXcOTegXmZ4OEkjg51Y0BnFJ2TryZnYNSc=;
 b=ekLsnfpRfIIVF9eYuDNZAxZYl0bNfKuY905FMzkRshP8URu6tarmnu+petOcl6b1IniVwBB8VIE2YH9d5IuOc4amwaWKyWEGjDb52S/SSY6O7Yoe1X+/pE8gQwJSjWjToVgk611BR8E66npEPheedS1Yk2GGfc71do4efhn7lA3AMF04fpeoS57bww6UFC9uZ9MLiZPvKe5VL+OgVhDd4ZTo4z3eyqEhwLCltLVIHQz0DZH6u0eEBN9bMe2+ID1xKP1uSUa1KrbxOQvky3tuzGMOdpVZsmEL/CVKNMD47wUxJZZUOWTIzFBHKFOYGfLrtRQXCTjhwz5kaB5xbTtQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BY5PR12MB4146.namprd12.prod.outlook.com (52.135.55.88) by
 BY5PR12MB3987.namprd12.prod.outlook.com (10.255.137.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 22:53:20 +0000
Received: from BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc]) by BY5PR12MB4146.namprd12.prod.outlook.com
 ([fe80::915:89b2:7fad:ccfc%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 22:53:20 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Topic: [PATCH 4/8] drm/amdgpu: update atomfirmware header with memory
 training related members
Thread-Index: AQHVf+cXA2mE1xlXlUOZM1cIxrnOR6dWDYiA
Date: Fri, 11 Oct 2019 22:53:20 +0000
Message-ID: <155db3ea-82ba-e3d7-8e2f-96df99772871@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-4-tianci.yin@amd.com>
In-Reply-To: <20191011035033.24935-4-tianci.yin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To BY5PR12MB4146.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbf51203-e1e7-4587-f9cd-08d74e9dcfbd
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BY5PR12MB3987:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3987508165DEBF3BF0C8B05799970@BY5PR12MB3987.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(189003)(199004)(6512007)(76176011)(99286004)(6246003)(229853002)(478600001)(31686004)(36756003)(6486002)(52116002)(386003)(6436002)(66066001)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(5660300002)(71190400001)(3846002)(6116002)(14454004)(26005)(186003)(86362001)(7736002)(305945005)(2906002)(102836004)(53546011)(316002)(486006)(8936002)(6506007)(446003)(31696002)(71200400001)(11346002)(476003)(2616005)(256004)(4001150100001)(8676002)(25786009)(2501003)(81156014)(110136005)(54906003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3987;
 H:BY5PR12MB4146.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lWolvuoZjvkuvirrUfostMOfNFzhDep0uDnj+K7H+/qnUFJbZtr2i2Ta33pjot9/SS+3UQnONOG1mFDhZDzVKQlJsyAYxzkkSoO33AQiQDzfY7dMPsyyHK7pA7G0rdj/94Qsc1XxAS/QXCsLwdJhvZ8TyG3fWzqWQZkPcLQ1yFvS7G5HROKd+QnClqu7DW8K1HPbDofYgBzAw3vosRVY0CRQrsnwdX8FTE3AAlmaSpvQwchsPsMI7tzPZ8oyxsZLFnegqS6+gEOopw3kWGA+qlCAzGbWr8eWVoNbbgPbP5wgAeH5eH1qiEWVOCObN4H6HTxYRaYLpxvv5V78JSoJJlsqjCNguEi8sodRcbiKEOwKp7MstacjnmSPeYIFN3lDzL0tmvYW21wzilt4IY0uOTSeM9Q4vI69ZtDkmCRpwMw=
Content-ID: <F06160798FE6434FBBC65C2FAF4131A1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf51203-e1e7-4587-f9cd-08d74e9dcfbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 22:53:20.0142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZWdRBwNJFK/togtTdFgPmJ3JGpzRQ2I7c/y04+HjnQa1TPLRCgfNXp6Qb5zGjaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3987
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3yQwvYSqeXcOTegXmZ4OEkjg51Y0BnFJ2TryZnYNSc=;
 b=LgAN3H4jqfG0f+6DBjNkrl6hHzcDL15VUXJygjlqUiW6cWTiDusKM9Zlo6C13OGtTZrc23JRuT68KqFl+hbYj19wEtRAeKlvSRbqqw6cp/r0BoKGvDs+Ivv7Zj3+LOZIYzTgEd2YWyDOQfuwajYLOPnIFHYfK2if3YAOxD/Wd/c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMCAxMTo1MCBwLm0uLCBUaWFuY2kgWWluIHdyb3RlOg0KPiBGcm9tOiAiVGlh
bmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4NCj4gDQo+IGFkZCBuZXcgdnJhbV9yZXNlcnZl
X2Jsb2NrIHN0cnVjdHVyZSBhbmQgYXRvbWZpcm13YXJlX2ludGVybmFsX2NvbnN0YW50cyBlbnVt
ZXJhdGlvbg0KPiANCj4gQ2hhbmdlLUlkOiBJNmJhNjQyZWNkN2FkOTQyNTAxNjJhZTVjMzIyZWQ4
ZDg1ZGU5YzM1YQ0KPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5o
IHwgMjggKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2F0b21maXJtd2FyZS5oDQo+IGluZGV4IGU4ODU0MWQ2N2FhMC4uNDYzYzE4ZTk5ZDc4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXRvbWZpcm13YXJlLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2F0b21maXJtd2FyZS5oDQo+IEBA
IC00OTIsMTIgKzQ5MiwxMyBAQCBzdHJ1Y3QgYXRvbV9maXJtd2FyZV9pbmZvX3YzXzENCj4gIC8q
IFRvdGFsIDMyYml0IGNhcCBpbmRpY2F0aW9uICovDQo+ICBlbnVtIGF0b21iaW9zX2Zpcm13YXJl
X2NhcGFiaWxpdHkNCj4gIHsNCj4gLSAgQVRPTV9GSVJNV0FSRV9DQVBfRklSTVdBUkVfUE9TVEVE
ID0gMHgwMDAwMDAwMSwNCj4gLSAgQVRPTV9GSVJNV0FSRV9DQVBfR1BVX1ZJUlRVQUxJWkFUSU9O
ICA9IDB4MDAwMDAwMDIsDQo+IC0gIEFUT01fRklSTVdBUkVfQ0FQX1dNSV9TVVBQT1JUICA9IDB4
MDAwMDAwNDAsDQo+IC0gIEFUT01fRklSTVdBUkVfQ0FQX0hXRU1VX0VOQUJMRSAgPSAweDAwMDAw
MDgwLA0KPiAtICBBVE9NX0ZJUk1XQVJFX0NBUF9IV0VNVV9VTUNfQ0ZHID0gMHgwMDAwMDEwMCwN
Cj4gLSAgQVRPTV9GSVJNV0FSRV9DQVBfU1JBTV9FQ0MgICAgICA9IDB4MDAwMDAyMDAsDQo+ICsJ
QVRPTV9GSVJNV0FSRV9DQVBfRklSTVdBUkVfUE9TVEVEID0gMHgwMDAwMDAwMSwNCj4gKwlBVE9N
X0ZJUk1XQVJFX0NBUF9HUFVfVklSVFVBTElaQVRJT04gID0gMHgwMDAwMDAwMiwNCj4gKwlBVE9N
X0ZJUk1XQVJFX0NBUF9XTUlfU1VQUE9SVCAgPSAweDAwMDAwMDQwLA0KPiArCUFUT01fRklSTVdB
UkVfQ0FQX0hXRU1VX0VOQUJMRSAgPSAweDAwMDAwMDgwLA0KPiArCUFUT01fRklSTVdBUkVfQ0FQ
X0hXRU1VX1VNQ19DRkcgPSAweDAwMDAwMTAwLA0KPiArCUFUT01fRklSTVdBUkVfQ0FQX1NSQU1f
RUNDICAgICAgPSAweDAwMDAwMjAwLA0KPiArCUFUT01fRklSTVdBUkVfQ0FQX0VOQUJMRV8yU1RB
R0VfQklTVF9UUkFJTklORyAgPSAweDAwMDAwNDAwLA0KPiAgfTsNCj4gIA0KPiAgZW51bSBhdG9t
X2Nvb2xpbmdfc29sdXRpb25faWR7DQo+IEBAIC02NzEsNiArNjcyLDIxIEBAIHN0cnVjdCB2cmFt
X3VzYWdlYnlmaXJtd2FyZV92Ml8xDQo+ICAgIHVpbnQxNl90ICB1c2VkX2J5X2RyaXZlcl9pbl9r
YjsgDQo+ICB9Ow0KPiAgDQo+ICsvKiBUaGlzIGlzIHBhcnQgb2YgdnJhbV91c2FnZWJ5ZmlybXdh
cmVfdjJfMSAqLw0KPiArc3RydWN0IHZyYW1fcmVzZXJ2ZV9ibG9jaw0KPiArew0KPiArCXVpbnQz
Ml90IHN0YXJ0X2FkZHJlc3NfaW5fa2I7DQo+ICsJdWludDE2X3QgdXNlZF9ieV9maXJtd2FyZV9p
bl9rYjsNCj4gKwl1aW50MTZfdCB1c2VkX2J5X2RyaXZlcl9pbl9rYjsNCj4gK307DQo+ICsNCj4g
Ky8qIERlZmluaXRpb25zIGZvciBjb25zdGFuY2UgKi8NCj4gK2VudW0gYXRvbWZpcm13YXJlX2lu
dGVybmFsX2NvbnN0YW50cw0KPiArew0KPiArCU9ORV9LCT0gMHg0MDAsDQo+ICsJT05FX01FRwk9
IDB4MTAwMDAwLA0KPiArCU9ORV9HCT0gMHg0MDAwMDAwMCwNCg0KU28uLi4gdGhpcyBpcyBwcm9u
b3VuY2VkIGluIEVuZ2xpc2ggYXMgIk9uZSBHZWUiLCBhbmQgZXZlbiB0aG91Z2gNCkkgbGlrZSBp
dCBtdWNoIG11Y2ggYmV0dGVyIGR1ZSB0byB3aGF0IGlzIGFjdHVhbGx5IHNheXMgKG5vLCBpdCBp
cyBub3QNCiJvbmUgZ2lnYWJ5dGUiKSwgSSdkIHJhdGhlciB5b3UgY2FsbGVkIHRoaXMgIk9ORV9H
aUIiLg0KDQpZb3UgZG8gbm90IGhhdmUgIk9uZSBHIiBhbnl3aGVyZSBpbiB0aGlzIGNvZGUuIDot
KQ0KDQpUbyBmaXQgaW50ZXJuYXRpb25hbCBzdGFuZGFyZGl6YXRpb24gYW5kIHRoZSBtb3ZlIExp
bnV4IGNvbnN0YW50cw0KaGF2ZSBiZWVuIGdvaW5nIHRvLCBuYW1lIHRoZW0gdGhpczoNCg0KT05F
X0tpQg0KT05FX01pQg0KT05FX0dpQg0KDQpUaGlzIG1lYW5zIHdoYXQgaXQgc2F5cyBhbmQgYWxz
byB0aGF0IHRoZXkgYXJlIHBvd2VyIG9mIDIuDQoNCk9ORV9HQiAoMTBeOSkgaXMgbGVzcyB0aGFu
IE9ORV9HaUIgKDJeMzApLg0KDQpSZWdhcmRzLA0KTHViZW4NCg0KPiArfTsNCj4gIA0KPiAgLyog
DQo+ICAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKg0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
