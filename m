Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9027E368
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F06E796;
	Thu,  1 Aug 2019 19:40:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780052.outbound.protection.outlook.com [40.107.78.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA96E796
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5NVtnm2EN5VvlnqqesYOVwGSQgv+YdBDukwHKmx3IJ77SX30aG+o2bTZ1NsMdErRPFAQxXiNoqdWj3E7xFPCRDR1ogaLe3JQ8HnQU18bN1TKkayza01xmCubB8wZG7DxUElilrwROw7XmrVWW4yvkD2LZet91w1EQlB10V+ecDpLuyiPJtQTE+2RIFsDNYTNWRjPeonRUHeF1sB3TP8vT/6dLUxd0KxqdTM12G9S11RU1c+FeRPH+Q9d0VYyifW6o4IWjdMisdZ5fg+/WM4Ju6yT+b+haJDrB3nfKfz1Rhw36wo9EksGEe5+U7iV6Q2kq0aVHQxbw+HK76+B/3h4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrzUlNR68VMHeQ/VjM59AB1hyLj9ByyIzS/Ne5TmsLQ=;
 b=U4wet3BEQv7SlRovUkQtH1GaZXsMof8SWGelmlEGdP6oMGmBfnpsFUptbEuykr52Bu7z9iBo+z1HjHb0JwOMnvQw+K1v/vn2tHF64nlo9gHMX1y+o8vA7Rp1x0k3QMRqUY1xPEnkSD96FQm8q5Sqo+tJ7mMPTPAZ/qaa2UASg7yX0CkTApAraAILZELpWiih5Y3qeEEhV51A/X12eN9DTkNMBG0ksLtYctYd/LLyZ2Uto0AwEVAV3LKSzzGInpDyGabGPWExNrndDzEsgML8nEjvBVR9UgLz/8YlWwaMIXDkPtOL+S2HwsM1cajsM5+TieqdFrP2QBqASRviJyVKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 1 Aug 2019 19:40:40 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::8581:1f0c:2002:db97%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 19:40:40 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Francis, David" <David.Francis@amd.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fast
 updates
Thread-Topic: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fast
 updates
Thread-Index: AQHVR7yxSY/gP5pcckiZt+Unu4FxH6bmpt0AgAAHbACAAAQ6AA==
Date: Thu, 1 Aug 2019 19:40:40 +0000
Message-ID: <e6958cdf-d76a-e34a-7646-f8127e946bea@amd.com>
References: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
 <20190731162604.28509-3-nicholas.kazlauskas@amd.com>
 <CADnq5_O+v6GC+DYOXkPRwT6S9tjiRs9uNEntS4wdCZVTUpmdAA@mail.gmail.com>
 <BN8PR12MB3217433D27E25905A31FC8EFEFDE0@BN8PR12MB3217.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3217433D27E25905A31FC8EFEFDE0@BN8PR12MB3217.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1eb1aa6-11d4-4e51-1043-08d716b82253
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2853; 
x-ms-traffictypediagnostic: BYAPR12MB2853:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR12MB2853418FE64A49FC3B922810ECDE0@BYAPR12MB2853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(51914003)(189003)(199004)(305945005)(6486002)(7736002)(54906003)(6436002)(229853002)(14454004)(81156014)(316002)(8676002)(37006003)(6306002)(6512007)(15650500001)(71190400001)(31686004)(71200400001)(6636002)(3846002)(14444005)(68736007)(6116002)(256004)(2906002)(5660300002)(66066001)(76176011)(25786009)(8936002)(66446008)(64756008)(31696002)(66946007)(6506007)(386003)(26005)(66556008)(53546011)(102836004)(6862004)(446003)(11346002)(81166006)(486006)(36756003)(6246003)(86362001)(478600001)(53936002)(99286004)(66476007)(966005)(2616005)(476003)(4326008)(52116002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2853;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3fSJlBbsAoi98KVaBpjETpKZI1Es6WzSv7xBMxcyewMjcJ+HcmgsbUEQ/Qx960pBvqQ64jsuLkJbo4iqeXYZe1nA3BOyLR06IEwwWPR92KwH2mZNxdPEsTwlqym8LQPk5kSCJT84HmV/winn2oShdoPHhUYyi1yJTh/7hBpWlT/guD78zR+XfYsfbXG3LyMMNnxAjXt/oTd/TBN6FmSlHdUi4NVfF+vKhIymf8H9XXM4V7bltAgNPUJkbP1ENRB48aZZZxx9foMwP+0ct1X0qmIe9o6rbXZSCBLPXEfyTa65qBrpWrPMu2b/GV+cosS377iFNp1N9ECjjERK3J5NquVRJBPgesnX4CW/+md5pEztpndNTkTIWeN22wi31K2SdtNe5urjYILV1rVyYdDByqziDAK/nWRWk88TtuJeS+M=
Content-ID: <898ADC4BB76AB4458059AF55831E6CE7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eb1aa6-11d4-4e51-1043-08d716b82253
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 19:40:40.4785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrzUlNR68VMHeQ/VjM59AB1hyLj9ByyIzS/Ne5TmsLQ=;
 b=ZGYgkxZV+A+ueyb0+SaGmXQFM3hpRJTmpT7JJTgfyKEEIdzb2Fl4i1hsbHXjfnHF7fa97REFlBY1IAte/7O2D/kakdDPJxPZqqtu9Z3WO76+KOQlmJKx+21N8MirwefXmrSXwCzjAx4d2sGCboX662qDex/Q18xrFDaVQo+/ea8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: Alex Deucher <alexdeucher@gmail.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBmb3Jnb3QgdG8gYWRkIGl0IGluIHRoaXMgY29tbWl0IGRlc2NyaXB0aW9uLCBidXQgSSBkbyBr
bm93IHRoZSBhY3R1YWwgDQpyZWdyZXNzaW9uIGNvbW1pdCB3YXMuDQoNCkZpeGVzOiAwMDRiMzkz
OGU2MzcgKCJkcm0vYW1kL2Rpc3BsYXk6IENoZWNrIHNjYWxpbmcgaW5mbyB3aGVuIGRldGVybWlu
ZyANCnVwZGF0ZSB0eXBlIikNCg0KVGhpcyBzdGFydGVkIGNyZWF0aW5nIG5ldyBkY19zdGF0ZSBv
biBmYXN0IHVwZGF0ZXMsIGJ1dCB3ZSBuZWVkIHRoZW0gZm9yIA0KdmFsaWRhdGlvbi4NCg0KSSds
bCBhZGQgdGhpcyB0byB0aGUgY29tbWl0IGJvZHkgYW5kIHB1c2guDQoNClRoYW5rcyBmb3IgdGhl
IHJldmlldyENCg0KTmljaG9sYXMgS2F6bGF1c2thcw0KDQpPbiA4LzEvMTkgMzoyNSBQTSwgRnJh
bmNpcywgRGF2aWQgd3JvdGU6DQo+IFNlcmllcyBpczoNCj4gDQo+IFJldmlld2VkLWJ5OiBEYXZp
ZCBGcmFuY2lzIDxkYXZpZC5mcmFuY2lzQGFtZC5jb20+DQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gKkZyb206KiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gKlNlbnQ6
KiBBdWd1c3QgMSwgMjAxOSAyOjU4OjU2IFBNDQo+ICpUbzoqIEthemxhdXNrYXMsIE5pY2hvbGFz
IDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+DQo+ICpDYzoqIGFtZC1nZnggbGlzdCA8YW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBMaSwgU3VuIHBlbmcgKExlbykgDQo+IDxTdW5w
ZW5nLkxpQGFtZC5jb20+OyBGcmFuY2lzLCBEYXZpZCA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPg0K
PiAqU3ViamVjdDoqIFJlOiBbUEFUQ0ggMy8zXSBkcm0vYW1kL2Rpc3BsYXk6IERvbid0IHJlcGxh
Y2UgdGhlIGRjX3N0YXRlIA0KPiBmb3IgZmFzdCB1cGRhdGVzDQo+IE9uIFdlZCwgSnVsIDMxLCAy
MDE5IGF0IDEyOjI2IFBNIE5pY2hvbGFzIEthemxhdXNrYXMNCj4gPG5pY2hvbGFzLmthemxhdXNr
YXNAYW1kLmNvbT4gd3JvdGU6DQo+Pg0KPj4gW1doeV0NCj4+IERSTSBwcml2YXRlIG9iamVjdHMg
aGF2ZSBubyBod19kb25lL2ZsaXBfZG9uZSBmZW5jaW5nIG1lY2hhbmlzbSBvbiB0aGVpcg0KPj4g
b3duIGFuZCBjYW5ub3QgYmUgdXNlZCB0byBzZXF1ZW5jZSBjb21taXRzIGFjY29yZGluZ2x5Lg0K
Pj4NCj4+IFdoZW4gaXNzdWluZyBjb21taXRzIHRoYXQgZG9uJ3QgdG91Y2ggdGhlIHNhbWUgc2V0
IG9mIGhhcmR3YXJlIHJlc291cmNlcw0KPj4gbGlrZSBwYWdlLWZsaXBzIG9uIGRpZmZlcmVudCBD
UlRDcyB3ZSBjYW4gcnVuIGludG8gdGhlIGlzc3VlIGJlbG93DQo+PiBiZWNhdXNlIG9mIHRoaXM6
DQo+Pg0KPj4gMS4gQ2xpZW50IHJlcXVlc3RzIG5vbi1ibG9ja2luZyBDb21taXQgIzEsIGhhcyBh
IG5ldyBkY19zdGF0ZSAjMSwNCj4+IHN0YXRlIGlzIHN3YXBwZWQsIGNvbW1pdCB0YWlsIGlzIGRl
ZmVycmVkIHRvIHdvcmsgcXVldWUNCj4+DQo+PiAyLiBDbGllbnQgcmVxdWVzdHMgbm9uLWJsb2Nr
aW5nIENvbW1pdCAjMiwgaGFzIGEgbmV3IGRjX3N0YXRlICMyLA0KPj4gc3RhdGUgaXMgc3dhcHBl
ZCwgY29tbWl0IHRhaWwgaXMgZGVmZXJyZWQgdG8gd29yayBxdWV1ZQ0KPj4NCj4+IDMuIENvbW1p
dCAjMiB3b3JrIHN0YXJ0cywgY29tbWl0IHRhaWwgZmluaXNoZXMsDQo+PiBhdG9taWMgc3RhdGUg
aXMgY2xlYXJlZCwgZGNfc3RhdGUgIzEgaXMgZnJlZWQNCj4+DQo+PiA0LiBDb21taXQgIzEgd29y
ayBzdGFydHMsDQo+PiBjb21taXQgdGFpbCBlbmNvdW50ZXJzIG51bGwgcG9pbnRlciBkZXJlZiBv
biBkY19zdGF0ZSAjMQ0KPj4NCj4+IEluIG9yZGVyIHRvIGNoYW5nZSB0aGUgREMgc3RhdGUgYXMg
aW4gdGhlIHByaXZhdGUgb2JqZWN0IHdlIG5lZWQgdG8NCj4+IGVuc3VyZSB0aGF0IHdlIHdhaXQg
Zm9yIGFsbCBvdXRzdGFuZGluZyBjb21taXRzIHRvIGZpbmlzaCBhbmQgdGhhdA0KPj4gYW55IG90
aGVyIHBlbmRpbmcgY29tbWl0cyBtdXN0IHdhaXQgZm9yIHRoZSBjdXJyZW50IG9uZSB0byBmaW5p
c2ggYXMNCj4+IHdlbGwuDQo+Pg0KPj4gV2UgZG8gdGhpcyBmb3IgTUVESVVNIGFuZCBGVUxMIHVw
ZGF0ZXMuIEJ1dCBub3QgZm9yIEZBU1QgdXBkYXRlcywgbm9yDQo+PiB3b3VsZCB3ZSB3YW50IHRv
IHNpbmNlIGl0IHdvdWxkIGNhdXNlIHN0dXR0ZXJpbmcgZnJvbSB0aGUgZGVsYXlzLg0KPj4NCj4+
IEZBU1QgdXBkYXRlcyB0aGF0IGdvIHRocm91Z2ggZG1fZGV0ZXJtaW5lX3VwZGF0ZV90eXBlX2Zv
cl9jb21taXQgYWx3YXlzDQo+PiBjcmVhdGUgYSBuZXcgZGNfc3RhdGUgYW5kIGxvY2sgdGhlIERS
TSBwcml2YXRlIG9iamVjdCBpZiB0aGVyZSBhcmUNCj4+IGFueSBjaGFuZ2VkIHBsYW5lcy4NCj4+
DQo+PiBXZSBuZWVkIHRoZSBvbGQgc3RhdGUgdG8gdmFsaWRhdGUsIGJ1dCB3ZSBkb24ndCBhY3R1
YWxseSBuZWVkIHRoZSBuZXcNCj4+IHN0YXRlIGhlcmUuDQo+Pg0KPj4gW0hvd10NCj4+IElmIHRo
ZSBjb21taXQgaXNuJ3QgYSBmdWxsIHVwZGF0ZSB0aGVuIHRoZSB1c2UgYWZ0ZXIgZnJlZSBjYW4g
YmUNCj4+IHJlc29sdmVkIGJ5IHNpbXBseSBkaXNjYXJkaW5nIHRoZSBuZXcgc3RhdGUgZW50aXJl
bHkgYW5kIHJldGFpbmluZw0KPj4gdGhlIGV4aXN0aW5nIG9uZSBpbnN0ZWFkLg0KPj4NCj4+IFdp
dGggdGhpcyBjaGFuZ2UgdGhlIHNlcXVlbmNlIGFib3ZlIGNhbiBiZSByZWV4YW1pbmVkLiBDb21t
aXQgIzIgd2lsbA0KPj4gc3RpbGwgZnJlZSBDb21taXQgIzEncyByZWZlcmVuY2UsIGJ1dCBiZWZv
cmUgdGhpcyBoYXBwZW5zIHdlIGFjdHVhbGx5DQo+PiBhZGRlZCBhbiBhZGRpdGlvbmFsIHJlZmVy
ZW5jZSBhcyBwYXJ0IG9mIENvbW1pdCAjMi4NCj4+DQo+PiBJZiBhbiB1cGRhdGUgY29tZXMgaW4g
ZHVyaW5nIHRoaXMgdGhhdCBuZWVkcyB0byBjaGFuZ2UgdGhlIGRjX3N0YXRlDQo+PiBpdCB3aWxs
IG5lZWQgdG8gd2FpdCBvbiBDb21taXQgIzEgYW5kIENvbW1pdCAjMiB0byBmaW5pc2guIFRoZW4g
aXQnbGwNCj4+IHN3YXAgdGhlIHN0YXRlLCBmaW5pc2ggdGhlIHdvcmsgaW4gY29tbWl0IHRhaWwg
YW5kIGRyb3AgdGhlIGxhc3QNCj4+IHJlZmVyZW5jZSBvbiBDb21taXQgIzIncyBkY19zdGF0ZS4N
Cj4+DQo+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMDQxODENCj4+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4NCj4+IENjOiBE
YXZpZCBGcmFuY2lzIDxkYXZpZC5mcmFuY2lzQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+IA0KPiBT
ZXJpZXMgaXM6DQo+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+DQo+IA0KPj4gLS0tDQo+PsKgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyB8IDIzICsrKysrKysrKysrKysrKysrKysNCj4+wqAgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+IGluZGV4IDRjOTA2NjJlOWZhMi4uZmU1
MjkxYjE2MTkzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gQEAgLTcyODgsNiArNzI4OCwyOSBAQCBzdGF0aWMg
aW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5W
QUw7DQo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGZhaWw7DQo+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+ICvCoMKg
wqDCoMKgwqAgfSBlbHNlIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVGhlIGNvbW1pdCBpcyBhIGZhc3Qg
dXBkYXRlLiBGYXN0IHVwZGF0ZXMgc2hvdWxkbid0IGNoYW5nZQ0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBEQyBjb250ZXh0LCBhZmZlY3QgZ2xvYmFsIHZhbGlkYXRp
b24sIGFuZCBjYW4gaGF2ZSB0aGVpcg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIGNvbW1pdCB3b3JrIGRvbmUgaW4gcGFyYWxsZWwgd2l0aCBvdGhlciBjb21taXRzIG5vdCB0
b3VjaGluZw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBzYW1lIHJl
c291cmNlLiBJZiB3ZSBoYXZlIGEgbmV3IERDIGNvbnRleHQgYXMgcGFydCBvZg0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBETSBhdG9taWMgc3RhdGUgZnJvbSB2YWxp
ZGF0aW9uIHdlIG5lZWQgdG8gZnJlZSBpdCBhbmQNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiByZXRhaW4gdGhlIGV4aXN0aW5nIG9uZSBpbnN0ZWFkLg0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRtX2F0b21pY19zdGF0ZSAqbmV3X2RtX3N0YXRlLCAqb2xkX2RtX3N0YXRlOw0K
Pj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3X2RtX3N0YXRlID0gZG1f
YXRvbWljX2dldF9uZXdfc3RhdGUoc3RhdGUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgb2xkX2RtX3N0YXRlID0gZG1fYXRvbWljX2dldF9vbGRfc3RhdGUoc3RhdGUpOw0KPj4g
Kw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5ld19kbV9zdGF0ZSAmJiBv
bGRfZG1fc3RhdGUpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAobmV3X2RtX3N0YXRlLT5jb250ZXh0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkY19yZWxlYXNlX3N0
YXRlKG5ld19kbV9zdGF0ZS0+Y29udGV4dCk7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3X2RtX3N0YXRlLT5jb250ZXh0ID0gb2xkX2Rt
X3N0YXRlLT5jb250ZXh0Ow0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChvbGRfZG1fc3RhdGUtPmNvbnRleHQpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRjX3Jl
dGFpbl9zdGF0ZShvbGRfZG1fc3RhdGUtPmNvbnRleHQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQ0KPj7CoMKgwqDCoMKgwqDCoMKgIH0NCj4+DQo+PsKgwqDCoMKgwqDCoMKg
wqAgLyogTXVzdCBiZSBzdWNjZXNzICovDQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGFtZC1nZnggbWFp
bGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
