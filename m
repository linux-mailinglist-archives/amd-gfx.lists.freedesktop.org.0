Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F52E0B8F
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 20:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C85A6E8CA;
	Tue, 22 Oct 2019 18:40:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690078.outbound.protection.outlook.com [40.107.69.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB086E8CA
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 18:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JseuJ2MsOosMmAFkCD2tzNcc74g8xb9MXpLNjck+IOZb+KSxL6Q+SMT1mTJ/sS2njC2Deg3/rrbKe7Qt53/MHnTJrqEqJtKaj8uSnzH5WAoMJuxnczRCEohhp5JkJOHnmuKTBxDvnCjKefyDv9sr0tFyaEL18+j0sLUMln9O6bzj54UzKtBAmxjyWZDZNt/uzmkAF1Nhbtt3PjW1VNTTWmsvR2aN3iCQK2r+D0GsIB1S+DUyO49wnEfvlJ13h40uSwFhBzJIzBw+nbXvZdFC7igT/STF5uV7EL5YwLG0J6INxO3Nu3ailcQsCjdNgTff9Dit33vp0J1e0wIQRdwsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJMocwqTsx4k3LnN18rf0aEabRmiIqQgxQ4w3jxPrJE=;
 b=MtrGVfHQZvJO2o/WAM+FtJHAtCP7B5P2tcxrhR/zyU9cQqZd/8l1vqdqyPKvRgOvl+rPxwyexT/zgmj1oA1QjnPqh9KYMXXQkBXHLntAFf/jwBiK8c7GSi7/p1WzWHjgqQ2qgXtFUAIM9fIxoDwQFW4eFQ6fsm/DROm/iVYEXQwyuR4q2tg7sL5QEvbf57OjCi98EkbLwB31vxOnw3Ezs0M+SC+sOpR+Qr4Qk/AHwN3kqUFCAEQNQlVCIMaQPSS4Z4bPGUjkbiJvvm2h2+g/seAdoCVo1kP3Ab1udPSPrDy5jvdmx/nM1yy1hizusGHkceWkBdWW0e//JMTBo0QW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1198.namprd12.prod.outlook.com (10.169.203.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 18:40:04 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 18:40:04 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdkfd: don't use dqm lock during device
 reset/suspend/resume
Thread-Topic: [PATCH v2] drm/amdkfd: don't use dqm lock during device
 reset/suspend/resume
Thread-Index: AQHViQZ4XzhiW2lzAk+tGGEmnkv7NKdm/cqAgAAAYwA=
Date: Tue, 22 Oct 2019 18:40:04 +0000
Message-ID: <b7c3ad13-0b36-5fbb-5079-4a72a8dd853a@amd.com>
References: <20191022182804.23845-1-Philip.Yang@amd.com>
 <83bfc853-cb0e-4285-d310-232683130751@amd.com>
In-Reply-To: <83bfc853-cb0e-4285-d310-232683130751@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::40) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 33e51d6b-4dca-4f9c-f653-08d7571f40fd
x-ms-traffictypediagnostic: MWHPR12MB1198:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1198673C14816B228576AA55EA680@MWHPR12MB1198.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(199004)(189003)(305945005)(7736002)(2906002)(6116002)(6486002)(3846002)(52116002)(6246003)(76176011)(71190400001)(71200400001)(110136005)(316002)(6306002)(6436002)(36756003)(229853002)(99286004)(6512007)(64756008)(25786009)(478600001)(81156014)(31696002)(15650500001)(8676002)(81166006)(8936002)(11346002)(14454004)(476003)(446003)(86362001)(966005)(5660300002)(31686004)(386003)(6506007)(53546011)(102836004)(26005)(256004)(14444005)(2616005)(66066001)(30864003)(2501003)(486006)(66476007)(66446008)(66556008)(66946007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1198;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /i7Mk4caYMyOu+v7eDXCCnTdBfg7IcAHdzgjO6g5ga0/DgJCFyELzFK/u9aOpbQZVKytxxyLI0woKoJ3bp0Hb5SwcZeZK+DOmXq3vPSGXqM00mTVg8MscyOFmI3FhA5LsDHDnr9EPVmrv4YbHfxnJ5x6HoXFly0BeYjanjNNQItNh4VKDLa1+vaOBH6J4OTrvchHuT6dcH3TjsubVs3Xw0Sue5HtX5e6M6cbOO5ce3MYTlBPKtJzQMbZ6tHJZOYgOIzBTk9raRigd7jaf1r4ioy2+Yo7Fe/KHLnNUR2Uk63HM93DKxqU267npkZJEtBtaNb49klCOR7cipLkWMNGYbH6tRKMFHQz5yrOw8Vym+npAGAT4noCUs1tYb+LeleOQWufvj8gyrnlfxcsc+ra74fJvNXAugAD+lpc2jKZW7CEzGHYW2tHclbPwAkZ+xckyCnb1Ei+h6QJGc2E3CZDo8zDj/lzd7hRUCAbcTqukZM=
Content-ID: <94F9D5FE78DA5B41BE41EC98D335EDCB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e51d6b-4dca-4f9c-f653-08d7571f40fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 18:40:04.3971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EipfAaMZotvIHuto1O79gdyaxI865ayxtBgCfyYBRynz7d0ZYquiLayLlZk6ViIG34yHGScTaGURPAzr+ggpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJMocwqTsx4k3LnN18rf0aEabRmiIqQgxQ4w3jxPrJE=;
 b=3os9E4OreOryrL0CCwggWeZlhfkH2Ypz6x7fMyjj6M6dGYLN+JCMiTWJytCgoVwBabKSFAoKwCYNo/VhYayxVaxf0n4BvpdEsEgQF7gasJ/tzMdJS6U0K47MMCk4eTbc0TsHdWYxXfqCd0Q1tpwJgE/bCTRo51F1dN/DSXxEMTA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

DQpPbiAxMC8yMi8xOSAyOjM4IFBNLCBHcm9kem92c2t5LCBBbmRyZXkgd3JvdGU6DQo+IE9uIDEw
LzIyLzE5IDI6MjggUE0sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4+IElmIGRldmljZSByZXNldC9z
dXNwZW5kL3Jlc3VtZSBmYWlsZWQgZm9yIHNvbWUgcmVhc29uLCBkcW0gbG9jayBpcw0KPj4gaG9s
ZCBmb3JldmVyIGFuZCB0aGlzIGNhdXNlcyBkZWFkbG9jay4gQmVsb3cgaXMgYSBrZXJuZWwgYmFj
a3RyYWNlIHdoZW4NCj4+IGFwcGxpY2F0aW9uIG9wZW4ga2ZkIGFmdGVyIHN1c3BlbmQvcmVzdW1l
IGZhaWxlZC4NCj4+DQo+PiBJbnN0ZWFkIG9mIGhvbGRpbmcgZHFtIGxvY2sgaW4gcHJlX3Jlc2V0
IGFuZCByZWxlYXNpbmcgZHFtIGxvY2sgaW4NCj4+IHBvc3RfcmVzZXQsIGFkZCBkcW0tPmRldmlj
ZV9zdG9wcGVkIGZsYWcgd2hpY2ggaXMgbW9kaWZpZWQgaW4NCj4+IGRxbS0+b3BzLnN0YXJ0IGFu
ZCBkcW0tPm9wcy5zdG9wLiBUaGUgZmxhZyBkb2Vzbid0IG5lZWQgbG9jayBwcm90ZWN0aW9uDQo+
PiBiZWNhdXNlIHdyaXRlL3JlYWQgYXJlIGFsbCBpbnNpZGUgZHFtIGxvY2suDQo+Pg0KPj4gRm9y
IEhXUyBjYXNlLCBtYXBfcXVldWVzX2Nwc2NoIGFuZCB1bm1hcF9xdWV1ZXNfY3BzY2ggY2hlY2tz
DQo+PiBkZXZpY2Vfc3RvcHBlZCBmbGFnIGJlZm9yZSBzZW5kaW5nIHRoZSB1cGRhdGVkIHJ1bmxp
c3QuDQo+DQo+IElzIHRoZXJlIGEgY2hhbmNlIG9mIHJhY2UgY29uZGl0aW9uIGhlcmUgd2hlcmUg
ZHFtLT5kZXZpY2Vfc3RvcHBlZA0KPiByZXR1cm5zIHRydWUgZm9yIHNvbWUgb3BlcmF0aW9uIChl
LmcubWFwX3F1ZXVlc19jcHNjaCkgYnV0IGp1c3QgYXMgaXQNCj4gcHJvY2VlZHMgR1BVIHJlc2V0
IHN0YXJ0c8KgID8NCj4NCj4gQW5kcmV5DQoNCg0KQ29ycmVjdGlvbiAtDQoNCmRxbS0+ZGV2aWNl
X3N0b3BwZWQgcmV0dXJucyBGQUxTRQ0KDQpBbmRyZXkNCg0KPg0KPg0KPj4gdjI6IEZvciBuby1I
V1MgY2FzZSwgd2hlbiBkZXZpY2UgaXMgc3RvcHBlZCwgZG9uJ3QgY2FsbA0KPj4gbG9hZC9kZXN0
cm95X21xZCBmb3IgZXZpY3Rpb24sIHJlc3RvcmUgYW5kIGNyZWF0ZSBxdWV1ZSwgYW5kIGF2b2lk
DQo+PiBkZWJ1Z2ZzIGR1bXAgaGRxcy4NCj4+DQo+PiBCYWNrdHJhY2Ugb2YgZHFtIGxvY2sgZGVh
ZGxvY2s6DQo+Pg0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gSU5GTzogdGFzayByb2Nt
aW5mbzozMDI0IGJsb2NrZWQgZm9yIG1vcmUNCj4+IHRoYW4gMTIwIHNlY29uZHMuDQo+PiBbVGh1
IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgICAgICBOb3QgdGFpbnRlZA0KPj4gNS4wLjAtcmMxLWtm
ZC1jb21wdXRlLXJvY20tZGttcy1uby1ucGktMTEzMSAjMQ0KPj4gW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gImVjaG8gMCA+DQo+PiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0
X3NlY3MiIGRpc2FibGVzIHRoaXMgbWVzc2FnZS4NCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIw
MTldIHJvY21pbmZvICAgICAgICBEICAgIDAgIDMwMjQgICAyOTQ3DQo+PiAweDgwMDAwMDAwDQo+
PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSBDYWxsIFRyYWNlOg0KPj4gW1RodSBPY3QgMTcg
MTY6NDM6MzcgMjAxOV0gID8gX19zY2hlZHVsZSsweDNkOS8weDhhMA0KPj4gW1RodSBPY3QgMTcg
MTY6NDM6MzcgMjAxOV0gIHNjaGVkdWxlKzB4MzIvMHg3MA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6
MzcgMjAxOV0gIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHhhLzB4MTANCj4+IFtUaHUgT2N0
IDE3IDE2OjQzOjM3IDIwMTldICBfX211dGV4X2xvY2suaXNyYS45KzB4MWUzLzB4NGUwDQo+PiBb
VGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBfX2NhbGxfc3JjdSsweDI2NC8weDNiMA0KPj4g
W1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNjaCsw
eDI0LzB4MmYwDQo+PiBbYW1kZ3B1XQ0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIHBy
b2Nlc3NfdGVybWluYXRpb25fY3BzY2grMHgyNC8weDJmMA0KPj4gW2FtZGdwdV0NCj4+IFtUaHUg
T2N0IDE3IDE2OjQzOjM3IDIwMTldDQo+PiBrZmRfcHJvY2Vzc19kZXF1ZXVlX2Zyb21fYWxsX2Rl
dmljZXMrMHg0Mi8weDYwIFthbWRncHVdDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAg
a2ZkX3Byb2Nlc3Nfbm90aWZpZXJfcmVsZWFzZSsweDFiZS8weDIyMA0KPj4gW2FtZGdwdV0NCj4+
IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBfX21tdV9ub3RpZmllcl9yZWxlYXNlKzB4M2Uv
MHhjMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGV4aXRfbW1hcCsweDE2MC8weDFh
MA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gX19oYW5kbGVfbW1fZmF1bHQrMHhi
YTMvMHgxMjAwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgPyBleGl0X3JvYnVzdF9s
aXN0KzB4NWEvMHgxMTANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBtbXB1dCsweDRh
LzB4MTIwDQo+PiBbVGh1IE9jdCAxNyAxNjo0MzozNyAyMDE5XSAgZG9fZXhpdCsweDI4NC8weGIy
MA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gID8gaGFuZGxlX21tX2ZhdWx0KzB4ZmEv
MHgyMDANCj4+IFtUaHUgT2N0IDE3IDE2OjQzOjM3IDIwMTldICBkb19ncm91cF9leGl0KzB4M2Ev
MHhhMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIF9feDY0X3N5c19leGl0X2dyb3Vw
KzB4MTQvMHgyMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGRvX3N5c2NhbGxfNjQr
MHg0Zi8weDEwMA0KPj4gW1RodSBPY3QgMTcgMTY6NDM6MzcgMjAxOV0gIGVudHJ5X1NZU0NBTExf
NjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkNCj4+DQo+PiBTdWdnZXN0ZWQtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8ICA2ICstLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgICAgIHwgIDUgLS0NCj4+ICAgIC4uLi9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDQ3ICsrKysrKysrKysr
KysrKysrLS0NCj4+ICAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuaCB8ICAxICsNCj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9jaGFyZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jDQo+PiBpbmRleCBkOWUzNmRiZjEzZDUuLjQwZDc1YzM5ZjA4ZSAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMNCj4+IEBAIC0xMjAsMTMgKzEyMCwx
MyBAQCBzdGF0aWMgaW50IGtmZF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxl
ICpmaWxlcCkNCj4+ICAgIAkJcmV0dXJuIC1FUEVSTTsNCj4+ICAgIAl9DQo+PiAgICANCj4+ICsJ
aWYgKGtmZF9pc19sb2NrZWQoKSkNCj4+ICsJCXJldHVybiAtRUFHQUlOOw0KPj4gKw0KPj4gICAg
CXByb2Nlc3MgPSBrZmRfY3JlYXRlX3Byb2Nlc3MoZmlsZXApOw0KPj4gICAgCWlmIChJU19FUlIo
cHJvY2VzcykpDQo+PiAgICAJCXJldHVybiBQVFJfRVJSKHByb2Nlc3MpOw0KPj4gICAgDQo+PiAt
CWlmIChrZmRfaXNfbG9ja2VkKCkpDQo+PiAtCQlyZXR1cm4gLUVBR0FJTjsNCj4+IC0NCj4+ICAg
IAlkZXZfZGJnKGtmZF9kZXZpY2UsICJwcm9jZXNzICVkIG9wZW5lZCwgY29tcGF0IG1vZGUgKDMy
IGJpdCkgLSAlZFxuIiwNCj4+ICAgIAkJcHJvY2Vzcy0+cGFzaWQsIHByb2Nlc3MtPmlzXzMyYml0
X3VzZXJfbW9kZSk7DQo+PiAgICANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMNCj4+IGluZGV4IDhmNGIyNGU4NDk2NC4uNGZhODgzNGNlN2NiIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4+IEBAIC03MzAsOSArNzMwLDYg
QEAgaW50IGtnZDJrZmRfcHJlX3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpDQo+PiAgICAJCXJl
dHVybiAwOw0KPj4gICAgCWtnZDJrZmRfc3VzcGVuZChrZmQpOw0KPj4gICAgDQo+PiAtCS8qIGhv
bGQgZHFtLT5sb2NrIHRvIHByZXZlbnQgZnVydGhlciBleGVjdXRpb24qLw0KPj4gLQlkcW1fbG9j
ayhrZmQtPmRxbSk7DQo+PiAtDQo+PiAgICAJa2ZkX3NpZ25hbF9yZXNldF9ldmVudChrZmQpOw0K
Pj4gICAgCXJldHVybiAwOw0KPj4gICAgfQ0KPj4gQEAgLTc1MCw4ICs3NDcsNiBAQCBpbnQga2dk
MmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpDQo+PiAgICAJaWYgKCFrZmQtPmlu
aXRfY29tcGxldGUpDQo+PiAgICAJCXJldHVybiAwOw0KPj4gICAgDQo+PiAtCWRxbV91bmxvY2so
a2ZkLT5kcW0pOw0KPj4gLQ0KPj4gICAgCXJldCA9IGtmZF9yZXN1bWUoa2ZkKTsNCj4+ICAgIAlp
ZiAocmV0KQ0KPj4gICAgCQlyZXR1cm4gcmV0Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4+IGluZGV4IDgxZmI1
NDVjZjQyYy4uODJlMWM2MjgwZDEzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+PiBAQCAtMzQwLDYg
KzM0MCwxMCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2Vf
cXVldWVfbWFuYWdlciAqZHFtLA0KPj4gICAgCW1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZx
LT5tcWQsIHEtPm1xZF9tZW1fb2JqLA0KPj4gICAgCQkJCSZxLT5nYXJ0X21xZF9hZGRyLCAmcS0+
cHJvcGVydGllcyk7DQo+PiAgICAJaWYgKHEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKSB7DQo+PiAr
CQlpZiAoIWRxbS0+c2NoZWRfcnVubmluZykgew0KPj4gKwkJCVdBUk5fT05DRSgxLCAiTG9hZCBu
b24tSFdTIG1xZCB3aGlsZSBzdG9wcGVkXG4iKTsNCj4+ICsJCQlnb3RvIGFkZF9xdWV1ZV90b19s
aXN0Ow0KPj4gKwkJfQ0KPj4gICAgDQo+PiAgICAJCWlmIChXQVJOKHEtPnByb2Nlc3MtPm1tICE9
IGN1cnJlbnQtPm1tLA0KPj4gICAgCQkJCQkic2hvdWxkIG9ubHkgcnVuIGluIHVzZXIgdGhyZWFk
IikpDQo+PiBAQCAtMzUxLDYgKzM1NSw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX25vY3Bz
Y2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+PiAgICAJCQlnb3RvIG91dF9m
cmVlX21xZDsNCj4+ICAgIAl9DQo+PiAgICANCj4+ICthZGRfcXVldWVfdG9fbGlzdDoNCj4+ICAg
IAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3QpOw0KPj4gICAgCXFwZC0+cXVl
dWVfY291bnQrKzsNCj4+ICAgIAlpZiAocS0+cHJvcGVydGllcy5pc19hY3RpdmUpDQo+PiBAQCAt
NDU4LDYgKzQ2MywxMSBAQCBzdGF0aWMgaW50IGRlc3Ryb3lfcXVldWVfbm9jcHNjaF9sb2NrZWQo
c3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+PiAgICANCj4+ICAgIAlkZWFsbG9j
YXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQo+PiAgICANCj4+ICsJaWYgKCFkcW0tPnNjaGVkX3J1bm5p
bmcpIHsNCj4+ICsJCVdBUk5fT05DRSgxLCAiRGVzdHJveSBub24tSFdTIHF1ZXVlIHdoaWxlIHN0
b3BwZWRcbiIpOw0KPj4gKwkJcmV0dXJuIDA7DQo+PiArCX0NCj4+ICsNCj4+ICAgIAlyZXR2YWwg
PSBtcWRfbWdyLT5kZXN0cm95X21xZChtcWRfbWdyLCBxLT5tcWQsDQo+PiAgICAJCQkJS0ZEX1BS
RUVNUFRfVFlQRV9XQVZFRlJPTlRfUkVTRVQsDQo+PiAgICAJCQkJS0ZEX1VOTUFQX0xBVEVOQ1lf
TVMsDQo+PiBAQCAtNTMzLDYgKzU0MywxMiBAQCBzdGF0aWMgaW50IHVwZGF0ZV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxKQ0KPj4gICAgCQkg
ICAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUgfHwNCj4+ICAg
IAkJICAgIHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BIHx8DQo+PiAg
ICAJCSAgICBxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKSkg
ew0KPj4gKw0KPj4gKwkJaWYgKCFkcW0tPnNjaGVkX3J1bm5pbmcpIHsNCj4+ICsJCQlXQVJOX09O
Q0UoMSwgIlVwZGF0ZSBub24tSFdTIHF1ZXVlIHdoaWxlIHN0b3BwZWRcbiIpOw0KPj4gKwkJCWdv
dG8gb3V0X3VubG9jazsNCj4+ICsJCX0NCj4+ICsNCj4+ICAgIAkJcmV0dmFsID0gbXFkX21nci0+
ZGVzdHJveV9tcWQobXFkX21nciwgcS0+bXFkLA0KPj4gICAgCQkJCUtGRF9QUkVFTVBUX1RZUEVf
V0FWRUZST05UX0RSQUlOLA0KPj4gICAgCQkJCUtGRF9VTk1BUF9MQVRFTkNZX01TLCBxLT5waXBl
LCBxLT5xdWV1ZSk7DQo+PiBAQCAtNjAyLDYgKzYxOCwxMSBAQCBzdGF0aWMgaW50IGV2aWN0X3By
b2Nlc3NfcXVldWVzX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+
PiAgICAJCW1xZF9tZ3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5
cGUoDQo+PiAgICAJCQkJcS0+cHJvcGVydGllcy50eXBlKV07DQo+PiAgICAJCXEtPnByb3BlcnRp
ZXMuaXNfYWN0aXZlID0gZmFsc2U7DQo+PiArCQlkcW0tPnF1ZXVlX2NvdW50LS07DQo+PiArDQo+
PiArCQlpZiAoIWRxbS0+c2NoZWRfcnVubmluZykNCj4+ICsJCQljb250aW51ZTsNCj4+ICsNCj4+
ICAgIAkJcmV0dmFsID0gbXFkX21nci0+ZGVzdHJveV9tcWQobXFkX21nciwgcS0+bXFkLA0KPj4g
ICAgCQkJCUtGRF9QUkVFTVBUX1RZUEVfV0FWRUZST05UX0RSQUlOLA0KPj4gICAgCQkJCUtGRF9V
Tk1BUF9MQVRFTkNZX01TLCBxLT5waXBlLCBxLT5xdWV1ZSk7DQo+PiBAQCAtNjEwLDcgKzYzMSw2
IEBAIHN0YXRpYyBpbnQgZXZpY3RfcHJvY2Vzc19xdWV1ZXNfbm9jcHNjaChzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4+ICAgIAkJCSAqIG1haW50YWluIGEgY29uc2lzdGVudCBl
dmljdGlvbiBzdGF0ZQ0KPj4gICAgCQkJICovDQo+PiAgICAJCQlyZXQgPSByZXR2YWw7DQo+PiAt
CQlkcW0tPnF1ZXVlX2NvdW50LS07DQo+PiAgICAJfQ0KPj4gICAgDQo+PiAgICBvdXQ6DQo+PiBA
QCAtNzExLDYgKzczMSwxMSBAQCBzdGF0aWMgaW50IHJlc3RvcmVfcHJvY2Vzc19xdWV1ZXNfbm9j
cHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4+ICAgIAkJbXFkX21nciA9
IGRxbS0+bXFkX21ncnNbZ2V0X21xZF90eXBlX2Zyb21fcXVldWVfdHlwZSgNCj4+ICAgIAkJCQlx
LT5wcm9wZXJ0aWVzLnR5cGUpXTsNCj4+ICAgIAkJcS0+cHJvcGVydGllcy5pc19hY3RpdmUgPSB0
cnVlOw0KPj4gKwkJZHFtLT5xdWV1ZV9jb3VudCsrOw0KPj4gKw0KPj4gKwkJaWYgKCFkcW0tPnNj
aGVkX3J1bm5pbmcpDQo+PiArCQkJY29udGludWU7DQo+PiArDQo+PiAgICAJCXJldHZhbCA9IG1x
ZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+cGlwZSwNCj4+ICAgIAkJCQkgICAg
ICAgcS0+cXVldWUsICZxLT5wcm9wZXJ0aWVzLCBtbSk7DQo+PiAgICAJCWlmIChyZXR2YWwgJiYg
IXJldCkNCj4+IEBAIC03MTgsNyArNzQzLDYgQEAgc3RhdGljIGludCByZXN0b3JlX3Byb2Nlc3Nf
cXVldWVzX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+PiAgICAJ
CQkgKiBtYWludGFpbiBhIGNvbnNpc3RlbnQgZXZpY3Rpb24gc3RhdGUNCj4+ICAgIAkJCSAqLw0K
Pj4gICAgCQkJcmV0ID0gcmV0dmFsOw0KPj4gLQkJZHFtLT5xdWV1ZV9jb3VudCsrOw0KPj4gICAg
CX0NCj4+ICAgIAlxcGQtPmV2aWN0ZWQgPSAwOw0KPj4gICAgb3V0Og0KPj4gQEAgLTkxNSw3ICs5
MzksOCBAQCBzdGF0aWMgaW50IHN0YXJ0X25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5h
Z2VyICpkcW0pDQo+PiAgICAJDQo+PiAgICAJaWYgKGRxbS0+ZGV2LT5kZXZpY2VfaW5mby0+YXNp
Y19mYW1pbHkgPT0gQ0hJUF9IQVdBSUkpDQo+PiAgICAJCXJldHVybiBwbV9pbml0KCZkcW0tPnBh
Y2tldHMsIGRxbSk7DQo+PiAtCQ0KPj4gKwlkcW0tPnNjaGVkX3J1bm5pbmcgPSB0cnVlOw0KPj4g
Kw0KPj4gICAgCXJldHVybiAwOw0KPj4gICAgfQ0KPj4gICAgDQo+PiBAQCAtOTIzLDcgKzk0OCw4
IEBAIHN0YXRpYyBpbnQgc3RvcF9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtKQ0KPj4gICAgew0KPj4gICAgCWlmIChkcW0tPmRldi0+ZGV2aWNlX2luZm8tPmFzaWNfZmFt
aWx5ID09IENISVBfSEFXQUlJKQ0KPj4gICAgCQlwbV91bmluaXQoJmRxbS0+cGFja2V0cyk7DQo+
PiAtCQ0KPj4gKwlkcW0tPnNjaGVkX3J1bm5pbmcgPSBmYWxzZTsNCj4+ICsNCj4+ICAgIAlyZXR1
cm4gMDsNCj4+ICAgIH0NCj4+ICAgIA0KPj4gQEAgLTEwNzQsNiArMTEwMCw3IEBAIHN0YXRpYyBp
bnQgc3RhcnRfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pDQo+PiAgICAJ
ZHFtX2xvY2soZHFtKTsNCj4+ICAgIAkvKiBjbGVhciBoYW5nIHN0YXR1cyB3aGVuIGRyaXZlciB0
cnkgdG8gc3RhcnQgdGhlIGh3IHNjaGVkdWxlciAqLw0KPj4gICAgCWRxbS0+aXNfaHdzX2hhbmcg
PSBmYWxzZTsNCj4+ICsJZHFtLT5zY2hlZF9ydW5uaW5nID0gdHJ1ZTsNCj4+ICAgIAlleGVjdXRl
X3F1ZXVlc19jcHNjaChkcW0sIEtGRF9VTk1BUF9RVUVVRVNfRklMVEVSX0RZTkFNSUNfUVVFVUVT
LCAwKTsNCj4+ICAgIAlkcW1fdW5sb2NrKGRxbSk7DQo+PiAgICANCj4+IEBAIC0xMDg5LDYgKzEx
MTYsNyBAQCBzdGF0aWMgaW50IHN0b3BfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
ICpkcW0pDQo+PiAgICB7DQo+PiAgICAJZHFtX2xvY2soZHFtKTsNCj4+ICAgIAl1bm1hcF9xdWV1
ZXNfY3BzY2goZHFtLCBLRkRfVU5NQVBfUVVFVUVTX0ZJTFRFUl9BTExfUVVFVUVTLCAwKTsNCj4+
ICsJZHFtLT5zY2hlZF9ydW5uaW5nID0gZmFsc2U7DQo+PiAgICAJZHFtX3VubG9jayhkcW0pOw0K
Pj4gICAgDQo+PiAgICAJa2ZkX2d0dF9zYV9mcmVlKGRxbS0+ZGV2LCBkcW0tPmZlbmNlX21lbSk7
DQo+PiBAQCAtMTI3NSw5ICsxMzAzLDEwIEBAIHN0YXRpYyBpbnQgbWFwX3F1ZXVlc19jcHNjaChz
dHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4+ICAgIHsNCj4+ICAgIAlpbnQgcmV0
dmFsOw0KPj4gICAgDQo+PiArCWlmICghZHFtLT5zY2hlZF9ydW5uaW5nKQ0KPj4gKwkJcmV0dXJu
IDA7DQo+PiAgICAJaWYgKGRxbS0+cXVldWVfY291bnQgPD0gMCB8fCBkcW0tPnByb2Nlc3Nlc19j
b3VudCA8PSAwKQ0KPj4gICAgCQlyZXR1cm4gMDsNCj4+IC0NCj4+ICAgIAlpZiAoZHFtLT5hY3Rp
dmVfcnVubGlzdCkNCj4+ICAgIAkJcmV0dXJuIDA7DQo+PiAgICANCj4+IEBAIC0xMjk5LDYgKzEz
MjgsOCBAQCBzdGF0aWMgaW50IHVubWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVl
X21hbmFnZXIgKmRxbSwNCj4+ICAgIHsNCj4+ICAgIAlpbnQgcmV0dmFsID0gMDsNCj4+ICAgIA0K
Pj4gKwlpZiAoIWRxbS0+c2NoZWRfcnVubmluZykNCj4+ICsJCXJldHVybiAwOw0KPj4gICAgCWlm
IChkcW0tPmlzX2h3c19oYW5nKQ0KPj4gICAgCQlyZXR1cm4gLUVJTzsNCj4+ICAgIAlpZiAoIWRx
bS0+YWN0aXZlX3J1bmxpc3QpDQo+PiBAQCAtMTkwMyw2ICsxOTM0LDEyIEBAIGludCBkcW1fZGVi
dWdmc19ocWRzKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4+ICAgIAlpbnQgcGlw
ZSwgcXVldWU7DQo+PiAgICAJaW50IHIgPSAwOw0KPj4gICAgDQo+PiArCWlmICghZHFtLT5zY2hl
ZF9ydW5uaW5nKSB7DQo+PiArCQlzZXFfcHJpbnRmKG0sICIgRGV2aWNlIGlzIHN0b3BwZWRcbiIp
Ow0KPj4gKw0KPj4gKwkJcmV0dXJuIDA7DQo+PiArCX0NCj4+ICsNCj4+ICAgIAlyID0gZHFtLT5k
ZXYtPmtmZDJrZ2QtPmhxZF9kdW1wKGRxbS0+ZGV2LT5rZ2QsDQo+PiAgICAJCQkJCUtGRF9DSUtf
SElRX1BJUEUsIEtGRF9DSUtfSElRX1FVRVVFLA0KPj4gICAgCQkJCQkmZHVtcCwgJm5fcmVncyk7
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuaA0KPj4gaW5kZXggMmVhZWE2YjA0Y2JlLi5hOGMzN2U2ZGEwMjcgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21h
bmFnZXIuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmgNCj4+IEBAIC0yMDEsNiArMjAxLDcgQEAgc3RydWN0IGRldmljZV9xdWV1
ZV9tYW5hZ2VyIHsNCj4+ICAgIAlib29sCQkJaXNfaHdzX2hhbmc7DQo+PiAgICAJc3RydWN0IHdv
cmtfc3RydWN0CWh3X2V4Y2VwdGlvbl93b3JrOw0KPj4gICAgCXN0cnVjdCBrZmRfbWVtX29iaglo
aXFfc2RtYV9tcWQ7DQo+PiArCWJvb2wJCQlzY2hlZF9ydW5uaW5nOw0KPj4gICAgfTsNCj4+ICAg
IA0KPj4gICAgdm9pZCBkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0X2NpaygNCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
