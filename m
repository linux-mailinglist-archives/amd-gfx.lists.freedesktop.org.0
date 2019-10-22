Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6748DFFF5
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 10:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4396E47E;
	Tue, 22 Oct 2019 08:48:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710055.outbound.protection.outlook.com [40.107.71.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424076E47E
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 08:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+ODuwFtsh6XitizlJlzkwLoM5HZHXnCL3assllL59RVgJYQqBm+RqsXT4htTyb7iyvqEHs6Aywcj4bd5Kp1wwx7IPCs43+lx58auFCPPhI+POc2h48Wv3hEPVhBKOzODJeN+Ky7Ksy8ByTallJvpLeWhVbPX9NBoREOrxwsISY8agIT4LUb6xyi49t7697kMuN3Pfx66WrgFKJha1v07JUKyTy+fjAFjrggjH5zP7bPMkcCk8MEgwq1Hj4+4fKLpVM927EakDSpfuggGVxyzwfjFGKTP94OEQG8FcQEqEnksfovE+e/lRQX+ScSm1pfgMna9oaJoP/nOkVvybcnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4/5CgV00AccC+0TSTPsTNH35ZalHSOSPasAd5Ziw00=;
 b=TCSVJv0UoT34sOuS8Gu3iP3wIzlokO1R+Mpq5IY6ogvh1jfvwnQ0XDLI+SIP3Bv6aGjL/OBzUJ4Re10i3sj//kpETK20+Bk9CVGS1jb3BH1rw2f00azq6fcdN7jH/eNz9U6TStZs4So7SxkXhhFHetGct4jSJRTU9+ueuOT6OmdnBct2l/OeaPaLYK7wS2BDv/JR8dInPGVrSXsD9vyZHtLgNPOXpukygaJ4CYdprFaXpkU2nNdT38MHGbTNrejHbFnqKkYDJZe4HAs5OBMfQrk6l95WNrjf9vWJ1tXm9VqrJlKTcGeNuwfApDmPeS1j3m21wC1lbLU0jHRShGTs/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1281.namprd12.prod.outlook.com (10.168.226.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 08:48:12 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 08:48:12 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: Re: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
 (v3)
Thread-Topic: [PATCH] drm/amdgpu: refine reboot debugfs operation in ras case
 (v3)
Thread-Index: AQHViIBvWcfkdVGdFkWgzEH1K6V/cqdmWdWA
Date: Tue, 22 Oct 2019 08:48:12 +0000
Message-ID: <4b8343e7-deba-2b88-537a-108e0be8b606@amd.com>
References: <20191022022810.10067-1-guchun.chen@amd.com>
In-Reply-To: <20191022022810.10067-1-guchun.chen@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0110.eurprd07.prod.outlook.com
 (2603:10a6:207:7::20) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9278b510-c30d-439a-6fd5-08d756cc91ff
x-ms-traffictypediagnostic: BN6PR12MB1281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1281C723D586759B19EBEE3883680@BN6PR12MB1281.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(6116002)(305945005)(7736002)(6246003)(52116002)(76176011)(71190400001)(99286004)(4326008)(6486002)(71200400001)(58126008)(110136005)(316002)(2906002)(36756003)(229853002)(6512007)(6436002)(81156014)(31696002)(478600001)(6636002)(8676002)(81166006)(8936002)(86362001)(446003)(2616005)(14454004)(476003)(31686004)(5660300002)(256004)(386003)(6506007)(102836004)(46003)(64756008)(486006)(2501003)(66556008)(66476007)(66446008)(65956001)(65806001)(66946007)(11346002)(25786009)(186003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1281;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4T+ExA0ovvkGVrZEC/g7nqKAwZb5DniPpMjWikFvOPHM/Cft8B5obdCTzUQ+MhWmdX8FsCbaMECjfIStryulDpZ9skBmrQpNVSiv/kAoOZz5wj0GlDViJzWuXh78KjNiSNGoYNwaEsC7Uy082QSI2PqT3oPahI2Ndal/hFKmC1i9UcPAlCrnTiDnhxLuVDcszkwi2mNbJrfNOLgVh0PSCjAw1a4/gHlqQIBlGwelwXxXZj/uBNemewVGe86CrRgoSUggEB1V+VTECS+2wf9N/MQTLtDZbYfLEOYY5KoILbphyLXY3OP27/5qv4X/gq2Wk43bTEe3C1y4m9Q5MB0p91IvButE2n5b0VusWdf1W0x1UmjIAfXQOAg08tqMNDR8qL9olZjUR/fCOEZbVK3J3XHXgcwmQKVW0OIO8nxrNcxOQoMgrgMuaPzfss22EdL
Content-ID: <5B8207C8EAEFAF46BECE1DEB22D5E4B1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9278b510-c30d-439a-6fd5-08d756cc91ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 08:48:12.1682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IABtnIKKqEE0GqrY272YJOackHl76fbOb1iWTX/zbKVZ0B/JPD0I9NgPuZ3SoT/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1281
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4/5CgV00AccC+0TSTPsTNH35ZalHSOSPasAd5Ziw00=;
 b=WCuBDGsSpJWF0Q76ZsEtMJFssFlVeMQjR/ST6DcNb6LbAkjtOucxuVcFen4WBfca0ONOuE5A1lot0ww1ctorgh9KlW1hsPdZqrANT/ZIA25YaL/F53qrdQ7R2jYvFj7jeSgAoN6LBzAU6P2tY5Vby0xTdxkiEGsRANmSO3uyHTw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjIuMTAuMTkgdW0gMDQ6Mjggc2NocmllYiBDaGVuLCBHdWNodW46DQo+IFJhcyByZWJvb3Qg
ZGVidWdmcyBub2RlIGFsbG93cyB1c2VyIG9uZSBlYXN5IGNvbnRyb2wgdG8gYXZvaWQNCj4gZ3B1
IHJlY292ZXJ5IGhhbmcgcHJvYmxlbSBhbmQgZGlyZWN0bHkgcmVib290IHN5c3RlbSBwZXIgY2Fy
ZA0KPiBiYXNpcywgYWZ0ZXIgcmFzIHVuY29ycmVjdGFibGUgZXJyb3IgaGFwcGVucy4gSG93ZXZl
ciwgaXQgaXMNCj4gb25lIGNvbW1vbiBlbnRyeSwgd2hpY2ggc2hvdWxkIGdldCByaWQgb2YgcmFz
X2N0cmwgbm9kZSBhbmQNCj4gcmVtb3ZlIGlwIGRlcGVuZGVuY2Ugd2hlbiBpbnB1dHRpbmcgYnkg
dXNlci4gU28gYWRkIG9uZSBuZXcNCj4gYXV0b19yZWJvb3Qgbm9kZSBpbiByYXMgZGVidWdmcyBk
aXIgdG8gYWNoaWV2ZSB0aGlzLg0KPg0KPiB2MjogaW4gY29tbWl0IG1zc2FnZSwgYWRkIGp1c3Rp
ZmljYXRpb24gd2h5IHJhcyByZWJvb3QgZGVidWdmcw0KPiBub2RlIGlzIG5lZWRlZC4NCj4gdjM6
IHVzZSBkZWJ1Z2ZzX2NyZWF0ZV9ib29sIHRvIGNyZWF0ZSBkZWJ1Z2ZzIGZpbGUgZm9yIGJvb2xl
YW4gdmFsdWUNCj4NCj4gU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFt
ZC5jb20+DQoNCk5pY2UgY2xlYW51cCwgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgDQo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4NCg0KVGhhbmtzLA0KQ2hyaXN0aWFu
Lg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDE5ICsrKysrKysrKysrKy0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYw0KPiBpbmRleCA2MjIwMzk0NTIxZTQuLjJkOWUxM2QyYTcxYSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBAQCAtMTUzLDggKzE1Myw2IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1Y3QgZmls
ZSAqZiwNCj4gICAJCW9wID0gMTsNCj4gICAJZWxzZSBpZiAoc3NjYW5mKHN0ciwgImluamVjdCAl
MzJzICU4cyIsIGJsb2NrX25hbWUsIGVycikgPT0gMikNCj4gICAJCW9wID0gMjsNCj4gLQllbHNl
IGlmIChzc2NhbmYoc3RyLCAicmVib290ICUzMnMiLCBibG9ja19uYW1lKSA9PSAxKQ0KPiAtCQlv
cCA9IDM7DQo+ICAgCWVsc2UgaWYgKHN0clswXSAmJiBzdHJbMV0gJiYgc3RyWzJdICYmIHN0clsz
XSkNCj4gICAJCS8qIGFzY2lpIHN0cmluZywgYnV0IGNvbW1hbmRzIGFyZSBub3QgbWF0Y2hlZC4g
Ki8NCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiBAQCAtMjE4LDEyICsyMTYsMTEgQEAgc3RhdGlj
IHN0cnVjdCByYXNfbWFuYWdlciAqYW1kZ3B1X3Jhc19maW5kX29iaihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4gICAgKiB2YWx1ZSB0byB0aGUgYWRkcmVzcy4NCj4gICAgKg0KPiAgICAq
IFNlY29uZCBtZW1iZXI6IHN0cnVjdCByYXNfZGVidWdfaWY6Om9wLg0KPiAtICogSXQgaGFzIGZv
dXIga2luZHMgb2Ygb3BlcmF0aW9ucy4NCj4gKyAqIEl0IGhhcyB0aHJlZSBraW5kcyBvZiBvcGVy
YXRpb25zLg0KPiAgICAqDQo+ICAgICogLSAwOiBkaXNhYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRh
a2UgOjpoZWFkIGFzIGl0cyBkYXRhLg0KPiAgICAqIC0gMTogZW5hYmxlIFJBUyBvbiB0aGUgYmxv
Y2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRhLg0KPiAgICAqIC0gMjogaW5qZWN0IGVycm9ycyBv
biB0aGUgYmxvY2suIFRha2UgOjppbmplY3QgYXMgaXRzIGRhdGEuDQo+IC0gKiAtIDM6IHJlYm9v
dCBvbiB1bnJlY292ZXJhYmxlIGVycm9yDQo+ICAgICoNCj4gICAgKiBIb3cgdG8gdXNlIHRoZSBp
bnRlcmZhY2U/DQo+ICAgICogcHJvZ3JhbXM6DQo+IEBAIC0zMDUsOSArMzAyLDYgQEAgc3RhdGlj
IHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNv
bnN0IGNoYXIgX191c2VyICoNCj4gICAJCS8qIGRhdGEuaW5qZWN0LmFkZHJlc3MgaXMgb2Zmc2V0
IGluc3RlYWQgb2YgYWJzb2x1dGUgZ3B1IGFkZHJlc3MgKi8NCj4gICAJCXJldCA9IGFtZGdwdV9y
YXNfZXJyb3JfaW5qZWN0KGFkZXYsICZkYXRhLmluamVjdCk7DQo+ICAgCQlicmVhazsNCj4gLQlj
YXNlIDM6DQo+IC0JCWFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldiktPnJlYm9vdCA9IHRydWU7
DQo+IC0JCWJyZWFrOw0KPiAgIAlkZWZhdWx0Og0KPiAgIAkJcmV0ID0gLUVJTlZBTDsNCj4gICAJ
CWJyZWFrOw0KPiBAQCAtMTAzNyw2ICsxMDMxLDE3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNf
ZGVidWdmc19jcmVhdGVfY3RybF9ub2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAg
IAkJCQlhZGV2LCAmYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfb3BzKTsNCj4gICAJZGVidWdmc19j
cmVhdGVfZmlsZSgicmFzX2VlcHJvbV9yZXNldCIsIFNfSVdVR08gfCBTX0lSVUdPLCBjb24tPmRp
ciwNCj4gICAJCQkJYWRldiwgJmFtZGdwdV9yYXNfZGVidWdmc19lZXByb21fb3BzKTsNCj4gKw0K
PiArCS8qDQo+ICsJICogQWZ0ZXIgb25lIHVuY29ycmVjdGFibGUgZXJyb3IgaGFwcGVucywgdXN1
YWxseSBHUFUgcmVjb3Zlcnkgd2lsbA0KPiArCSAqIGJlIHNjaGVkdWxlZC4gQnV0IGR1ZSB0byB0
aGUga25vd24gcHJvYmxlbSBpbiBHUFUgcmVjb3ZlcnkgZmFpbGluZw0KPiArCSAqIHRvIGJyaW5n
IEdQVSBiYWNrLCBiZWxvdyBpbnRlcmZhY2UgcHJvdmlkZXMgb25lIGRpcmVjdCB3YXkgdG8NCj4g
KwkgKiB1c2VyIHRvIHJlYm9vdCBzeXN0ZW0gYXV0b21hdGljYWxseSBpbiBzdWNoIGNhc2Ugd2l0
aGluDQo+ICsJICogRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGdlbmVyYXRlZC4gTm9ybWFsIEdQ
VSByZWNvdmVyeSByb3V0aW5lDQo+ICsJICogd2lsbCBuZXZlciBiZSBjYWxsZWQuDQo+ICsJICov
DQo+ICsJZGVidWdmc19jcmVhdGVfYm9vbCgiYXV0b19yZWJvb3QiLCBTX0lXVUdPIHwgU19JUlVH
TywgY29uLT5kaXIsDQo+ICsJCQkJJmNvbi0+cmVib290KTsNCj4gICB9DQo+ICAgDQo+ICAgdm9p
ZCBhbWRncHVfcmFzX2RlYnVnZnNfY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
