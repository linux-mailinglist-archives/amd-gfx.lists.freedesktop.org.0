Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863F103D1A
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2019 15:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0066C6E5F6;
	Wed, 20 Nov 2019 14:17:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5C6EA50
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 14:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9e/GgUlfWQJpqBB64BHG06/9L94pIfrdH66C9x11agsjVe7nMKuI/arFyjqid7lfCPVmO72lnMS4aQbziiylVPGW7llKUa06/ZqVAhMUXCSymuzX5d5pGKwgaXSMQevLp156I7QUmHEOKx4K46Qzok7A6If5U3bfc/RV4mVLatUERqklcbweDOG4X6sfajcnyGK2r8qTPN9pfzvYEdSBKKqB1fnc55WQM+jwx9dWOl8jgfZx6pX9sh1FZgowOY7spTrrn2SAaCz+e+kbkyOGggOWmx52CSn9GBaQE43RNQ5jF3h6OtwfS/zh5VJPjiFd7TAB3s44nqAvEZo4Ex5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMz0k5+5DvGaO1cmQIejc6g8AMQwjb9tnHES0KZ5LX8=;
 b=gwkyvhdSePOCKOABnsmr5MDdFVNixvx4WuED/hL11rnbqxgfE7bGK9YwVJzgvXBfVmVCkbzG3ObmmEPL2D8IKOenDJNGrpRss61Qup02etA4hEj4lNrC1Z9pUVxfhLUwGTtJyoHfwAARu7YLo9k79wv2zy0MIKLIk48tHZAxx/mtXgnCeBbTIPmMtGPaz9/Ry+310EVVk5TD1LTM4CmtpvJpbLw9XPQ6pVkZUd4/fUt8etef+RQINJkMA7+EoxgI0AIlexLx25mapICRBCUYCE6NlJAuJ/hV0R5+HaTG6rhvEzA3EyCSqo9a27D9Quk0O69O6A3DkRfK19bTSmeibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB4256.namprd12.prod.outlook.com (52.135.48.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Wed, 20 Nov 2019 14:16:55 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580%6]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 14:16:54 +0000
From: "Zhu, Changfeng" <Changfeng.Zhu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Huang, Shimmer"
 <Xinmei.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOetlOWkjTog562U5aSNOiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBp?=
 =?utf-8?B?bnZhbGlkYXRlIG1taHViIHNlbXBob3JlIHdvcmthcm91bmQgaW4gYW1kZ3B1?=
 =?utf-8?Q?=5Fvirt?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6IGludmFs?=
 =?utf-8?B?aWRhdGUgbW1odWIgc2VtcGhvcmUgd29ya2Fyb3VuZCBpbiBhbWRncHVfdmly?=
 =?utf-8?Q?t?=
Thread-Index: AQHVn4cK1/dvbyILqkGZU8vKP05viqeUCt8AgAAAu4CAAAlNAIAAAbOAgAAAYFA=
Date: Wed, 20 Nov 2019 14:16:54 +0000
Message-ID: <MN2PR12MB289616C5DA35AF8AE1799114FD4F0@MN2PR12MB2896.namprd12.prod.outlook.com>
References: <20191120091418.26526-1-changfeng.zhu@amd.com>
 <MN2PR12MB3933863C8DFCE1F68A44EFFA844F0@MN2PR12MB3933.namprd12.prod.outlook.com>
 <1d7cd15c-f529-93da-c15e-a1fde745e6c5@amd.com>
 <MN2PR12MB39330A0D6169250A0B75700D844F0@MN2PR12MB3933.namprd12.prod.outlook.com>
 <2d410370-01d0-c845-1229-529610898604@gmail.com>
