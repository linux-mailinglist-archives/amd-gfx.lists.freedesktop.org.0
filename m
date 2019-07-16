Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F676AE14
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 19:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7576E175;
	Tue, 16 Jul 2019 17:58:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00062.outbound.protection.outlook.com [40.107.0.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA116E169
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 17:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmhCMvmqn/z9HRu+H+batwSfjAU8XvNiOhOr+WmThavbZztel293C/TAIxh3ZhRjXXzEYzcRgmOfzMul3tn2z0iGWJ1eq2g9OcOIXvk1A895DlV0xusE1+ZhcBc2UsCMIndnLJ2ZH0oS2Hc/t3rXizVhcdKhocA8BUiCBxkCMXbg7GVjVk6SOcReDjEV0Uvn2EJbXF7t1VemQes+xAma9+wNv0ds+XWKf7r1lmr/eoTh7awYYLnLA3/5F2fuC1JyVydjDyLl4qUgtrEY1iewE2pVa2K93k26nbqoDi4eO/yPtgs+IIn2wzvYLhvb1f+BAyOferfibNuktVHVtHUnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIOGFJb8MDLQSpSCG7n2MSAc9iySzj60JiBibgrXuOY=;
 b=dC+EF6+AsITeMWx/nvjLcUh84QZDHQJBsDix+Ft6GHlWEM8hGjZ9S+rnr73xJo8ckwnZYbdR715xU04kY7uxgk4YYM3WC6lg4YXYCQT+nrHZ3nUgdrARXJtX20xZsmyNgOF3xtz71aiZes3wuME/kRgh89YfSN2rocysEJPMKm/LeRAIY/prxr+IFUFZHoG5RhYWL6dOhdFWKDFw1W7LZqLwodNGSgKIYEb78/gCvhbW6skYswlRA7rWDpLGNQLaGnPC94j897XGMFmYhAkjD8BFUNnAYNtY/CARP2lzjlbnYEE/Lktlw6F9Mlr5G5dCx09A6RSk02YQFIGHf10hxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4703.eurprd05.prod.outlook.com (20.176.4.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 17:20:50 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 17:20:50 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: HMM related use-after-free with amdgpu
Thread-Topic: HMM related use-after-free with amdgpu
Thread-Index: AQHVOy2BuBeOBwIpPkyfmkDLpwDNk6bL7iyAgAGDN4CAAAFJgIAACCMAgAAEcIA=
Date: Tue, 16 Jul 2019 17:20:50 +0000
Message-ID: <20190716172045.GG29741@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
 <20190716163545.GF29741@mellanox.com>
 <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
In-Reply-To: <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1e0f5c2-fd4d-43fe-d094-08d70a11f2ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4703; 
x-ms-traffictypediagnostic: VI1PR05MB4703:
x-microsoft-antispam-prvs: <VI1PR05MB4703930B1FED201DCDD25E44CFCE0@VI1PR05MB4703.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(52116002)(229853002)(6436002)(53936002)(478600001)(6512007)(6486002)(476003)(2616005)(68736007)(2906002)(486006)(6246003)(11346002)(446003)(386003)(7736002)(305945005)(25786009)(36756003)(4326008)(6506007)(26005)(102836004)(33656002)(76176011)(3846002)(8676002)(81156014)(53546011)(6916009)(81166006)(6116002)(186003)(1076003)(71190400001)(71200400001)(8936002)(66066001)(86362001)(5024004)(316002)(256004)(14454004)(5660300002)(66946007)(99286004)(66446008)(64756008)(66556008)(66476007)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4703;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AYsx6VYfk6nLADxIAYW/pzrUnBjWG464F7t3CAXPN8R5/7Kx7zCMz6/j/XqsKg9nCqIaH2CDQI77r2yQZB+jbpAW0RRgn85XHic77EhxgJ1EU7ip5IFiE5B/BqBjyWSoMkjEUS6pgAa1VTzWAyqhpIlJJe0sjofNKVLYj+9CJc8Nf0MLz5nv6GXmQ3I45zz+IqFwfaD5qY9R03uWIdqQGcxsAiNgwvGgozV4Rrzobn+XwV27lSfOm33OEEhYYRf6Qx6ugzMcCST9Dehd80sjOX0z6SbUNcW/81WA3fQZ4Gx5UCKy1rzRQRVN/GKwjP+S9TluJlu4Gf6Bsah8eFNN0LfTps2+rqa1mIEukqe7BHrUbx+64TuqAGvi/LvLrGsE5mQ1TNA1OPaTBefxkkT36qMHTz17cb+UaPnkU1ulFQM=
Content-ID: <39D6CAD110CBBA4D856BF26456B82915@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e0f5c2-fd4d-43fe-d094-08d70a11f2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 17:20:50.3797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4703
X-Mailman-Approved-At: Tue, 16 Jul 2019 17:58:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIOGFJb8MDLQSpSCG7n2MSAc9iySzj60JiBibgrXuOY=;
 b=L4eF81bCQ8SZVVXfgtxwuMaevA8wdXjafzMFnW8IzT7oG3+cGfRJ+WBwroK9A7wAHtq8RI0om8/6FGl/Ne0HNziubSik0btPrXZ3XNGdVhH4hIs/3ea7+/4vsvEpmj0SXZEt/XEwlEY2p3q6EaRIceibZiwp6LxAniOJnj89zMI=
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDc6MDQ6NTJQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6DQo+IE9uIDIwMTktMDctMTYgNjozNSBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gT24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDY6MzE6MDlQTSArMDIwMCwgTWljaGVsIETD
pG56ZXIgd3JvdGU6DQo+ID4+IE9uIDIwMTktMDctMTUgNzoyNSBwLm0uLCBKYXNvbiBHdW50aG9y
cGUgd3JvdGU6DQo+ID4+PiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAwNjo1MTowNlBNICswMjAw
LCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IFdpdGggYSBLQVNBTiBlbmFi
bGVkIGtlcm5lbCBidWlsdCBmcm9tIGFtZC1zdGFnaW5nLWRybS1uZXh0LCB0aGUNCj4gPj4+PiBh
dHRhY2hlZCB1c2UtYWZ0ZXItZnJlZSBpcyBwcmV0dHkgcmVsaWFibHkgZGV0ZWN0ZWQgZHVyaW5n
IGEgcGlnbGl0IGdwdSBydW4uDQo+ID4+Pg0KPiA+Pj4gRG9lcyB0aGlzIGJyYW5jaCB5b3UgYXJl
IHRlc3RpbmcgaGF2ZSB0aGUgaG1tLmdpdCBtZXJnZWQ/IEkgdGhpbmsgZnJvbQ0KPiA+Pj4gdGhl
IG5hbWUgaXQgZG9lcyBub3Q/DQo+ID4+DQo+ID4+IEluZGVlZCwgbm8uDQo+ID4+DQo+ID4+DQo+
ID4+PiBVc2UgYWZ0ZXIgZnJlZSdzIG9mIHRoaXMgbmF0dXJlIHdlcmUgc29tZXRoaW5nIHRoYXQg
d2FzIGZpeGVkIGluDQo+ID4+PiBobW0uZ2l0Li4NCj4gPj4+DQo+ID4+PiBJIGRvbid0IHNlZSBh
biBvYnZpb3VzIHdheSB5b3UgY2FuIGhpdCBzb21ldGhpbmcgbGlrZSB0aGlzIHdpdGggdGhlDQo+
ID4+PiBuZXcgY29kZSBhcnJhbmdlbWVudC4uDQo+ID4+DQo+ID4+IEkgdHJpZWQgbWVyZ2luZyB0
aGUgaG1tLWRldm1lbS1jbGVhbnVwLjQgY2hhbmdlc1swXSBpbnRvIG15IDUuMi55ICsNCj4gPj4g
ZHJtLW5leHQgZm9yIDUuMyBrZXJuZWwuIFdoaWxlIHRoZSByZXN1bHQgZGlkbid0IGhpdCB0aGUg
cHJvYmxlbSwgYWxsDQo+ID4+IEdMX0FNRF9waW5uZWRfbWVtb3J5IHBpZ2xpdCB0ZXN0cyBmYWls
ZWQsIHNvIEkgc3VzcGVjdCB0aGUgcHJvYmxlbSB3YXMNCj4gPj4gc2ltcGx5IGF2b2lkZWQgYnkg
bm90IGFjdHVhbGx5IGhpdHRpbmcgdGhlIEhNTSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuDQo+ID4+
DQo+ID4+IEl0J3MgcG9zc2libGUgdGhhdCBJIG1hZGUgYSBtaXN0YWtlIGluIG1lcmdpbmcgdGhl
IGNoYW5nZXMsIG9yIHRoYXQgSQ0KPiA+PiBtaXNzZWQgc29tZSBvdGhlciByZXF1aXJlZCBjaGFu
Z2VzLiBCdXQgaXQncyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIEhNTQ0KPiA+PiBjaGFuZ2VzIGJy
b2tlIHRoZSBjb3JyZXNwb25kaW5nIHVzZXItcG9pbnRlciBmdW5jdGlvbmFsaXR5IGluIGFtZGdw
dS4NCj4gPiANCj4gPiBOb3Qgc3VyZSwgdGhpcyB3YXMgYWxsIFRlc3RlZCBieSB0aGUgQU1EIHRl
YW0gc28gaXQgc2hvdWxkIHdvcmssIEkNCj4gPiBob3BlLg0KPiANCj4gSXQgY2FuJ3QsIGR1ZSB0
byB0aGUgaXNzdWUgcG9pbnRlZCBvdXQgYnkgTGludXMgaW4gdGhlICJkcm0gcHVsbCBmb3INCj4g
NS4zLXJjMSIgdGhyZWFkOiBEUk1fQU1ER1BVX1VTRVJQVFIgc3RpbGwgZGVwZW5kcyBvbiBBUkNI
X0hBU19ITU0sIHdoaWNoDQo+IG5vIGxvbmdlciBleGlzdHMsIHNvIGl0IGNhbid0IGJlIGVuYWJs
ZWQuDQoNClNvbWVob3cgdGhhdCBtZXJnZSByZXNvbHV0aW9uIGdvdCBtaXNzZWQsIGJ1dCBJIHRo
aW5rIHRoZSBBTUQgZm9sa3MNCm11c3QgaGF2ZSBpbmNsdWRlZCBpdCB3aGVuIHRoZXkgZGlkIHRo
ZWlyIG1lcmdlICYgdGVzdC4NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
