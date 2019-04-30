Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2923F432
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 12:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF7489166;
	Tue, 30 Apr 2019 10:28:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9479889166
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 10:28:52 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3183.namprd12.prod.outlook.com (20.179.82.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 10:28:50 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 10:28:50 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Topic: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Index: AQHU/uQe3a9JFuTW4Ei0FX7BBwKNtqZUbsaAgAAGylCAAAM7gIAABgMg
Date: Tue, 30 Apr 2019 10:28:50 +0000
Message-ID: <MN2PR12MB3408B8667025191A35674764FE3A0@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
 <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
 <749d808b-5afc-488e-6d31-fae5e8dac208@gmail.com>
 <MN2PR12MB3408BADD8375F5B6D6090244FE3A0@MN2PR12MB3408.namprd12.prod.outlook.com>
 <0df2a92e-c021-66f7-f6ba-4984e24d5d6c@amd.com>
In-Reply-To: <0df2a92e-c021-66f7-f6ba-4984e24d5d6c@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5022a9d2-72e4-45d5-2f35-08d6cd56a330
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3183; 
x-ms-traffictypediagnostic: MN2PR12MB3183:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB31830C6A474683C935844B60FE3A0@MN2PR12MB3183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(136003)(39860400002)(396003)(189003)(199004)(51914003)(13464003)(73956011)(478600001)(66946007)(8676002)(76116006)(66476007)(66556008)(2906002)(966005)(25786009)(66446008)(81156014)(81166006)(6246003)(33656002)(64756008)(86362001)(7696005)(316002)(52536014)(229853002)(68736007)(99286004)(97736004)(2501003)(76176011)(72206003)(110136005)(53546011)(66574012)(6506007)(26005)(3846002)(6436002)(486006)(11346002)(446003)(53936002)(476003)(55016002)(6116002)(7736002)(14444005)(256004)(93886005)(305945005)(74316002)(5660300002)(66066001)(102836004)(14454004)(9686003)(71200400001)(6306002)(186003)(8936002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3183;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0pvmde3Bvuh4Kn58YAeUBPa83NvwOAVFe56KvnX1NeZ/bfoq2jwc1MYDZhnNSPYVCgsmjk6YIJZkkQjwxlXC6uLK4ve7EOiHKAkG+MkILjTKPkb5XOOJJIlyCdClr/vC/kCK7kX+FCe5R4QhIqUGvjqCY42VKGBAxCFD8fHVsUnQJluAGSGjlqXU/Lq6v61DkhcYikX/6zD4Xt943vktKLfY7On88qjMDztoPHvjjXocK6FjRzEGFTYF0J7YRIxBn2+4cSQTXn7l3tFkCnaxFiSMTVHU8ReLygxELjWAghjfxDNvDG8G89kPxabFoT0EbRqTP1yYBDviXAwzD/Lm3DfyWKhdaeJM5RfJcF5Ew+XwQ5sxOCBeoWWdx7mGLjzJR36vIvyy5moSokw85e1B7InabL/PvrhWM8RgTUCseX4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5022a9d2-72e4-45d5-2f35-08d6cd56a330
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 10:28:50.7158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE6QmxLiHYjNAweBWCHJjNNkoBRdKvUhddNuPOe/tbU=;
 b=r65XciG9jX5CuREgyGlHryYqgWr3o39M5RYep0klBjVONpc5xtnkXsDqkeyv+w+sNTK4Y57ch/WXUu5NEB69JxciiYr6wGqR+Xkj6lX2An1dJSQcn3XyAkl1qIY91JKylW6GtqxzG2IFtA+oJXzwcRhpyMpmTSEvRovp43nOv8g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trigger.Huang@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KDQpUaGFua3MgZm9yIHRoZSBxdWljayByZXNwb25zZS4NCg0KT25lIHRo
aW5nIEkgd2FudCB0byBjb25maXJtLCBwZXIgbXkgdW5kZXJzdGFuZGluZyB0aGF0IENTQSBpcyBv
bmx5IHVzZWQgYnkgQ1AgcHJlZW1wdGlvbiBmb3IgS0NRIGFuZCBLR1EgcGF0aCwgYnV0IGluIEtG
RCB1c2VyIG1vZGUgcXVldWUgcGF0aCwgY2FuIHdlIGRlbGV0ZSBDU0E/DQpJZiB5ZXMsIHRoZW4g
bWF5YmUgd2UgY2FuIHNwbGl0IHRoaXMgdG9waWMgaW50byB0d28gcGF0Y2hlcw0KMSwgdGhlIG9y
aWdpbmFsIG9uZSB0aGF0IHVubWFwIENTQSBpbiBLRkQgcGF0aCBpcyBzdGlsbCBuZWVkZWQNCjIs
IEFkZCBuZXcgcGF0Y2ggdG8gdXNlICBuZXcgbWV0aG9kIGZvciBWTSBjaGVja2luZy4NCg0KVGhh
bmtzICYgQmVzdCBXaXNoZXMsDQpUcmlnZ2VyIEh1YW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PiANClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDMwLCAyMDE5IDU6NTkgUE0NClRvOiBIdWFuZywgVHJp
Z2dlciA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWRncHU6IFVubWFwIENTQSB1bmRlciBTUi1JT1YgaW4gS0ZEIHBhdGgN
Cg0KQW0gMzAuMDQuMTkgdW0gMTE6NTMgc2NocmllYiBIdWFuZywgVHJpZ2dlcjoNCj4gSGkgQ2hy
aXN0aWFuICYgRmVsaXgsDQo+DQo+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLg0KPg0KPiBC
dXQgYWN0dWFsbHkgY3VycmVudGx5IENTQSBpcyBtYXBwZWQgb25seSBpbiBhbWRncHVfZHJpdmVy
X29wZW5fa21zIHVuZGVyIFNSLUlPVi4NCj4gU28gd291bGQgeW91IGdpdmUgbW9yZSBpbmZvcm1h
dGlvbiBhYm91dCAnIFdlbGwgdGhhdCBpcyBleGFjdGx5IHdoYXQgd2UgYWxyZWFkeSBkbyBoZXJl
Jz8gV2hlcmUgSSBjYW4gZmluZCBpdHMgaW1wbGVtZW50YXRpb24/DQoNCldlbGwgdGhlIHBsYW4g
d2FzIHRvIG1vdmUgdGhpcyB0byB3aGVuIHRoZSBhY3R1YWxseSBleGVjdXRpb24gY29udGV4dCBp
cyBjcmVhdGVkLiBCdXQgUmV4IGxlZnQgdGhlIGNvbXBhbnksIGNvdWxkIGJlIHRoYXQgdGhlIHBh
dGNoZXMgZm9yIHRoaXMgd2hlcmUgbmV2ZXIgY29tbWl0dGVkLg0KDQo+DQo+IE9uIHRoZSBvdGhl
ciBoYW5kLCBJIHdpbGwgIHRyeSB0aGUgbWV0aG9kICdJbnN0ZWFkIG9mIGNoZWNraW5nIGlmIHNv
bWUgcGFnZSB0YWJsZXMgYXJlIGFscmVhZHkgZmlsbGVkIHdlIGNoZWNrIGlmIHNvbWUgbWFwcGlu
ZyBpcyBhbHJlYWR5IG1hZGUnDQoNClllYWgsIHRoYXQgc2hvdWxkIGNlcnRhaW5seSB3b3JrIGFz
IHdlbGwuIEp1c3QgY2hlY2sgYWxsIGVudHJpZXMgb2YgdGhlIA0Kcm9vdCBQRCBpbiBhIGZvciBs
b29wIGlmIGFueSBzdWJzZXF1ZW50IFBEcyBhcmUgYWxsb2NhdGVkIGFuZCBhYm9ydCBpZiANCnlv
dSBmaW5kIG9uZS4NCg0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRoYW5rcyAmIEJlc3QgV2lzaGVzLA0K
PiBUcmlnZ2VyIEh1YW5nDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBBcHJpbCAzMCwgMjAxOSA1OjIzIFBNDQo+IFRvOiBLdWVobGluZywgRmVs
aXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBIdWFuZywgVHJpZ2dlciA8VHJpZ2dlci5IdWFu
Z0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL2FtZGdwdTogVW5tYXAgQ1NBIHVuZGVyIFNSLUlPViBpbiBLRkQgcGF0aA0K
Pg0KPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+DQo+IFdlbGwgdGhhdCBpcyBleGFjdGx5
IHdoYXQgd2UgYWxyZWFkeSBkbyBoZXJlLiBUaGUgb25seSBwcm9ibGVtIGlzIHdlIGRvIHRoZSB3
cm9uZyBjaGVjayBhbWRncHVfdm1fbWFrZV9jb21wdXRlKCkuDQo+DQo+IEluc3RlYWQgb2YgY2hl
Y2tpbmcgaWYgc29tZSBwYWdlIHRhYmxlcyBhcmUgYWxyZWFkeSBmaWxsZWQgd2UgY2hlY2sgaWYg
c29tZSBtYXBwaW5nIGlzIGFscmVhZHkgbWFkZS4NCj4NCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFu
Lg0KPg0KPiBBbSAzMC4wNC4xOSB1bSAwMTozNCBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+
IEkgcmVtZW1iZXIgYSBwYXN0IGRpc2N1c3Npb24gdG8gY2hhbmdlIHRoZSBDU0EgYWxsb2NhdGlv
bi9tYXBwaW5nDQo+PiBzY2hlbWUgdG8gYXZvaWQgdGhpcyBpc3N1ZSBpbiB0aGUgZmlyc3QgcGxh
Y2UuIENhbiBhZGRpbmcgdGhlIENTQSB0bw0KPj4gdGhlIFZNIGJlIGRlbGF5ZWQgYSBsaXR0bGUg
dG8gYSBwb2ludCBhZnRlciB0aGUgVk0gZ2V0cyBjb252ZXJ0ZWQgdG8gYSBjb21wdXRlIFZNPw0K
Pj4gTWF5YmUgdGhlIGZpcnN0IGNvbW1hbmQgc3VibWlzc2lvbj8NCj4+DQo+PiBSZWdhcmRzLA0K
Pj4gICAgICBGZWxpeA0KPj4NCj4+IE9uIDIwMTktMDQtMjggNjoyNSBhLm0uLCBUcmlnZ2VyIEh1
YW5nIHdyb3RlOg0KPj4+IEluIGFtZGdwdSBvcGVuIHBhdGgsIENTQSB3aWxsIGJlIG1hcHBlbmVk
IGluIFZNLCBzbyB3aGVuIG9wZW5pbmcgS0ZELA0KPj4+IGNhbGxpbmcgbWRncHVfdm1fbWFrZV9j
b21wdXRlICB3aWxsIGZhaWwgYmVjYXVzZSBpdCBmb3VuZCB0aGlzIFZNIGlzDQo+Pj4gbm90IGEg
Y2xlYW4gVk0gd2l0aCBzb21lIG1hcHBpbmdzLCBhcyBhIHJlc3VsdCwgaXQgd2lsbCBsZWFkIHRv
DQo+Pj4gZmFpbGVkIHRvIGNyZWF0ZSBwcm9jZXNzIFZNIG9iamVjdA0KPj4+DQo+Pj4gVGhlIGZp
eCBpcyB0cnkgdG8gdW5tYXAgQ1NBLCBhbmQgYWN0dWFsbHkgQ1NBIGlzIG5vdCBuZWVkZWQgaW4N
Cj4+PiBjb21wdXRlIFZGIHdvcmxkIHN3aXRjaA0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVHJp
Z2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPg0KPj4+IC0tLQ0KPj4+ICAgICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAxMCArKysrKysr
KysrDQo+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyAgICAg
ICAgICB8ICAyICstDQo+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+Pj4gaW5kZXggNjk3YjhlZi4uZTBiYzQ1NyAx
MDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMNCj4+PiBAQCAtOTU2LDYgKzk1NiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9n
cHV2bV9hY3F1aXJlX3Byb2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwNCj4+PiAgICAgICBp
ZiAoYXZtLT5wcm9jZXNzX2luZm8pDQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4+Pg0KPj4+ICsgICAgLyogRGVsZXRlIENTQSBtYXBwaW5nIHRvIG1ha2Ugc3VyZSB0aGlzIFZN
IGlzIGEgY2xlYW4gVk0gIGJlZm9yZQ0KPj4+ICsgICAgICogIGNvbnZlcnRpbmcgVk0NCj4+PiAr
ICAgICAqLw0KPj4+ICsgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBkcnZfcHJpdi0+
Y3NhX3ZhKSB7DQo+Pj4gKyAgICAgICAgICAgIGFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPnZpcnQu
Y3NhX29iaiwgdHJ1ZSk7DQo+Pj4gKyAgICAgICAgICAgIGFtZGdwdV92bV9ib19ybXYoYWRldiwg
ZHJ2X3ByaXYtPmNzYV92YSk7DQo+Pj4gKyAgICAgICAgICAgIGRydl9wcml2LT5jc2FfdmEgPSBO
VUxMOw0KPj4+ICsgICAgICAgICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPnZpcnQuY3Nh
X29iaik7DQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICAgICAgIC8qIENvbnZlcnQgVk0gaW50byBh
IGNvbXB1dGUgVk0gKi8NCj4+PiAgICAgICByZXQgPSBhbWRncHVfdm1fbWFrZV9jb21wdXRlKGFk
ZXYsIGF2bSwgcGFzaWQpOw0KPj4+ICAgICAgIGlmIChyZXQpDQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYw0KPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+Pj4gaW5kZXggZGE3YjRmZS4uMzYxYzJlNSAx
MDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4+PiBA
QCAtMTA2OSw3ICsxMDY5LDcgQEAgdm9pZCBhbWRncHVfZHJpdmVyX3Bvc3RjbG9zZV9rbXMoc3Ry
dWN0DQo+Pj4gZHJtX2RldmljZSAqZGV2LA0KPj4+DQo+Pj4gICAgICAgYW1kZ3B1X3ZtX2JvX3Jt
dihhZGV2LCBmcHJpdi0+cHJ0X3ZhKTsNCj4+Pg0KPj4+IC0gICAgaWYgKGFtZGdwdV9zcmlvdl92
ZihhZGV2KSkgew0KPj4+ICsgICAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBmcHJpdi0+
Y3NhX3ZhKSB7DQo+Pj4gICAgICAgICAgICAgICAvKiBUT0RPOiBob3cgdG8gaGFuZGxlIHJlc2Vy
dmUgZmFpbHVyZSAqLw0KPj4+ICAgICAgICAgICAgICAgQlVHX09OKGFtZGdwdV9ib19yZXNlcnZl
KGFkZXYtPnZpcnQuY3NhX29iaiwgdHJ1ZSkpOw0KPj4+ICAgICAgICAgICAgICAgYW1kZ3B1X3Zt
X2JvX3JtdihhZGV2LCBmcHJpdi0+Y3NhX3ZhKTsNCj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