In-Reply-To: <2d410370-01d0-c845-1229-529610898604@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2408:8025:21e:7f20:b0b9:b5d:6e3c:895e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ec9f931-8c27-43bd-8bd6-08d76dc44bdb
x-ms-traffictypediagnostic: MN2PR12MB4256:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42563FDE482F28EA64FE05DAFD4F0@MN2PR12MB4256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(189003)(199004)(13464003)(7696005)(25786009)(66476007)(66556008)(64756008)(6506007)(53546011)(110136005)(81166006)(81156014)(76176011)(316002)(186003)(966005)(2501003)(14454004)(478600001)(46003)(446003)(11346002)(5660300002)(52536014)(476003)(486006)(305945005)(71190400001)(6116002)(74316002)(71200400001)(66574012)(6436002)(99286004)(102836004)(8936002)(33656002)(7736002)(6246003)(76116006)(2906002)(86362001)(229853002)(14444005)(256004)(55016002)(9686003)(6306002)(66946007)(66446008)(224303003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4256;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DkbpjFnHT6ecqb7EZwjopuVHiU7zil5GCsWmKWwYlhpKtYJplQwx3J3Xe24l2YVVFpszXoZXKo0RHOnG6n7WKLuhtEikSBZ2dCydtVEtRMuZJyYXzl7XErSR2phzFp3qLgWwJqW6wmP4JOWBS/GuYldNZyK+N5WPm5A+VG8QsM2T5qYdA25fQwThpNdxpLJjP5vvnPsd0+aIaecAiY7fy30yAlzm5CkYqpPOibYnIwuuoYdnh0Nh2V7/19KOfCBxazFSjefDyw7BO/ddGXIeLDbP11zahKFaDK0L6f5wqmA4o77J14TKi/gSWEJk/fcASaGDYFqHtZDAn7UQXcrgZ+0aSWwaFc9ej2EmfoDDE5kgoVfxNo1pIfLazUgZE9Ln82sCLsmIYDXprqIgdqPy1hpuUJWR7ljaQAtTEimkV3w3HkrlyiSWqYaT4yLhJeyIITZAXQGuo7XAYloA5+U4ltFbvR4XYcURPHpV0LX3mkM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec9f931-8c27-43bd-8bd6-08d76dc44bdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 14:16:54.7852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4iJKcOpH3lMFb/fgSNqx2r2SUFrQwfYe48xDaGhQU9ymwspfbKOLFtQrqCIDUcyyce5ex/I7JHVT1gIE+U7zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMz0k5+5DvGaO1cmQIejc6g8AMQwjb9tnHES0KZ5LX8=;
 b=bWvZjbuZJHKDyNyrr6M0xGqerLjPPMUvXAKt3ndKimpq6K8/CAXi383owpIPo52Azz3HoQYRNVMDGLJkyoWlKLXYyhrw0Oox49xQtxG5O9ztVt+ElP0PfATS9vipzVuShJVcSPQwZ1F6pWhQFXzqkDhJ531nniE+qfcLiPxsFu4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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

Pj4+IERpZCBDaGFuZ2ZlbmcgYWxyZWFkeSBoaXQgdGhpcyBpc3N1ZSB1bmRlciBTUklPViA/Pz8N
Cg0KSSBtZWV0IHRoaXMgcHJvYmxlbSBvbiBuYXZpMTQgdW5kZXIgZ21jX3YxMF8wX2VtaXRfZmx1
c2hfZ3B1X3RsYiAuDQpUaGUgcHJvYmxlbSBpcyBhbHNvIHNlZW4gYnkgWmhvdSxUYW8uDQoNCkFu
ZCB0aGlzIGlzIHRpY2tldDoNCmh0dHA6Ly9vbnRyYWNrLWludGVybmFsLmFtZC5jb20vYnJvd3Nl
L1NXREVWLTIwMTQ1OQ0KDQpBZnRlciB0aGUgc2VtYXBob3JlIHBhdGNoLCB0aGUgcHJvYmxlbSBj
YW4gYmUgZml4ZWQuDQoNCklmIFNST1YgaGFzIGNvbmNlcm4gYWJvdXQgdGhpcyBwcm9ibGVtLCAg
aXQgc2hvdWxkIG5vdCBhZGQgc2VtYXBob3JlIGluIFNST1YuDQoNCkhvd2V2ZXIsIHdlIHNob3Vs
ZCBhcHBseSBzZW1hcGhvcmUgZm9yIGdtY192OV8wX2ZsdXNoX2dwdV90bGIvIGdtY192OV8wX2Vt
aXRfZmx1c2hfZ3B1X3RsYi8gZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIvIGdtY192MTBfMF9lbWl0
X2ZsdXNoX2dwdV90bGINCg0KT3IgaG93IGNhbiB3ZSBoYW5kbGUgdGhlIHRpY2tldCBhYm92ZT8N
Cg0KQlIsDQpDaGFuZ2ZlbmcuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBD
aHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50
OiBXZWRuZXNkYXksIE5vdmVtYmVyIDIwLCAyMDE5IDEwOjAwIFBNDQpUbzogTGl1LCBNb25rIDxN
b25rLkxpdUBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT47IFpodSwgQ2hhbmdmZW5nIDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+OyBYaWFvLCBKYWNr
IDxKYWNrLlhpYW9AYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgSHVh
bmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBIdWFuZywgU2hpbW1lciA8WGlubWVpLkh1YW5n
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOet
lOWkjTog562U5aSNOiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBpbnZhbGlkYXRlIG1taHViIHNl
bXBob3JlIHdvcmthcm91bmQgaW4gYW1kZ3B1X3ZpcnQNCg0KPiBEaWQgQ2hhbmdmZW5nIGFscmVh
ZHkgaGl0IHRoaXMgaXNzdWUgdW5kZXIgU1JJT1YgPw0KSSBkb24ndCB0aGluayBzbywgYnV0IENo
YW5nZmVuZyBuZWVkcyB0byBhbnN3ZXIgdGhpcy4NCg0KUXVlc3Rpb24gaXMgZG9lcyB0aGUgZXh0
cmEgc2VtYXBob3JlIGFjcXVpcmUgaGFzIHNvbWUgbmVnYXRpdmUgZWZmZWN0IG9uIFNSSU9WPw0K
DQpJIHdvdWxkIGxpa2UgdG8gYXZvaWQgaGF2aW5nIGV2ZW4gbW9yZSBTUklPViBzcGVjaWZpYyBo
YW5kbGluZyBpbiBoZXJlIHdoaWNoIHdlIGNhbid0IHJlYWxseSB0ZXN0IG9uIGJhcmUgbWV0YWwu
DQoNCkNocmlzdGlhbi4NCg0KQW0gMjAuMTEuMTkgdW0gMTQ6NTQgc2NocmllYiBMaXUsIE1vbms6
DQo+IEhhaCwgYnV0IGluIFNSSU9WIGNhc2UsIG91ciBndWVzdCBLTUQgZHJpdmVyIGlzIG5vdCBh
bGxvd2VkIHRvIGRvIHN1Y2ggDQo+IHRoaW5ncyAuLi4uIChhbmQgZXZlbiB0aGVyZSBpcyBhIGJ1
ZyB0aGF0IEtNRCB0cnkgdG8gcG93ZXIgZ2F0ZSwgdGhlIA0KPiBTTVUgZmlybXdhcmUgd291bGQg
bm90IHJlYWxseSBkbyB0aGUgam9icyBzaW5jZSBXZSBoYXZlIFBTUCBMMSBwb2xpY3kgDQo+IHRv
IHByZXZlbnQgdGhvc2UgZGFuZ2VyIG9wZXJhdGlvbnMgKQ0KPg0KPiBEaWQgQ2hhbmdmZW5nIGFs
cmVhZHkgaGl0IHRoaXMgaXNzdWUgdW5kZXIgU1JJT1YgPz8/DQo+DQo+IC0tLS0t6YKu5Lu25Y6f
5Lu2LS0tLS0NCj4g5Y+R5Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPg0KPiDlj5HpgIHml7bpl7Q6IDIwMTnlubQxMeaciDIw5pelIDIxOjIxDQo+IOaU
tuS7tuS6ujogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgWmh1LCBDaGFuZ2ZlbmcgDQo+
IDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47
IFpob3UxLCBUYW8gDQo+IDxUYW8uWmhvdTFAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFu
Z0BhbWQuY29tPjsgSHVhbmcsIFNoaW1tZXIgDQo+IDxYaW5tZWkuSHVhbmdAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IOS4u+mimDogUmU6IOetlOWkjTogW1BBVENI
IDEvMl0gZHJtL2FtZGdwdTogaW52YWxpZGF0ZSBtbWh1YiBzZW1waG9yZSANCj4gd29ya2Fyb3Vu
ZCBpbiBhbWRncHVfdmlydA0KPg0KPiBIaSBNb25rLA0KPg0KPiB0aGlzIGlzIGEgZml4IGZvciBw
b3dlciBnYXRpbmcgdGhlIE1NSFVCLg0KPg0KPiBCYXNpYyBwcm9ibGVtIGlzIHRoYXQgdGhlIE1N
SFVCIGNhbiBwb3dlciBnYXRlIHdoaWxlIGFuIGludmFsaWRhdGlvbiBpcyBpbiBwcm9ncmVzcyB3
aGljaCBsb29zZXMgYWxsIGJpdHMgaW4gdGhlIEFDSyByZWdpc3RlciBhbmQgc28gZGVhZGxvY2tz
IHRoZSBlbmdpbmUgd2FpdGluZyBmb3IgdGhlIGludmFsaWRhdGlvbiB0byBmaW5pc2guDQo+DQo+
IFRoaXMgYnVnIGlzIGhpdCBpbW1lZGlhdGVseSB3aGVuIHdlIGVuYWJsZSBwb3dlciBnYXRpbmcg
b2YgdGhlIE1NSFVCLg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+IEFtIDIwLjEx
LjE5IHVtIDE0OjE4IHNjaHJpZWIgTGl1LCBNb25rOg0KPj4gSGkgQ2hhbmdmZW5nDQo+Pg0KPj4g
RmlycyBvZiBhbGwsIHRoZXJlIGlzIG5vIHBvd2VyLWdhdGluZyBvZmYgY2lyY2xlIGludm9sdmVk
IGluIEFNREdQVSANCj4+IFNSSU9WLCBzaW5jZSB3ZSBkb24ndCBhbGxvdyBWRi9WTSBkbyBzdWNo
IHRoaW5ncyBzbyBJIGRvIGZlZWwgc3RyYW5nZSANCj4+IHdoeSB5b3UgcG9zdCBzb21ldGhpbmcg
bGlrZSB0aGlzIEVzcGVjaWFsbHkgb24gVkVHQTEwIHNlcmlhbHMgd2hpY2ggDQo+PiBsb29rcyBk
b2Vzbid0IGhhdmUgYW55IGlzc3VlIG9uIHRob3NlIGdwdV9mbHVzaCBwYXJ0DQo+Pg0KPj4gSGVy
ZSBpcyBteSBxdWVzdGlvbnMgZm9yIHlvdToNCj4+IDEpIENhbiB5b3UgcG9pbnQgbWUgd2hhdCBp
c3N1ZSBoYWQgeW91IGJlZW4gZXhwZXJpZW5jZWQgPyBhbmQgaG93IHRvIA0KPj4gcmVwcm8gdGhl
IGJ1Zw0KPj4gMikgaWYgeW91IGRvIGhpdCBzb21lIGlzc3VlcywgZGlkIHlvdSB2ZXJpZmllZCB0
aGF0IHlvdXIgcGF0Y2ggY2FuIGZpeCBpdCA/DQo+Pg0KPj4gYmVzaWRlcw0KPj4NCj4+IC9Nb25r
DQo+Pg0KPj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPj4g5Y+R5Lu25Lq6OiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiDku6PooaggQ2hhbmdmZW5nLlpo
dQ0KPj4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0MTHmnIgyMOaXpSAxNzoxNA0KPj4g5pS25Lu25Lq6
OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWGlhbywgSmFj
ayANCj4+IDxKYWNrLlhpYW9AYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29t
PjsgSHVhbmcsIFJheSANCj4+IDxSYXkuSHVhbmdAYW1kLmNvbT47IEh1YW5nLCBTaGltbWVyIDxY
aW5tZWkuSHVhbmdAYW1kLmNvbT47IA0KPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4+IOaKhOmAgTogWmh1LCBDaGFuZ2ZlbmcgPENoYW5nZmVuZy5aaHVAYW1kLmNvbT4NCj4+IOS4
u+mimDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogaW52YWxpZGF0ZSBtbWh1YiBzZW1waG9yZSB3
b3JrYXJvdW5kIGluIA0KPj4gYW1kZ3B1X3ZpcnQNCj4+DQo+PiBGcm9tOiBjaGFuZ3podSA8Q2hh
bmdmZW5nLlpodUBhbWQuY29tPg0KPj4NCj4+IEl0IG1heSBsb3NlIGdwdXZtIGludmFsaWRhdGUg
YWNrbm93bGRlZ2Ugc3RhdGUgYWNyb3NzIHBvd2VyLWdhdGluZyBvZmYgY3ljbGUuIFRvIGF2b2lk
IHRoaXMgaXNzdWUgaW4gdmlydCBpbnZhbGlkYXRpb24sIGFkZCBzZW1hcGhvcmUgYWNxdWlyZSBi
ZWZvcmUgaW52YWxpZGF0aW9uIGFuZCBzZW1hcGhvcmUgcmVsZWFzZSBhZnRlciBpbnZhbGlkYXRp
b24uDQo+Pg0KPj4gQ2hhbmdlLUlkOiBJZTk4MzA0ZTQ3NTE2NmI1M2VlZDAzMzQ2MmQ3NjQyM2I2
YjBmYzI1Yg0KPj4gU2lnbmVkLW9mZi1ieTogY2hhbmd6aHUgPENoYW5nZmVuZy5aaHVAYW1kLmNv
bT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQu
YyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZpcnQuaCB8ICAzICsrLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYyAgICB8ICAzICsrLQ0KPj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92aXJ0LmMNCj4+IGluZGV4IGYwNGViMWE2NDI3MS4uNzBmZmFmOTFjZDEy
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQu
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYw0KPj4g
QEAgLTEzNSw3ICsxMzUsOCBAQCB2b2lkIGFtZGdwdV92aXJ0X2tpcV93cmVnKHN0cnVjdCBhbWRn
cHVfZGV2aWNlIA0KPj4gKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdikNCj4+ICAgIA0K
Pj4gICAgdm9pZCBhbWRncHVfdmlydF9raXFfcmVnX3dyaXRlX3JlZ193YWl0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPj4gICAgCQkJCQl1aW50MzJfdCByZWcwLCB1aW50MzJfdCByZWcx
LA0KPj4gLQkJCQkJdWludDMyX3QgcmVmLCB1aW50MzJfdCBtYXNrKQ0KPj4gKwkJCQkJdWludDMy
X3QgcmVmLCB1aW50MzJfdCBtYXNrLA0KPj4gKwkJCQkJdWludDMyX3Qgc2VtKQ0KPj4gICAgew0K
Pj4gICAgCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsNCj4+ICAgIAlz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAma2lxLT5yaW5nOyBAQCAtMTQ0LDkgKzE0NSwzMCBA
QCB2b2lkIGFtZGdwdV92aXJ0X2tpcV9yZWdfd3JpdGVfcmVnX3dhaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+PiAgICAJdWludDMyX3Qgc2VxOw0KPj4gICAgDQo+PiAgICAJc3Bpbl9s
b2NrX2lycXNhdmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7DQo+PiAtCWFtZGdwdV9yaW5nX2Fs
bG9jKHJpbmcsIDMyKTsNCj4+ICsJYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgNjApOw0KPj4gKw0K
Pj4gKwkvKg0KPj4gKwkgKiBJdCBtYXkgbG9zZSBncHV2bSBpbnZhbGlkYXRlIGFja25vd2xkZWdl
IHN0YXRlIGFjcm9zcyBwb3dlci1nYXRpbmcNCj4+ICsJICogb2ZmIGN5Y2xlLCBhZGQgc2VtYXBo
b3JlIGFjcXVpcmUgYmVmb3JlIGludmFsaWRhdGlvbiBhbmQgc2VtYXBob3JlDQo+PiArCSAqIHJl
bGVhc2UgYWZ0ZXIgaW52YWxpZGF0aW9uIHRvIGF2b2lkIGVudGVyaW5nIHBvd2VyIGdhdGVkIHN0
YXRlDQo+PiArCSAqIHRvIFdBIHRoZSBJc3N1ZQ0KPj4gKwkgKi8NCj4+ICsNCj4+ICsJLyogYSBy
ZWFkIHJldHVybiB2YWx1ZSBvZiAxIG1lYW5zIHNlbWFwaG9yZSBhY3VxaXJlICovDQo+PiArCWlm
IChyaW5nLT5mdW5jcy0+dm1odWIgPT0gQU1ER1BVX01NSFVCXzAgfHwNCj4+ICsJICAgIHJpbmct
PmZ1bmNzLT52bWh1YiA9PSBBTURHUFVfTU1IVUJfMSkNCj4+ICsJYW1kZ3B1X3JpbmdfZW1pdF9y
ZWdfd2FpdChyaW5nLCBzZW0sIDB4MSwgMHgxKTsNCj4+ICsNCj4+ICAgIAlhbWRncHVfcmluZ19l
bWl0X3JlZ193cml0ZV9yZWdfd2FpdChyaW5nLCByZWcwLCByZWcxLA0KPj4gICAgCQkJCQkgICAg
cmVmLCBtYXNrKTsNCj4+ICsJLyoNCj4+ICsJICogYWRkIHNlbWFwaG9yZSByZWxlYXNlIGFmdGVy
IGludmFsaWRhdGlvbiwNCj4+ICsJICogd3JpdGUgd2l0aCAwIG1lYW5zIHNlbWFwaG9yZSByZWxl
YXNlDQo+PiArCSAqLw0KPj4gKwlpZiAocmluZy0+ZnVuY3MtPnZtaHViID09IEFNREdQVV9NTUhV
Ql8wIHx8DQo+PiArCSAgICByaW5nLT5mdW5jcy0+dm1odWIgPT0gQU1ER1BVX01NSFVCXzEpDQo+
PiArCWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCBzZW0sIDApOw0KPj4gKw0KPj4gICAgCWFt
ZGdwdV9mZW5jZV9lbWl0X3BvbGxpbmcocmluZywgJnNlcSk7DQo+PiAgICAJYW1kZ3B1X3Jpbmdf
Y29tbWl0KHJpbmcpOw0KPj4gICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmtpcS0+cmluZ19s
b2NrLCBmbGFncyk7IGRpZmYgLS1naXQgDQo+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92aXJ0LmgNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zp
cnQuaA0KPj4gaW5kZXggYjBiMmJkYzc1MGRmLi5iZGE2YTJmMzdkYzAgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5oDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5oDQo+PiBAQCAtMjk1LDcgKzI5NSw4
IEBAIHVpbnQzMl90IGFtZGdwdV92aXJ0X2tpcV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1aW50MzJfdCByZWcpOyAgdm9pZCBhbWRncHVfdmlydF9raXFfd3JlZyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2KTsgIHZvaWQgYW1kZ3B1
X3ZpcnRfa2lxX3JlZ193cml0ZV9yZWdfd2FpdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
Cj4+ICAgIAkJCQkJdWludDMyX3QgcmVnMCwgdWludDMyX3QgcnJlZzEsDQo+PiAtCQkJCQl1aW50
MzJfdCByZWYsIHVpbnQzMl90IG1hc2spOw0KPj4gKwkJCQkJdWludDMyX3QgcmVmLCB1aW50MzJf
dCBtYXNrLA0KPj4gKwkJCQkJdWludDMyX3Qgc2VtKTsNCj4+ICAgIGludCBhbWRncHVfdmlydF9y
ZXF1ZXN0X2Z1bGxfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIA0KPj4gaW5p
dCk7ICBpbnQgYW1kZ3B1X3ZpcnRfcmVsZWFzZV9mdWxsX2dwdShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgDQo+PiBib29sIGluaXQpOyAgaW50IGFtZGdwdV92aXJ0X3Jlc2V0X2dwdShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYw0KPj4gaW5kZXggZjI1Y2Q5N2JhNWYyLi4xYWU1OWFmNzgzNmEgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+PiBAQCAtNDQ4LDkgKzQ0OCwx
MCBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLA0KPj4gICAgCQkJIWFkZXYtPmluX2dwdV9yZXNldCkg
ew0KPj4gICAgCQl1aW50MzJfdCByZXEgPSBodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZzsNCj4+
ICAgIAkJdWludDMyX3QgYWNrID0gaHViLT52bV9pbnZfZW5nMF9hY2sgKyBlbmc7DQo+PiArCQl1
aW50MzJfdCBzZW0gPSBodWItPnZtX2ludl9lbmcwX3NlbSArIGVuZzsNCj4+ICAgIA0KPj4gICAg
CQlhbWRncHVfdmlydF9raXFfcmVnX3dyaXRlX3JlZ193YWl0KGFkZXYsIHJlcSwgYWNrLCB0bXAs
DQo+PiAtCQkJCTEgPDwgdm1pZCk7DQo+PiArCQkJCQkJICAgMSA8PCB2bWlkLCBzZW0pOw0KPj4g
ICAgCQlyZXR1cm47DQo+PiAgICAJfQ0KPj4gICAgDQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZngg
bWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
