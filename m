Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B9748F81
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DD689CCE;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD089C6B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:05 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3290.namprd12.prod.outlook.com (20.179.106.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 19:32:03 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 19:32:03 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "StDenis, Tom"
 <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
Thread-Topic: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
Thread-Index: AQHVItFjqqx8iWFz9ketxi+qnnOTQqagPGCAgAADrwCAAAD5gA==
Date: Mon, 17 Jun 2019 19:32:03 +0000
Message-ID: <84969444-1d5a-d9ea-c4eb-96ad0c0fabca@amd.com>
References: <20190614165108.23011-1-tom.stdenis@amd.com>
 <1d91998e-e97c-229e-e7f6-2cc0228bf213@amd.com>
 <2dcdc076-baee-d321-38d5-626b740eae59@gmail.com>
In-Reply-To: <2dcdc076-baee-d321-38d5-626b740eae59@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::39) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40d482a0-bfa0-4d6e-2d61-08d6f35a7975
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3290; 
x-ms-traffictypediagnostic: DM6PR12MB3290:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB329031125BAD1014E5D648C592EB0@DM6PR12MB3290.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(366004)(376002)(51914003)(199004)(189003)(6486002)(86362001)(2501003)(966005)(31696002)(72206003)(486006)(7736002)(6116002)(305945005)(8936002)(8676002)(81166006)(36756003)(81156014)(2906002)(229853002)(476003)(6512007)(73956011)(6436002)(66946007)(6306002)(64756008)(66556008)(66476007)(256004)(25786009)(3846002)(66446008)(53936002)(71200400001)(102836004)(66066001)(11346002)(71190400001)(14454004)(26005)(64126003)(58126008)(2616005)(65956001)(446003)(99286004)(68736007)(478600001)(65806001)(52116002)(110136005)(186003)(76176011)(31686004)(65826007)(53546011)(5660300002)(386003)(6506007)(6246003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3290;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AZnKbySmBd9foedwiVIDAcoWgGhDSv99zHVG3jzl0vOONL1N6yl6JIt5FQgysykNHa8y2DbTmnSeyFBhyAMYFh/s6zCN6+M2XU+pYL15DmejxZ820v4z2DFjh6ckVT3e5TUrpmnI4s6dqlVsSHzsvIXjdPFbbcd1xHDhtrdOU0rvDxcqPWShnvaw6k0VmBJPP6cL+Fv62DivsMUgrtRGm83j7Wwnty+lK5oq3TpAbQCkJpwDhqWF5DxbliDXKedZqY2Sv6XOXr0Xs5+n6l+IHMkVi08e46a+vzMZtuAW1F6BivQC2qEvbDUhZaALQbdO6XpLKcAq4uRDdisvh9N5a82N1wjhpQpDGVcy65wyfYd87V8wceoYEp/Z+w8N1F6dezra2zg8i2Z+V0OdaSxvkmhmkG8NdCwo3uDhHPxss3I=
Content-ID: <2592980EF6C8E84CA07621CF0E002A7B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d482a0-bfa0-4d6e-2d61-08d6f35a7975
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 19:32:03.2361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3290
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqxa9/McKpDIPU/WnByS2Rg18/PKJBzPykZ4mvQD+SU=;
 b=vXAgZV6mGJE/5RyZQMY4G7DBviBhRBB874Rwd724EtFGGGpwYY3nVsAhMzfqfEjPo3YPOjmhdpEtuN6+utMe+JWw7WsDeAXirqyzQZctEggtvLLdO0d902FfHYrDoKNBtHPGwI9V9HKmzRfWGBj6yYk4GwpAmbjmrF6F1lL10n8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNyAzOjI4IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDE3
LjA2LjE5IHVtIDIxOjE1IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Og0KPj4gTG9va3MgZ29vZCB0
byBtZS4gT25lIGNvc21ldGljIGNvbW1lbnQgaW5saW5lLiBXaXRoIHRoYXQgZml4ZWQgdGhpcw0K
Pj4gcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6wqAgRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+DQo+Pg0KPj4gT24gMjAxOS0wNi0xNCAxMjo1MSBwLm0uLCBTdERlbmlzLCBUb20g
d3JvdGU6DQo+Pj4gT24gMzItYml0IGhvc3RzIG1lbS0+bnVtX3BhZ2VzIGlzIDMyLWJpdHMgYW5k
IGNhbiBvdmVyZmxvdw0KPj4+IHdoZW4gc2hpZnRlZC7CoCBBZGQgYSBjYXN0IHRvIGF2b2lkIHRo
aXMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFt
ZC5jb20+DQo+Pj4gLS0tDQo+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdnJhbV9tZ3IuYyB8IDggKysrKystLS0NCj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgDQo+Pj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KPj4+IGluZGV4IGM5NjNhZDg2MDcy
ZS4uMzE4OTVkM2MzM2RlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92cmFtX21nci5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4+PiBAQCAtMjc5LDE0ICsyNzksMTYgQEAgc3RhdGljIGlu
dCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCANCj4+PiB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuLA0KPj4+IMKgwqDCoMKgwqDCoCB1aW50NjRfdCB2aXNfdXNhZ2UgPSAwOw0KPj4+IMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpOw0KPj4+IMKgwqDCoMKgwqDCoCBpbnQgcjsNCj4+PiArwqDCoMKg
IHVpbnQ2NF90IG1lbV9ieXRlczsNCj4+IENocmlzdGlhbiBsaWtlcyB0aGUgInVwc2lkZS1kb3du
IGNocmlzdG1hcyB0cmVlIiB0byBoZWxwIHJlYWRhYmlsaXR5IG9mDQo+PiBsb2NhbCB2YXJpYWJs
ZSBkZWNsYXJhdGlvbnMuDQo+DQo+IEFoLCB5ZWFoLiBUaGFua3MgZm9yIHRoZSBub3RlLg0KPg0K
PiBJIGFjdHVhbGx5IGRvbid0IGNhcmUgYWJvdXQgdGhhdCBtdWNoLCBidXQgSSBhbHdheXMgZ2V0
IHJlamVjdHMgZnJvbSANCj4gdXBzdHJlYW0gc3Vic3lzdGVtIG1haW50YWluZXJzIGlmIEkgZG9u
J3QgZG8gdGhpcy4NCj4NCj4gSXQncyBtb3N0IGxpa2VseSBub3QgZXZlbiBkb2N1bWVudGVkIHNv
bWV3aGVyZSwNCg0KUmlnaHQuIFRoZSBmYWN0IHRoYXQgSSBldmVuIG5vdGljZWQgaXQgcHJvYmFi
bHkgbWVhbnMgdGhhdCBJIGhhdmUgYSBtaWxkIA0KY2FzZSBvZiBPQ0QgbXlzZWxmLiBJZiBpdCB3
YXMgYSBzdHJpY3QgcmVxdWlyZW1lbnQsIGl0IHNob3VsZCBiZSBjYXVnaHQgDQpieSBjaGVja3Bh
dGNoLnBsLg0KDQpDaGVlcnMsDQogwqAgRmVsaXgNCg0KDQo+IENocmlzdGlhbi4NCj4NCj4+DQo+
Pg0KPj4+IMKgwqAgwqDCoMKgwqDCoMKgIGxwZm4gPSBwbGFjZS0+bHBmbjsNCj4+PiDCoMKgwqDC
oMKgwqAgaWYgKCFscGZuKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxwZm4gPSBtYW4tPnNp
emU7DQo+Pj4gwqDCoCDCoMKgwqDCoMKgwqAgLyogYmFpbCBvdXQgcXVpY2tseSBpZiB0aGVyZSdz
IGxpa2VseSBub3QgZW5vdWdoIFZSQU0gZm9yIA0KPj4+IHRoaXMgQk8gKi8NCj4+PiAtwqDCoMKg
IGlmIChhdG9taWM2NF9hZGRfcmV0dXJuKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsIA0K
Pj4+ICZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCj4+PiAtwqDCoMKg
wqDCoMKgwqAgYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3It
PnVzYWdlKTsNCj4+PiArwqDCoMKgIG1lbV9ieXRlcyA9ICh1NjQpbWVtLT5udW1fcGFnZXMgPDwg
UEFHRV9TSElGVDsNCj4+PiArwqDCoMKgIGlmIChhdG9taWM2NF9hZGRfcmV0dXJuKG1lbV9ieXRl
cywgJm1nci0+dXNhZ2UpID4gDQo+Pj4gYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSkgew0KPj4+ICvC
oMKgwqDCoMKgwqDCoCBhdG9taWM2NF9zdWIobWVtX2J5dGVzLCAmbWdyLT51c2FnZSk7DQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtLT5tbV9ub2RlID0gTlVMTDsNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+PiDCoMKgwqDCoMKgwqAgfQ0KPj4+IEBAIC0zMDgsNyAr
MzEwLDcgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCANCj4+PiB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLA0KPj4+IMKgwqDCoMKgwqDCoCBub2RlcyA9IGt2bWFsbG9j
X2FycmF5KCh1aW50MzJfdCludW1fbm9kZXMsIHNpemVvZigqbm9kZXMpLA0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMIHwgX19HRlBfWkVS
Tyk7DQo+Pj4gwqDCoMKgwqDCoMKgIGlmICghbm9kZXMpIHsNCj4+PiAtwqDCoMKgwqDCoMKgwqAg
YXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsN
Cj4+PiArwqDCoMKgwqDCoMKgwqAgYXRvbWljNjRfc3ViKG1lbV9ieXRlcywgJm1nci0+dXNhZ2Up
Ow0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPj4+IMKgwqDCoMKg
wqDCoCB9DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
