Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95016BF1A
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE66E1D8;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF2389DA6
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEe0KdRm+ZO9NxlshafJiEOBi1R8jH9OlAZ3MkhYOiZnQ091PoWaX4+qca2Up5MVKLeaSn+8wtn7HYW1K8LCKLBvaDkdJI1C0Ce6RdoMZwBgEzADLJ2+hQy1uV3pdPKcnaZX6IGHKujIrj2MjH+br2TSY7UjFWO7SLTMVHKP2bhAMZINL63ug1hA7+k5OPWZVyEn6FV8xleNN2nuJfxaoRrOTvMOdzOLR/HgwUNhVkRVa2JohU9JXwOmFPInqH4Fg7c9IcvJMlePsfCX8OqJIKrpTgI84us0jDRjdJ1hPk09WKwpHy9clXfk/rsaUxc6P2fdxA8d62EfCK+aGkcA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo0iOzaYLhoGQAU73D5qq8fABgoaI2DBdFuH1MMkfKE=;
 b=ioxYsLU1Cu0sa6Dde8bpxIlQ2j3Vlv5/FV4HKiUfGaMKF7N5qqxdcZMIV8993inyg/9aJex4shs26EUF5/c9ojdCahq+e57I3JXqDW+cWxMzxc/Lgg1gQcAkBqxmTULS4eUhxr0RDog8gUGc2sJHE2Q8448JXY2KMvEC67k+QC6fWGAMXTE/i01dGTGfaySCg01L7lt9q1idRYQi2jwj83xIs2oiO+0uU0AdvHhBjxIzL0sJ0XnFM5rQiFuiH+pKUAr3WQwWB18tKVQn/vfKRZKbXUXBLIpuoBbiM1OezcASUOieW9Gfe1ZNfMFAh3DfcTlHNljnfalWREt76vKMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5182.eurprd05.prod.outlook.com (20.178.11.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 11:34:30 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 11:34:30 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: HMM related use-after-free with amdgpu
Thread-Topic: HMM related use-after-free with amdgpu
Thread-Index: AQHVOy2BuBeOBwIpPkyfmkDLpwDNk6bL7iyAgAGDN4CAAAFJgIAACCMAgABVeACAAOCJgA==
Date: Wed, 17 Jul 2019 11:34:30 +0000
Message-ID: <20190717113425.GA12099@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
 <20190716163545.GF29741@mellanox.com>
 <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
 <7b5daece-10ea-e96e-5e75-f6fa4e589d5e@amd.com>
In-Reply-To: <7b5daece-10ea-e96e-5e75-f6fa4e589d5e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::39) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8b6320d-80c3-47c2-989f-08d70aaabb6f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5182; 
x-ms-traffictypediagnostic: VI1PR05MB5182:
x-microsoft-antispam-prvs: <VI1PR05MB5182DFF8ECAF53310C16ED05CFC90@VI1PR05MB5182.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(189003)(199004)(86362001)(66446008)(256004)(6436002)(476003)(5024004)(66946007)(1076003)(26005)(2616005)(76176011)(478600001)(5660300002)(64756008)(66476007)(6246003)(6116002)(6486002)(446003)(66556008)(102836004)(8936002)(11346002)(68736007)(7736002)(386003)(305945005)(3846002)(6512007)(186003)(6916009)(36756003)(53546011)(14454004)(229853002)(6506007)(25786009)(33656002)(52116002)(4326008)(486006)(316002)(53936002)(66066001)(81166006)(2906002)(81156014)(71190400001)(54906003)(8676002)(71200400001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5182;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yLEWRqs08p1OVz/gbOvbGfJRzXd/Of/E5Q6I/a9+7kZIgN5WCXaQZf6smeGzHdhIb99CyO4BBafqzSPTBN1+xhgCA0Hy9w09heahsSur+lQh9Sxf2Bv6U7dnAnHMf20kDMpaGdTLAAF0aZJOX/WUwbuJbaCw6kyYV7eiAL0GSDlNLNJGYZVsE307QmGlrRhqE5QhTNO1G9VtEP6EoVl8CaUAqeoJ1rxgMcKJmt1Db/A4TtHL45rB1dSXWy5B8g6F7snFsG2K1mxtG7FFY/w0P41bKWZ3NP5QKJJwX60WxQFUeeLHmegm0gEayxpuwk7mC80Lmy3XvURTNVNh8e+/yYm9bsU3JAI2dvklV15pZQa0nRNwySj9qycDfbPR/ovpS7BAy9vJA6O61OIkqGQVj3p8ldIUxRJT4U3d9q/dsYU=
Content-ID: <75CF9C281BF49D4196B4B1C1103E39DB@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b6320d-80c3-47c2-989f-08d70aaabb6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:34:30.4503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5182
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo0iOzaYLhoGQAU73D5qq8fABgoaI2DBdFuH1MMkfKE=;
 b=IMwhwrlvCjPo7JKYF13+Ivl5VcLhsTPxgwNFa2EelmAvGSR7cF3vuS8U+tjFteRyiNyAu5JzSnjr1odr4TPi/W4wCWkuTvNRi3blfxOH0R1NYz1J7wF7zy+gHxXis0HYIBxVBi76JW5t+c5n1DyAYFqiV4uQSEWb+dNsZiGKO1A=
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
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MTA6NDZQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOg0KPiBPbiAyMDE5LTA3LTE2IDE6MDQgcC5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6
DQo+ID4gT24gMjAxOS0wNy0xNiA2OjM1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4g
Pj4gT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDY6MzE6MDlQTSArMDIwMCwgTWljaGVsIETDpG56
ZXIgd3JvdGU6DQo+ID4+PiBPbiAyMDE5LTA3LTE1IDc6MjUgcC5tLiwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOg0KPiA+Pj4+IE9uIE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA2OjUxOjA2UE0gKzAyMDAs
IE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiA+Pj4+PiBXaXRoIGEgS0FTQU4gZW5hYmxlZCBrZXJu
ZWwgYnVpbHQgZnJvbSBhbWQtc3RhZ2luZy1kcm0tbmV4dCwgdGhlDQo+ID4+Pj4+IGF0dGFjaGVk
IHVzZS1hZnRlci1mcmVlIGlzIHByZXR0eSByZWxpYWJseSBkZXRlY3RlZCBkdXJpbmcgYSBwaWds
aXQgZ3B1IHJ1bi4NCj4gPj4+PiBEb2VzIHRoaXMgYnJhbmNoIHlvdSBhcmUgdGVzdGluZyBoYXZl
IHRoZSBobW0uZ2l0IG1lcmdlZD8gSSB0aGluayBmcm9tDQo+ID4+Pj4gdGhlIG5hbWUgaXQgZG9l
cyBub3Q/DQo+ID4+PiBJbmRlZWQsIG5vLg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pj4gVXNlIGFmdGVy
IGZyZWUncyBvZiB0aGlzIG5hdHVyZSB3ZXJlIHNvbWV0aGluZyB0aGF0IHdhcyBmaXhlZCBpbg0K
PiA+Pj4+IGhtbS5naXQuLg0KPiA+Pj4+DQo+ID4+Pj4gSSBkb24ndCBzZWUgYW4gb2J2aW91cyB3
YXkgeW91IGNhbiBoaXQgc29tZXRoaW5nIGxpa2UgdGhpcyB3aXRoIHRoZQ0KPiA+Pj4+IG5ldyBj
b2RlIGFycmFuZ2VtZW50Li4NCj4gPj4+IEkgdHJpZWQgbWVyZ2luZyB0aGUgaG1tLWRldm1lbS1j
bGVhbnVwLjQgY2hhbmdlc1swXSBpbnRvIG15IDUuMi55ICsNCj4gPj4+IGRybS1uZXh0IGZvciA1
LjMga2VybmVsLiBXaGlsZSB0aGUgcmVzdWx0IGRpZG4ndCBoaXQgdGhlIHByb2JsZW0sIGFsbA0K
PiA+Pj4gR0xfQU1EX3Bpbm5lZF9tZW1vcnkgcGlnbGl0IHRlc3RzIGZhaWxlZCwgc28gSSBzdXNw
ZWN0IHRoZSBwcm9ibGVtIHdhcw0KPiA+Pj4gc2ltcGx5IGF2b2lkZWQgYnkgbm90IGFjdHVhbGx5
IGhpdHRpbmcgdGhlIEhNTSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuDQo+ID4+Pg0KPiA+Pj4gSXQn
cyBwb3NzaWJsZSB0aGF0IEkgbWFkZSBhIG1pc3Rha2UgaW4gbWVyZ2luZyB0aGUgY2hhbmdlcywg
b3IgdGhhdCBJDQo+ID4+PiBtaXNzZWQgc29tZSBvdGhlciByZXF1aXJlZCBjaGFuZ2VzLiBCdXQg
aXQncyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIEhNTQ0KPiA+Pj4gY2hhbmdlcyBicm9rZSB0aGUg
Y29ycmVzcG9uZGluZyB1c2VyLXBvaW50ZXIgZnVuY3Rpb25hbGl0eSBpbiBhbWRncHUuDQo+ID4+
IE5vdCBzdXJlLCB0aGlzIHdhcyBhbGwgVGVzdGVkIGJ5IHRoZSBBTUQgdGVhbSBzbyBpdCBzaG91
bGQgd29yaywgSQ0KPiA+PiBob3BlLg0KPiA+IEl0IGNhbid0LCBkdWUgdG8gdGhlIGlzc3VlIHBv
aW50ZWQgb3V0IGJ5IExpbnVzIGluIHRoZSAiZHJtIHB1bGwgZm9yDQo+ID4gNS4zLXJjMSIgdGhy
ZWFkOiBEUk1fQU1ER1BVX1VTRVJQVFIgc3RpbGwgZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0sIHdo
aWNoDQo+ID4gbm8gbG9uZ2VyIGV4aXN0cywgc28gaXQgY2FuJ3QgYmUgZW5hYmxlZC4NCj4gDQo+
IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBMaW51cyBmaXhlZCB0aGlzIHVwIGluIGhpcyBtZXJnZSBj
b21taXQgDQo+IGJlODQ1NGFmYzUwZjQzMDE2Y2E4YjYxMzBkOTY3M2JkZDBiZDU2ZWMuIEphc29u
LCBpcyBobW0uZ2l0IGdvaW5nIHRvIGdldCANCj4gcmViYXNlZCBvciBtZXJnZSB0byBwaWNrIHVw
IHRoZSBhbWRncHUgY2hhbmdlcyBmb3IgSE1NIGZyb20gbWFzdGVyPw0KDQpJdCB3aWxsIGJlIHJl
c2V0IHRvIC1yYzEgd2hlbiBpdCBjb21lcyBvdXQsIHRoZW4gd2Ugc3RhcnQgYWxsIG92ZXINCmFn
YWluLg0KDQpKYXNvbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
