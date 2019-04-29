Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B864BED35
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 01:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AD189354;
	Mon, 29 Apr 2019 23:16:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9A489354
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 23:16:03 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB3400.namprd12.prod.outlook.com (20.178.196.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 23:16:02 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 23:16:02 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZqZTFL0AgACzGYA=
Date: Mon, 29 Apr 2019 23:16:02 +0000
Message-ID: <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
In-Reply-To: <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0ce4778-cad2-4ee0-3d97-08d6ccf8a554
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3400; 
x-ms-traffictypediagnostic: BYAPR12MB3400:
x-microsoft-antispam-prvs: <BYAPR12MB3400F89F8520D6F58068F23392390@BYAPR12MB3400.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(366004)(39860400002)(189003)(199004)(8676002)(14444005)(26005)(186003)(31696002)(2501003)(256004)(71200400001)(71190400001)(52116002)(81156014)(65956001)(6246003)(316002)(102836004)(66066001)(76176011)(73956011)(25786009)(8936002)(31686004)(99286004)(4326008)(65806001)(58126008)(6506007)(53546011)(386003)(64126003)(81166006)(36756003)(97736004)(66946007)(446003)(68736007)(3846002)(72206003)(6436002)(6116002)(305945005)(64756008)(66446008)(2906002)(66476007)(229853002)(2616005)(66556008)(478600001)(14454004)(6512007)(11346002)(5660300002)(53936002)(86362001)(110136005)(6486002)(65826007)(66574012)(486006)(7736002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3400;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QBpR6NKMTq9J10dM/RIrS4vNCZgEJrtUKS5+TgV+TwPhRrIlpHcvCzTFtS3C4F20HVYOeQkxCmVz9T32ptfek91PGav61p74qjl7PWiGbTEB+L2xr00crGxJ/bWUzVVq3gTXZdJ6o5jyDA/1Uct1EF4hfIjDOt0jtvQ+V5PjSDAA6jLTp7jvezhWX2dUJSjBKor6ZFSw3xMEHOEMUJ5U6nZYkXkNjXPiMBOq2QLnLNKQUSL1XZLQ8SrT5fcWm+6Fu64xXRWhbTxC9rPQ1gEuR9xJReaLOiOOREmC3P45ZmeEYyRem6WwGi6sTKDGuFQlT51dLj7cLR8Wd+vUtOAVxuyPbHRnoo1KSg0wRwi40h0rnAMg63vvOyYu+HE5epgF2PPK1+cMC29FBuVIDHyyHXsTa+16mP9Ognb5Rf6DiW4=
Content-ID: <91E320F7002DE6458DF9B85E2898CBF2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ce4778-cad2-4ee0-3d97-08d6ccf8a554
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 23:16:02.1534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3400
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU8CX/oJ195PRPLWFY1K09Ub6w6jPA4ZJSpyPw38DAU=;
 b=p52KVbzNluMePQmgxRDJDYqSfTHXIzQqrDCqdduia5zPuqiQ+PNJazgVXgQQSVR3ewws+iHLMNz0JzdFJv1DYJRlphCOXlQAa7w8R/SEMLW1sqpLEaommuEI4MkBK/fL+s/C00mTzU456kUZ/5gqM6p0eleS88yqndmsYSVyTO8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNC0yOSA4OjM0IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDI4
LjA0LjE5IHVtIDA5OjQ0IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Og0KPj4gRnJvbTogS2VudCBS
dXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4NCj4+DQo+PiBHVFQgc2l6ZSBpcyBjdXJyZW50
bHkgbGltaXRlZCB0byB0aGUgbWluaW11bSBvZiBWUkFNIHNpemUgb3IgMy80IG9mDQo+PiBzeXN0
ZW0gbWVtb3J5LiBUaGlzIHNldmVyZWx5IGxpbWl0cyB0aGUgcXVhbml0aXR5IG9mIHN5c3RlbSBt
ZW1vcnkNCj4+IHRoYXQgY2FuIGJlIHVzZWQgYnkgUk9DbSBhcHBsaWNhdGlvbi4NCj4+DQo+PiBJ
bmNyZWFzZSBHVFQgc2l6ZSB0byB0aGUgbWF4aW11bSBvZiBWUkFNIHNpemUgb3Igc3lzdGVtIG1l
bW9yeSBzaXplLg0KPg0KPiBXZWxsLCBOQUsuDQo+DQo+IFRoaXMgbGltaXQgd2FzIGRvbmUgb24g
cHVycG9zZSBiZWNhdXNlIHdlIG90aGVyd2lzZSB0aGUgDQo+IG1heC10ZXh0dXJlLXNpemUgd291
bGQgYmUgY3Jhc2hpbmcgdGhlIHN5c3RlbSBiZWNhdXNlIHRoZSBPT00ga2lsbGVyIA0KPiB3b3Vs
ZCBiZSBjYXVzaW5nIGEgc3lzdGVtIHBhbmljLg0KPg0KPiBVc2luZyBtb3JlIHRoYW4gNzUlIG9m
IHN5c3RlbSBtZW1vcnkgYnkgdGhlIEdQVSBhdCB0aGUgc2FtZSB0aW1lIG1ha2VzIA0KPiB0aGUg
c3lzdGVtIHVuc3RhYmxlIGFuZCBzbyB3ZSBjYW4ndCBhbGxvdyB0aGF0IGJ5IGRlZmF1bHQuDQoN
Ckxpa2Ugd2UgZGlzY3Vzc2VkLCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyB0b28gbGlt
aXRpbmcuIE9uIGEgRmlqaSANCnN5c3RlbSB3aXRoIDRHQiBWUkFNIGFuZCAzMkdCIHN5c3RlbSBt
ZW1vcnksIGl0IGxpbWl0cyBzeXN0ZW0gbWVtb3J5IA0KYWxsb2NhdGlvbnMgdG8gNEdCLiBJIHRo
aW5rIHRoaXMgd29ya2Fyb3VuZCB3YXMgZml4ZWQgb25jZSBiZWZvcmUgYW5kIA0KcmV2ZXJ0ZWQg
YmVjYXVzZSBpdCBicm9rZSBhIENaIHN5c3RlbSB3aXRoIDFHQiBzeXN0ZW0gbWVtb3J5LiBTbyBJ
IA0Kc3VzcGVjdCB0aGF0IHRoaXMgaXMgYW4gaXNzdWUgYWZmZWN0aW5nIHNtYWxsIG1lbW9yeSBz
eXN0ZW1zIHdoZXJlIG1heWJlIA0KdGhlIDEvMiBzeXN0ZW0gbWVtb3J5IGxpbWl0IGluIFRUTSBp
c24ndCBzdWZmaWNpZW50IHRvIHByb3RlY3QgZnJvbSBPT00gDQpwYW5pY3MuDQoNClRoZSBPT00g
a2lsbGVyIHByb2JsZW0gaXMgYSBtb3JlIGdlbmVyYWwgcHJvYmxlbSB0aGF0IHBvdGVudGlhbGx5
IA0KYWZmZWN0cyBvdGhlciBkcml2ZXJzIHRvby4gS2VlcGluZyB0aGlzIEdUVCBsaW1pdCBicm9r
ZW4gaW4gQU1ER1BVIGlzIGFuIA0KaW5hZGVxdWF0ZSB3b3JrYXJvdW5kIGF0IGJlc3QuIEknZCBs
aWtlIHRvIGxvb2sgZm9yIGEgYmV0dGVyIHNvbHV0aW9uLCANCnByb2JhYmx5IHNvbWUgYWRqdXN0
bWVudCBvZiB0aGUgVFRNIHN5c3RlbSBtZW1vcnkgbGltaXRzIG9uIHN5c3RlbXMgd2l0aCANCnNt
YWxsIG1lbW9yeSwgdG8gYXZvaWQgT09NIHBhbmljcyBvbiBzdWNoIHN5c3RlbXMuDQoNClJlZ2Fy
ZHMsDQogwqAgRmVsaXgNCg0KDQo+DQo+IFdoYXQgY291bGQgbWF5YmUgd29yayBpcyB0byByZWR1
Y2UgYW1vdW50IG9mIHN5c3RlbSBtZW1vcnkgYnkgYSBmaXhlZCANCj4gZmFjdG9yLCBidXQgSSBv
ZiBoYW5kIGRvbid0IHNlZSBhIHdheSBvZiBmaXhpbmcgdGhpcyBpbiBnZW5lcmFsLg0KPg0KPiBS
ZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogS2VudCBSdXNz
ZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCA5ICsrKystLS0tLQ0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIA0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+IGluZGV4IGMxNDE5ODczN2RjZC4u
ZTllY2MzOTUzNjczIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMNCj4+IEBAIC0xNzQwLDExICsxNzQwLDEwIEBAIGludCBhbWRncHVfdHRtX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHN5
c2luZm8gc2k7DQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgc2lfbWVtaW5mbygmc2kpOw0KPj4g
LcKgwqDCoMKgwqDCoMKgIGd0dF9zaXplID0gbWluKG1heCgoQU1ER1BVX0RFRkFVTFRfR1RUX1NJ
WkVfTUIgPDwgMjApLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
ZGV2LT5nbWMubWNfdnJhbV9zaXplKSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKCh1aW50NjRfdClzaS50b3RhbHJhbSAqIHNpLm1lbV91bml0ICogMy80KSk7DQo+
PiAtwqDCoMKgIH0NCj4+IC3CoMKgwqAgZWxzZQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGd0dF9zaXpl
ID0gbWF4MygoQU1ER1BVX0RFRkFVTFRfR1RUX1NJWkVfTUIgPDwgMjApLA0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGV2LT5nbWMubWNfdnJhbV9zaXplLA0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoKHVpbnQ2NF90KXNpLnRvdGFscmFtICogc2kubWVt
X3VuaXQpKTsNCj4+ICvCoMKgwqAgfSBlbHNlDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ3R0X3Np
emUgPSAodWludDY0X3QpYW1kZ3B1X2d0dF9zaXplIDw8IDIwOw0KPj4gwqAgwqDCoMKgwqDCoCAv
KiBJbml0aWFsaXplIEdUVCBtZW1vcnkgcG9vbCAqLw0KPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
