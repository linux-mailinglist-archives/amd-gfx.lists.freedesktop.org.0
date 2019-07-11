Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6A650BF
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 06:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33389C0A;
	Thu, 11 Jul 2019 04:12:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B87289C0A
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 04:12:45 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 04:12:44 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2%4]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 04:12:44 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: switch to macro for psp bootloader command
Thread-Topic: [PATCH 1/2] drm/amdgpu: switch to macro for psp bootloader
 command
Thread-Index: AQHVNzhu1Pqi5KXag0eGwSsfVSLS9abEGluAgACzmVA=
Date: Thu, 11 Jul 2019 04:12:43 +0000
Message-ID: <DM5PR12MB141867D8A862369F2B63C312FCF30@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1562774338-4457-1-git-send-email-Hawking.Zhang@amd.com>
 <CADnq5_ODqPSB_2DAeS8amdP3dHNJvO=koZMMncRtWEGBDPA7rg@mail.gmail.com>
In-Reply-To: <CADnq5_ODqPSB_2DAeS8amdP3dHNJvO=koZMMncRtWEGBDPA7rg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 030b5acf-889f-454e-db72-08d705b60628
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1545; 
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB154555EC3AB7F6D55027BC11FCF30@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(13464003)(199004)(189003)(26005)(6246003)(186003)(68736007)(102836004)(81166006)(229853002)(81156014)(76116006)(74316002)(305945005)(33656002)(3846002)(6116002)(99286004)(66946007)(66556008)(66476007)(256004)(53546011)(966005)(6506007)(66446008)(64756008)(8936002)(6916009)(54906003)(7696005)(66066001)(4326008)(9686003)(11346002)(1411001)(53936002)(6436002)(55016002)(316002)(446003)(76176011)(71200400001)(71190400001)(476003)(52536014)(2906002)(25786009)(478600001)(7736002)(14454004)(8676002)(5660300002)(486006)(6306002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pqCKuf//RdG9bCJk2/hVeO8KPs0AVwTveKEG0uCb2h5TJM7END6dJKHGMcjtd8lttWhCeMnjSXpnm7Q88Bj/jnOZmgY20u2so+kcYeVavvomqbtxf8ukKhMX5gCNaUs3jRPhI7rew7MO5Klazq5M5oAvIJtBVOSqQgWjX7oScadhuwVKWxxKdSMxzlmmh28iFkAg00rFDGEzKwcny8EtqUP7kEqzqOtABjbEDNPtRCLopiijg1iHsfRbnKZRWPpOygmIDPxy1mRhysyXiMzJdj4Hv5bW/Nq3qmR9ykYqX48FJwHhA+rvsgm65D7Tf9OgIkx+WOkuX+YXdTqj6II4Rt8UYIh9fiEpXz1XODadOj93oqR2RnOHPbdzs8kEq4Pf8xUyswcHIHJ8TbZiDcnZI5bM7QqMaWSTGOd+SuffKfM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 030b5acf-889f-454e-db72-08d705b60628
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 04:12:43.8469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAK0VYBP8a/hXc8ilEeOLVYMg32ZvONbG+hOPsvz4EA=;
 b=zTrOtpRfZk2PFshPRwxyahVS+Yx7tHVi+L3eehuFXSUkCLc/mO7C5K9dr3tuQ8qNKDHyEbT2qpzZBVdjmAXt8/GxdwWU/pINOB3q3r+CSO/n8Z7/KEuzsyDc3P9ujA2/uRoslTqDaFgicYooScB7/thdMk4pdVuU+9Ci+Tzgci0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Clements,
 John" <John.Clements@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UkUgLSBNYXliZSB0aGlzIHdvdWxkIGJlIGJldHRlciBpbiBwc3BfZ2Z4X2lmLmggc2luY2UgaXQn
cyBzb3J0IG9mIHBhcnQgb2YgdGhlIGZpcm13YXJlIGludGVyZmFjZSwgYnV0IEkgZ3Vlc3MgaXQn
cyBub3QgcmVhbGx5IHBhcnQgb2YgdGhlIHBzcCByaW5nIGludGVyZmFjZS4NCg0KWWVzLCB0aGVz
ZSBjbWRzIGFyZSBub3Qgc3VibWl0dGVkIHRvIHRoZSBwc3AgcmluZyBhbmQgYWN0dWFsbHkgaXNz
dWVkIGJlZm9yZSB0aGUgcHNwIHJpbmcgc2V0dXAuIFRoZXkgYXJlIG5vdCBpbiB0aGUgaW50ZXJu
YWwgcHNwX2dmeF9pZi5oIGZpbGVzLCBzbyBJIHB1dCB0aGVtIGluIGdlbmVyYWwgcHNwIGhlYWRl
ci4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gDQpTZW50OiAyMDE55bm0N+ac
iDEx5pelIDE6MjUNClRvOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0K
Q2M6IGFtZC1nZnggbGlzdCA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT47IENsZW1lbnRzLCBKb2huIDxKb2huLkNsZW1l
bnRzQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogc3dpdGNoIHRvIG1hY3Jv
IGZvciBwc3AgYm9vdGxvYWRlciBjb21tYW5kDQoNCk9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDEx
OjU5IEFNIEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4gd3JvdGU6DQo+DQoN
ClBsZWFzZSBhZGQgYSBwYXRjaCBkZXNjcmlwdGlvbi4NCg0KPiBDaGFuZ2UtSWQ6IEllZjRjMWU1
Y2EwMWRmMGEwMjhhNzg0YzBmYWYzNzU0NDkzOTczM2EzDQo+IFNpZ25lZC1vZmYtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggfCA5ICsrKysrKysrKyAgDQo+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jICB8IDQgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgIHwgNCArKy0tDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5oDQo+IGluZGV4IGUyOGNmNWUuLjhkZGNlYzEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgNCj4gQEAgLTQyLDYgKzQyLDE1
IEBAIHN0cnVjdCBwc3BfY29udGV4dDsgIHN0cnVjdCBwc3BfeGdtaV9ub2RlX2luZm87ICANCj4g
c3RydWN0IHBzcF94Z21pX3RvcG9sb2d5X2luZm87DQo+DQo+ICtlbnVtIHBzcF9ib290bG9hZGVy
X2NtZCB7DQo+ICsgICAgICAgUFNQX0JMX19MT0FEX1NZU0RSViAgICAgICAgICAgICA9IDB4MTAw
MDAsDQo+ICsgICAgICAgUFNQX0JMX19MT0FEX1NPU0RSViAgICAgICAgICAgICA9IDB4MjAwMDAs
DQo+ICsgICAgICAgUFNQX0JMX19OT19FQ0MgICAgICAgICAgICAgICAgICA9IDB4NDAwMDAsDQo+
ICsgICAgICAgUFNQX0JMX19QQVJUSUFMX0VDQyAgICAgICAgICAgICA9IDB4NTAwMDAsDQo+ICsg
ICAgICAgUFNQX0JMX19GVUxMX0VDQyAgICAgICAgICAgICAgICA9IDB4NjAwMDAsDQo+ICsgICAg
ICAgUFNQX0JMX19MT0FEX0tFWV9EQVRBQkFTRSAgICAgICA9IDB4ODAwMDAsDQo+ICt9Ow0KPiAr
DQoNCk1heWJlIHRoaXMgd291bGQgYmUgYmV0dGVyIGluIHBzcF9nZnhfaWYuaCBzaW5jZSBpdCdz
IHNvcnQgb2YgcGFydCBvZiB0aGUgZmlybXdhcmUgaW50ZXJmYWNlLCBidXQgSSBndWVzcyBpdCdz
IG5vdCByZWFsbHkgcGFydCBvZiB0aGUgcHNwIHJpbmcgaW50ZXJmYWNlLiAgRWl0aGVyIHdheSwg
d2l0aCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gYWRkZWQsIHRoZSBzZXJpZXMgaXM6DQpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KDQo+ICBlbnVt
IHBzcF9yaW5nX3R5cGUNCj4gIHsNCj4gICAgICAgICBQU1BfUklOR19UWVBFX19JTlZBTElEID0g
MCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5j
IA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jDQo+IGluZGV4IDFi
NmMyMGMuLmU3ODQwOTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92MTFfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFf
MC5jDQo+IEBAIC0yMTIsNyArMjEyLDcgQEAgc3RhdGljIGludCBwc3BfdjExXzBfYm9vdGxvYWRl
cl9sb2FkX3N5c2RydihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkNCj4gICAgICAgICAvKiBQcm92
aWRlIHRoZSBzeXMgZHJpdmVyIHRvIGJvb3Rsb2FkZXIgKi8NCj4gICAgICAgICBXUkVHMzJfU09D
MTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM2LA0KPiAgICAgICAgICAgICAgICAodWludDMy
X3QpKHBzcC0+ZndfcHJpX21jX2FkZHIgPj4gMjApKTsNCj4gLSAgICAgICBwc3BfZ2Z4ZHJ2X2Nv
bW1hbmRfcmVnID0gMSA8PCAxNjsNCj4gKyAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0g
UFNQX0JMX19MT0FEX1NZU0RSVjsNCj4gICAgICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1Q
MF9TTU5fQzJQTVNHXzM1LA0KPiAgICAgICAgICAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVn
KTsNCj4NCj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9ib290bG9h
ZGVyX2xvYWRfc29zKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KPiAgICAgICAgIC8qIFByb3Zp
ZGUgdGhlIFBTUCBzZWN1cmUgT1MgdG8gYm9vdGxvYWRlciAqLw0KPiAgICAgICAgIFdSRUczMl9T
T0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMzYsDQo+ICAgICAgICAgICAgICAgICh1aW50
MzJfdCkocHNwLT5md19wcmlfbWNfYWRkciA+PiAyMCkpOw0KPiAtICAgICAgIHBzcF9nZnhkcnZf
Y29tbWFuZF9yZWcgPSAyIDw8IDE2Ow0KPiArICAgICAgIHBzcF9nZnhkcnZfY29tbWFuZF9yZWcg
PSBQU1BfQkxfX0xPQURfU09TRFJWOw0KPiAgICAgICAgIFdSRUczMl9TT0MxNShNUDAsIDAsIG1t
TVAwX1NNTl9DMlBNU0dfMzUsDQo+ICAgICAgICAgICAgICAgIHBzcF9nZnhkcnZfY29tbWFuZF9y
ZWcpOw0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yz
XzEuYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jDQo+IGluZGV4
IDNmNTgyNzcuLmVjM2EwNTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92M18xLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3Yz
XzEuYw0KPiBAQCAtMTUzLDcgKzE1Myw3IEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFfYm9vdGxvYWRl
cl9sb2FkX3N5c2RydihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkNCj4gICAgICAgICAvKiBQcm92
aWRlIHRoZSBzeXMgZHJpdmVyIHRvIGJvb3Rsb2FkZXIgKi8NCj4gICAgICAgICBXUkVHMzJfU09D
MTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzM2LA0KPiAgICAgICAgICAgICAgICAodWludDMy
X3QpKHBzcC0+ZndfcHJpX21jX2FkZHIgPj4gMjApKTsNCj4gLSAgICAgICBwc3BfZ2Z4ZHJ2X2Nv
bW1hbmRfcmVnID0gMSA8PCAxNjsNCj4gKyAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVnID0g
UFNQX0JMX19MT0FEX1NZU0RSVjsNCj4gICAgICAgICBXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1Q
MF9TTU5fQzJQTVNHXzM1LA0KPiAgICAgICAgICAgICAgICBwc3BfZ2Z4ZHJ2X2NvbW1hbmRfcmVn
KTsNCj4NCj4gQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IHBzcF92M18xX2Jvb3Rsb2Fk
ZXJfbG9hZF9zb3Moc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApDQo+ICAgICAgICAgLyogUHJvdmlk
ZSB0aGUgUFNQIHNlY3VyZSBPUyB0byBib290bG9hZGVyICovDQo+ICAgICAgICAgV1JFRzMyX1NP
QzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18zNiwNCj4gICAgICAgICAgICAgICAgKHVpbnQz
Ml90KShwc3AtPmZ3X3ByaV9tY19hZGRyID4+IDIwKSk7DQo+IC0gICAgICAgcHNwX2dmeGRydl9j
b21tYW5kX3JlZyA9IDIgPDwgMTY7DQo+ICsgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3JlZyA9
IFBTUF9CTF9fTE9BRF9TT1NEUlY7DQo+ICAgICAgICAgV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1N
UDBfU01OX0MyUE1TR18zNSwNCj4gICAgICAgICAgICAgICAgcHNwX2dmeGRydl9jb21tYW5kX3Jl
Zyk7DQo+DQo+IC0tDQo+IDIuNy40DQo+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
