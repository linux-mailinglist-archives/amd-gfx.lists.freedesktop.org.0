Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D409D58D
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 20:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40E989E05;
	Mon, 26 Aug 2019 18:12:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E5289E05
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 18:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asaacmgPr3rhqaRAoNIGyHVP7zQrRDBDBuFxkRuZcep2Z15SLUJEcdmQiHsB8BlHy/JiBUldvZjyJiG0krFu/C61fO7lSOPNyciwkLLhSbWqSKFnMPuL7L5EhRCOuUeAfeh4zjgEg8nBLpB2OcLQPOXTc/Eq1zwZuiCAzzTeoTpT10vLKi0opI7mSx6Nuhi4FQXja9/35pIkoCetK2qbErpoh0SmZrb6HOiocTK2M6q5bYv0sF9om6IneyMZBZZSca+0uRGmQmV6KJZDHkJ7m7sXQ6q/w79SsYgYEucbHOVwsoat8BYT6LXbwlcOUMhsqB4T9Ao6RcJXpYb9ga0AiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGa1y4i0zw/yhpL2fgPvwkcCGS0KVh4EzrEAGYFkp+M=;
 b=U5WmW4g1mPPucqfGfHpOKazwFSZiBL5Gl4Wi1taZionCmFb6E3EAy3JJEEOhCVplar1Vll6TLkhvlTno/rWXZjYBgnmsHSWHQ41UGafYbMaScYQEdvGY+YN7pVvOFyTGpxTaUvyVjzcS5iEmWCr0GnCeM9KqyiYxf6/UJP+oXB2wCHw03HqzvLKD5IBJ9cJhxSqqRnXneeBoSeFWQ6wZ0UhWuI6QYcC5j1v7TrOOyiXLEeCU/T+e0xRoOKT6AW0nhX6ET1p3cqVQy+wsa0Ky3NxMsUw4Wdpf/mLJQmVz3Bt4FFQOpTmpRwAsfkGYudmiza76rNMSshhw8LFOC1z2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1689.namprd12.prod.outlook.com (10.172.33.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 18:12:25 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 18:12:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpzxkfPqEXOrkaSf+Sezn1FH6cKJd+AgABW3YCAACt2AIAC7oQAgAAZUwCAAA0pAIAAAnGA
Date: Mon, 26 Aug 2019 18:12:25 +0000
Message-ID: <49ba47da-a225-5a21-9014-ccc316c55b60@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
 <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
 <4b48fc1a-6ee2-bb60-0518-ea9c6346b8d6@amd.com>
 <89bf5baa-4b63-e40a-7995-fa35bad988b7@amd.com>
 <216f63db-78c5-1098-bea5-2f379b0bf051@amd.com>
In-Reply-To: <216f63db-78c5-1098-bea5-2f379b0bf051@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::30) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e791f97b-55d6-4ae5-dc9c-08d72a50f2d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1689; 
x-ms-traffictypediagnostic: DM5PR12MB1689:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1689BBBCB6AA26C98B94B41583A10@DM5PR12MB1689.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(6436002)(6512007)(186003)(53936002)(6246003)(66946007)(64756008)(66446008)(66556008)(446003)(66574012)(486006)(11346002)(2616005)(476003)(66476007)(31686004)(46003)(305945005)(5660300002)(76176011)(8676002)(81166006)(81156014)(36756003)(58126008)(25786009)(52116002)(7736002)(110136005)(316002)(99286004)(4326008)(229853002)(6486002)(8936002)(102836004)(86362001)(386003)(71190400001)(6506007)(2501003)(2906002)(14444005)(6116002)(256004)(478600001)(14454004)(65806001)(31696002)(71200400001)(53546011)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1689;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y3GSFSmCaqIdgl1+4XDje6CuxtaYNGGySiA7YM8Ic6QjKYGNZyfQwjhP2CXFDe14GLUOR5bMLM3XPdoloJ3o2j6CMV5o3W76s6WiObmLEjGawh6SIi4DFTvhmmboXGCUiblD3J/ijatiL3PhUDoayyqOveOqr09ljtKb9U0aNA9skZ1QEJe9a+E00h3P76y5VS1V2ek17qf5gu1aF1stu3a0MOKGwvdjPoXXoaUegR7Oz3XBsA4SrdFvRGo9J7iolBf3pogdpHmGnQoP5tlgr8h6LZV6g9lNijhiAvaaE0onXBkjDKUUg9NAKGrb6mBA76DzQsGg09Bx5x4JhEAa/+fAEUjubV7I0nV7+dVmKhqa+7evq0sxhEAlcgMh89bLpiljpM8mprUibHbqrwlEAkUblhqZf6wH10b6nt+w+Bk=
Content-ID: <6D7CD452212DBE409FDFD2D99665492B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e791f97b-55d6-4ae5-dc9c-08d72a50f2d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 18:12:25.8614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZrVkD0CwD/Lau2cJFc7EoFxIn5ObPf1xtfp0srT3RsX4X7puEAwIiihAcb3iejN+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1689
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGa1y4i0zw/yhpL2fgPvwkcCGS0KVh4EzrEAGYFkp+M=;
 b=IpJ4V95bIBrMo6JjzQTe+n8rrEjkndGt6S1gq8jzFsWj1j3cYjiNIeqxoobw/xzEM6E1xssUtkFZ4k9P3aGkte3UZttgan3Vjqv3QQYno4iNloQvK5pY9E5fwrBBrsFGTrsQqHCkjMvijg0oEp/WfuguVOE/U19bMHHUyCG9XGE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDguMTkgdW0gMjA6MDMgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IE9uIDIwMTkt
