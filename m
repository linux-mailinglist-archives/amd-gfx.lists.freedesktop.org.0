Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BA18898
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 12:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E47899A5;
	Thu,  9 May 2019 10:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42204899A5
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 10:56:31 +0000 (UTC)
Received: from BYAPR12MB3301.namprd12.prod.outlook.com (20.179.93.222) by
 BYAPR12MB2694.namprd12.prod.outlook.com (20.176.255.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 10:56:28 +0000
Received: from BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::dcb6:2d1b:43fd:2e40]) by BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::dcb6:2d1b:43fd:2e40%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 10:56:28 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Topic: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Index: AQHVBiApks2+wxa9uUu9tWDK7+Bjf6ZiYnKAgAAz74CAAAGpAIAAAQYQgAAFx4CAAABa0A==
Date: Thu, 9 May 2019 10:56:28 +0000
Message-ID: <BYAPR12MB33012AC49AC6DB8F728BA43084330@BYAPR12MB3301.namprd12.prod.outlook.com>
References: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
 <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
 <BYAPR12MB3301677254798D131BC7E8FB84330@BYAPR12MB3301.namprd12.prod.outlook.com>
 <4b0c90d0-6535-9942-e140-666a4c0ff4b7@gmail.com>
 <BYAPR12MB3301D3741595A6AEE81F184884330@BYAPR12MB3301.namprd12.prod.outlook.com>
 <2a65cd8c-78ef-8f99-8c6c-67fe02afc062@amd.com>
