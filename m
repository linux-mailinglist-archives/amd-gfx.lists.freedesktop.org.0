Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C06AE13
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E426E15F;
	Tue, 16 Jul 2019 17:58:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50085.outbound.protection.outlook.com [40.107.5.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2DE6E14D
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 16:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVDse8nMg4YPT94DzatQFeEZiAi4j+RZiLlQOarEOWe8fNbzE1bqHdqToZf3DMb1iY8RjhoIzRuZ04H7yqXyHPrMBWrya9RjHMSYTCbU5zIMyxMsPvlGEVKLhAGPrPWLAKqo87nRJ3LlP4f01Ak8KJ8iA7RvB9P2oENxuJSU6lNlOoyqHH+b6Wswe1u1pTYqcLDLod1TyddCIG6h/9tf6vGlw3FSwxu/5zB+3IZ1ABXYgcceKYTvSgpB0mjn3AU9I+HSv2GslTDD0TkPbIOQItOkV12IRnKzZ1ynhVvGi4ahLMOexaTqbL7HnHpT1AkzXssxeI0VQi4y3/sLCRB51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agnbLE2Oiu3hH4zYPcI/nBXxOki84bSzcoJRnyF0eco=;
 b=FZnf5CEkVJjjR8ZvA3gMykbUo1aCz0R92/lEYp8KnLvsOtU3juYHVYExbVcqoqUxskJ//uq8016nAxnjlvcwsWV0FN/F5P6Djufy7lvgjNZmjbGpm/X9Kb+eb2dRNG1vZ86w5TaNPVZxDEcVF8IqUoiG8x+RY9qneSQ1oMx2GB3ocEinHZ5xACf/ajSb4N6INMCoxjI+tigAfYBnXVemO1L/73HdfT2tcWmWYHEgevXBBQMkA00othD+9x4u/y099kRYiMAW6QWOzTkv94MJa0KnJbibJFcPIQm4lHCpZC9ilS+k2ZF1HF2z3JsrUKtckAA4YNcjfLNlwezITGrzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6160.eurprd05.prod.outlook.com (20.178.123.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:35:50 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:35:50 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: HMM related use-after-free with amdgpu
Thread-Topic: HMM related use-after-free with amdgpu
Thread-Index: AQHVOy2BuBeOBwIpPkyfmkDLpwDNk6bL7iyAgAGDN4CAAAFJgA==
Date: Tue, 16 Jul 2019 16:35:50 +0000
Message-ID: <20190716163545.GF29741@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
In-Reply-To: <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0005.prod.exchangelabs.com (2603:10b6:208:10c::18)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7572130f-89e4-4e00-0e58-08d70a0ba9a9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6160; 
x-ms-traffictypediagnostic: VI1PR05MB6160:
x-microsoft-antispam-prvs: <VI1PR05MB6160A4E50E920CF19655EC08CFCE0@VI1PR05MB6160.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(54906003)(476003)(2616005)(6512007)(25786009)(6486002)(3846002)(6506007)(11346002)(102836004)(99286004)(6116002)(446003)(14454004)(26005)(186003)(386003)(6436002)(316002)(81166006)(53546011)(81156014)(64756008)(76176011)(486006)(1076003)(8936002)(66446008)(66946007)(66476007)(66556008)(33656002)(6246003)(52116002)(68736007)(478600001)(4326008)(71200400001)(71190400001)(66066001)(5660300002)(7736002)(2906002)(305945005)(229853002)(6916009)(86362001)(8676002)(256004)(36756003)(5024004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6160;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6C116hOppDlaS8n39DlDUZta6RTYcCY+Y3Cv8Ey1kniH4pFjjoCNcI73+flrRj/zAft4J2pJHexh+XKM9Ormi5N6mxdc5sraQDrSspb8wCFdOLH+0pRG3HcvsEiDkQ/r9Ql2sPkw0obWvpsfDZ4Uu1bk0EDeiurn8VZ+T8GVYgxB6J6S8mUyy+CmqhIA12PdRY5YyX359wOzOEu22553AQU3VDQkXtN+JVc2AziCVVGvQn7bydYpisR8kiZWm1i5NbdvCPqh8W3sV2VihYHTWG1dX9GgKo7xZFed0Ar61K8DaGfgFDfGhAy9oqwGDMXDW8FUbqQixPd5Nk0PNCpQNeWP2HdXHXeTQi24JJGrdJ/P9lcHrzHbox0/xdEZaJY3iT+Deh6FzoeO2l9UwJGDJX/t+oyYhJH73ap8cTcRhfc=
Content-ID: <B859CA61BFFF174FA8C0CFAC40B38C07@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7572130f-89e4-4e00-0e58-08d70a0ba9a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:35:50.4630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6160
X-Mailman-Approved-At: Tue, 16 Jul 2019 17:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agnbLE2Oiu3hH4zYPcI/nBXxOki84bSzcoJRnyF0eco=;
 b=NQc/ODjHxPmPzhMG/un4lAtEEtp6MylJC24bQG22DL+ZVnLdDHCmaCHgKLDMdl84F7QZlJiylgdWf5zGyDuws8RtZBgqDI+qCz2iS7uRm/IEz2vBqc8m8CM5tLnNiVdFE38UJUG4Q9tFwA6tolkzU7qWlkJ+6B4nBF/g8e08xxc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDY6MzE6MDlQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6DQo+IE9uIDIwMTktMDctMTUgNzoyNSBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDY6NTE6MDZQTSArMDIwMCwgTWljaGVsIETD
pG56ZXIgd3JvdGU6DQo+ID4+DQo+ID4+IFdpdGggYSBLQVNBTiBlbmFibGVkIGtlcm5lbCBidWls
dCBmcm9tIGFtZC1zdGFnaW5nLWRybS1uZXh0LCB0aGUNCj4gPj4gYXR0YWNoZWQgdXNlLWFmdGVy
LWZyZWUgaXMgcHJldHR5IHJlbGlhYmx5IGRldGVjdGVkIGR1cmluZyBhIHBpZ2xpdCBncHUgcnVu
Lg0KPiA+IA0KPiA+IERvZXMgdGhpcyBicmFuY2ggeW91IGFyZSB0ZXN0aW5nIGhhdmUgdGhlIGht
bS5naXQgbWVyZ2VkPyBJIHRoaW5rIGZyb20NCj4gPiB0aGUgbmFtZSBpdCBkb2VzIG5vdD8NCj4g
DQo+IEluZGVlZCwgbm8uDQo+IA0KPiANCj4gPiBVc2UgYWZ0ZXIgZnJlZSdzIG9mIHRoaXMgbmF0
dXJlIHdlcmUgc29tZXRoaW5nIHRoYXQgd2FzIGZpeGVkIGluDQo+ID4gaG1tLmdpdC4uDQo+ID4g
DQo+ID4gSSBkb24ndCBzZWUgYW4gb2J2aW91cyB3YXkgeW91IGNhbiBoaXQgc29tZXRoaW5nIGxp
a2UgdGhpcyB3aXRoIHRoZQ0KPiA+IG5ldyBjb2RlIGFycmFuZ2VtZW50Li4NCj4gDQo+IEkgdHJp
ZWQgbWVyZ2luZyB0aGUgaG1tLWRldm1lbS1jbGVhbnVwLjQgY2hhbmdlc1swXSBpbnRvIG15IDUu
Mi55ICsNCj4gZHJtLW5leHQgZm9yIDUuMyBrZXJuZWwuIFdoaWxlIHRoZSByZXN1bHQgZGlkbid0
IGhpdCB0aGUgcHJvYmxlbSwgYWxsDQo+IEdMX0FNRF9waW5uZWRfbWVtb3J5IHBpZ2xpdCB0ZXN0
cyBmYWlsZWQsIHNvIEkgc3VzcGVjdCB0aGUgcHJvYmxlbSB3YXMNCj4gc2ltcGx5IGF2b2lkZWQg
Ynkgbm90IGFjdHVhbGx5IGhpdHRpbmcgdGhlIEhNTSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuDQo+
IA0KPiBJdCdzIHBvc3NpYmxlIHRoYXQgSSBtYWRlIGEgbWlzdGFrZSBpbiBtZXJnaW5nIHRoZSBj
aGFuZ2VzLCBvciB0aGF0IEkNCj4gbWlzc2VkIHNvbWUgb3RoZXIgcmVxdWlyZWQgY2hhbmdlcy4g
QnV0IGl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IHRoZSBITU0NCj4gY2hhbmdlcyBicm9rZSB0aGUg
Y29ycmVzcG9uZGluZyB1c2VyLXBvaW50ZXIgZnVuY3Rpb25hbGl0eSBpbiBhbWRncHUuDQoNCk5v
dCBzdXJlLCB0aGlzIHdhcyBhbGwgVGVzdGVkIGJ5IHRoZSBBTUQgdGVhbSBzbyBpdCBzaG91bGQg
d29yaywgSQ0KaG9wZS4NCg0KSXQgc2hvdWxkIGFsbCBiZSBzb3J0ZWQgb3V0IGluIHJjMSwgdHJ5
IGFnYWluIHRoZW4/DQoNCkphc29uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
