Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09369E37E
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 11:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657008972D;
	Tue, 27 Aug 2019 09:00:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798288972D
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 09:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnWcTzAgmeZ1s0B2angnOKmd+8BDtBXWVFymqZr9CsN5ap+FHZzaXAfXXaSNnn+bAVw+ZNUv63nV/oXLSyGFlgsqv7mIh3XLHCM9n2No7HB9YtA+6T0l8RHa7RPY42uxkWPmL4OUIyVhMNwHs6JOxAWbLdVIB7Q6kEZO6tBxwM2sd2hceugqv/WzlhYmAdQrShrMKLUI6lfu6Vaymwt7Qe+/pZp3hEI0XdvMjLFD4R2whiQ/OItuyobGuUFCyAU1CutviC6IgDOzSFvqNP6fyz52RqID3XUnqmRoyz0rJKcDawLjq+BLMDMNx0D3zhWCDn97tinACkxpa+1d3yVTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfjv1Uba8QtyrX9tQSvjqpFclS8dna0+gBpD1Pb5ipw=;
 b=NaVR38scUGG2t4UD1UVfONpJTY4lL5mAUf9cG26XoN+ZXUw8mllJFYhjO2VhrWzyp6q8nqNHbqNKn8+v4TL+zKIkv0o4s2mlHFuJ4xrDZJuD1I9UrpPHtdS28wMRp8ki7uUJBD3KnZWwdvQoJh9zTOffxTvBcyrOPQyQbYaLCqHy1s4zaXufZ91RvNP5NRwxTc0BtAuVOCqIWqgyeAZlEd3qeDtDwKITtuf1fpsVP+2kwHtOSdfuXqq/icZgd4Q5xzCeLMTHCFU9X+mH/FhbTh67hxAFfolcufXMe46+2vH8GxaOZMybE1lM4dhxRa0jQaNzzCjakR9qUd9aqJqD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5SPR00MB111.namprd12.prod.outlook.com (10.174.247.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 09:00:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 09:00:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v2)
Thread-Topic: [PATCH 3/4] drm/amdgpu: Determing PTE flags separately for each
 mapping (v2)
Thread-Index: AQHVXGL/v9DSW9Pw00GIWG9VAy5GOqcOsuaA
Date: Tue, 27 Aug 2019 09:00:19 +0000
Message-ID: <0bf604b8-0091-9cc7-fbac-44cb0485729e@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
 <20190826230355.25007-3-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-3-Felix.Kuehling@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::35) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 628e8ced-9e07-4458-f4a4-08d72accfc38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5SPR00MB111; 