In-Reply-To: <2a65cd8c-78ef-8f99-8c6c-67fe02afc062@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e732d860-ea31-420e-ec6b-08d6d46cfd0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2694; 
x-ms-traffictypediagnostic: BYAPR12MB2694:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2694EEA9BDD7C523D400DCF684330@BYAPR12MB2694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(366004)(346002)(39860400002)(13464003)(199004)(189003)(76116006)(476003)(15650500001)(73956011)(71200400001)(66946007)(66446008)(99286004)(64756008)(66556008)(66476007)(14454004)(26005)(68736007)(966005)(6436002)(72206003)(256004)(14444005)(66066001)(53936002)(478600001)(229853002)(66574012)(76176011)(52536014)(25786009)(74316002)(486006)(3846002)(86362001)(53546011)(6116002)(102836004)(5660300002)(7736002)(305945005)(186003)(11346002)(446003)(71190400001)(110136005)(55016002)(81166006)(81156014)(2906002)(8936002)(9686003)(6246003)(6306002)(2501003)(316002)(6506007)(7696005)(33656002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2694;
 H:BYAPR12MB3301.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pzPz0AUA7nBPHDtkbrNLN0ZQLopKEV2r3FRsI9cuhlrS+7XbAGMDDM9p7jnTvGzIAQNISMwRelgwgu1e8Wqew8K8pRwOtotBh+LXi35v8mB1NdlDMyH1Koj65tyGFm7u1jgpFQQVQCxDeM5lOAIs93XXlWmtVjCzODg2aEeRhKy+VjkAvXzb2LWdKPsCoEYWXjHTMIy+KBd1XG0kQTzSBsjKcQhnwrTDAe/YuknuYxfrwrJYg79amTBZS6AnakVeynM8XUYbWtMrG8VqTETcSm8r2HqiEYYPc+BSjObUXMZhLmlydc9y6yUxD5bVwEwnd6qTm1cK68vD0sugkIgXaLZcjY9TalsZy02387WSd5Tc9dh/Gy1wHslfVA0Wd1u0Ic+3N0RMtJvSKXkEQ1a3ljvWF3tCsiBULZNkcMOt4xQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e732d860-ea31-420e-ec6b-08d6d46cfd0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 10:56:28.5288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEj7rlJvMJ4uA+PjGOxkX93oCmqF+ZfukmYc9FmFnx0=;
 b=Z9xrH326GsQIRlbKrRu6WckKIhBmOAy91dxoMMP9pW9JnTuVAp103i+z6sITig2zgnIgYIZKBHZsvdENjfhhJnmUmY4s1+5qkY6dgiuEqXa9La56a0eQwSeXhtf9oJYMR4i2FO+h1ddu+MtqZ3Wwxmmco34IqQMMSh5PRuY4/VU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

Q2hyaXN0aWFuLCANCldoeSB0aGlzIGlzIGludGVudGlvbmFsIHRoYXQgdGhlIHNhbWUgam9iIGtl
ZXAgcmVwb3J0aW5nIHRpbWVvdXQgPyANCkFuZCB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGF0ID8g
DQoNClRoYXQncyBsb29rcyBqdXN0IGEgYnVnIA0KDQovTW9uaw0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mIEtvZW5pZywgQ2hyaXN0aWFuDQpTZW50OiBUaHVyc2RheSwg
TWF5IDksIDIwMTkgNjo1NCBQTQ0KVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vc2No
ZWQ6IGZpeCB0aGUgZHVwbGljYXRlZCBUTU8gbWVzc2FnZSBmb3Igb25lIElCDQoNCltDQVVUSU9O
OiBFeHRlcm5hbCBFbWFpbF0NCg0KSGkgTW9uaywNCg0Kb2sgeW91IGRvbid0IHNlZW0gdG8gdW5k
ZXJzdGFuZDogSXQgaXMgaW50ZW50aW9uYWwgdGhhdCB0aGUgc2FtZSBqb2IgdGltZXMgb3V0IG11
bHRpcGxlIHRpbWVzISBTbyB3ZSBjYW4ndCByZWFsbHkgY2hhbmdlIGFueXRoaW5nIGhlcmUuDQoN
CldoYXQgd2UgY2FuIGRvIGlzIGluc3RlYWQgb2Ygc2VuZGluZyBhIHNpZ25hbCAod2hpY2ggaXMg
bm90IGEgZ29vZCBpZGVhIGZyb20gdGhlIHRpbWVvdXQgaGFuZGxlciBhbnl3YXkpIHdlIGNhbiBz
dGFydCBhIGJhY2tncm91bmQgc2NyaXB0IHRvIGRvIHRoZSBkdW1waW5nLg0KDQpOb3cgd2hlbiB0
aGUgbmV4dCB0aW1lb3V0IGhhcHBlbnMgd2UgZG91YmxlIGNoZWNrIGlmIHRoZSBiYWNrZ3JvdW5k
IHNjcmlwdCBpcyBzdGlsbCBydW5uaW5nIGFuZCBpZiB5ZXMsIHNpbXBseSBpZ25vcmUgdGhlIHRp
bWVvdXQgYW5kIHdhaXQgZm9yIHRoZSBuZXh0IG9uZS4NCg0KQ2hyaXN0aWFuLg0KDQpBbSAwOS4w
NS4xOSB1bSAxMjo0OSBzY2hyaWViIExpdSwgTW9uazoNCj4gSGFoIC4uLiBJIHNlZSwgYnV0IG15
IHJlcXVpcmVtZW50IGNhbm5vdCBiZSBzYXRpc2ZpZWQgd2l0aCBjdXJyZW50IGRlc2lnbjoNCj4N
Cj4gV2hhdCBJIG5lZWQgdG8gZG8gaXMgcHV0IGEgc2lnbmFsIGFybWluZyBpbiBqb2JfdGltZW91
dCgpIHRvIG5vdGlmeSBhIFVTRVIgU1BBQ0UgZGFlbW9uIGFwcCAsIHdoaWNoIGZpbmFsbHkgbGV2
ZXJhZ2UgIlVNUiIgdG8gRFVNUC9yZXRyaWV2ZSBzdy9odyBpbmZvcm1hdGlvbiByZWxhdGVkIHdp
dGggdGhlIFRNTy9oYW5nIGFzIG11Y2ggYXMgcG9zc2libGUgLiAgVG8gbWFrZSBpdCBzdHJhaWdo
dCBmb3J3YXJkIEkgd291bGQgc2lnbmFsIFVTUjEgdG8gdGhlIHJlZ2lzdGVyZWQgYXBwICh0aGUg
ZGFlbW9uKSBldmVyeSB0aW1lIGEgVE1PIGhhcHBlbnMsICBhbmQgdGhpcyB3b3VsZCBpbnRyb2R1
Y2UgbG90IG9mIHVubmVjZXNzYXJ5IERVTVAgaWYgdGhpcyAiYnVnIiBjYW5ub3QgcmVzb2x2ZWQu
DQo+DQo+IEkgdGhpbmsga2VlcCByZXBvcnRpbmcgVE1PIG1lc3NhZ2UgZm9yIG9uZSBJQiBpcyBh
ICJidWciIHRvIG1lIGV2ZW4gaXQgaXMgbm90IGZvciBteSBhYm92ZSBmZWF0dXJlLi4uDQo+DQo+
IFRvIGFkZHJlc3MgeW91ciBjb25jZXJuLCB3aGF0IGFib3V0IHRoaXMgb25lOg0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiBpbmRleCAxMzk3OTQyLi4z
MWQ5OWU5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+
IEBAIC0yOCw3ICsyOCw3IEBADQo+ICAgI2luY2x1ZGUgImFtZGdwdS5oIg0KPiAgICNpbmNsdWRl
ICJhbWRncHVfdHJhY2UuaCINCj4NCj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQo
c3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0KPiArc3RhdGljIGludCBhbWRncHVfam9iX3Rp
bWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikNCj4gICB7DQo+ICAgICAgICAgIHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IHRvX2FtZGdwdV9yaW5nKHNfam9iLT5zY2hlZCk7DQo+
ICAgICAgICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVfam9iKHNfam9iKTsg
QEAgLTM5LDcgKzM5LDcgDQo+IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQ0KPiAgICAgICAgICBpZiAoYW1kZ3B1X3Jpbmdfc29m
dF9yZWNvdmVyeShyaW5nLCBqb2ItPnZtaWQsIHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQpKSB7DQo+
ICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIGJ1dCBzb2Z0IHJl
Y292ZXJlZFxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc19qb2ItPnNjaGVkLT5u
YW1lKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybjsNCj4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRU5PREVWOw0KPiAgICAgICAgICB9DQo+DQo+ICAgICAgICAgIGFtZGdwdV92bV9nZXRfdGFz
a19pbmZvKHJpbmctPmFkZXYsIGpvYi0+cGFzaWQsICZ0aSk7IEBAIA0KPiAtNTEsNiArNTEsOCBA
QCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iIA0K
PiAqc19qb2IpDQo+DQo+ICAgICAgICAgIGlmIChhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVy
X2dwdShyaW5nLT5hZGV2KSkNCj4gICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2dwdV9y
ZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gICB9
DQo+DQo+ICAgaW50IGFtZGdwdV9qb2JfYWxsb2Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVuc2lnbmVkIG51bV9pYnMsIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMNCj4gaW5kZXggYzFhYWY4NS4uYjkzZGViMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMNCj4gQEAgLTMwOCwxOCArMzA4LDIzIEBAIHN0YXRpYyB2b2lk
IGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIHsN
Cj4gICAgICAgICAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsNCj4gICAgICAgICAg
c3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsNCj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KPiArICAgICAgIGludCByZXQ7DQo+DQo+ICAgICAgICAgIHNjaGVkID0gY29udGFpbmVyX29m
KHdvcmssIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciwgd29ya190ZHIud29yayk7DQo+ICAgICAg
ICAgIGpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xp
c3QsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X3NjaGVkX2pvYiwgbm9kZSk7DQo+DQo+IC0gICAgICAgaWYgKGpvYikNCj4gLSAgICAgICAgICAg
ICAgIGpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7DQo+ICsgICAgICAgaWYgKGpv
Yikgew0KPiArICAgICAgICAgICAgICAgcmV0ID0gam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9q
b2Ioam9iKTsNCj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4NCj4gLSAgICAgICBzcGluX2xvY2tfaXJx
c2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gLSAgICAgICBkcm1fc2NoZWRf
c3RhcnRfdGltZW91dChzY2hlZCk7DQo+IC0gICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
c2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
LyogbWVhbnMgcmVjb3ZlcmVkLCByZXN0YXJ0IHRpbWVyIG5vdyAqLw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdz
KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2No
ZWQpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZz
Y2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAg
ICAgIH0NCj4gICB9DQo+DQo+ICAgIC8qKg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZ3B1
X3NjaGVkdWxlci5oIGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIA0KPiBpbmRleCA5YzJh
OTU3Li5jMzg4NGMzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgN
Cj4gQEAgLTIyOSw3ICsyMjksNyBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2JhY2tlbmRfb3BzIHsNCj4g
ICAgICAgICAgICAqIEB0aW1lZG91dF9qb2I6IENhbGxlZCB3aGVuIGEgam9iIGhhcyB0YWtlbiB0
b28gbG9uZyB0byBleGVjdXRlLA0KPiAgICAgICAgICAgICogdG8gdHJpZ2dlciBHUFUgcmVjb3Zl
cnkuDQo+ICAgICAgICAgICAqLw0KPiAtICAgICAgIHZvaWQgKCp0aW1lZG91dF9qb2IpKHN0cnVj
dCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOw0KPiArICAgICAgIGludCAoKnRpbWVkb3V0X2pv
Yikoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYik7DQo+DQo+ICAgICAgICAgIC8qKg0K
PiAgICAgICAgICAgICogQGZyZWVfam9iOiBDYWxsZWQgb25jZSB0aGUgam9iJ3MgZmluaXNoZWQg
ZmVuY2UgaGFzIGJlZW4gDQo+IHNpZ25hbGVkDQo+IChFTkQpDQo+DQo+DQo+IFRoYW5rcw0KPiAv
TW9uaw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IE1heSA5LCAyMDE5IDY6MzAgUE0NCj4gVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47
IEtvZW5pZywgQ2hyaXN0aWFuIA0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3NjaGVk
OiBmaXggdGhlIGR1cGxpY2F0ZWQgVE1PIG1lc3NhZ2UgZm9yIG9uZSANCj4gSUINCj4NCj4gW0NB
VVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBkcm1fc2NoZWRfc3RhcnQoKSBpcyBub3QgbmVj
ZXNzYXJ5IGNhbGxlZCBmcm9tIHRoZSB0aW1lb3V0IGhhbmRsZXIuDQo+DQo+IElmIGEgc29mdCBy
ZWNvdmVyeSBpcyBzdWZmaWNpZW50LCB3ZSBqdXN0IGNvbnRpbnVlIHdpdGhvdXQgYSBjb21wbGV0
ZSByZXNldC4NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPiBBbSAwOS4wNS4xOSB1bSAxMjoyNSBzY2hy
aWViIExpdSwgTW9uazoNCj4+IENocmlzdGlhbg0KPj4NCj4+IENoZWNrICJkcm1fc2NoZWRfc3Rh
cnQiIHdoaWNoIGlzIGludm9rZWQgZnJvbSBncHVfcmVjb3ZlcigpICwgdGhlcmUgDQo+PiBpcyBh
ICJkcm1fc2NoZWRfc3RhcnRfdGltZW91dCgpIiBpbiB0aGUgdGFpbA0KPj4NCj4+IC9Nb25rDQo+
Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IENocmlzdGlhbiBLw7Zu
aWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPj4gU2VudDogVGh1cnNkYXks
IE1heSA5LCAyMDE5IDM6MTggUE0NCj4+IFRvOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
ZHJtL3NjaGVkOiBmaXggdGhlIGR1cGxpY2F0ZWQgVE1PIG1lc3NhZ2UgZm9yIA0KPj4gb25lIElC
DQo+Pg0KPj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPj4NCj4+IEFtIDA5LjA1LjE5IHVt
IDA2OjMxIHNjaHJpZWIgTW9uayBMaXU6DQo+Pj4gd2UgZG9uJ3QgbmVlZCBkdXBsaWNhdGVkIElC
J3MgdGltZW91dCBlcnJvciBtZXNzYWdlIHJlcG9ydGVkIA0KPj4+IGVuZGxlc3NseSwganVzdCBv
bmUgcmVwb3J0IHBlciB0aW1lZG91dCBJQiBpcyBlbm91Z2gNCj4+IFdlbGwsIE5BSy4gV2UgZG9u
J3QgbmVlZCBtdWx0aXBsZSB0aW1lb3V0IHJlcG9ydHMsIGJ1dCB3ZSByZWFsbHkgbmVlZCB0byBy
ZXN0YXJ0IHRoZSB0aW1lb3V0IGNvdW50ZXIgYWZ0ZXIgaGFuZGxpbmcgaXQuDQo+Pg0KPj4gT3Ro
ZXJ3aXNlIHdlIHdpbGwgbmV2ZXIgcnVuIGludG8gYSB0aW1lb3V0IGFnYWluIGFmdGVyIGhhbmRs
aW5nIG9uZSBhbmQgaXQgaXNuJ3QgdW5saWtlbHkgdGhhdCBtdWx0aXBsZSBJQnMgaW4gYSByb3cg
ZG9lc24ndCB3b3JrIGNvcnJlY3RseS4NCj4+DQo+PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPj4+IC0tLQ0KPj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDUgLS0tLS0NCj4+PiAgICAg
MSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gaW5kZXggYzFhYWY4NS4uZDZjMTdmMSAxMDA2
NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4gQEAgLTMw
OCw3ICszMDgsNiBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykNCj4+PiAgICAgew0KPj4+ICAgICAgICAgc3RydWN0IGRybV9ncHVf
c2NoZWR1bGVyICpzY2hlZDsNCj4+PiAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7
DQo+Pj4gLSAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+Pg0KPj4+ICAgICAgICAgc2NoZWQg
PSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53
b3JrKTsNCj4+PiAgICAgICAgIGpvYiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QsDQo+Pj4gQEAgLTMxNiwxMCArMzE1LDYgQEAgc3RhdGljIHZvaWQg
ZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3QgDQo+Pj4gd29ya19zdHJ1Y3QgKndvcmspDQo+
Pj4NCj4+PiAgICAgICAgIGlmIChqb2IpDQo+Pj4gICAgICAgICAgICAgICAgIGpvYi0+c2NoZWQt
Pm9wcy0+dGltZWRvdXRfam9iKGpvYik7DQo+Pj4gLQ0KPj4+IC0gICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+IC0gICAgIGRybV9zY2hlZF9z
dGFydF90aW1lb3V0KHNjaGVkKTsNCj4+PiAtICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZz
Y2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICAgICB9DQo+Pj4NCj4+PiAgICAgIC8q
Kg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+
IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQt
Z2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
