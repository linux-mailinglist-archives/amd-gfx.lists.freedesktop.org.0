Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C527F75
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 16:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015A289E7C;
	Thu, 23 May 2019 14:24:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CB389E7C
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 14:24:16 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2821.namprd12.prod.outlook.com (20.177.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 14:24:12 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1922.018; Thu, 23 May 2019
 14:24:12 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: sort probed modes before adding common modes
Thread-Topic: [PATCH] drm/amdgpu: sort probed modes before adding common modes
Thread-Index: AQHVEXBXKTL7oh7y002WbcrgKs1anqZ4w32A
Date: Thu, 23 May 2019 14:24:12 +0000
Message-ID: <fd19e8bf-5ba7-20de-11cd-cbde82d2e697@amd.com>
References: <20190523140310.44773-1-yogesh.mohanmarimuthu@amd.com>
In-Reply-To: <20190523140310.44773-1-yogesh.mohanmarimuthu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 729da4fe-7f5f-4c56-5b2a-08d6df8a5397
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2821; 
x-ms-traffictypediagnostic: BYAPR12MB2821:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB28211259560AB28042253124EC010@BYAPR12MB2821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(66066001)(8936002)(99286004)(14444005)(14454004)(2501003)(256004)(72206003)(478600001)(966005)(71190400001)(6486002)(11346002)(25786009)(8676002)(476003)(6512007)(110136005)(2616005)(316002)(446003)(71200400001)(6306002)(229853002)(81156014)(81166006)(86362001)(6436002)(486006)(36756003)(6506007)(53936002)(68736007)(31686004)(53546011)(386003)(7736002)(76176011)(26005)(305945005)(73956011)(66946007)(5660300002)(52116002)(31696002)(2906002)(66476007)(66556008)(64756008)(66446008)(102836004)(186003)(6116002)(6246003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2821;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nm5soyoQlrVo2oCLxdcNRDFuTe9HQ8CVNmIp7pGCXsips7X8c/UTxjPqs0fcbrbzDG5hyWPx6xJxyyk2zQo8WE39Sx/Ww+RH0JgZ49wDEpYFOmPsZjV/bf9gpBLP/cAt+HcHpUn7ZHcqJT7ESWi8jws44d6i/lteXK/+hC0amsiK9UXJy57kFyHxvdEvIJ30IMvuO2024oBrQelk2WxLSqrZ1ykVfEFnTo0+Tk/JTRa8FdmkjHZ1vg87QhHRiYTCyO0kk2qAJ0oBKvC9ax7a+UpSlSXQExB3YZVbejgMNnkHizBv1qpJgyf9OASsJlh2O59UBOJnNVTlfTFrcESlGed6daS4o5jcShGeXKl20iyRHSgMkrS49DpG2AgjrWCtLmVSRck3zTKunAmD2GszMzfx9BNbyV2CN+VK1dKmzG0=
Content-ID: <8D1E3C0C11F8494FB3EA04220EFBCF05@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729da4fe-7f5f-4c56-5b2a-08d6df8a5397
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 14:24:12.3171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1K1MNXLXCy7XVISATYBtomr9op8JLUPbWW4NUiZOKQ=;
 b=WQHYu3hUwi+Pu3nkCyeleBbOwGitRvfPdX0wX8bVAgvmCo1qXyzIXGgjLl+rzLxASJ4wDFnlsWGUw/AFjskr2r+Z4Vv1Wk8smThFuLz+eYLc4enQ1CmXCVJIjnbb4J1rNNPemzcdXjcjpGZDcE83g6GvU9pm26CTnEpG8BSReAk=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNS8yMy8xOSAxMDowMyBBTSwgTW9oYW4gTWFyaW11dGh1LCBZb2dlc2ggd3JvdGU6DQo+IA0K
PiBbV2h5XQ0KPiBUaGVyZSBhcmUgbW9uaXRvcnMgd2hpY2ggY2FuIGhhdmUgbW9yZSB0aGFuIG9u
ZSBwcmVmZXJyZWQgbW9kZQ0KPiBzZXQuIFRoZXJlIGFyZSBjaGFuY2VzIGluIHRoZXNlIG1vbml0
b3JzIHRoYXQgaWYgY29tbW9uIG1vZGVzIGFyZQ0KPiBhZGRlZCBpbiBmdW5jdGlvbiBhbWRncHVf
ZG1fY29ubmVjdG9yX2FkZF9jb21tb25fbW9kZXMoKSwgdGhlc2UNCj4gY29tbW9uIG1vZGVzIGNh
biBiZSBjYWxjdWxhdGVkIHdpdGggZGlmZmVyZW50IHByZWZlcnJlZCBtb2RlIHRoYW4NCj4gdGhl
IG9uZSB1c2VkIGluIGZ1bmN0aW9uIGRlY2lkZV9jcnRjX3RpbWluZ19mb3JfZHJtX2Rpc3BsYXlf
bW9kZSgpLg0KPiBUaGUgcHJlZmVycmVkIG1vZGUgY2FuIGJlIGRpZmZlcmVudCBiZWNhdXNlIGFm
dGVyIGNvbW1vbiBtb2Rlcw0KPiBhcmUgYWRkZWQsIHRoZSBtb2RlIGxpc3QgaXMgc29ydGVkIGFu
ZCB0aGlzIGNoYW5nZXMgdGhlIG9yZGVyIG9mDQo+IHByZWZlcnJlZCBtb2RlcyBpbiB0aGUgbGlz
dC4gVGhlIGZpcnN0IG1vZGUgaW4gdGhlIGxpc3Qgd2l0aA0KPiBwcmVmZXJyZWQgZmxhZyBzZXQg
aXMgc2VsZWN0ZWQgYXMgcHJlZmVycmVkIG1vZGUuIER1ZSB0byB0aGlzIHRoZQ0KPiBwcmVmZXJy
ZWQgbW9kZSBzZWxlY3RlZCB2YXJpZXMuDQo+IElmIHNhbWUgcHJlZmVycmVkIG1vZGUgaXMgbm90
IHNlbGVjdGVkIGluIGNvbW1vbiBtb2RlIGNhbGN1bGF0aW9uDQo+IGFuZCBjcnRjIHRpbWluZywg
dGhlbiBkdXJpbmcgbW9kZSBzZXQgaW5zdGVhZCBvZiBzZXR0aW5nIHByZWZlcnJlZA0KPiB0aW1p
bmcsIGNvbW1vbiBtb2RlIHRpbWluZyB3aWxsIGJlIGFwcGxpZWQgd2hpY2ggY2FuIGNhdXNlICJv
dXQgb2YNCj4gcmFuZ2UiIG1lc3NhZ2UgaW4gdGhlIG1vbml0b3Igd2l0aCBtb25pdG9yIGJsYW5r
aW5nIG91dC4NCj4gDQo+IFtIb3ddDQo+IFNvcnQgdGhlIG1vZGVzIGJlZm9yZSBhZGRpbmcgY29t
bW9uIG1vZGVzLiBUaGUgc2FtZSBzb3J0aW5nIGZ1bmN0aW9uDQo+IGlzIGNhbGxlZCBkdXJpbmcg
Y29tbW9uIG1vZGUgYWRkaXRpb24gYW5kIGRlY2lkaW5nIGNydGMgdGltaW5nLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogWW9nZXNoIE1vaGFuIE1hcmltdXRodSA8eW9nZXNoLm1vaGFubWFyaW11dGh1
QGFtZC5jb20+DQo+IENoYW5nZS1JZDogSTQ4MDM2YTQ3NmFkNjIxZGUwMjJlMmZkYTVlMTg2MWU3
MmU3ZThjMzANCg0KV2l0aCB0aGUgcGF0Y2ggdGl0bGUgZml4ZWQgdG8gc3RhcnQgd2l0aCAiZHJt
L2FtZC9kaXNwbGF5OiIsIHRoaXMgaXM6DQoNClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVz
a2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNClNvIHRoZSBzb3J0aW5nIG5vcm1h
bGx5IHNlZW1zIHRvIGhhcHBlbiBhdCB0aGUgZW5kIG9mIA0KZHJtX2hlbHBlcl9wcm9iZV9zaW5n
bGVfY29ubmVjdG9yX21vZGVzLCBvciBhZnRlciBib3RoIGdldF9tb2RlcyBhbmQgDQpmaWxsX21v
ZGVzIGhhdmUgYmVlbiBjYWxsZWQuDQoNClNvIHNvcnRpbmcgdGhlIGxpc3QgaW4gYWR2YW5jZSBh
aGVhZCBvZiBEUk0gc2hvdWxkbid0IGh1cnQgaGVyZS4NCg0KVGhpcyBzaG91bGQgaGVscCB0aGUg
b3JkZXIgYXQgbGVhc3QgbWF0Y2ggdGhlIG9yZGVyIHdlIHF1ZXJ5IGZvciB0aGUgDQpwcmVmZXJy
ZWQgbW9kZSBsYXRlciBvbiB3aGVuIGNyZWF0aW5nIHRoZSBzaW5rIGZvciB0aGUgc3RyZWFtLCBi
dXQgaXQgDQpzdGlsbCBpcyBqdXN0IG1hc2tpbmcgdGhlIG92ZXJhbGwgcHJvYmxlbSBvZiBub3Qg
Y2hlY2tpbmcgdGhlIHJpZ2h0IG1vZGUgDQpmb3IgZGVjaWRpbmcgd2hlbiB0byBzY2FsZSBvciBu
b3QuDQoNCldlJ2xsIHByb2JhYmx5IG5lZWQgdG8gZWl0aGVyIGFkZCBhIHByaXZhdGUgZmxhZyB0
byB0aGUgY29tbW9uIG1vZGVzIHRvIA0KaW5kaWNhdGUgdGhhdCB0aGV5IHNob3VsZCBiZSBzY2Fs
ZWQgb3IgdXNpbmcgY2hlY2sgdGhlIHNjYWxpbmcgYWdhaW5zdCANCndoYXQgd2UgdGhvdWdodCB3
YXMgdGhlIG5hdGl2ZSBtb2RlLCBpZS4gdGhlIG9uZSBmcm9tIHRoZSBlbmNvZGVyLg0KDQpOaWNo
b2xhcyBLYXpsYXVza2FzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDkgKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IDRhMTc1NWJjZS4uNDE4ZTM5NTZhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj4gQEAgLTQ2NzcsNiArNDY3NywxNSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1f
Y29ubmVjdG9yX2RkY19nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwN
Cj4gICAgICAgICAgICAgICAgICBhbWRncHVfZG1fY29ubmVjdG9yLT5udW1fbW9kZXMgPQ0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVj
dG9yLCBlZGlkKTsNCj4gDQo+ICsgICAgICAgICAgICAgICAvKiBzb3J0aW5nIHRoZSBwcm9iZWQg
bW9kZXMgYmVmb3JlIGNhbGxpbmcgZnVuY3Rpb24NCj4gKyAgICAgICAgICAgICAgICAqIGFtZGdw
dV9kbV9nZXRfbmF0aXZlX21vZGUoKSBzaW5jZSBFRElEIGNhbiBoYXZlDQo+ICsgICAgICAgICAg
ICAgICAgKiBtb3JlIHRoYW4gb25lIHByZWZlcnJlZCBtb2RlLiBUaGUgbW9kZXMgdGhhdCBhcmUN
Cj4gKyAgICAgICAgICAgICAgICAqIGxhdGVyIGluIHRoZSBwcm9iZWQgbW9kZSBsaXN0IGNvdWxk
IGJlIG9mIGhpZ2hlcg0KPiArICAgICAgICAgICAgICAgICogYW5kIHByZWZlcnJlZCByZXNvbHV0
aW9uLiBGb3IgZXhhbXBsZSwgMzg0MHgyMTYwDQo+ICsgICAgICAgICAgICAgICAgKiByZXNvbHV0
aW9uIGluIGJhc2UgRURJRCBwcmVmZXJyZWQgdGltaW5nIGFuZCA0MDk2eDIxNjANCj4gKyAgICAg
ICAgICAgICAgICAqIHByZWZlcnJlZCByZXNvbHV0aW9uIGluIERJRCBleHRlbnNpb24gYmxvY2sg
bGF0ZXIuDQo+ICsgICAgICAgICAgICAgICAgKi8NCj4gKyAgICAgICAgICAgICAgIGRybV9tb2Rl
X3NvcnQoJmNvbm5lY3Rvci0+cHJvYmVkX21vZGVzKTsNCj4gICAgICAgICAgICAgICAgICBhbWRn
cHVfZG1fZ2V0X25hdGl2ZV9tb2RlKGNvbm5lY3Rvcik7DQo+ICAgICAgICAgIH0gZWxzZSB7DQo+
ICAgICAgICAgICAgICAgICAgYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+bnVtX21vZGVzID0gMDsNCj4g
LS0NCj4gMi4xNy4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
