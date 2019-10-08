Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D354ED0016
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 19:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5516E880;
	Tue,  8 Oct 2019 17:44:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501B36E880
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 17:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABrMYcsR7sbziXVn7fNLKAoQdW8VGjjnB525/LxpRvjsR5c4eFl9cMhxhiDLHc6ahJtLlL635PwQhD1kRnWTge9G28FlI6gPANPpzP7Mw9HtGwY650my4fb3TRse/6qW2FKLn4OWfO61e6kelV0mKYnX3KiO8pjTAELRQsYE9lMzJJ16gsGyDws6FEmRQbtTJZLBX0I4EPuQ+AfKrHXUxuZVQu++Jgta/6DjvZS44TscAQydjwej683fcgU+YJBy7iDqogRTtJ0MXhlhRXYw3tJ+D0YrySrUaBB1SPEFEFY9BFUa1XPFdzeFWY+xDN9AMS0/rXAytvmZidycdYf15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fptc1rrX18/G4MqtmdAuFxbb2/rUT3QBU4Q2V/Tn7Ds=;
 b=cDU5dL3TMfwIZHLUil303A1cSX1xntHKtip48OUD2WXLkAh8xtxVjHcg1VBPNZmWBTwigOsPbhYd2jO40SUeZp15Tn6Xc3gjpALeADBVoa7HE6B5iHnscA4RIjgsP2bGYW9kje1BnUxbFQOy4JJrGqR3X2OSRC8ZlMg2xaSHb2/GW8EThVcqizjuA0n3eBVFIFt7uBmjT+0vFEtdXR+gg5KdOfH0OUoxshUdgzSJDufMkXk+geonUaVkzERjuduaExEEOS72oEUfW5CJhg/8sPXys6ZYZE2u4YL6wN4BzHBAx1Hb6tl2ZNM2k/i0pvVejnuckz4FCTirGjmql5GKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0261.namprd12.prod.outlook.com (10.172.78.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Tue, 8 Oct 2019 17:44:10 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 17:44:10 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Julien Isorce <julien.isorce@gmail.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
Thread-Topic: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
Thread-Index: AQHVeKaYKMS49LSYD0eLcyayen05xKdQ83AAgAAbOAA=
Date: Tue, 8 Oct 2019 17:44:10 +0000
Message-ID: <4610d814-6c54-982e-ecc6-716cc42b5e68@amd.com>
References: <20191001222123.2392-1-jisorce@oblong.com>
 <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
In-Reply-To: <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5ae9576-b9a6-43e5-e971-08d74c171fd7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0261:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR1201MB0261D61936B637D2C74B44928C9A0@CY4PR1201MB0261.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(55674003)(386003)(8936002)(31686004)(186003)(6486002)(71190400001)(2616005)(966005)(53546011)(71200400001)(5660300002)(6506007)(256004)(6246003)(110136005)(11346002)(6116002)(305945005)(2906002)(446003)(14454004)(26005)(3846002)(478600001)(486006)(65806001)(65956001)(66066001)(6306002)(36756003)(476003)(58126008)(6436002)(6512007)(316002)(102836004)(66946007)(81156014)(52116002)(25786009)(99286004)(8676002)(64756008)(76176011)(66556008)(7736002)(66446008)(229853002)(66476007)(31696002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0261;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yor8iz7/Bi217G9+9Wrg3Sw5FWPOKqge2GTInPOXk4CmSwYRLGr6JYTVoS0is6wdZXlA8JqgDUTupiAL+ShdEa7o0Iaa1kc9nAXxUKlbtVdPDY3VilUJkplHg/m4LBUBBram+Egy6nAus5U60CUHMn6fqsXpbIyt04y7Q48ECuX/s27AYCXU7yp6HGUg+zdseG6fUojCWB62v4MtsMyTqmS0WS0cqYYV5Mc+CizZt7H2yob6JH2bziLSQqRvkeBnL6Cpm2G3R8jSGquVqIzODw+h9kKwKmfTNgYMgZFuqHPWpDyvN9V+tZ2CV2SIHhU9HwhSnP0ZiAreDiD6MyYWJ+ujOnMisd/it3R997LtZc7WE81DKyKBgoTIACeMwWqf4gym/DkPgWQdUU+Lj3nKq5dgpeK2T9ZWzc9xtwmUEQMYFF9wl+OYakFS3N+uBCgXkrcpeCLWtO4pOr4YvdjfZg==
x-ms-exchange-transport-forked: True
Content-ID: <226C4B6E6E8CAE468ED13D21C1C35FC8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ae9576-b9a6-43e5-e971-08d74c171fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 17:44:10.0795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsEVfI/bfqhfcHZPmFfUSrlL5ZlkabU24eEr1N5FkQG6+EjiVaXojrXTQIODY//ggqfSrlKQI1iTX0PVDz5KxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0261
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fptc1rrX18/G4MqtmdAuFxbb2/rUT3QBU4Q2V/Tn7Ds=;
 b=kmAmHE0su0UYeLfAL1gRY1P8v2vJlaqpBtZLlNghbtK00ZztqJHLfewbiHbG5DShaRwofWNhPeYbg23Y2OmMoVfxiTHZQVjAXzEWoJHNRknX2u+Kj8Qfc9YBkLNTau+za/Wi4zAG662sAanWqluquXS4WBJbnSIzKyh5GMscSNg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

SGkgSnVsaWVuLA0KDQpjdXJpb3VzIHdoaWNoIG1vbml0b3IgeW91J3JlIHVzaW5nLg0KDQpIYXZl
IHlvdSBjaGVja2VkIHdoZXRoZXIgdGhlIGRyaXZlciBwaWNrcyBSR0Igb3IgWUNCQ1I0MjAgd2l0
aG91dCB5b3VyDQpwYXRjaD8NCg0KSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCBob3cgdGhlIHBp
bmtpc2ggY29sb3IgaXNzdWUgbG9va3MuIERvIHlvdSBzZWUNCmEgcGlua2lzaCBjb2xvciBhdCB0
aGUgdHJhbnNpdGlvbiBmcm9tIGdyZXkgdG8gYW5vdGhlciBjb2xvcj8gT3IgaXMgdGhlDQplbnRp
cmUgZ3JleSBhcmVhIHBpbmtpc2g/DQoNClRoYW5rcywNCkhhcnJ5DQoNCk9uIDIwMTktMTAtMDgg
MTI6MDYgcC5tLiwgSnVsaWVuIElzb3JjZSB3cm90ZToNCj4gSGksDQo+IA0KPiBHZW50bGUgcGlu
ZyA/DQo+IA0KPiBUaHgNCj4gSnVsaWVuDQo+IA0KPiBPbiBUdWUsIE9jdCAxLCAyMDE5IGF0IDM6
MjEgUE0gSnVsaWVuIElzb3JjZSA8anVsaWVuLmlzb3JjZUBnbWFpbC5jb20NCj4gPG1haWx0bzpq
dWxpZW4uaXNvcmNlQGdtYWlsLmNvbT4+IHdyb3RlOg0KPiANCj4gICAgIEZpeCBwaW5raXNoIGNv
bG9yIGlzc3VlIGFyb3VuZCBncmV5IGFyZWFzLiBUaGlzIGFsc28gaGFwcGVucw0KPiAgICAgd2hl
biBub3QgdXNpbmcgYW55IGRvbmdsZSBzbyBkaXJlY3RseSB3aXRoIGEgdXNiLWMgdG8gRGlzcGxh
eQ0KPiAgICAgUG9ydCBjYWJsZS4gTWVhbmluZyB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2hl
biB1c2luZyBwaXhlbA0KPiAgICAgZW5jb2RpbmcgUkdCIHdpdGggYW1kIGRyaXZlciBpbiB0aGUg
Z2VuZXJhbCBjYXNlLiBJbiB0aGUgbWVhbnRpbWUNCj4gICAgIGp1c3QgdXNlIHRoZSBzYW1lIHBp
eGVsIGVuY29kaW5nIGFzIHdoZW4gdXNpbmcgSERNSSB3aXRob3V0IGRvbmdsZS4NCj4gICAgIFRo
aXMgd2F5IHVzZXJzIHdpbGwgc2VlIHRoZSBzYW1lIHRoaW5nIG9uIDIgaWRlbnRpY2FsIHNjcmVl
bnMgd2hlbg0KPiAgICAgb25lIGlzIGNvbm5lY3RlZCB3aXRoIGhkbWktdG8taGRtaSBhbmQgdGhl
IG90aGVyIGlzIGNvbm5lY3RlZCB3aXRoDQo+ICAgICB1c2ItYy10by1oZG1pLg0KPiANCj4gICAg
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBJc29yY2UgPGppc29yY2VAb2Jsb25nLmNvbQ0KPiAgICAg
PG1haWx0bzpqaXNvcmNlQG9ibG9uZy5jb20+Pg0KPiAgICAgLS0tDQo+ICAgICDCoGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1ICsrKysrDQo+ICAg
ICDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+ICAgICBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiAg
ICAgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+
ICAgICBpbmRleCBkM2Y0MDRmMDk3ZWIuLjgxMzlkY2MwYmZiYSAxMDA2NDQNCj4gICAgIC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gICAg
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMN
Cj4gICAgIEBAIC0zMzEzLDYgKzMzMTMsNyBAQCBzdGF0aWMgdm9pZA0KPiAgICAgZmlsbF9zdHJl
YW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUoDQo+ICAgICDCoHsNCj4gICAgIMKg
IMKgIMKgIMKgIHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nX291dCA9ICZzdHJlYW0tPnRp
bWluZzsNCj4gICAgIMKgIMKgIMKgIMKgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICpp
bmZvID0gJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOw0KPiAgICAgK8KgIMKgIMKgIMKgY29uc3Qg
c3RydWN0IGRjX2xpbmsgKmxpbmsgPSBzdHJlYW0tPnNpbmstPmxpbms7DQo+IA0KPiAgICAgwqAg
wqAgwqAgwqAgbWVtc2V0KHRpbWluZ19vdXQsIDAsIHNpemVvZihzdHJ1Y3QgZGNfY3J0Y190aW1p
bmcpKTsNCj4gDQo+ICAgICBAQCAtMzMyNyw2ICszMzI4LDEwIEBAIHN0YXRpYyB2b2lkDQo+ICAg
ICBmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgNCj4gICAgIMKg
IMKgIMKgIMKgIGVsc2UgaWYgKChjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5jb2xvcl9mb3JtYXRz
ICYNCj4gICAgIERSTV9DT0xPUl9GT1JNQVRfWUNSQ0I0NDQpDQo+ICAgICDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmJiBzdHJlYW0tPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9I
RE1JX1RZUEVfQSkNCj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRpbWluZ19vdXQtPnBp
eGVsX2VuY29kaW5nID0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0NDQ7DQo+ICAgICArwqAgwqAgwqAg
wqBlbHNlIGlmICgoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uY29sb3JfZm9ybWF0cyAmDQo+ICAg
ICBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDQ0KQ0KPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJiYgc3RyZWFtLT5zaW5rLT5zaW5rX3NpZ25hbCA9PQ0KPiAgICAgU0lH
TkFMX1RZUEVfRElTUExBWV9QT1JUDQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmJiBsaW5rLT5kcGNkX2NhcHMuZG9uZ2xlX3R5cGUgPT0NCj4gICAgIERJU1BMQVlf
RE9OR0xFX0RQX0hETUlfQ09OVkVSVEVSKQ0KPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dGltaW5nX291dC0+cGl4ZWxfZW5jb2RpbmcgPSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQ0NDsNCj4g
ICAgIMKgIMKgIMKgIMKgIGVsc2UNCj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRpbWlu
Z19vdXQtPnBpeGVsX2VuY29kaW5nID0gUElYRUxfRU5DT0RJTkdfUkdCOw0KPiANCj4gICAgIC0t
IA0KPiAgICAgMi4xNy4xDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
