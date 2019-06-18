Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A349E4B
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 12:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215216E13F;
	Tue, 18 Jun 2019 10:33:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD2C6E12E
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 10:33:21 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 10:33:19 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1965.019; Tue, 18 Jun 2019
 10:33:19 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 092/459] drm/amdgpu: add ib preemption status in amdgpu_job
Thread-Topic: [PATCH 092/459] drm/amdgpu: add ib preemption status in
 amdgpu_job
Thread-Index: AQHVJUFzPBBFkQV00k+5GFYlqP/cQqahDigAgAAG5rCAAAmpAIAAGMmg
Date: Tue, 18 Jun 2019 10:33:19 +0000
Message-ID: <MN2PR12MB3437C2AE9D30AC73D27C2784EFEA0@MN2PR12MB3437.namprd12.prod.outlook.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
 <20190617191700.17899-81-alexander.deucher@amd.com>
 <8429fbeb-fbb2-b71d-e146-c8f4c0959063@gmail.com>
 <MN2PR12MB3437D15684332D5E9DFA1715EFEA0@MN2PR12MB3437.namprd12.prod.outlook.com>
 <450d50ba-3c79-7199-d2f9-eac5e86b1f8f@amd.com>
In-Reply-To: <450d50ba-3c79-7199-d2f9-eac5e86b1f8f@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 099d38a9-15ab-4d7c-301b-08d6f3d861d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2877; 
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-microsoft-antispam-prvs: <MN2PR12MB2877245CB0332A405D2EFD75EFEA0@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(13464003)(199004)(189003)(3846002)(6506007)(66556008)(5660300002)(256004)(14444005)(478600001)(446003)(2501003)(476003)(74316002)(71200400001)(486006)(73956011)(66476007)(26005)(76116006)(66946007)(66446008)(64756008)(11346002)(71190400001)(53546011)(7736002)(305945005)(52536014)(186003)(99286004)(86362001)(76176011)(66574012)(7696005)(6116002)(2906002)(81156014)(81166006)(6436002)(8676002)(8936002)(6246003)(53936002)(229853002)(110136005)(54906003)(102836004)(55016002)(9686003)(316002)(25786009)(4326008)(33656002)(72206003)(14454004)(68736007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x016TFnDMhZ0hmibMbrik3gygIcGGV/Vtq1ANMBknNpvIquPd5iCGB0QfIIvZPSJujq/KvsabcIOQ+kvwsHtmva9HExdzzDhjm5Nd9oH/DqZnCOReLuZ0LeDoShXB5oJ+fo3+owcN6xywXXRRhJzCUHsIVm5GqyAmbI7ImlZvhFl5rk3pPDyU4LpaHI5ecuLp7opyv58z2wrTJOEpoEiJQRXyQbckGXGx26DC+Sr+XfG3Ve0a16WSgTrqzuaJIE6cl2rYBcm351S3ty07YGtLXGY2uFTGJsjDnDskSOCMMdjEiz5e00njymaSBcjnwAtaKBGGYnUPna9WlSHq1X7459DeEujegP1vzI3z1g8wWUE8l2xT4riV57C1YFWj7Zmv/dhiI8IGck1Ds1ArSE0NRJ1PBWDCdO0kdsL6B7kigM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099d38a9-15ab-4d7c-301b-08d6f3d861d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 10:33:19.8345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVCWOebwIewX7K2tm4x48VJx9CmTNDPWgbHLfrKqFn4=;
 b=XJoyq+Jekiv8BeaN3HdrlyJKLbdu/A9Ddln6uF7JO1oG45S+3G2EVe1d4I7iwV9uCsRWiuulNaD0it9xNEvga/bDvtuC6kkh5acHMdOoSdgfi4Lj++FHoRILk9fAU0qKhduPTnSW+lu3q4fs+rdMhZ5ZA0qLxF077bJOq+qMDHQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBzZW50IG91dCBhIHNlcGFyYXRlIHBhdGNoIHRvIGFkZCBqb2ItPnByZWFtYmxlX3N0YXR1cyBi
YWNrLg0KDQpSZWdhcmRzLA0KSmFjaw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gDQpTZW50OiBU
dWVzZGF5LCBKdW5lIDE4LCAyMDE5IDU6MDMgUE0NClRvOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9A
YW1kLmNvbT47IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSCAwOTIvNDU5XSBkcm0vYW1kZ3B1OiBhZGQgaWIgcHJlZW1wdGlv
biBzdGF0dXMgaW4gYW1kZ3B1X2pvYg0KDQpZZWFoIHRob3VnaHQgc28sIGNhdXNlIHRoYXQgd291
bGQgYnJlYWsgaW1tZWRpYXRlbHkgYW5kIHdvbid0IHdvcmsgYXQgYWxsLg0KDQpJdCBtdXN0IGJl
IHNvbWV0aGluZyBsaWtlIGEgbWVyZ2Ugb3IgcmViYXNlIGFydGlmYWN0Lg0KDQpXaGF0J3MgdGhl
IGJlc3Qgd2F5IHRvIGZpeCB0aGF0IHVwPyBJbiBvdGhlciB3b3JkcyBob3cgc2hvdWxkIGl0IGxv
b2sgbGlrZT8NCg0KQ2hyaXN0aWFuLg0KDQpBbSAxOC4wNi4xOSB1bSAxMDozMiBzY2hyaWViIFhp
YW8sIEphY2s6DQo+IEluIG9yaWdpbmFsIHBhdGNoLCB0aGVyZSBpcyBubyBkZWxldGlvbiBvbiBq
b2ItPnByZWFtYmxlX3N0YXR1cy4NCj4NCj4gUmVnYXJkcywNCj4gSmFjaw0KPg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxOCwgMjAxOSA0
OjA0IFBNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT47IA0KPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWGlhbywgSmFjayANCj4gPEphY2suWGlhb0BhbWQu
Y29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwOTIvNDU5XSBkcm0vYW1kZ3B1OiBhZGQgaWIgcHJlZW1wdGlvbiBzdGF0dXMg
aW4gDQo+IGFtZGdwdV9qb2INCj4NCj4gQW0gMTcuMDYuMTkgdW0gMjE6MTAgc2NocmllYiBBbGV4
IERldWNoZXI6DQo+PiBGcm9tOiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPg0KPj4NCj4+
IEFkZCBpYiBwcmVlbXB0aW9uIHN0YXR1cyBpbiBhbWRncHVfam9iLCBzbyB0aGF0IHJpbmcgbGV2
ZWwgZnVuY3Rpb24gDQo+PiBjYW4gZGV0ZWN0IHByZWVtcHRpb24gYW5kIHByb2dyYW0gZm9yIHJl
c3VtaW5nIGl0Lg0KPj4NCj4+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2li
LmMgIHwgMiArLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5o
IHwgMyArKysNCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+
PiBpbmRleCBlMTU1MzFiZmNkNDcuLjkwY2MwODQxYjU2NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPj4gQEAgLTIwOCw3ICsyMDgsNyBAQCBpbnQgYW1k
Z3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgDQo+PiB1bnNpZ25lZCBu
dW1faWJzLA0KPj4gICAgDQo+PiAgICAJc2tpcF9wcmVhbWJsZSA9IHJpbmctPmN1cnJlbnRfY3R4
ID09IGZlbmNlX2N0eDsNCj4+ICAgIAlpZiAoam9iICYmIHJpbmctPmZ1bmNzLT5lbWl0X2NudHhj
bnRsKSB7DQo+PiAtCQlzdGF0dXMgfD0gam9iLT5wcmVhbWJsZV9zdGF0dXM7DQo+PiArCQlzdGF0
dXMgfD0gam9iLT5wcmVlbXB0aW9uX3N0YXR1czsNCj4gVGhhdCBhY3R1YWxseSBsb29rcyBjb21w
bGV0ZWx5IGluY29ycmVjdCB0byBtZSBzaW5jZSBpdCBicmVha3MgdGhlIG9sZCBzdGF0dXMgaGFu
ZGxpbmcuDQo+DQo+IENocmlzdGlhbi4NCj4NCj4+ICAgIAkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4
Y250bChyaW5nLCBzdGF0dXMpOw0KPj4gICAgCX0NCj4+ICAgIA0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4+IGluZGV4IGUxYjQ2YTY3MDNkZS4uNTFlNjI1
MDRjMjc5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgN
Cj4+IEBAIC0yOSw2ICsyOSw4IEBADQo+PiAgICAjZGVmaW5lIEFNREdQVV9QUkVBTUJMRV9JQl9Q
UkVTRU5UX0ZJUlNUICAgICgxIDw8IDEpDQo+PiAgICAvKiBiaXQgc2V0IG1lYW5zIGNvbnRleHQg
c3dpdGNoIG9jY3VyZWQgKi8NCj4+ICAgICNkZWZpbmUgQU1ER1BVX0hBVkVfQ1RYX1NXSVRDSCAg
ICAgICAgICAgICAgKDEgPDwgMikNCj4+ICsvKiBiaXQgc2V0IG1lYW5zIElCIGlzIHByZWVtcHRl
ZCAqLw0KPj4gKyNkZWZpbmUgQU1ER1BVX0lCX1BSRUVNUFRFRCAgICAgICAgICAgICAgICAgKDEg
PDwgMykNCj4+ICAgIA0KPj4gICAgI2RlZmluZSB0b19hbWRncHVfam9iKHNjaGVkX2pvYikJCVwN
Cj4+ICAgIAkJY29udGFpbmVyX29mKChzY2hlZF9qb2IpLCBzdHJ1Y3QgYW1kZ3B1X2pvYiwgYmFz
ZSkgQEAgLTQ1LDYgDQo+PiArNDcsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2pvYiB7DQo+PiAgICAJc3Ry
dWN0IGFtZGdwdV9pYgkqaWJzOw0KPj4gICAgCXN0cnVjdCBkbWFfZmVuY2UJKmZlbmNlOyAvKiB0
aGUgaHcgZmVuY2UgKi8NCj4+ICAgIAl1aW50MzJfdAkJcHJlYW1ibGVfc3RhdHVzOw0KPj4gKwl1
aW50MzJfdCAgICAgICAgICAgICAgICBwcmVlbXB0aW9uX3N0YXR1czsNCj4+ICAgIAl1aW50MzJf
dAkJbnVtX2liczsNCj4+ICAgIAl2b2lkCQkJKm93bmVyOw0KPj4gICAgCWJvb2wgICAgICAgICAg
ICAgICAgICAgIHZtX25lZWRzX2ZsdXNoOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
