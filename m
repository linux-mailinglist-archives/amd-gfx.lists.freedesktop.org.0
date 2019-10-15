Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CAFD7848
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 16:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D546E81D;
	Tue, 15 Oct 2019 14:20:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341F26E81D
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 14:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABWbh5l1ut7itHxBuKbCHfKH+4WtE7BdNrz10UgWS4NlewJ2gMJYohrhI0VAeq8woHIpoL6KQ55Xu91Y4unNGFR5OO982z3Dx4Y8SNTNDS42dRTqbnpxrYDmIsI08XQ99Q3H/IIC8zlBDgse/Ke/Esdb3Rt4RfhgMOXSV1C94QjTXcwECVmN6QxJOhgCyKBCnLwINUXwcVaOnSRudOMk1pd2ZrHr9vaJwpsOTJHL/yYojAM6Xq9KnEUUILRdjSZPP9f9lG7fB+Lr+8Z8s85VewEKphUJvR1LuoOuQZDGyE6w9jNH3tYbYbHDFhSY3nDaLeqysj/ytw4UxFCW3GxoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWyjg9qmpdYnWuvNGCKkEgtiein857/4vccrAGOs5iU=;
 b=PCYnlMpkK8y7UK3/T34PvDUlH9kzmlkGwKklA/JcX42uVLnGOJo0HVQ5ZWGl7SPf4CYJMOfvC20HwiVw0G18nL/OYeGjh2tU1wOBP7UG1efl22kRcmOfi/3Flq3vhpiqYpszmxNv55FsAHIogDo7R14v9ClzUD4mfnl8AITl9Ku5Xtv/gv8T/DffqsfGUgy8ZVuBHAWKC89l1WU4a4QP7KSxydSpje5EUeMRfdG31HKywwXegm3IPqNahiMluaqeAc5arPQf6el8d+dBMejzHtEQVIGyZ18Zwl12mJJslrKRiX3VJVuVxFEHNwliaHKw8lml/cyWdvh+o8uFr0OlgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1334.namprd12.prod.outlook.com (10.168.169.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 14:20:04 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Tue, 15 Oct
 2019 14:20:04 +0000
From: James Zhu <jamesz@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James"
 <James.Zhu@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
Thread-Topic: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
Thread-Index: AQHVgHWjklEm5qLixUKDm7P+epzd8adZ3H8AgABBmYCAAADHAIABp3iA
Date: Tue, 15 Oct 2019 14:20:03 +0000
Message-ID: <6e578172-509a-09ad-4819-a5e8dbf4a7ff@amd.com>
References: <20191011205050.21021-1-alexander.deucher@amd.com>
 <990fccc3-f8a1-a1dc-52c6-5299c645c24a@gmail.com>
 <CADnq5_O9ipAScOVXAvaqGTuM-4qMhzJdAK6_yxCg3-E3xzfqOA@mail.gmail.com>
 <5f597d92-86f1-d221-abde-d3f7f9597024@amd.com>
In-Reply-To: <5f597d92-86f1-d221-abde-d3f7f9597024@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d34291ec-83c1-40bf-f9dc-08d7517ac56d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1334:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB13342D5244615AF5D6D91ED1E4930@CY4PR12MB1334.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(25786009)(99286004)(7736002)(2906002)(52116002)(229853002)(4326008)(305945005)(256004)(6636002)(6506007)(53546011)(386003)(5660300002)(6486002)(76176011)(478600001)(966005)(31686004)(102836004)(6436002)(81166006)(71190400001)(71200400001)(14454004)(3846002)(36756003)(8676002)(6116002)(26005)(54906003)(8936002)(6246003)(316002)(486006)(31696002)(6512007)(2616005)(476003)(11346002)(446003)(66574012)(66066001)(186003)(4001150100001)(6306002)(66556008)(66446008)(64756008)(66476007)(110136005)(81156014)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1334;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ykk48CBfHwThem7ZQz5k2l9ebkMwhQJ/j3j+hcz6vRw6YNDhY57kDtB7GXkKdWYtLrVOU74CcCB8xdfLcIvAIoLWYcMffCtUFxkO3DpfRSwQGyCFWaNG4XbaUFQe1LcN5+iM/g95ZEI3+942Qg+BwIWz5kQdMxI7X/ifiUVuEc0C6WJm8ZbFKhOof4ZiiHrU1p1Dj9s18TP0/bVSw2EH7qJvBFRVBd8bg/Z+w8eISefwiYK1vkoL8Z6mdOa06sWEdtv9hb2SOHVZCM3SeLDoOOY1a4dgZG0mWqZ3cFli9SNBBlz0R5uwCztlPMVVLMh1EG4QBULz4qgXVGTIkYmSIeKihhjmwAFPx4ImbSdo1fNfnkz/7e+XZr75VrwknPPDioxk+ftKz27Srmd11YMH+RtLA/XFdCkX3S1YGowYspyjKg1TTHO0VUi+YjA17DBW7lK+A9N23d+f3wUn3hY4g==
Content-ID: <A8707D0AAAA28C498EA02EA914DEACD0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34291ec-83c1-40bf-f9dc-08d7517ac56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 14:20:03.9072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YRwT0uQfkVwuyESx/vz+JZgdwl+qBMZJ9hvbS0xn/stBuOKA2TCIEEr4cDPBqNu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWyjg9qmpdYnWuvNGCKkEgtiein857/4vccrAGOs5iU=;
 b=AFqI2jz1ncWp82IYpiS42zT3yoAHGIsLIboWlWeRho0yenoHuIoi9it18gEE1esGQeiMyZtrRP/xperT6RbuN6COzCBf0S3KX2YbJMtWvhcc0XlpdaTvbGItg5JnjTauz55+BGfcbpicTBwFYKXa6WHB9zgf72KgST+rignijSg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTEwLTE0IDk6MDQgYS5tLiwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+IEFt
IDE0LjEwLjE5IHVtIDE1OjAxIHNjaHJpZWIgQWxleCBEZXVjaGVyOg0KPj4gT24gTW9uLCBPY3Qg
MTQsIDIwMTkgYXQgNTowNiBBTSBDaHJpc3RpYW4gS8O2bmlnDQo+PiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IEFtIDExLjEwLjE5IHVtIDIyOjUwIHNjaHJp
ZWIgQWxleCBEZXVjaGVyOg0KPj4+PiBXZSBuZWVkIHRvIGFsbG9jYXRlIGEgbGFyZ2UgZW5vdWdo
IGJ1ZmZlciBmb3IgdGhlDQo+Pj4+IHNlc3Npb24gaW5mbywgb3RoZXJ3aXNlIHRoZSBJQiB0ZXN0
IGNhbiBvdmVyd3JpdGUNCj4+Pj4gb3RoZXIgbWVtb3J5Lg0KPj4+Pg0KPj4+PiBCdWc6IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0MjQxDQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+PiBB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3Ig
dGhlIHNlcmllcy4NCj4+ICsgTGVvLCBKYW1lcw0KPj4NCj4+IFNlZW1zIGxpa2Ugd2Ugc3RpbGwg
b3ZlcndyaXRlIHRoZSBidWZmZXIuICBEbyB5b3Uga25vdyBob3cgYmlnIHRoZQ0KPj4gc2Vzc2lv
biBidWZmZXIgbmVlZHMgdG8gYmU/ICBJcyBpdCBkaWZmZXJlbnQgZm9yIFVWRCBhbmQgVkNOPw0K
DQpJIHdpbGwgY2hlY2sgd2l0aCBGaXJtd2FyZSB0ZWFtLg0KDQpKYW1lcw0KDQo+IEF0IGxlYXN0
IG9yaWdpbmFsbHkgd2UgYWxsb2NhdGVkIGEgc2VwYXJhdGUgNEtCIEJPIGluIFZSQU0gZm9yIHRo
aXMuIFRoZQ0KPiBtZXNzYWdlIHdhcyBxdWl0ZSBsYXJnZSBJSVJDLg0KPg0KPiBDaHJpc3RpYW4u
DQo+DQo+PiBBbGV4DQo+Pg0KPj4+PiAtLS0NCj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3V2ZF92Nl8wLmMgfCA4ICsrKystLS0tDQo+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4+Pj4gaW5kZXggNjcwNzg0YTc4NTEyLi45MDliYzJjZTc5
MWYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8w
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KPj4+
PiBAQCAtMjE1LDEyICsyMTUsMTIgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0
ZV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUNCj4+Pj4gICAg
ICAgICB1aW50NjRfdCBkdW1teTsNCj4+Pj4gICAgICAgICBpbnQgaSwgcjsNCj4+Pj4NCj4+Pj4g
LSAgICAgciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihyaW5nLT5hZGV2LCBpYl9zaXplX2R3
ICogNCwgJmpvYik7DQo+Pj4+ICsgICAgIHIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIocmlu
Zy0+YWRldiwgKGliX3NpemVfZHcgKiA0KSArIDEwMjQsICZqb2IpOw0KPj4+PiAgICAgICAgIGlm
IChyKQ0KPj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHI7DQo+Pj4+DQo+Pj4+ICAgICAgICAg
aWIgPSAmam9iLT5pYnNbMF07DQo+Pj4+IC0gICAgIGR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAy
NDsNCj4+Pj4gKyAgICAgZHVtbXkgPSBpYi0+Z3B1X2FkZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOw0K
Pj4+Pg0KPj4+PiAgICAgICAgIGliLT5sZW5ndGhfZHcgPSAwOw0KPj4+PiAgICAgICAgIGliLT5w
dHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7DQo+Pj4+IEBAIC0yNzcsMTIgKzI3Nywx
MiBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLA0KPj4+PiAgICAgICAgIHVpbnQ2NF90IGR1bW15Ow0KPj4+PiAgICAgICAg
IGludCBpLCByOw0KPj4+Pg0KPj4+PiAtICAgICByID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2li
KHJpbmctPmFkZXYsIGliX3NpemVfZHcgKiA0LCAmam9iKTsNCj4+Pj4gKyAgICAgciA9IGFtZGdw
dV9qb2JfYWxsb2Nfd2l0aF9pYihyaW5nLT5hZGV2LCAoaWJfc2l6ZV9kdyAqIDQpICsgMTAyNCwg
JmpvYik7DQo+Pj4+ICAgICAgICAgaWYgKHIpDQo+Pj4+ICAgICAgICAgICAgICAgICByZXR1cm4g
cjsNCj4+Pj4NCj4+Pj4gICAgICAgICBpYiA9ICZqb2ItPmlic1swXTsNCj4+Pj4gLSAgICAgZHVt
bXkgPSBpYi0+Z3B1X2FkZHIgKyAxMDI0Ow0KPj4+PiArICAgICBkdW1teSA9IGliLT5ncHVfYWRk
ciArIChpYl9zaXplX2R3ICogNCk7DQo+Pj4+DQo+Pj4+ICAgICAgICAgaWItPmxlbmd0aF9kdyA9
IDA7DQo+Pj4+ICAgICAgICAgaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
