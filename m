Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4A43FA9
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Jun 2019 17:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CB689994;
	Thu, 13 Jun 2019 15:59:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810079.outbound.protection.outlook.com [40.107.81.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A07898BC
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 15:59:19 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2553.namprd12.prod.outlook.com (10.172.91.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 15:59:17 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 15:59:17 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQKaYZ8eAgAAdTACAAMOkAIAAdsyA
Date: Thu, 13 Jun 2019 15:59:17 +0000
Message-ID: <9841bd53-6cfd-acef-c786-2d46df903598@amd.com>
References: <20190612151250.816-1-Philip.Yang@amd.com>
 <5eae5f5a-73f3-4d6e-2a20-892aed285359@gmail.com>
 <8af5593f-10aa-5654-76d3-7be9622dae4e@amd.com>
 <21c5935a-513f-be45-8513-de45fa0fed4d@amd.com>
In-Reply-To: <21c5935a-513f-be45-8513-de45fa0fed4d@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3288a61-4ccc-451f-1308-08d6f018168e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2553; 
x-ms-traffictypediagnostic: DM5PR1201MB2553:
x-microsoft-antispam-prvs: <DM5PR1201MB2553C7BBA19D6DAD819B9135E6EF0@DM5PR1201MB2553.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(51914003)(2616005)(25786009)(6116002)(5660300002)(3846002)(76176011)(53546011)(486006)(6506007)(102836004)(99286004)(386003)(52116002)(446003)(6246003)(316002)(26005)(31686004)(476003)(186003)(11346002)(110136005)(6512007)(53936002)(6436002)(2501003)(66476007)(66556008)(64756008)(66446008)(66946007)(73956011)(229853002)(6486002)(66066001)(7736002)(81166006)(81156014)(8676002)(305945005)(8936002)(478600001)(86362001)(66574012)(14444005)(71190400001)(71200400001)(256004)(31696002)(14454004)(68736007)(72206003)(2906002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2553;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FYzlt04r1d8cW8lmWmNaY3E/LdMS4X+kgVuGazjXrB3V+opBgL0NQGiBpuTb8LAqb4ucLq6ECUxPqDinjua0vMky4wuUy9deNIlvUR/EVUrCC0v+D4ORsKwNxGXDoen/n1RNiq9wK2XsqBzwB1JzsdZqQxgF7lGX1vGaFLYcXplQ/9BwrL7txVCWe2ac7QQ8vCnfpJzZ3h5SvIkcxG6F08fz0nomQQnifTIYQvuZddl1Ke5wEY0LepmULxkWjaqUWLo3XJWWVECK8+FoaMy+bIt8yXCKPB/EDq4yPuS9HwS5FMKBGLSQbsvRBZDzOyHAunARCMkSc/2RHK1q92FBlZb+YC09sTEGtQGA2ngVqYP/mZegyMBZc60c7Uq4U2l+slnwA91TD7UBR24l8XcVC4ZwqZUC2hH6J8QgzI/nbVY=
Content-ID: <871FE3B97069584BAA5C9AAF34BCD063@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3288a61-4ccc-451f-1308-08d6f018168e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 15:59:17.1768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2553
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beMZpQVZCp6ki2vy6bhCihtHp8n5/RwhRFuEDl/hsyg=;
 b=N4ObhS4K4xvJ28nNpqcb6+R/BCBFi0PweMa5o5csVdSZY3BNyJS6TEkDOQIKUF42k0oPAhL4GNa8XQc+ihsyRAprQ9tUqmtZ5K3OorlBHaj5rvP5p4meAWDi3PCEGAYZe8y/hX4orrXjg/K6niTHfq9ycynqiWJvZ3WzjGywYtw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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

DQpPbiAyMDE5LTA2LTEzIDQ6NTQgYS5tLiwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+IEFt
IDEyLjA2LjE5IHVtIDIzOjEzIHNjaHJpZWIgWWFuZywgUGhpbGlwOg0KPj4gT24gMjAxOS0wNi0x
MiAzOjI4IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+Pj4gQW0gMTIuMDYuMTkgdW0g
MTc6MTMgc2NocmllYiBZYW5nLCBQaGlsaXA6DQo+Pj4+IFRUTSBjcmVhdGUgdHdvIHpvbmVzLCBr
ZXJuZWwgem9uZSBhbmQgZG1hMzIgem9uZSBmb3Igc3lzdGVtIG1lbW9yeS4gSWYNCj4+Pj4gc3lz
dGVtIG1lbW9yeSBhZGRyZXNzIGFsbG9jYXRlZCBpcyBiZWxvdyA0R0IsIHRoaXMgYWNjb3VudCB0
byBkbWEzMiB6b25lDQo+Pj4+IGFuZCB3aWxsIGV4aGF1c3QgZG1hMzIgem9uZSBhbmQgdHJpZ2dl
ciB1bm5lc3NzYXJ5IFRUTSBldmljdGlvbi4NCj4+Pj4NCj4+Pj4gUGF0Y2ggImRybS90dG06IEFj
Y291bnQgZm9yIGtlcm5lbCBhbGxvY2F0aW9ucyBpbiBrZXJuZWwgem9uZSBvbmx5IiBvbmx5DQo+
Pj4+IGhhbmRsZSB0aGUgYWxsb2NhdGlvbiBmb3IgYWNjX3NpemUsIHRoZSBzeXN0ZW0gbWVtb3J5
IHBhZ2UgYWxsb2NhdGlvbiBpcw0KPj4+PiB0aHJvdWdoIHR0bV9tZW1fZ2xvYmFsX2FsbG9jX3Bh
Z2Ugd2hpY2ggc3RpbGwgYWNjb3VudCB0byBkbWEzMiB6b25lIGlmDQo+Pj4+IHBhZ2UgaXMgYmVs
b3cgNEdCLg0KPj4+IE5BSywgYXMgdGhlIG5hbWUgc2F5cyB0aGUgbWVtX2dsb2IgaXMgZ2xvYmFs
IGZvciBhbGwgZGV2aWNlcyBpbiB0aGUgc3lzdGVtLg0KPj4+DQo+Pj4gU28gdGhpcyB3aWxsIGJy
ZWFrIGlmIHlvdSBtaXggRE1BMzIgYW5kIG5vbiBETUEzMiBpbiB0aGUgc2FtZSBzeXN0ZW0NCj4+
PiB3aGljaCBpcyBleGFjdGx5IHRoZSBjb25maWd1cmF0aW9uIG15IGxhcHRvcCBoZXJlIGhhcyA6
KA0KPj4+DQo+PiBJIGRpZG4ndCBmaW5kIHBhdGggdXNlIGRtYTMyIHpvbmUsIGJ1dCBJIG1heSBt
aXNzZWQgc29tZXRoaW5nLg0KPiANCj4gV2VsbCB0aGUgcG9pbnQgaXMgdGhlcmUgaXMgbm9uIGlu
IG91ciBkcml2ZXIsIGJ1dCBtYW55IGRyaXZlcnMgaW4gdGhlDQo+IHN5c3RlbSBzdGlsbCBuZWVk
IERNQTMyIG1lbW9yeS4NCj4gDQo+PiBUaGVyZSBpcw0KPj4gYW4gaXNzdWUgZm91bmQgYnkgS0ZE
VGVzdC5CaWdCdWZTdHJlc3NUZXN0LCBpdCBhbGxvY2F0ZXMgYnVmZmVycyB1cCB0bw0KPj4gMy84
IG9mIHRvdGFsIDI1NkdCIHN5c3RlbSBtZW1vcnksIGVhY2ggYnVmZmVyIHNpemUgaXMgMTI4TUIs
IHRoZW4gdXNlDQo+PiBxdWV1ZSB0byB3cml0ZSB0byB0aGUgYnVmZmVycy4gSWYgdHRtX21lbV9n
bG9iYWxfYWxsb2NfcGFnZSBnZXQgcGFnZSBwZm4NCj4+IGlzIGJlbG93IDRHQiwgaXQgYWNjb3Vu
dCB0byBkbWEzMiB6b25lIGFuZCB3aWxsIGV4aGF1c3QgMkdCIGxpbWl0LCB0aGVuDQo+PiB0dG1f
Y2hlY2tfc3dhcHBpbmcgd2lsbCBzY2hlZHVsZSB0dG1fc2hyaW5rX3dvcmsgdG8gc3RhcnQgZXZp
Y3Rpb24uIEl0DQo+PiB0YWtlcyBtaW51dGVzIHRvIGZpbmlzaCByZXN0b3JlIChyZXRyeSBtYW55
IHRpbWVzIGlmIGJ1c3kpLCB0aGUgdGVzdA0KPj4gZmFpbGVkIGJlY2F1c2UgcXVldWUgdGltZW91
dC4gVGhpcyBldmljdGlvbiBpcyB1bm5lY2Vzc2FyeSBiZWNhdXNlIHdlDQo+PiBzdGlsbCBoYXZl
IGVub3VnaCBmcmVlIHN5c3RlbSBtZW1vcnkuDQo+IA0KPiBObyB0aGF0IGlzIGRlZmluaXRlbHkg
bmVjZXNzYXJ5LiBGb3IgZXhhbXBsZSBvbiBteSBMYXB0b3AgaXQncyB0aGUgc291bmQNCj4gc3lz
dGVtIHdoaWNoIG5lZWRzIERNQTMyLg0KPiANCj4gV2l0aG91dCB0aGlzIHdoZW4gYW4gYXBwbGlj
YXRpb24gdXNlcyBhIGxvdCBvZiBtZW1vcnkgd2UgcnVuIGludG8gdGhlDQo+IE9PTSBraWxsZXIg
YXMgc29vbiBhcyBzb21lIGF1ZGlvIHN0YXJ0cyBwbGF5aW5nLg0KPg0KSSBkaWQgbm90IHJlYWxp
emUgVFRNIGlzIHVzZWQgYnkgb3RoZXIgZHJpdmVycy4gSSBhZ3JlZSB3ZSBjYW5ub3QgcmVtb3Zl
IA0KZG1hMzIgem9uZSwgdGhpcyB3aWxsIGJyZWFrIG90aGVyIGRldmljZSBkcml2ZXJzIHdoaWNo
IGRlcGVuZHMgb24gZG1hMzIgDQp6b25lLg0KDQo+PiBJdCdzIHJhbmRvbSBjYXNlLCBoYXBwZW5z
IGFib3V0IDEvNS4gSSBjYW4gY2hhbmdlIHRlc3QgdG8gaW5jcmVhc2UgdGhlDQo+PiB0aW1lb3V0
IHZhbHVlIHRvIHdvcmthcm91bmQgdGhpcywgYnV0IHRoaXMgc2VlbXMgVFRNIGJ1Zy4gVGhpcyB3
aWxsIHNsb3cNCj4+IGFwcGxpY2F0aW9uIHBlcmZvcm1hbmNlIGEgbG90IGlmIHRoaXMgcmFuZG9t
IGlzc3VlIGhhcHBlbnMuDQo+IA0KPiBPbmUgdGhpbmcgd2UgY291bGQgdHJ5IGlzIHRvIGRpZyBp
bnRvIHdoeSB0aGUga2VybmVsIGdpdmVzIHVzIERNQTMyDQo+IHBhZ2VzIHdoZW4gdGhlcmUgYXJl
IHN0aWxsIG90aGVyIHBhZ2VzIGF2YWlsYWJsZS4gUGxlYXNlIHRha2UgYSBsb29rIGF0DQo+IC9w
cm9jL2J1ZGR5aW5mbyBvbiB0aGF0IGJveCBmb3IgdGhpcy4NCj4NClRoYW5rcyBmb3IgdGhlIGFk
dmlzZSwgZnJvbSBidWRkeWluZm8sIHRoZSBtYWNoaW5lIGhhcyA0IG5vZGVzLCBlYWNoIA0Kbm9k
ZSBoYXMgNjRHQiBtZW1vcnksIGFuZCBkbWEzMiB6b25lIGlzIG9uIG5vZGUgMC4gQmlnQnVmU3Ry
ZXNzVGVzdCANCmFsbG9jYXRlIDk2R0IuIElmIEkgZm9yY2UgdGhlIHRlc3Qgb24gbm9kZSAxLCAi
bnVtYWN0bCAtLWNwdW5vZGViaW5kPTEgDQouL2tmZHRlc3QiLCBubyBldmljdGlvbiBhdCBhbGwu
IElmIEkgZm9yY2UgdGhlIHRlc3Qgb24gbm9kZSAwLCBpdCBhbHdheXMgDQpoYXMgZXZpY3Rpb24g
YW5kIHJlc3RvcmUgYmVjYXVzZSBpdCB1c2VkIHVwIGFsbCBtZW1vcnkgaW5jbHVkaW5nIGRtYTMy
IA0Kem9uZSBmcm9tIG5vZGUgMC4gSSB3aWxsIGNoYW5nZSB0ZXN0IGFwcCB0byBhdm9pZCBydW5u
aW5nIG9uIG5vZGUgMCB0byANCndvcmthcm91bmQgdGhpcy4NCg0KVGhhbmtzLA0KUGhpbGlwDQoN
Cj4gVGhlIG5leHQgdGhpbmcgY29taW5nIHRvIG1pbmQgaXMgdGhhdCB3ZSBjYW4gbW9zdCBsaWtl
bHkgY29tcGxldGVseSBza2lwDQo+IHRoaXMgaWYgSU9NTVUgaXMgYWN0aXZlLg0KPiANCj4gVGhl
IGxhc3QgdGhpbmcgb2YgaGFuZCBjb21pbmcgdG8gbXkgbWluZCBpcyB0byBpbXByb3ZlIFRUTSB0
byBhY3R1YWxseQ0KPiBvbmx5IGV2aWN0IEJPcyB3aGljaCB1c2UgRE1BMzIgbWVtb3J5LCBjYXVz
ZSBjdXJyZW50bHkgd2UganVzdCBldmljdA0KPiBzdHVmZiByYW5kb21seSBhbmQgbm90IGNoZWNr
IGlmIGl0cyBETUEzMiBvciBvdGhlciBtZW1vcnkuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3Rp
YW4uDQo+IA0KPj4NCj4+IFRoYW5rcywNCj4+IFBoaWxpcA0KPj4NCj4+DQo+Pj4gQ2hyaXN0aWFu
Lg0KPj4+DQo+Pj4+IENoYW5nZS1JZDogSTI4OWI4NWQ4OTFiOGY2NGExNDIyYzQyYjFlYWIzOTgw
OThhYjdlZjcNCj4+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFt
ZC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDQgKysrKw0KPj4+PiAgIMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYw0KPj4+PiBpbmRleCAyNzc4ZmY2M2Q5N2QuLjc5YmI5ZGZlNjE3YiAxMDA2NDQNCj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4+PiBAQCAtMTY4Niw2
ICsxNjg2LDEwIEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpDQo+Pj4+ICAgwqDCoMKgwqDCoCB9DQo+Pj4+ICAgwqDCoMKgwqDCoCBhZGV2LT5tbWFuLmlu
aXRpYWxpemVkID0gdHJ1ZTsNCj4+Pj4gK8KgwqDCoCAvKiBPbmx5IGtlcm5lbCB6b25lIChubyBk
bWEzMiB6b25lKSBpZiBkZXZpY2UgZG9lcyBub3QgcmVxdWlyZQ0KPj4+PiBkbWEzMiAqLw0KPj4+
PiArwqDCoMKgIGlmICghYWRldi0+bmVlZF9kbWEzMikNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFk
ZXYtPm1tYW4uYmRldi5nbG9iLT5tZW1fZ2xvYi0+bnVtX3pvbmVzID0gMTsNCj4+Pj4gKw0KPj4+
PiAgIMKgwqDCoMKgwqAgLyogV2Ugb3B0IHRvIGF2b2lkIE9PTSBvbiBzeXN0ZW0gcGFnZXMgYWxs
b2NhdGlvbnMgKi8NCj4+Pj4gICDCoMKgwqDCoMKgIGFkZXYtPm1tYW4uYmRldi5ub19yZXRyeSA9
IHRydWU7DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
