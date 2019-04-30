Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79FF381
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 11:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CDE891AD;
	Tue, 30 Apr 2019 09:53:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690047.outbound.protection.outlook.com [40.107.69.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AD5891AD
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 09:53:25 +0000 (UTC)
Received: from MN2PR12MB3408.namprd12.prod.outlook.com (20.178.243.85) by
 MN2PR12MB3247.namprd12.prod.outlook.com (20.179.81.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 09:53:23 +0000
Received: from MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4]) by MN2PR12MB3408.namprd12.prod.outlook.com
 ([fe80::7042:de63:ed77:13b4%5]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 09:53:23 +0000
From: "Huang, Trigger" <Trigger.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Topic: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
Thread-Index: AQHU/uQe3a9JFuTW4Ei0FX7BBwKNtqZUbsaAgAAGylA=
Date: Tue, 30 Apr 2019 09:53:23 +0000
Message-ID: <MN2PR12MB3408BADD8375F5B6D6090244FE3A0@MN2PR12MB3408.namprd12.prod.outlook.com>
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
 <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
 <749d808b-5afc-488e-6d31-fae5e8dac208@gmail.com>
In-Reply-To: <749d808b-5afc-488e-6d31-fae5e8dac208@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bb252ed-27bb-4e94-671e-08d6cd51af77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3247; 
x-ms-traffictypediagnostic: MN2PR12MB3247:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB324773C5A778CC02271DD36EFE3A0@MN2PR12MB3247.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(39860400002)(376002)(13464003)(51914003)(199004)(189003)(33656002)(2501003)(99286004)(76176011)(7696005)(86362001)(68736007)(316002)(110136005)(66574012)(5660300002)(14444005)(256004)(8676002)(229853002)(81156014)(81166006)(2906002)(55016002)(8936002)(6116002)(3846002)(6436002)(71200400001)(71190400001)(102836004)(53546011)(6506007)(186003)(966005)(72206003)(478600001)(14454004)(9686003)(11346002)(446003)(476003)(486006)(305945005)(73956011)(76116006)(64756008)(66946007)(53936002)(66066001)(66556008)(52536014)(66476007)(7736002)(97736004)(66446008)(6246003)(6306002)(74316002)(26005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3247;
 H:MN2PR12MB3408.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qP+EPBTo4g6wxzXHO0XfVJICOkedqFeDEuN5n9k7cXnWAa0ldKIESH4s6jRmhJVfb3eM5cqckLle1nfuANPS7IXuoc5TLSjRLERn/QVKUQw22rIE3sadZf5H57ZIC9C4g2LIJ/uLD8lH7aPyEWD6Qrira7gtYbkRr1WZk0KlNLUD+wM5lthPLK2dHmEhN7iBFTvGPDzcWOHPTfgQOhgdg/mXOjFV4KkyKOAGkGrlz3dlk/bBXCMsYSqxz6dBwai9UYOHukxSLReuEs9DMV0LcfwZ+DE5dpd0buEG4JSSjBY52uzBpjIL4qvPjfXjCIjLsoXyMiXK9/UULd7Qf0n/Mb4uC3GwrffyDkFiT+l9jctRXlT+svMJDisSKHz7HMl4DI0QzQ0ZP2xw3ggkkptbgvpfgdQEGjLxXVcWZfu9ljw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb252ed-27bb-4e94-671e-08d6cd51af77
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 09:53:23.7695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3247
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb3d1zNOSmBhLxGINvF6yHlRrALyoN53cZXDjJklAcg=;
 b=MgkD1Tr9heqEE+7kXgYLZ1166+XVxDYjl4iksTpwcvL3B8no6aqEFeVqgXCOlqvcERUHlSQgdx38LHr1ReeI9Sz75sNSPIBoaO1modIhisUUs+ep3E52F+0gXP3SrFgBiBayJ8ew7Aoqm6jVNZW7/iTgfZOIRZqaU+oMlrEboos=
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

SGkgQ2hyaXN0aWFuICYgRmVsaXgsDQoNClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLg0KDQpC
dXQgYWN0dWFsbHkgY3VycmVudGx5IENTQSBpcyBtYXBwZWQgb25seSBpbiBhbWRncHVfZHJpdmVy
X29wZW5fa21zIHVuZGVyIFNSLUlPVi4NClNvIHdvdWxkIHlvdSBnaXZlIG1vcmUgaW5mb3JtYXRp
b24gYWJvdXQgJyBXZWxsIHRoYXQgaXMgZXhhY3RseSB3aGF0IHdlIGFscmVhZHkgZG8gaGVyZSc/
IFdoZXJlIEkgY2FuIGZpbmQgaXRzIGltcGxlbWVudGF0aW9uPw0KDQpPbiB0aGUgb3RoZXIgaGFu
ZCwgSSB3aWxsICB0cnkgdGhlIG1ldGhvZCAnSW5zdGVhZCBvZiBjaGVja2luZyBpZiBzb21lIHBh
Z2UgdGFibGVzIGFyZSBhbHJlYWR5IGZpbGxlZCB3ZSBjaGVjayBpZiBzb21lIG1hcHBpbmcgaXMg
YWxyZWFkeSBtYWRlJw0KDQpUaGFua3MgJiBCZXN0IFdpc2hlcywNClRyaWdnZXIgSHVhbmcNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2Vu
aWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDMwLCAy
MDE5IDU6MjMgUE0NClRvOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
OyBIdWFuZywgVHJpZ2dlciA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IFVubWFwIENT
QSB1bmRlciBTUi1JT1YgaW4gS0ZEIHBhdGgNCg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0K
DQpXZWxsIHRoYXQgaXMgZXhhY3RseSB3aGF0IHdlIGFscmVhZHkgZG8gaGVyZS4gVGhlIG9ubHkg
cHJvYmxlbSBpcyB3ZSBkbyB0aGUgd3JvbmcgY2hlY2sgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZSgp
Lg0KDQpJbnN0ZWFkIG9mIGNoZWNraW5nIGlmIHNvbWUgcGFnZSB0YWJsZXMgYXJlIGFscmVhZHkg
ZmlsbGVkIHdlIGNoZWNrIGlmIHNvbWUgbWFwcGluZyBpcyBhbHJlYWR5IG1hZGUuDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDMwLjA0LjE5IHVtIDAxOjM0IHNjaHJpZWIgS3VlaGxpbmcs
IEZlbGl4Og0KPiBJIHJlbWVtYmVyIGEgcGFzdCBkaXNjdXNzaW9uIHRvIGNoYW5nZSB0aGUgQ1NB
IGFsbG9jYXRpb24vbWFwcGluZyANCj4gc2NoZW1lIHRvIGF2b2lkIHRoaXMgaXNzdWUgaW4gdGhl
IGZpcnN0IHBsYWNlLiBDYW4gYWRkaW5nIHRoZSBDU0EgdG8gDQo+IHRoZSBWTSBiZSBkZWxheWVk
IGEgbGl0dGxlIHRvIGEgcG9pbnQgYWZ0ZXIgdGhlIFZNIGdldHMgY29udmVydGVkIHRvIGEgY29t
cHV0ZSBWTT8NCj4gTWF5YmUgdGhlIGZpcnN0IGNvbW1hbmQgc3VibWlzc2lvbj8NCj4NCj4gUmVn
YXJkcywNCj4gICAgIEZlbGl4DQo+DQo+IE9uIDIwMTktMDQtMjggNjoyNSBhLm0uLCBUcmlnZ2Vy
IEh1YW5nIHdyb3RlOg0KPj4gSW4gYW1kZ3B1IG9wZW4gcGF0aCwgQ1NBIHdpbGwgYmUgbWFwcGVu
ZWQgaW4gVk0sIHNvIHdoZW4gb3BlbmluZyBLRkQsIA0KPj4gY2FsbGluZyBtZGdwdV92bV9tYWtl
X2NvbXB1dGUgIHdpbGwgZmFpbCBiZWNhdXNlIGl0IGZvdW5kIHRoaXMgVk0gaXMgDQo+PiBub3Qg
YSBjbGVhbiBWTSB3aXRoIHNvbWUgbWFwcGluZ3MsIGFzIGEgcmVzdWx0LCBpdCB3aWxsIGxlYWQg
dG8gDQo+PiBmYWlsZWQgdG8gY3JlYXRlIHByb2Nlc3MgVk0gb2JqZWN0DQo+Pg0KPj4gVGhlIGZp
eCBpcyB0cnkgdG8gdW5tYXAgQ1NBLCBhbmQgYWN0dWFsbHkgQ1NBIGlzIG5vdCBuZWVkZWQgaW4g
DQo+PiBjb21wdXRlIFZGIHdvcmxkIHN3aXRjaA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRyaWdn
ZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMTAgKysrKysrKysrKw0K
Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jICAgICAgICAgIHwg
IDIgKy0NCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ3B1dm0uYw0KPj4gaW5kZXggNjk3YjhlZi4uZTBiYzQ1NyAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+
PiBAQCAtOTU2LDYgKzk1NiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hY3F1aXJlX3By
b2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwNCj4+ICAgICAgaWYgKGF2bS0+cHJvY2Vzc19p
bmZvKQ0KPj4gICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4NCj4+ICsgICAgLyogRGVs
ZXRlIENTQSBtYXBwaW5nIHRvIG1ha2Ugc3VyZSB0aGlzIFZNIGlzIGEgY2xlYW4gVk0gIGJlZm9y
ZQ0KPj4gKyAgICAgKiAgY29udmVydGluZyBWTQ0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKGFt
ZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBkcnZfcHJpdi0+Y3NhX3ZhKSB7DQo+PiArICAgICAgICAg
ICAgYW1kZ3B1X2JvX3Jlc2VydmUoYWRldi0+dmlydC5jc2Ffb2JqLCB0cnVlKTsNCj4+ICsgICAg
ICAgICAgICBhbWRncHVfdm1fYm9fcm12KGFkZXYsIGRydl9wcml2LT5jc2FfdmEpOw0KPj4gKyAg
ICAgICAgICAgIGRydl9wcml2LT5jc2FfdmEgPSBOVUxMOw0KPj4gKyAgICAgICAgICAgIGFtZGdw
dV9ib191bnJlc2VydmUoYWRldi0+dmlydC5jc2Ffb2JqKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
ICAgICAvKiBDb252ZXJ0IFZNIGludG8gYSBjb21wdXRlIFZNICovDQo+PiAgICAgIHJldCA9IGFt
ZGdwdV92bV9tYWtlX2NvbXB1dGUoYWRldiwgYXZtLCBwYXNpZCk7DQo+PiAgICAgIGlmIChyZXQp
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
IA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4+IGluZGV4
IGRhN2I0ZmUuLjM2MWMyZTUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfa21zLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9rbXMuYw0KPj4gQEAgLTEwNjksNyArMTA2OSw3IEBAIHZvaWQgYW1kZ3B1X2RyaXZlcl9w
b3N0Y2xvc2Vfa21zKHN0cnVjdCANCj4+IGRybV9kZXZpY2UgKmRldiwNCj4+DQo+PiAgICAgIGFt
ZGdwdV92bV9ib19ybXYoYWRldiwgZnByaXYtPnBydF92YSk7DQo+Pg0KPj4gLSAgICBpZiAoYW1k
Z3B1X3NyaW92X3ZmKGFkZXYpKSB7DQo+PiArICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikg
JiYgZnByaXYtPmNzYV92YSkgew0KPj4gICAgICAgICAgICAgIC8qIFRPRE86IGhvdyB0byBoYW5k
bGUgcmVzZXJ2ZSBmYWlsdXJlICovDQo+PiAgICAgICAgICAgICAgQlVHX09OKGFtZGdwdV9ib19y
ZXNlcnZlKGFkZXYtPnZpcnQuY3NhX29iaiwgdHJ1ZSkpOw0KPj4gICAgICAgICAgICAgIGFtZGdw
dV92bV9ib19ybXYoYWRldiwgZnByaXYtPmNzYV92YSk7DQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
