Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439FE1AF
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 13:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A510489301;
	Mon, 29 Apr 2019 11:57:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710049.outbound.protection.outlook.com [40.107.71.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2B58907C
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 11:57:23 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3486.namprd12.prod.outlook.com (20.178.241.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 11:57:22 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 11:57:22 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: RE: [PATCH] drm/amdgpu: enable separate timeout setting for every
 ring type
Thread-Topic: [PATCH] drm/amdgpu: enable separate timeout setting for every
 ring type
Thread-Index: AQHU/mmoE3+f4jkTIku11+cUS+7F1KZS7KCAgAAbvWA=
Date: Mon, 29 Apr 2019 11:57:21 +0000
Message-ID: <MN2PR12MB33441D2A8DACF3A181F5D3E2E4390@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190429085748.15712-1-evan.quan@amd.com>
 <74c1715e-cd43-7c16-6e8c-29a085d23317@daenzer.net>
In-Reply-To: <74c1715e-cd43-7c16-6e8c-29a085d23317@daenzer.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bb4688-8420-44fe-bf9d-08d6cc99d68f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3486; 
x-ms-traffictypediagnostic: MN2PR12MB3486:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3486B5912A0CDAAE996157F9E4390@MN2PR12MB3486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(13464003)(7696005)(8676002)(486006)(81156014)(316002)(33656002)(81166006)(66066001)(8936002)(6916009)(53546011)(76176011)(99286004)(54906003)(446003)(68736007)(476003)(6506007)(52536014)(11346002)(102836004)(7736002)(74316002)(2906002)(6116002)(3846002)(305945005)(64756008)(256004)(66476007)(66946007)(966005)(186003)(66556008)(97736004)(66446008)(73956011)(25786009)(14454004)(4326008)(76116006)(9686003)(71200400001)(6246003)(86362001)(71190400001)(72206003)(478600001)(55016002)(6306002)(53936002)(26005)(14444005)(229853002)(66574012)(6436002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3486;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3dggsfm1lgoGHNLOWkUt0egySQzyuUBB6k5CxoIKwuipMSAU3r/xBBxwl78mBVoLj+a4dWTQQk6oWOXzN52tpneDwL+dZDT3ZVeiKrbavIJN8FVYni4hazm3cXtphTDPOP41qdYe0RThtMzJh06eZnA5KFEtSYViwz312El/xsGRMWFVYEyDxxJxmnHss2c/v79TPffmAJKYwEMQr96gSEF1VrNb78TgyCtlbYorXawgm16+dXhhIBPAx/ydv5BIvQOFsU7o1ex3Cximle0JtuRFF//blK0sV8yrBEPTXBErM/9rRbLVT+SsxaR2OGNfm/yEUaouPRshFfsd4IiW0D80iV7RjGwfKYF3YkYZo68n3BISCdCj8PtsEGnQdZpMppbFvByckydKKg2Tf1i755dz7d7TUttdHWOwWU9yP/U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bb4688-8420-44fe-bf9d-08d6cc99d68f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 11:57:21.9770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtiYyHE4TJiCPLYdUmIWKXG1Tzk4sv83DsDNdJLj19k=;
 b=HkRnnl/5LAwE5EGYsJTDQscH+kROTAAb4cCZ/A41okevoNeHg+pzLIG2fSVbbuvkl6VG9Y7aEF4xF42hnJFYPnB2+UwO2pbUg/KmFplV7ddtC0FQsaQP7Ld8nZuhurQ8BwSjy4l08ZA5b9bWPUPbyLqiSfvUAe01Kb71sRkp9mc=
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lou, Wentao" <Wentao.Lou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcuIFdpbGwgdXBkYXRlIHRoZW0gaW4gVjIuDQoNClJlZ2FyZHMs
DQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hlbCBEw6Ru
emVyIDxtaWNoZWxAZGFlbnplci5uZXQ+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjksIDIwMTkg
NjoxNyBQTQ0KPiBUbzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+DQo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPjsgTG91LCBXZW50YW8gPFdlbnRhby5Mb3VAYW1kLmNvbT47DQo+
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IGVuYWJsZSBzZXBhcmF0ZSB0aW1lb3V0IHNldHRpbmcg
Zm9yDQo+IGV2ZXJ5IHJpbmcgdHlwZQ0KPiANCj4gT24gMjAxOS0wNC0yOSAxMDo1NyBhLm0uLCBF
dmFuIFF1YW4gd3JvdGU6DQo+ID4gRXZlcnkgcmluZyB0eXBlIGNhbiBoYXZlIGl0cyBvd24gdGlt
ZW91dCBzZXR0aW5nLg0KPiA+DQo+ID4gQ2hhbmdlLUlkOiBJOTkyZjIyNGYzNmJiMzNhY2Q1NjAx
NjJiZmZkMmMzZTk4Nzg0MGE3ZQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+DQo+IA0KPiBUaGlzIGlzIGdvaW5nIGluIGEgZ29vZCBkaXJlY3Rpb24sIGJ1
dCB0aGVyZSBhcmUgc3RpbGwgc29tZSBtaW5vci9jb3NtZXRpYw0KPiBpc3N1ZXMuDQo+IA0KPiAN
Cj4gPiBAQCAtOTU4LDEzICs5NjAsMTYgQEAgc3RhdGljIHZvaWQNCj4gYW1kZ3B1X2RldmljZV9j
aGVja19hcmd1bWVudHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4gIAkJYW1kZ3B1
X3ZyYW1fcGFnZV9zcGxpdCA9IDEwMjQ7DQo+ID4gIAl9DQo+ID4NCj4gPiAtCWlmIChhbWRncHVf
bG9ja3VwX3RpbWVvdXQgPT0gMCkgew0KPiA+IC0JCWRldl93YXJuKGFkZXYtPmRldiwgImxvY2t1
cF90aW1lb3V0IG1zdXQgYmUgPiAwLA0KPiBhZGp1c3RpbmcgdG8gMTAwMDBcbiIpOw0KPiA+IC0J
CWFtZGdwdV9sb2NrdXBfdGltZW91dCA9IDEwMDAwOw0KPiA+ICsJcmV0ID0gYW1kZ3B1X2Rldmlj
ZV9nZXRfam9iX3RpbWVvdXQoYWRldik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vy
cihhZGV2LT5kZXYsICJpbnZhbGlkIGpvYiB0aW1lb3V0IHNldHRpbmdcbiIpOw0KPiA+ICsJCXJl
dHVybiByZXQ7DQo+ID4gIAl9DQo+IA0KPiBUaGUgZXJyb3IgbWVzc2FnZSBzaG91bGQgc3RpbGwg
ZXhwbGljaXRseSBtZW50aW9uIGxvY2t1cF90aW1lb3V0LCBvciBpdCBtYXkNCj4gbm90IGJlIGNs
ZWFyIHRvIHRoZSB1c2VyIHdoYXQgaXQncyBhYm91dC4gRS5nLiAiSW52YWxpZCBsb2NrdXBfdGlt
ZW91dA0KPiBwYXJhbWV0ZXIgc3ludGF4Ii4NCj4gDQo+IA0KPiA+IEBAIC0yMzIsMTIgKzIzNCwy
MCBAQCBNT0RVTEVfUEFSTV9ERVNDKG1zaSwgIk1TSSBzdXBwb3J0ICgxID0NCj4gZW5hYmxlLA0K
PiA+IDAgPSBkaXNhYmxlLCAtMSA9IGF1dG8pIik7ICBtb2R1bGVfcGFyYW1fbmFtZWQobXNpLCBh
bWRncHVfbXNpLCBpbnQsDQo+ID4gMDQ0NCk7DQo+ID4NCj4gPiAgLyoqDQo+ID4gLSAqIERPQzog
bG9ja3VwX3RpbWVvdXQgKGludCkNCj4gPiAtICogU2V0IEdQVSBzY2hlZHVsZXIgdGltZW91dCB2
YWx1ZSBpbiBtcy4gVmFsdWUgMCBpcyBpbnZhbGlkYXRlZCwgd2lsbCBiZQ0KPiBhZGp1c3RlZCB0
byAxMDAwMC4NCj4gPiAtICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmluaXRlIHRpbWVvdXQn
IChNQVhfSklGRllfT0ZGU0VUKS4gVGhlDQo+IGRlZmF1bHQgaXMgMTAwMDAuDQo+ID4gKyAqIERP
QzogbG9ja3VwX3RpbWVvdXQgKHN0cmluZykNCj4gPiArICogU2V0IEdQVSBzY2hlZHVsZXIgdGlt
ZW91dCB2YWx1ZSBpbiBtcy4NCj4gPiArICoNCj4gPiArICogVGhlIGZvcm1hdCBpcyBub24tY29t
cHV0ZVsuZ2Z4LnNkbWEudmlkZW9dWzpjb21wdXRlXS4NCj4gPiArICogV2l0aCBubyAibm9uLWNv
bXB1dGVbLmdmeC5zZG1hLnZpZGVvXSIgdGltZW91dCBzcGVjaWZpZWQsIHRoZQ0KPiBkZWZhdWx0
IHRpbWVvdXQgZm9yIG5vbi1jb21wdXRlX2pvYiBpcyAxMDAwMC4NCj4gPiArICogVGhlICJub24t
Y29tcHV0ZSIgdGltZW91dCBzZXR0aW5nIGFwcGx5cyB0byBhbGwgbm9uIGNvbXB1dGUNCj4gPiAr
IElQcyhnZngsIHNkbWEgYW5kIHZpZGVvKS4gVW5sZXNzDQo+ID4gKyAqIHRoZSB0aW1lb3V0IGZv
ciB0aGlzIElQIGlzIHNwZWNpZmllZCBzZXBhcmF0ZWx5KGJ5ICJbLmdmeC5zZG1hLnZpZGVvXSIp
Lg0KPiANCj4gQSBkb3QgaXMgYSBiaXQgd2VpcmQgYXMgYSBzZXBhcmF0b3IsIGNvbW1hIChvciBt
YXliZSBzZW1pY29sb24pIHdvdWxkIGJlDQo+IGJldHRlci4NCj4gDQo+IEFsc28sIGluc3RlYWQg
b2YgcmVxdWlyaW5nIGEgZ2VuZXJhbCBub24tY29tcHV0ZSB2YWx1ZSAod2hpY2ggaXMgdW51c2Vk
IGlmIGFsbA0KPiAzIGVuZ2luZSBzcGVjaWZpYyB2YWx1ZXMgYXJlIHNwZWNpZmllZCkgYmVmb3Jl
IHRoZSBlbmdpbmUgc3BlY2lmaWMgb25lcywgaG93DQo+IGFib3V0OiBJZiBvbmx5IG9uZSBub24t
Y29tcHV0ZSB2YWx1ZSBpcyBzcGVjaWZpZWQsIGl0IGFwcGxpZXMgdG8gYWxsIG5vbi0NCj4gY29t
cHV0ZSBlbmdpbmVzLiBJZiBtdWx0aXBsZSB2YWx1ZXMgYXJlIHNwZWNpZmllZCwgdGhlIGZpcnN0
IG9uZSBpcyBmb3IgR0ZYLA0KPiBzZWNvbmQgb25lIGZvciBTRE1BLCB0aGlyZCBvbmUgZm9yIHZp
ZGVvLg0KPiANCj4gDQo+ID4gQEAgLTEzMDcsNiArMTMxNyw2NiBAQCBpbnQgYW1kZ3B1X2ZpbGVf
dG9fZnByaXYoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdA0KPiBhbWRncHVfZnByaXYgKipmcHJp
dikNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiAraW50IGFtZGdwdV9kZXZpY2Vf
Z2V0X2pvYl90aW1lb3V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSB7DQo+ID4gKwljaGFy
ICppbnB1dCA9IGFtZGdwdV9sb2NrdXBfdGltZW91dDsNCj4gPiArCWNoYXIgKm5vbl9jb21wdXRl
X3NldHRpbmcgPSBOVUxMOw0KPiA+ICsJY2hhciAqdGltZW91dF9zZXR0aW5nID0gTlVMTDsNCj4g
PiArCWludCBpbmRleCA9IDA7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKwkvKiBE
ZWZhdWx0IHRpbWVvdXQgZm9yIG5vbiBjb21wdXRlIGpvYiBpcyAxMDAwMCAqLw0KPiA+ICsJYWRl
di0+Z2Z4X3RpbWVvdXQgPQ0KPiA+ICsJCWFkZXYtPnNkbWFfdGltZW91dCA9DQo+ID4gKwkJCWFk
ZXYtPnZpZGVvX3RpbWVvdXQgPSAxMDAwMDsNCj4gDQo+IFRoaXMgaXMgYSBiaXQgd2VpcmQgZm9y
bWF0dGluZy4gOikgTWF5YmUgaXQgY2FuIGJlIG9uZSBvciB0d28gbGluZXMsIG90aGVyd2lzZQ0K
PiB0aGUgc2Vjb25kIGNvbnRpbnVhdGlvbiBsaW5lIHNob3VsZCBoYXZlIHRoZSBzYW1lIGluZGVu
dGF0aW9uIGFzIHRoZSBmaXJzdA0KPiBvbmUuDQo+IA0KPiANCj4gPiArCS8qIEVuZm9yY2Ugbm8g
dGltZW91dCBvbiBjb21wdXRlIGpvYiBhdCBkZWZhdWx0ICovDQo+IA0KPiAiYnkgZGVmYXVsdCIg
KHNhbWUgaW4gYW1kZ3B1X2ZlbmNlX2RyaXZlcl9pbml0X3JpbmcpLg0KPiANCj4gDQo+IC0tDQo+
IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0
dHBzOi8vd3d3LmFtZC5jb20NCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAg
ICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
