Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE096B2E4
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 02:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08FA6E1D2;
	Wed, 17 Jul 2019 00:43:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3927C6E1D2
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 00:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1/cXruXKKxz5STcCKfn9y66bxNG0UlZWYUWbi6xT0TPSglGT/XtExFKJaYctE7EFaz2Ky+lM7mNSIm9xoP4/dmDd4c9ItsvDHWx5kvpWdPzs+dl6jBceDmUP/G6GKRNaXy38etBqn5oT5aqpXKeRxYwdqmFyiwZ3zspxgVFdojk7PEEcYogWWVYNVg8dpI1o3sEiipvZyqovnmgwzIOPf0gmVhonUDFnMJ7THCIih7n0lSmqnTXj2CWTb1S07BWkNv/Fob+HkINSukFEvLrE6C9IozQz6UFZYmxGih30PCTH2jMVfjdjNsctSjWvvRoE7l/zk/0VEw0/iAffSxECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN13DLRLabfCRKfyOdta/rGgT/l1OaUur3zS8D/UDgo=;
 b=VgNh0vD0k4n6zcacoUYusgcNXFKMwY1TA819ENnMZTh1Rc1NuoKI4ps1DcH43GXraMnPUqWWVppJToZwqiJWx4F15m/HgD8IzM+B++GmVnA6mzI/IfhM7IO9wK3u9eU0IY9iDcGpT6EBq3yRhxf3cgg/7WvYSP/BnqqSuEwrLtE5K/CgGNMlKgC3e1NsT7lYh0TKW8b8Wh8+9S8LwPJgZUEmE2m/Xuin/ZHEjrq74mU02IvjUUvF79u9PlnH9MmosUPiIkK8a1Dc1hQxJ0uUjkecruGTi1XZHO2NOSqwrDAU6L2CZ7JWdXfv7MdZHS51vfrLgWqKMTTbWkB5tZnj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3373.namprd12.prod.outlook.com (20.178.242.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 00:43:02 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 00:43:02 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: drop dead header
Thread-Topic: [PATCH] drm/amdgpu: drop dead header
Thread-Index: AQHVO+MrzQ9aqKl9/k+jKUl9OrZE7abN+VTw
Date: Wed, 17 Jul 2019 00:43:01 +0000
Message-ID: <MN2PR12MB3344F312BC62C140FFAD5FE7E4C90@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190716143116.5262-1-alexander.deucher@amd.com>
In-Reply-To: <20190716143116.5262-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e1037e3-c7a9-43ac-e44f-08d70a4fb918
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3373; 
x-ms-traffictypediagnostic: MN2PR12MB3373:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB33731CA99D643E67D21469B9E4C90@MN2PR12MB3373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(199004)(189003)(13464003)(5660300002)(6116002)(14454004)(54906003)(66476007)(3846002)(66066001)(305945005)(25786009)(256004)(7736002)(68736007)(74316002)(14444005)(446003)(66556008)(76176011)(53546011)(7696005)(64756008)(11346002)(66446008)(6506007)(229853002)(6436002)(486006)(33656002)(110136005)(102836004)(186003)(52536014)(26005)(99286004)(81166006)(6306002)(53936002)(8936002)(71190400001)(2906002)(2501003)(71200400001)(55016002)(478600001)(9686003)(81156014)(316002)(6246003)(476003)(66946007)(76116006)(8676002)(86362001)(4326008)(966005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3373;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bmb/uodjjuJwvdF7Fj46UZzqnKgyS08CHergdwLjRLsBNgKFPJIpd2nmEpEAvDYYWiD/wh7655e29Iuj13Qgf0hOrOsSm9iJ/GGkyLDUFSuA4HLLr6Zvs7dbrT1J/FhZDStFPr8NPe0ul/5ESLtv8Z4mqIW5HC+4EX+HzON3mF8UUM5DnWxble968ia1gl2h7qJypvwy0Mw2EKB3bUefMjat3hzGtdph9H7SbUpFpudEgy0N6rg2WrAkmP+rpVa1AxtGxXVmS6S2aABepPi0oYaqO/mRT+Sq0f9DfaViqiigV4A0VM2tqBrTTkZI72uVNOv+vNJ5WbLTTG9REw0VrmGdRdmC/9ypuj7jNiCD3d9oumlDqplhOxYyznsvrarxpym+dO+vF8Ymkr7jLsK8UzX1N7gVwD7gsg5rUIYe1xo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1037e3-c7a9-43ac-e44f-08d70a4fb918
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 00:43:01.7866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3373
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN13DLRLabfCRKfyOdta/rGgT/l1OaUur3zS8D/UDgo=;
 b=lpEfXnrGUz6bRG4C/AU9WhZV3NLSCd2mAorheRJQfvM0zyvb7x8EsEBswI+ZRX6VAQze9GeCaLno1NIDlYArSl8I+E/pbzD1CogitNiiVaCEHKOrQ4RReg4SUNfQLayP1zNtofR3bS5CeWhPeVHiV0U1GCDzGzP8w4Yb6vVofU8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBU
dWVzZGF5LCBKdWx5IDE2LCAyMDE5IDEwOjMxIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgRGF2ZSBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBb
UEFUQ0hdIGRybS9hbWRncHU6IGRyb3AgZGVhZCBoZWFkZXINCj4gDQo+IE5vdCB1c2VkIGFueW1v
cmUuDQo+IA0KPiBOb3RpY2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jICAgICB8ICAxIC0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpX2RwbS5oIHwgMzIgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgZGVsZXRpb25zKC0pDQo+ICBk
ZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmlfZHBtLmgNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYyBpbmRleCBiOGFkZjM4MDhkZTIuLmZmZmFlNGMy
OTczYg0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jDQo+IEBAIC01Nyw3ICs1Nyw2
IEBADQo+IA0KPiAgI2luY2x1ZGUgInZpZC5oIg0KPiAgI2luY2x1ZGUgInZpLmgiDQo+IC0jaW5j
bHVkZSAidmlfZHBtLmgiDQo+ICAjaW5jbHVkZSAiZ21jX3Y4XzAuaCINCj4gICNpbmNsdWRlICJn
bWNfdjdfMC5oIg0KPiAgI2luY2x1ZGUgImdmeF92OF8wLmgiDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0uaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZpX2RwbS5oDQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCBjNDNl
MDNmZGRmYmEuLjAwMDAwMDAwMDAwMA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92aV9kcG0uaA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDMyICswLDAgQEANCj4gLS8qDQo+
IC0gKiBDb3B5cmlnaHQgMjAxNCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuDQo+IC0gKg0K
PiAtICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb24gb2J0YWluaW5nIGENCj4gLSAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNz
b2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksDQo+IC0gKiB0byBk
ZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91
dCBsaW1pdGF0aW9uDQo+IC0gKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJn
ZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwNCj4gLSAqIGFuZC9vciBzZWxsIGNv
cGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQ0K
PiAtICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9uczoNCj4gLSAqDQo+IC0gKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGlj
ZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbg0KPiAtICog
YWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuDQo+IC0g
Kg0KPiAtICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFO
VFkgT0YgQU5ZIEtJTkQsDQo+IEVYUFJFU1MgT1INCj4gLSAqIElNUExJRUQsIElOQ0xVRElORyBC
VVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YNCj4gTUVSQ0hBTlRBQklMSVRZLA0K
PiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVO
VC4gIElOIE5PDQo+IEVWRU5UIFNIQUxMDQo+IC0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBP
UiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sDQo+IERBTUFHRVMgT1INCj4gLSAq
IE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQg
T1INCj4gT1RIRVJXSVNFLA0KPiAtICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUg0KPiBUSEUgVVNFIE9SDQo+IC0gKiBPVEhFUiBERUFM
SU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+IC0gKg0KPiAtICovDQo+IC0NCj4gLSNpZm5kZWYgX19W
SV9EUE1fSF9fDQo+IC0jZGVmaW5lIF9fVklfRFBNX0hfXw0KPiAtDQo+IC1leHRlcm4gY29uc3Qg
c3RydWN0IGFtZF9pcF9mdW5jcyBjel9kcG1faXBfZnVuY3M7IC1pbnQgY3pfc211X2luaXQoc3Ry
dWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyAtaW50IGN6X3NtdV9zdGFydChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7IC0NCj4gaW50IGN6X3NtdV9maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsNCj4gLQ0KPiAtI2VuZGlmDQo+IC0tDQo+IDIuMjAuMQ0KPiANCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