MDgtMjYgMToxNiBwLm0uLCB3cm90ZToNCj4+IEFtIDI2LjA4LjE5IHVtIDE3OjQ1IHNjaHJpZWIg
S3VlaGxpbmcsIEZlbGl4Og0KPj4+IE9uIDIwMTktMDgtMjQgMjo1OSBwLm0uLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOg0KPj4+PiBBbSAyNC4wOC4xOSB1bSAxODoyNCBzY2hyaWViIEt1ZWhsaW5n
LCBGZWxpeDoNCj4+Pj4+IE9uIDIwMTktMDgtMjQgNzoxMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToNCj4+Pj4+PiBBbSAyMy4wOC4xOSB1bSAyMzozMyBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoN
Cj4+Pj4+Pj4gRnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+Pj4+Pj4+DQo+Pj4+
Pj4+IFNldCBzbm9vcGVkIFBURSBmbGFnIGFjY29yZGluZyB0byBtYXBwaW5nIGZsYWcuIFdyaXRl
IHJlcXVlc3QgdG8gYQ0KPj4+Pj4+PiBwYWdlIHdpdGggc25vb3BlZCBiaXQgc2V0LCB3aWxsIHNl
bmQgb3V0IGludmFsaWRhdGUgcHJvYmUgcmVxdWVzdA0KPj4+Pj4+PiB0byBUQ0Mgb2YgdGhlIHJl
bW90ZSBHUFUgd2hlcmUgdGhlIHZyYW0gcGFnZSByZXNpZGVzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBD
aGFuZ2UtSWQ6IEk3OTlmNjhlYzdhNWExYWJmMzIwNzVmNWVmMzEwNTE2NDFhMGIzNzM2DQo+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPj4+Pj4+PiAt
LS0NCj4+Pj4+Pj4gICAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
IHwgMyArKysNCj4+Pj4+Pj4gICAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jDQo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYw0KPj4+Pj4+PiBpbmRleCA5YWFmY2RhNmM0ODguLjhhN2M0ZWM2OWFlOCAxMDA2NDQNCj4+
Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4+Pj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+Pj4+Pj4+IEBA
IC02MDQsNiArNjA0LDkgQEAgc3RhdGljIHVpbnQ2NF90IGdtY192OV8wX2dldF92bV9wdGVfZmxh
Z3Moc3RydWN0DQo+Pj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+Pj4+Pj4+ICAgIMKgwqDC
oMKgwqDCoCBpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9QUlQpDQo+Pj4+Pj4+ICAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfUFJUOw0KPj4+Pj4+PiAgICDC
oMKgICvCoMKgwqAgaWYgKGZsYWdzICYgQU1ER1BVX1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRSkN
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfU05PT1BFRDsN
Cj4+Pj4+Pj4gKw0KPj4+Pj4+IFRoYXQgaXMgc3RpbGwgYSBOQUsgd2l0aG91dCBmdXJ0aGVyIGNo
ZWNrcy4gV2UgbmVlZCB0byBtYWtlIGFic29sdXRlbHkNCj4+Pj4+PiBzdXJlIHRoYXQgd2UgZG9u
J3Qgc2V0IHRoaXMgd2hlbiBQQ0llIHJvdXRpbmcgaXMgaW4gdXNlLg0KPj4+Pj4gVGhlIG9ubHkg
cGxhY2Ugd2hlcmUgQU1ER1BVX1ZNXy4uLiBmbGFncyBhcmUgYWNjZXB0ZWQgZnJvbSB1c2VyIG1v
ZGUNCj4+Pj4+IHNlZW1zIHRvIGJlIGFtZGdwdV9nZW1fdmFfaW9jdGwuIEl0IGhhcyBhbiBleHBs
aWNpdCBzZXQgb2YgdmFsaWRfZmxhZ3MNCj4+Pj4+IGl0IGFjY2VwdHMuIFRoZSBuZXcgSU5WQUxJ
REFURV9QUk9CRSBmbGFnIGlzIG5vdCBwYXJ0IG9mIGl0LiBUaGF0IG1lYW5zDQo+Pj4+PiB1c2Vy
IG1vZGUgd2lsbMKgIG5vdCBiZSBhYmxlIHRvIHNldCBpdCBkaXJlY3RseS4gSWYgd2UgYWRkZWQg
aXQgdG8gdGhlDQo+Pj4+PiBzZXQgb2YgdmFsaWRfZmxhZ3MgaW4gYW1kZ3B1X2dlbV92YV9pb2N0
bCwgd2UnZCBuZWVkIHRvIGFkZCBhcHByb3ByaWF0ZQ0KPj4+Pj4gY2hlY2tzIGF0IHRoZSBzYW1l
IHRpbWUuDQo+Pj4+Pg0KPj4+Pj4gS0ZEIGRvZXMgbm90IGV4cG9zZSBBTURHUFVfVk1fLi4uIGZs
YWdzIGRpcmVjdGx5IHRvIHVzZXIgbW9kZS4gSXQgb25seQ0KPj4+Pj4gc2V0cyB0aGUgSU5WQUxJ
REFURV9QUk9CRSBmbGFnIGluIGtlcm5lbCBtb2RlIGZvciBtYXBwaW5ncyBpbiB0aGUgc2FtZQ0K
Pj4+Pj4gWEdNSSBoaXZlIG9uIEFydHVydXMgKGluIHBhdGNoIDQpLg0KPj4+Pj4NCj4+Pj4+IElm
IHRoZXJlIGlzIHNvbWV0aGluZyBJJ20gbWlzc2luZywgcGxlYXNlIHBvaW50IGl0IG91dC4gQnV0
IEFGQUlDVCB0aGUNCj4+Pj4+IGNoZWNraW5nIHRoYXQgaXMgY3VycmVudGx5IGRvbmUgc2hvdWxk
IHNhdGlzZnkgeW91ciByZXF1aXJlbWVudHMuDQo+Pj4+IFRoZSBoYXJkd2FyZSBiZWhhdmlvciBk
ZXBlbmRzIG9uIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGJ1ZmZlciwgc28gYXQNCj4+Pj4gYmFyZSBt
aW5pbXVtIHdlIG5lZWQgdG8gY2hlY2sgaWYgaXQncyBwb2ludGluZyB0byBQQ0llIG9yIGxvY2Fs
IChjaGVjaw0KPj4+PiB0aGUgc3lzdGVtIGJpdCkuDQo+Pj4+DQo+Pj4+IEJ1dCBldmVuIGlmIGl0
J3MgbG9jYWwgd2hhdCBpcyB0aGUgYmVoYXZpb3IgZm9yIGxvY2FsIG1lbW9yeT8gRS5nLiBub3QN
Cj4+Pj4gYWNjZXNzZWQgdGhyb3VnaCBYR01JPw0KPj4+Pg0KPj4+PiBBcyBmYXIgYXMgSSBjYW4g
c2VlIHdoYXQgd2UgbmVlZCB0byBjaGVjayBoZXJlIGlzIHRoYXQgdGhpcyBpcyBhDQo+Pj4+IHJl
bW90ZSBhY2Nlc3Mgb3ZlciBYR01JIGFuZCB0aGVuIChhbmQgb25seSB0aGVuISkgd2UgYXJlIGFs
bG93ZWQgdG8NCj4+Pj4gc2V0IHRoZSBzbm9vcCBiaXQgb24gdGhlIFBURS4NCj4+PiBNeSBwb2lu
dCBpcywgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgdGhpcyBiaXQgY2FuIGdldCBzZXQgcmlnaHQgbm93
IGlzIGluDQo+Pj4ga2VybmVsIG1vZGUgaW4gYW1kZ3B1X2FtZGtmZF9ncHV2bS5jLiBTZWUgcGF0
Y2ggNCBvZiBteSBzZXJpZXMuIFRoYXQNCj4+PiBjb2RlIGFscmVhZHkgaGFzIGFsbCB0aGUgcmln
aHQgY29uZGl0aW9ucyB0byBtYWtlIHN1cmUgdGhlDQo+Pj4gSU5WQUxJREFURV9QUk9CRSBiaXQg
aXMgb25seSBzZXQgaW4gdGhlIGNvcnJlY3QgY2lyY3Vtc3RhbmNlcyAocmVtb3RlDQo+Pj4gWEdN
SSBtYXBwaW5ncyBpbiB0aGUgc2FtZSBoaXZlKToNCj4+Pg0KPj4+PiArCXN3aXRjaCAoYWRldi0+
YXNpY190eXBlKSB7DQo+Pj4+ICsJY2FzZSBDSElQX0FSQ1RVUlVTOg0KPj4+PiArCQlpZiAobWVt
LT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19WUkFNKSB7DQo+Pj4+ICsJCQlpZiAoYm9f
YWRldiA9PSBhZGV2KSB7DQo+Pj4+ICsJCQkJLi4uDQo+Pj4+ICsJCQl9IGVsc2Ugew0KPj4+PiAr
CQkJCS4uLg0KPj4+PiArCQkJCWlmIChhbWRncHVfeGdtaV9zYW1lX2hpdmUoYWRldiwgYm9fYWRl
dikpDQo+Pj4+ICsJCQkJCW1hcHBpbmdfZmxhZ3MgfD0NCj4+Pj4gKwkJCQkJCUFNREdQVV9WTV9Q
QUdFX0lOVkFMSURBVEVfUFJPQkU7DQo+Pj4+ICsJCQl9DQo+Pj4+ICsJCX0gZWxzZSB7DQo+Pj4g
SSB0aGluayB5b3UncmUgYXNraW5nIG1lIHRvIGFkZCBhbiBleHRyYSBjaGVjayBmb3IgdGhlIHNh
bWUgY29uZGl0aW9ucw0KPj4+IGluIHRoZSBHTUMgY29kZT8gTGlrZSBHTUMgZG9lc24ndCB0cnVz
dCBhbWRncHVfYW1ka2ZkLiBJdCBzZWVtcw0KPj4+IGNvbXBsZXRlbHkgcmVkdW5kYW50IGFuZCBh
IGJpdCBwYXJhbm9pZCB0byBtZS4NCj4+IFdlbGwgdGhlIGpvYiBvZiB0aGUgVk0gY29kZSBpcyB0
byBmaWd1cmUgb3V0IHRoZSBmbGFncyBhbmQgbG9jYXRpb24gZm9yDQo+PiB0aGUgUFRFIGJhc2Vk
IG9uIHRoZSBjdXJyZW50IHBsYWNlbWVudCBCTyBhbmQgdGhlIGZsYWdzIGdpdmVuIGZvciB0aGUN
Cj4+IG1hcHBpbmcuDQo+Pg0KPj4gQW5kIHllcyB0aGF0IGltcGxpZXMgdGhhdCB3ZSBkb24ndCB0
cnVzdCB1cHBlciBsYXllcnMgdG8gZG8gdGhpcyBpbnN0ZWFkLg0KPiBJIGNvbnNpZGVyIGFtZGdw
dV9hbWRrZmRfZ3B1dm0gYXMgcGFydCBvZiB0aGUgbG93ZXIgbGF5ZXIuIEl0IGhhcw0KPiBjb250
cm9sIG92ZXIgdGhlIHBsYWNlbWVudCBvZiB0aGUgYnVmZmVycy4NCj4NCj4gVGhhdCBzYWlkLCBp
ZiB0aGUgR01DIGNvZGUgaGFzIHRvIGZpZ3VyZSBvdXQgdGhlIFBURSBtYXBwaW5nIGZsYWdzIGJh
c2VkDQo+IG9uIHRoZSBsb2NhdGlvbiBvZiB0aGUgYnVmZmVyIGFuZCB0aGUgaW50ZW5kZWQgdXNh
Z2UsIGl0J2xsIGJlIGhhcmQgdG8NCj4gYXZvaWQgc29tZSBvZiB0aGUgYWJzdHJhY3Rpb25zIHlv
dSBjcml0aWNpemVkIGluIE9haydzIHBhdGNoIHNlcmllcy4gWW91DQo+IGNhbid0IGhhdmUgaXQg
Ym90aCB3YXlzLiBFaXRoZXIgeW91IGdpdmUgdXNlciBtb2RlIHRoZSByZXNwb25zaWJpbGl0eSB0
bw0KPiBrbm93IGFsbCB0aGUgSFcgZGV0YWlscyBhbmQgbGV0IHVzZXIgbW9kZSBkZXRlcm1pbmUg
dGhlIG10eXBlIGFuZCBmbGFncw0KPiAod2hpY2ggaXMgd2hhdCB5b3UgY3VycmVudGx5IGRvIGlu
IHRoZSBHRU0gaW50ZXJmYWNlKSwgb3IgeW91IGxldCB0aGUgVk0NCj4gY29kZSBkZXRlcm1pbmUg
dGhlIGZsYWdzIGJhc2VkIG9uIG1vcmUgYWJzdHJhY3QgaW5mb3JtYXRpb24gZnJvbSB1c2VyIG1v
ZGUuDQoNCkdvb2QgcG9pbnQsIGFuZCB5ZXMgSSBhY3R1YWxseSB0aGluayBhcyB3ZWxsIHRoYXQg
d2Ugc2hvdWxkbid0IGhhdmUgaGFkIA0KdGhlIGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3MgY2Fs
bGJhY2sgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQo+IEkgc2VlIHRoaXMgZGlzY3Vzc2lvbiBtb3Zp
bmcgdG93YXJkcyBhIG1vcmUgYWJzdHJhY3QgaW50ZXJmYWNlLiBJJ2xsIHNlZQ0KPiBpZiBJIGNh
biBhZGQgdGhhdCBpbnRvIHRoZSBHTUMgSVAgd2l0aG91dCBicmVha2luZyB0aGUgZXhpc3Rpbmcg
QU1ER1BVDQo+IEdFTSBBUElzLg0KDQpXZSBzaG91bGQgcHJvYmFibHkganVzdCByZXZlcnQgYmFj
ayB0aGUgdG8gZG9pbmcgbW9zdCBvZiB0aGUgbWFwcGluZyBpbiANCmFtZGdwdV92bV9ib19zcGxp
dF9tYXBwaW5nKCkuDQoNCkhlcmUgd2UgYWxyZWFkeSBoYXZlIGEgd2hvbGUgYnVuY2ggb2YgQVNJ
QyBzcGVjaWZpYyBoYW5kbGluZyBhbnl3YXk6DQoNCj4gwqDCoMKgwqDCoMKgwqAgaWYgKCEobWFw
cGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX1JFQURBQkxFKSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZsYWdzICY9IH5BTURHUFVfUFRFX1JFQURBQkxFOw0KPiDCoMKgwqDCoMKg
wqDCoCBpZiAoIShtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfV1JJVEVBQkxFKSkNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9IH5BTURHUFVfUFRFX1dSSVRFQUJM
RTsNCj4NCj4gwqDCoMKgwqDCoMKgwqAgZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJMRTsN
Cj4gwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VY
RUNVVEFCTEU7DQo+DQo+IMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9OQVZJMTApIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9IH5B
TURHUFVfUFRFX01UWVBFX05WMTBfTUFTSzsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZsYWdzIHw9IChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfTVRZUEVfTlYxMF9NQVNL
KTsNCj4gwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZsYWdzICY9IH5BTURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSzsNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzIHw9IChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9Q
VEVfTVRZUEVfVkcxMF9NQVNLKTsNCj4gwqDCoMKgwqDCoMKgwqAgfQ0KPg0KPiDCoMKgwqDCoMKg
wqDCoCBpZiAoKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9QUlQpICYmDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkpIHsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzIHw9IEFNREdQVV9QVEVfUFJUOw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQ
X05BVkkxMCkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZsYWdzIHw9IEFNREdQVV9QVEVfU05PT1BFRDsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBBTURHUFVfUFRFX0xPRzsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyB8PSBBTURH
UFVfUFRFX1NZU1RFTTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzICY9IH5BTURHUFVfUFRFX1ZBTElEOw0K
PiDCoMKgwqDCoMKgwqDCoCB9DQoNCkFuZCBub3cgdGhhdCB5b3UgbWVudGlvbmVkIGl0LCB0aGUg
Y29kZSB5b3UgcHJvcG9zZWQgd291bGRuJ3QgaGF2ZSANCndvcmtlZCBhbnl3YXkgYmVjYXVzZSB0
aGUgQU1ER1BVX1BURV9TTk9PUEVEIHdvdWxkIGhhdmUgYmVlbiBmaWx0ZXJlZCANCm91dCBoZXJl
IDopDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gUmVnYXJkcywNCj4gICDCoCBGZWxp
eA0KPg0KPg0KPj4+IGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3MgZG9lc24ndCBldmVuIGhhdmUg
YWxsIHRoZSBpbmZvcm1hdGlvbiBpdCBuZWVkcyB0byBtYWtlIHRoYXQgZGV0ZXJtaW5hdGlvbi4N
Cj4+IFdlbGwgdGhlbiB3ZSBwcm9iYWJseSBuZWVkIHRvIGNoYW5nZSB0aGF0Lg0KPj4NCj4+IFJl
Z2FyZHMsDQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4gICAgIMKgIEZlbGl4
DQo+Pj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
