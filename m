Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83BBADF1
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B874D6E0E4;
	Mon, 23 Sep 2019 06:41:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D66E0E4
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 06:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fudgbMDFQWA+kNifo8Hy0jOqbvo8o8rxwDI1OC/z3WQqTFm5pRBlngimt6NCZy+bPbufnbagjrmEMMrkGoNGsLBo4rqy9+AuZGjYMx7uXKuM0s5p4kATk6Z0jgAi5WNOCvEMwcWCZaro7Gxxj83WEvV/xIaHk6SyQEft+jr3uSv6V9oW1lxdB2e+MSv8f/3b9UEfA3PAxYv/prVukuOg+0sgETqNkYFeaBmVVKtPv2MIGde4YNyWOMQKKF/YHtbHUibhKWa5qw/s1ul12hx7H6biZ5HVaXFeu3mcWhdITfRQGwuTvpXXHiu0dMwFNo9gApcflQ2zW57lMCs9N0G0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vipLTVHMZUCqHd3Wh/LoQmUuVWOQQO8qem5MA8uXM1k=;
 b=Amx/pEEY25qwhQd0znGaz/cENOg+KsIQMpkHsqPeuw1RU+CAR4Ekdi8Gi2XsoAbQUKw6fIpHNLVpAVWw0OLQ9mAQG8QWpEPuRuk0BEdtTNF8NRoocMdtNIGxh5ql2CmaqzjuPtiJdea9qr2dHoWUWPReh9kj+5nCnIGEGPMIS9d0SLK7TDGJUZoZQfzuuNLXDgZfgLU78DSw79gnxWqMmKMgXYfBtmz7AYimJxZk8GNRoFspVFZzoZHZOTCwZv4ROnKDV6NcpTf4j6gQ3pBRxggnDrrra/joxfdTj84mrxBxlll29r809FjUnOEVG3kjDeMNmsleL9pQC8ewPrd7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3584.namprd12.prod.outlook.com (20.178.242.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 06:41:18 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 06:41:18 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Gong, Curry" <Curry.Gong@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: Add mode2 mode for GPU RESET
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: Add mode2 mode for GPU RESET
Thread-Index: AQHVcdYomyw4IKes1U+mArf3DmKnHKc4zSeA
Date: Mon, 23 Sep 2019 06:41:17 +0000
Message-ID: <MN2PR12MB38382005F9B205E969D0A981F0850@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1569219248-29457-1-git-send-email-curry.gong@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79cb4917-07a1-40ce-59ca-08d73ff109dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3584; 
x-ms-traffictypediagnostic: MN2PR12MB3584:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3584D6440B651057C302E29FF0850@MN2PR12MB3584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(13464003)(189003)(199004)(9686003)(25786009)(71200400001)(71190400001)(7696005)(8676002)(74316002)(4326008)(5660300002)(81156014)(76176011)(33656002)(81166006)(229853002)(966005)(14454004)(446003)(11346002)(486006)(66066001)(6116002)(478600001)(476003)(3846002)(52536014)(102836004)(86362001)(6436002)(6306002)(55016002)(186003)(6246003)(53546011)(6506007)(7736002)(66556008)(66946007)(66476007)(76116006)(110136005)(2906002)(66446008)(64756008)(14444005)(256004)(2501003)(26005)(8936002)(99286004)(316002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3584;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PYuFSUvezPyMDt1rcdrve0CCSOBRl6lz8Q8EuJ4Lcz2HDcwV5hdj4sC2ssm5G3r/8PC437NOTrbxY9FwpY7/XK1f2s46iiDBr6QfoPBSynGWhFEadCf01pPHl+uM6jsylAjAi7qLymID90lmZWsYEMqfNpH5/Q/sVFHMqCdAiquDB0Bqp//VT0tAqSQu1Rcm6kgmdIV5d2c7fnybWxLmHFIfFsI8kYwrbC2iJImd91KJVrZ8FTWdOlA4vI7NIHIxQ8XbDMf7Tnjy0Bu4oo5DCq2qthsWeeWcZu3aNbvvfjbfHb3GKNbyDINdB9c9nG1yMfnc8MiD4qoiLYXdr4Q+eGyFm/hseG0qG7ZT+IRKXDm0x5/rgXYaTyxvRUvYKQyGOXOxkmoPjmAKERl38oP3T1zbNd9j5yk/J/a+Sh28ka8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cb4917-07a1-40ce-59ca-08d73ff109dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 06:41:17.9879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LpwxXYSLDb2m5OIG1FXSGPXUuCHBMpNb8W5g9bt5QfEJUPZokCqadY8iaz6kvwXZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vipLTVHMZUCqHd3Wh/LoQmUuVWOQQO8qem5MA8uXM1k=;
 b=QlW5ugTXEsx9A/uOKn5Y/JKIuz2/3a7GA5Th2SL/14f+yEZu3rPyAKpBva0qEeYWzTtBRcy64ZX5/gDAvRzLkilDYn+Ri7I408Ffl8UVJsNczFIGqhqSs0oEOIy8hGgX3iZwLXHGKievOq94+dpzq1bx5R4MK/FUAmjxoLCeIBc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgY3VycnksDQoNCjEuIFlvdSBjYW4gc2VwYXJhdGUgdGhlIHBhdGNoIGludG8gMiBwYXRjaGVz
LCBvbmUgaXMgd29ya2Fyb3VuZCBpbiBzbXVfc3VzcGVuZCBhbmQgYW5vdGhlciBpcyB0aGUgaW1w
bGVtZW50YXRpb24gb2YgbW9kZTJfcmVzZXQuDQoyLiBod21nci5oIGlzIHVzZWQgZm9yIGFtZGdw
dV9wb3dlcnBsYXkgaW5zdGVhZCBvZiBhbWRncHVfc211LiBZb3UgY2FuIGRlZmluZSBpdCBkaXJl
Y3RseSBpbiBhbWRncHVfc211LmgNCg0KQlIsDQpBYXJvbiBMaXUNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgY2hlbg0KPiBnb25nDQo+IFNlbnQ6IE1vbmRheSwg
U2VwdGVtYmVyIDIzLCAyMDE5IDI6MTQgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBHb25nLCBDdXJyeSA8Q3VycnkuR29uZ0BhbWQuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMS8yXSBkcm0vYW1kL3Bvd2VycGxheTogQWRkIG1vZGUyIG1vZGUgZm9yIEdQVSBS
RVNFVA0KPiANCj4gQ2hhbmdlcyB0byBmdW5jdGlvbiAic211X3N1c3BlbmQiIGluIGFtZGdwdV9z
bXUuYyBpcyBhIHdvcmthcm91bmQuDQo+IA0KPiBXZSBzaG91bGQgZ2V0IHJlYWwgaW5mb3JtYXRp
b24gYWJvdXQgaWYgYmFjbyBpcyBlbmFibGVkIG9yIG5vdCwgd2hpbGUgd2UNCj4gYWx3YXlzIGNv
bnNpZGVyIEFQVSBTTVUgZmVhdHVyZSBhcyBlbmFibGVkIGluIGN1cnJlbnQgY29kZS4NCj4gDQo+
IEkga25vdyBBUFUgZG8gbm90IHN1cHBvcnQgYmFjbyBtb2RlIGZvciBHUFUgcmVzZXQsIHNvIEkg
dXNlICJhZGV2LT5mbGFncyINCj4gdG8gc2tpcCBmdW5jdGlvbiAic211X2ZlYXR1cmVfaXNfZW5h
YmxlZCIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBjaGVuIGdvbmcgPGN1cnJ5LmdvbmdAYW1kLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMg
ICAgIHwgNSArKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaCB8IDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEy
XzAuYyAgICAgIHwgNiArKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYw0KPiBpbmRleCA5MGZhNDQ0Li5lNTFkNzI3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQo+IEBAIC0xMzYzLDcgKzEzNjMs
MTAgQEAgc3RhdGljIGludCBzbXVfc3VzcGVuZCh2b2lkICpoYW5kbGUpDQo+ICAJaW50IHJldDsN
Cj4gIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
KWhhbmRsZTsNCj4gIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7DQo+IC0J
Ym9vbCBiYWNvX2ZlYXR1cmVfaXNfZW5hYmxlZCA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211
LA0KPiBTTVVfRkVBVFVSRV9CQUNPX0JJVCk7DQo+ICsJYm9vbCBiYWNvX2ZlYXR1cmVfaXNfZW5h
YmxlZCA9IGZhbHNlOw0KPiArDQo+ICsJaWYgKCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkN
Cj4gKwkJYmFjb19mZWF0dXJlX2lzX2VuYWJsZWQgPSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNt
dSwNCj4gK1NNVV9GRUFUVVJFX0JBQ09fQklUKTsNCj4gDQo+ICAJcmV0ID0gc211X3N5c3RlbV9m
ZWF0dXJlc19jb250cm9sKHNtdSwgZmFsc2UpOw0KPiAgCWlmIChyZXQpDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KPiBpbmRleCA0NWRh
MjFkLi4zNWU4YjBjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvYW1kZ3B1X3NtdS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgNCj4gQEAgLTUzNyw2ICs1MzcsNyBAQCBzdHJ1Y3Qgc211X2Z1bmNz
DQo+ICAJZW51bSBzbXVfYmFjb19zdGF0ZSAoKmJhY29fZ2V0X3N0YXRlKShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSk7DQo+ICAJaW50ICgqYmFjb19zZXRfc3RhdGUpKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCBlbnVtDQo+IHNtdV9iYWNvX3N0YXRlIHN0YXRlKTsNCj4gIAlpbnQgKCpiYWNvX3Jl
c2V0KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7DQo+ICsgICAgaW50ICgqbW9kZTJfcmVzZXQp
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsNCj4gIAlpbnQgKCpnZXRfZHBtX3VsdGltYXRlX2Zy
ZXEpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtDQo+IHNtdV9jbGtfdHlwZSBjbGtfdHlw
ZSwgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCk7ICB9Ow0KPiANCj4gQEAgLTc2MCw2ICs3
NjEsOCBAQCBzdHJ1Y3Qgc211X2Z1bmNzDQo+ICAJKChzbXUpLT5mdW5jcy0+YmFjb19nZXRfc3Rh
dGU/IChzbXUpLT5mdW5jcy0NCj4gPmJhY29fZ2V0X3N0YXRlKChzbXUpLCAoc3RhdGUpKSA6IDAp
ICAjZGVmaW5lIHNtdV9iYWNvX3Jlc2V0KHNtdSkgXA0KPiAgCSgoc211KS0+ZnVuY3MtPmJhY29f
cmVzZXQ/IChzbXUpLT5mdW5jcy0+YmFjb19yZXNldCgoc211KSkgOiAwKQ0KPiArI2RlZmluZSBz
bXVfbW9kZTJfcmVzZXQoc211KSBcDQo+ICsgICAgKChzbXUpLT5mdW5jcy0+bW9kZTJfcmVzZXQ/
IChzbXUpLT5mdW5jcy0+bW9kZTJfcmVzZXQoKHNtdSkpIDogMCkNCj4gICNkZWZpbmUgc211X2Fz
aWNfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHNtdSwgbGV2ZWwpIFwNCj4gIAkoKHNtdSktPnBwdF9m
dW5jcy0+c2V0X3BlcmZvcm1hbmNlX2xldmVsPyAoc211KS0+cHB0X2Z1bmNzLQ0KPiA+c2V0X3Bl
cmZvcm1hbmNlX2xldmVsKChzbXUpLCAobGV2ZWwpKSA6IC1FSU5WQUwpOyAgI2RlZmluZQ0KPiBz
bXVfZHVtcF9wcHRhYmxlKHNtdSkgXCBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMl8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjEyXzAuYw0KPiBpbmRleCAyNDI3NGM5Li5mNzYyYTk4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYw0KPiBAQCAtMzAsNiArMzAsNyBAQA0K
PiAgI2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIg0KPiAgI2luY2x1ZGUgImF0b20uaCINCj4gICNp
bmNsdWRlICJyZW5vaXJfcHB0LmgiDQo+ICsjaW5jbHVkZSAiaHdtZ3IuaCINCj4gDQo+ICAjaW5j
bHVkZSAiYXNpY19yZWcvbXAvbXBfMTJfMF8wX29mZnNldC5oIg0KPiAgI2luY2x1ZGUgImFzaWNf
cmVnL21wL21wXzEyXzBfMF9zaF9tYXNrLmgiDQo+IEBAIC0zODAsNiArMzgxLDEwIEBAIHN0YXRp
YyBpbnQNCj4gc211X3YxMl8wX2dldF9kcG1fdWx0aW1hdGVfZnJlcShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgZW51bQ0KPiBzbXVfY2xrDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICtz
dGF0aWMgaW50IHNtdV92MTJfMF9tb2RlMl9yZXNldChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSl7
DQo+ICsJcmV0dXJuIHNtdV92MTJfMF9zZW5kX21zZ193aXRoX3BhcmFtKHNtdSwNCj4gK1NNVV9N
U0dfR2Z4RGV2aWNlRHJpdmVyUmVzZXQsIFNNVV9BU0lDX1JFU0VUX01PREVfMik7IH0NCj4gKw0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbXVfZnVuY3Mgc211X3YxMl8wX2Z1bmNzID0gew0KPiAg
CS5jaGVja19md19zdGF0dXMgPSBzbXVfdjEyXzBfY2hlY2tfZndfc3RhdHVzLA0KPiAgCS5jaGVj
a19md192ZXJzaW9uID0gc211X3YxMl8wX2NoZWNrX2Z3X3ZlcnNpb24sIEBAIC0zOTQsNg0KPiAr
Mzk5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbXVfZnVuY3Mgc211X3YxMl8wX2Z1bmNzID0g
ew0KPiAgCS5maW5pX3NtY190YWJsZXMgPSBzbXVfdjEyXzBfZmluaV9zbWNfdGFibGVzLA0KPiAg
CS5wb3B1bGF0ZV9zbWNfdGFibGVzID0gc211X3YxMl8wX3BvcHVsYXRlX3NtY190YWJsZXMsDQo+
ICAJLmdldF9kcG1fdWx0aW1hdGVfZnJlcSA9IHNtdV92MTJfMF9nZXRfZHBtX3VsdGltYXRlX2Zy
ZXEsDQo+ICsJLm1vZGUyX3Jlc2V0ID0gc211X3YxMl8wX21vZGUyX3Jlc2V0LA0KPiAgfTsNCj4g
DQo+ICB2b2lkIHNtdV92MTJfMF9zZXRfc211X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211
KQ0KPiAtLQ0KPiAyLjcuNA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