x-ms-traffictypediagnostic: DM5SPR00MB111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR00MB111F7B97AB2FC199330FB4E83A00@DM5SPR00MB111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(71200400001)(71190400001)(6512007)(2501003)(58126008)(8936002)(52116002)(66446008)(66946007)(64756008)(66556008)(66476007)(110136005)(65956001)(65806001)(305945005)(316002)(53936002)(14454004)(8676002)(81156014)(81166006)(36756003)(46003)(478600001)(6246003)(446003)(256004)(76176011)(14444005)(25786009)(102836004)(486006)(66574012)(86362001)(31696002)(11346002)(7736002)(6436002)(5660300002)(4326008)(6486002)(386003)(6506007)(31686004)(6116002)(229853002)(2906002)(186003)(476003)(99286004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR00MB111;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cLGaCgMbI94jIQgPu1hORm55hfo4cIXpd3+QzKoxr9Yk9GyzvBQarOOI/dbu5hurUn0VmWHcyi21RolhkCs8RjEIysaF76pCGS1GcBMrbLjLgHDAfBcHb81Ts1I5tOlUMpqEgxpyuxqy48YL2qRUY5DAldI/X+semyhnxuzey4aWMiRRT78kXU81RnNy4Wdf7P8lx17dWZ9vXA9fP83xU7MFeqLPHGb0TDsackh31hQAeqmnZi2o9p92ll3UgDEICJzfR04+xLd8LB2cJMZf9jvV3WrouGoaK66TCZtkm6oIzjIOZynwpwGPFnlWwhRvEQW60/GLsUqCVrzusdjnN6Q2S/lhWtWuZ2LozEQyUWgaIMhNog9ws5LXkvwkjFAP2T40bCgaxYefvCHCiC2KCOCqGXrwUq2tiZmJedk2xas=
Content-ID: <1F0C7D299F9E9341A730F3EE15588C59@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628e8ced-9e07-4458-f4a4-08d72accfc38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 09:00:19.1739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBWvfRigT3qOhLjKCnsUNtLb9W4FIVMdrZrs0yBLs+Whzb7r6F8qqPQqomIPmk4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfjv1Uba8QtyrX9tQSvjqpFclS8dna0+gBpD1Pb5ipw=;
 b=AevFVeMjebjhs+oJCVGJsdokmMvf+StGswYyzjKN+IWyFAF2r6REqXGKm4ahDpQyiW/QWP3TVQWKu7ONe4N6mXTmBOLgb9hWHFYIiL+fBLv5PLYMm2TKgcfSYvZAUEjrT/jGNR94ScVIJte1ChNuVBrW453jXn0ldPBWtFumMAM=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDguMTkgdW0gMDE6MDcgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IFRoZSBzYW1l
IEJPIGNhbiBiZSBtYXBwZWQgd2l0aCBkaWZmZXJlbnQgUFRFIGZsYWdzIGJ5IGRpZmZlcmVudCBH
UFVzLg0KPiBUaGVyZWZvcmUgZGV0ZXJtaW5lIHRoZSBQVEUgZmxhZ3Mgc2VwYXJhdGVseSBmb3Ig
ZWFjaCBtYXBwaW5nIGluc3RlYWQNCj4gb2Ygc3RvcmluZyB0aGVtIGluIHRoZSBLRkQgYnVmZmVy
IG9iamVjdC4NCj4NCj4gQWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGRldGVybWluZSB0aGUgUFRF
IGZsYWdzIHRvIGJlIGV4dGVuZGVkIHdpdGgNCj4gQVNJQyBhbmQgbWVtb3J5LXR5cGUtc3BlY2lm
aWMgbG9naWMgaW4gc3Vic2VxdWVudCBjb21taXRzLg0KPg0KPiB2MjogU3BsaXQgQXJjdHVydXMt
c3BlY2lmaWMgTVRZUEUgY2hhbmdlcyBpbnRvIHNlcGFyYXRlIGNvbW1pdA0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KQWNrZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggICAgfCAgMiAr
LQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDM5
ICsrKysrKysrKysrLS0tLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMo
KyksIDE3IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oDQo+IGluZGV4IGU1MTlkZjNmZDJiNi4uMWFmOGY4M2Y3ZTAyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+IEBAIC01Nyw3
ICs1Nyw3IEBAIHN0cnVjdCBrZ2RfbWVtIHsNCj4gICAJdW5zaWduZWQgaW50IG1hcHBlZF90b19n
cHVfbWVtb3J5Ow0KPiAgIAl1aW50NjRfdCB2YTsNCj4gICANCj4gLQl1aW50MzJfdCBtYXBwaW5n
X2ZsYWdzOw0KPiArCXVpbnQzMl90IGFsbG9jX2ZsYWdzOw0KPiAgIA0KPiAgIAlhdG9taWNfdCBp
bnZhbGlkOw0KPiAgIAlzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
DQo+IGluZGV4IDQ0YTUyYjA5Y2M1OC4uMWI3MzQwYTE4ZjY3IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+IEBAIC0zNTUs
NiArMzU1LDIzIEBAIHN0YXRpYyBpbnQgdm1fdXBkYXRlX3BkcyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwgc3RydWN0IGFtZGdwdV9zeW5jICpzeW5jKQ0KPiAgIAlyZXR1cm4gYW1kZ3B1X3N5bmNfZmVu
Y2UoTlVMTCwgc3luYywgdm0tPmxhc3RfdXBkYXRlLCBmYWxzZSk7DQo+ICAgfQ0KPiAgIA0KPiAr
c3RhdGljIHVpbnQzMl90IGdldF9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHN0cnVjdCBrZ2RfbWVtICptZW0pDQo+ICt7DQo+ICsJYm9vbCBjb2hlcmVudCA9IG1lbS0+YWxs
b2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfQ09IRVJFTlQ7DQo+ICsJdWludDMyX3QgbWFwcGlu
Z19mbGFnczsNCj4gKw0KPiArCW1hcHBpbmdfZmxhZ3MgPSBBTURHUFVfVk1fUEFHRV9SRUFEQUJM
RTsNCj4gKwlpZiAobWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19XUklUQUJMRSkN
Cj4gKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9XUklURUFCTEU7DQo+ICsJaWYg
KG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4gKwkJbWFw
cGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9FWEVDVVRBQkxFOw0KPiArDQo+ICsJbWFwcGlu
Z19mbGFncyB8PSBjb2hlcmVudCA/DQo+ICsJCUFNREdQVV9WTV9NVFlQRV9VQyA6IEFNREdQVV9W
TV9NVFlQRV9OQzsNCj4gKw0KPiArCXJldHVybiBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3MoYWRl
diwgbWFwcGluZ19mbGFncyk7DQo+ICt9DQo+ICsNCj4gICAvKiBhZGRfYm9fdG9fdm0gLSBBZGQg
YSBCTyB0byBhIFZNDQo+ICAgICoNCj4gICAgKiBFdmVyeXRoaW5nIHRoYXQgbmVlZHMgdG8gYm8g
ZG9uZSBvbmx5IG9uY2Ugd2hlbiBhIEJPIGlzIGZpcnN0IGFkZGVkDQo+IEBAIC00MDMsOCArNDIw
LDcgQEAgc3RhdGljIGludCBhZGRfYm9fdG9fdm0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICAgCX0NCj4gICANCj4gICAJYm9fdmFfZW50cnktPnZh
ID0gdmE7DQo+IC0JYm9fdmFfZW50cnktPnB0ZV9mbGFncyA9IGFtZGdwdV9nbWNfZ2V0X3B0ZV9m
bGFncyhhZGV2LA0KPiAtCQkJCQkJCSBtZW0tPm1hcHBpbmdfZmxhZ3MpOw0KPiArCWJvX3ZhX2Vu
dHJ5LT5wdGVfZmxhZ3MgPSBnZXRfcHRlX2ZsYWdzKGFkZXYsIG1lbSk7DQo+ICAgCWJvX3ZhX2Vu
dHJ5LT5rZ2RfZGV2ID0gKHZvaWQgKilhZGV2Ow0KPiAgIAlsaXN0X2FkZCgmYm9fdmFfZW50cnkt
PmJvX2xpc3QsIGxpc3RfYm9fdmEpOw0KPiAgIA0KPiBAQCAtMTA4MSw3ICsxMDk3LDYgQEAgaW50
IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgNCj4gICAJaW50IGJ5dGVf
YWxpZ247DQo+ICAgCXUzMiBkb21haW4sIGFsbG9jX2RvbWFpbjsNCj4gICAJdTY0IGFsbG9jX2Zs
YWdzOw0KPiAtCXVpbnQzMl90IG1hcHBpbmdfZmxhZ3M7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+
ICAgCS8qDQo+IEBAIC0xMTQzLDE2ICsxMTU4LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1f
YWxsb2NfbWVtb3J5X29mX2dwdSgNCj4gICAJCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdB
TSkgPw0KPiAgIAkJCVZJX0JPX1NJWkVfQUxJR04gOiAxOw0KPiAgIA0KPiAtCW1hcHBpbmdfZmxh
Z3MgPSBBTURHUFVfVk1fUEFHRV9SRUFEQUJMRTsNCj4gLQlpZiAoZmxhZ3MgJiBBTExPQ19NRU1f
RkxBR1NfV1JJVEFCTEUpDQo+IC0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfV1JJ
VEVBQkxFOw0KPiAtCWlmIChmbGFncyAmIEFMTE9DX01FTV9GTEFHU19FWEVDVVRBQkxFKQ0KPiAt
CQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEU7DQo+IC0JaWYgKGZs
YWdzICYgQUxMT0NfTUVNX0ZMQUdTX0NPSEVSRU5UKQ0KPiAtCQltYXBwaW5nX2ZsYWdzIHw9IEFN
REdQVV9WTV9NVFlQRV9VQzsNCj4gLQllbHNlDQo+IC0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BV
X1ZNX01UWVBFX05DOw0KPiAtCSgqbWVtKS0+bWFwcGluZ19mbGFncyA9IG1hcHBpbmdfZmxhZ3M7
DQo+ICsJKCptZW0pLT5hbGxvY19mbGFncyA9IGZsYWdzOw0KPiAgIA0KPiAgIAlhbWRncHVfc3lu
Y19jcmVhdGUoJigqbWVtKS0+c3luYyk7DQo+ICAgDQo+IEBAIC0xNjI1LDkgKzE2MzEsMTAgQEAg
aW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1faW1wb3J0X2RtYWJ1ZihzdHJ1Y3Qga2dkX2RldiAqa2dk
LA0KPiAgIA0KPiAgIAlJTklUX0xJU1RfSEVBRCgmKCptZW0pLT5ib192YV9saXN0KTsNCj4gICAJ
bXV0ZXhfaW5pdCgmKCptZW0pLT5sb2NrKTsNCj4gLQkoKm1lbSktPm1hcHBpbmdfZmxhZ3MgPQ0K
PiAtCQlBTURHUFVfVk1fUEFHRV9SRUFEQUJMRSB8IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRSB8
DQo+IC0JCUFNREdQVV9WTV9QQUdFX0VYRUNVVEFCTEUgfCBBTURHUFVfVk1fTVRZUEVfTkM7DQo+
ICsJKCptZW0pLT5hbGxvY19mbGFncyA9DQo+ICsJCSgoYm8tPnByZWZlcnJlZF9kb21haW5zICYg
QU1ER1BVX0dFTV9ET01BSU5fVlJBTSkgPw0KPiArCQkgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0gOiBB
TExPQ19NRU1fRkxBR1NfR1RUKSB8DQo+ICsJCUFMTE9DX01FTV9GTEFHU19XUklUQUJMRSB8IEFM
TE9DX01FTV9GTEFHU19FWEVDVVRBQkxFOw0KPiAgIA0KPiAgIAkoKm1lbSktPmJvID0gYW1kZ3B1
X2JvX3JlZihibyk7DQo+ICAgCSgqbWVtKS0+dmEgPSB2YTsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
