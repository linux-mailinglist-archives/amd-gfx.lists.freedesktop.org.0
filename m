Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EACA1011
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B16989F31;
	Thu, 29 Aug 2019 03:53:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720062.outbound.protection.outlook.com [40.107.72.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244FD89F31
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axm7W/xXO/NHPfdADkSH112ZeB/bUtH9gXV37oHN+d1ZBUy8q01cAAPfVAKkYbX3471xwWdkdRQWCNFyXS72XDeq3Ie9dPketrTMWm2M8LoOUzyRs8ouXdaWonJVZRsZOGtbdsWf/Up7+ozKrTKE/6g31APfxO5bqvNDQefDIxmTMhk5YIrCdfIHwg+l+LFdPrOIawuVeOYPJW1rO8j2/2sxZuaslcS8yvKXUVU3HWZ1fFGepBw3lR1kHHHzUoBcEb+czfFyxy+zZQccMz1f5ITxRF1mKXei39e+hsMGnuXNVWOeaaq0WZ9rIQ8FA+lzpP/XUvh/+jMfqAHZ+sZaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUlhAjkxDRdah0lvGo5otcb79mFB3m9/ZlPEn25MgEw=;
 b=Z/3LdUNIM26iqJRIvYmxFF1YfteEcIwlup/U/k++6ApwsgokBVagQo2zrQkj3H5R6u/fh6vP6SKW8TrmPbpk8E8UEmmVA9vu82lYxlBPvTQCgenDHPTy0iKb3XtXS6hUypt/GEAXZGRxN1p+NMAGIbyvSg2Ox3mPjOThvOqMAErfELuyn+o7Hm9EEce5GdTWV6cpzrBH+OJrMtWXEtnWzpbV8SaEaUkcmwzdtPUKmNXPctAnmO4hRvQUbTJtkt9VjHLfykBjBYzRbZpqL+Q2T95/E99filXVM7CQbjsf1VgaTKq5NlJHUhgNUHIx74y6A/6oxt1VoinIN29+bVCsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3231.namprd12.prod.outlook.com (20.179.83.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 03:53:23 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:53:23 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
Thread-Topic: [PATCH 5/7] drm/amdgpu: add mmhub ras_late_init callback function
Thread-Index: AQHVXaEHl+sHxLs4EEGDQd7lEUd0y6cRezaggAAD6hA=
Date: Thu, 29 Aug 2019 03:53:23 +0000
Message-ID: <MN2PR12MB30549416607B743EA133D7DBB0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>
 <1566997395-7185-5-git-send-email-Hawking.Zhang@amd.com>
 <MN2PR12MB3054E5F6FC389201F8C841A1B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054E5F6FC389201F8C841A1B0A20@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b17457b4-34ab-4c6a-93bd-08d72c3470d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3231; 
x-ms-traffictypediagnostic: MN2PR12MB3231:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3231BC3A02FA94E893C0A4A9B0A20@MN2PR12MB3231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(13464003)(189003)(199004)(5660300002)(305945005)(3846002)(6116002)(53546011)(6506007)(476003)(53936002)(74316002)(33656002)(71190400001)(6636002)(6246003)(71200400001)(25786009)(14454004)(52536014)(11346002)(9686003)(446003)(6306002)(55016002)(6436002)(86362001)(4326008)(478600001)(7736002)(76176011)(76116006)(256004)(26005)(102836004)(81166006)(486006)(2940100002)(8676002)(81156014)(66556008)(110136005)(64756008)(7696005)(66446008)(66476007)(316002)(66946007)(8936002)(99286004)(966005)(229853002)(66066001)(2501003)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3231;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pk3Cs/pBPgfxFmkvULrW9zJuhEZLheO+XmAX0j9zYNU+S/G90G7158RRflDJvHRrc0sZSaealEGnkyAWrvQBfi4i34+B42vC2cZhFc1ZxzVD7XdjblRU38WZZYz8aACTYvTTW1Q72QiDiZ16IKdOxdAOucHpqmB8t2yvZsepKOM+gJx9mb+dmT3TVelX64X6syGcGkQ3yNdR0H7EG9Y8PaRXg2yUWG26FNMUBMepkBMGO+yYrPGivzzmbNpPANga0DJKppDmb5TMWkzsCf3M0innJGjmOCf9XN90XooPP+KXeNBCDfvBnoHvi6lPsCGinSLscH2YH4XJ3ntRz7NGXw3k9rdThwNFIHMq8qgK83wDQvtipEICLP7yajr3Pcp3UJnJL6eCT8WyDaEnNIVdI75SL/GSmdz3nFg61gZEhpQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17457b4-34ab-4c6a-93bd-08d72c3470d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:53:23.8216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGkCW/bjg89+CKGp2YK2U0Jn6L90l9XbioGQlR4YAfIXu4y20RjrseAOYBlpDiZj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUlhAjkxDRdah0lvGo5otcb79mFB3m9/ZlPEn25MgEw=;
 b=ldnN5FOJ8kEVEqF34CqscWGeKV/DtKFhx9py7Dh7mYnmaWFs/wdmPeRj+qvTd+rMDknJmp9/clx4Oxqqhsmla36NCCTb/zN3VvTMdYf9Yi7KCRXe1WsYBHqR0Nme4apg5MFGYDCSRr91J6NiQ0B2/jJHrsOZse7huFW7BUta6+0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FuIHdlIGFsc28gYWRkIGEgcmFzX2xhdGVfaW5pdCBmb3IgdW1jPw0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBaaG91MSwgVGFvDQo+IFNlbnQ6IDIwMTnl
ubQ45pyIMjnml6UgMTE6NDENCj4gVG86IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERldWNoZXIsIEFsZXhh
bmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFpoYW5nLCBIYXdraW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggNS83XSBkcm0v
YW1kZ3B1OiBhZGQgbW1odWIgcmFzX2xhdGVfaW5pdCBjYWxsYmFjaw0KPiBmdW5jdGlvbg0KPiAN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiA+IFNlbnQ6IDIwMTnlubQ45pyIMjjm
l6UgMjE6MDMNCj4gPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPjsNCj4gPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+DQo+ID4gQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIIDUvN10gZHJtL2FtZGdwdTogYWRkIG1taHVi
IHJhc19sYXRlX2luaXQgY2FsbGJhY2sNCj4gPiBmdW5jdGlvbg0KPiA+DQo+ID4gVGhlIGZ1bmN0
aW9uIHdpbGwgYmUgY2FsbGVkIGluIGxhdGUgaW5pdCBwaGFzZSB0byBkbyBtbWh1YiByYXMgaW5p
dA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
bW1odWIuaCB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyAgICAgfCAyMSArKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbW1odWJfdjFfMC5jICAgfCAyOA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfbW1odWIuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21t
aHViLmgNCj4gPiBpbmRleCAyZDc1ZWNmLi5kZjA0YzcxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmgNCj4gPiBAQCAtMjMsNiArMjMsNyBAQA0K
PiA+DQo+ID4gIHN0cnVjdCBhbWRncHVfbW1odWJfZnVuY3Mgew0KPiA+ICAJdm9pZCAoKnJhc19p
bml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ID4gKwlpbnQgKCpyYXNfbGF0ZV9p
bml0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ID4gIAl2b2lkICgqcXVlcnlfcmFz
X2Vycm9yX2NvdW50KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAgCQkJCQl2b2lk
ICpyYXNfZXJyb3Jfc3RhdHVzKTsNCj4gPiAgfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiA+IGluZGV4IDhkYzEzZDIuLjI2YTY5NTYgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gPiBAQCAtNzYyLDcgKzc2Miw2
IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpICB7DQo+
ID4gIAlpbnQgcjsNCj4gPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBh
bWRncHVfZGV2aWNlICopaGFuZGxlOw0KPiA+IC0Jc3RydWN0IHJhc19paF9pZiBtbWh1Yl9paF9p
bmZvOw0KPiA+ICAJc3RydWN0IHJhc19mc19pZiB1bWNfZnNfaW5mbyA9IHsNCj4gPiAgCQkuc3lz
ZnNfbmFtZSA9ICJ1bWNfZXJyX2NvdW50IiwNCj4gPiAgCQkuZGVidWdmc19uYW1lID0gInVtY19l
cnJfaW5qZWN0IiwNCj4gPiBAQCAtNzcwLDEwICs3NjksNiBAQCBzdGF0aWMgaW50IGdtY192OV8w
X2VjY19sYXRlX2luaXQodm9pZCAqaGFuZGxlKQ0KPiA+ICAJc3RydWN0IHJhc19paF9pZiB1bWNf
aWhfaW5mbyA9IHsNCj4gPiAgCQkuY2IgPSBnbWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiLA0K
PiA+ICAJfTsNCj4gPiAtCXN0cnVjdCByYXNfZnNfaWYgbW1odWJfZnNfaW5mbyA9IHsNCj4gPiAt
CQkuc3lzZnNfbmFtZSA9ICJtbWh1Yl9lcnJfY291bnQiLA0KPiA+IC0JCS5kZWJ1Z2ZzX25hbWUg
PSAibW1odWJfZXJyX2luamVjdCIsDQo+ID4gLQl9Ow0KPiA+DQo+ID4gIAlpZiAoIWFkZXYtPmdt
Yy51bWNfcmFzX2lmKSB7DQo+ID4gIAkJYWRldi0+Z21jLnVtY19yYXNfaWYgPSBrbWFsbG9jKHNp
emVvZihzdHJ1Y3QNCj4gcmFzX2NvbW1vbl9pZiksDQo+ID4gR0ZQX0tFUk5FTCk7IEBAIC03OTcs
MjUgKzc5MiwxMyBAQCBzdGF0aWMgaW50DQo+ID4gZ21jX3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lk
ICpoYW5kbGUpDQo+ID4gIAkJCWdvdG8gZnJlZTsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JaWYgKCFh
ZGV2LT5nbWMubW1odWJfcmFzX2lmKSB7DQo+ID4gLQkJYWRldi0+Z21jLm1taHViX3Jhc19pZiA9
IGttYWxsb2Moc2l6ZW9mKHN0cnVjdA0KPiA+IHJhc19jb21tb25faWYpLCBHRlBfS0VSTkVMKTsN
Cj4gPiAtCQlpZiAoIWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYpDQo+ID4gLQkJCXJldHVybiAtRU5P
TUVNOw0KPiA+IC0JCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPmJsb2NrID0NCj4gPiBBTURHUFVf
UkFTX0JMT0NLX19NTUhVQjsNCj4gPiAtCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmLT50eXBlID0N
Cj4gPiBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOw0KPiA+IC0JCWFkZXYt
PmdtYy5tbWh1Yl9yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7DQo+ID4gLQkJc3RyY3B5KGFk
ZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPm5hbWUsICJtbWh1YiIpOw0KPiA+IC0JfQ0KPiA+IC0JbW1o
dWJfaWhfaW5mby5oZWFkID0gbW1odWJfZnNfaW5mby5oZWFkID0gKmFkZXYtDQo+ID4gPmdtYy5t
bWh1Yl9yYXNfaWY7DQo+ID4gLQlyID0gYW1kZ3B1X3Jhc19sYXRlX2luaXQoYWRldiwgYWRldi0+
Z21jLm1taHViX3Jhc19pZiwNCj4gPiAtCQkJCSAmbW1odWJfZnNfaW5mbywgJm1taHViX2loX2lu
Zm8pOw0KPiA+ICsJciA9IGFkZXYtPm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KGFkZXYpOw0K
PiBbVGFvXSBJdCdzIGJldHRlciB0byBhZGQgImlmIChhZGV2LT5tbWh1Yl9mdW5jcy0+cmFzX2xh
dGVfaW5pdChhZGV2KSkiDQo+IA0KPiA+ICAJaWYgKHIpDQo+ID4gLQkJZ290byBmcmVlOw0KPiA+
ICsJCXJldHVybiByOw0KPiA+DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgZnJlZToNCj4gPiAgCWtm
cmVlKGFkZXYtPmdtYy51bWNfcmFzX2lmKTsNCj4gPiAtCWtmcmVlKGFkZXYtPmdtYy5tbWh1Yl9y
YXNfaWYpOw0KPiA+ICAJcmV0dXJuIHI7DQo+ID4gIH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92MV8wLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L21taHViX3YxXzAuYw0KPiA+IGluZGV4IDA0Y2Q0YjYuLjlmN2Q1ZDEg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjFfMC5jDQo+ID4g
QEAgLTMxLDYgKzMxLDcgQEANCj4gPiAgI2luY2x1ZGUgInZlZ2ExMF9lbnVtLmgiDQo+ID4NCj4g
PiAgI2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIg0KPiA+ICsjaW5jbHVkZSAiYW1kZ3B1X3Jhcy5o
Ig0KPiA+DQo+ID4gICNkZWZpbmUgbW1EQUdCMF9DTlRMX01JU0MyX1JWIDB4MDA4Zg0KPiA+ICAj
ZGVmaW5lIG1tREFHQjBfQ05UTF9NSVNDMl9SVl9CQVNFX0lEWCAwIEBAIC02MTUsNiArNjE2LDMz
IEBADQo+IHN0YXRpYw0KPiA+IHZvaWQgbW1odWJfdjFfMF9xdWVyeV9yYXNfZXJyb3JfY291bnQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gIAl9DQo+ID4gIH0NCj4gPg0KPiA+ICtz
dGF0aWMgaW50IG1taHViX3YxXzBfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikgew0KPiA+ICsJaW50IHI7DQo+ID4gKwlzdHJ1Y3QgcmFzX2loX2lmIG1taHViX2loX2lu
Zm87DQo+ID4gKwlzdHJ1Y3QgcmFzX2ZzX2lmIG1taHViX2ZzX2luZm8gPSB7DQo+ID4gKwkJLnN5
c2ZzX25hbWUgPSAibW1odWJfZXJyX2NvdW50IiwNCj4gPiArCQkuZGVidWdmc19uYW1lID0gIm1t
aHViX2Vycl9pbmplY3QiLA0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlpZiAoIWFkZXYtPmdtYy5t
bWh1Yl9yYXNfaWYpIHsNCj4gPiArCQlhZGV2LT5nbWMubW1odWJfcmFzX2lmID0ga21hbGxvYyhz
aXplb2Yoc3RydWN0DQo+ID4gcmFzX2NvbW1vbl9pZiksIEdGUF9LRVJORUwpOw0KPiA+ICsJCWlm
ICghYWRldi0+Z21jLm1taHViX3Jhc19pZikNCj4gPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ID4g
KwkJYWRldi0+Z21jLm1taHViX3Jhc19pZi0+YmxvY2sgPQ0KPiA+IEFNREdQVV9SQVNfQkxPQ0tf
X01NSFVCOw0KPiA+ICsJCWFkZXYtPmdtYy5tbWh1Yl9yYXNfaWYtPnR5cGUgPQ0KPiA+IEFNREdQ
VV9SQVNfRVJST1JfX01VTFRJX1VOQ09SUkVDVEFCTEU7DQo+ID4gKwkJYWRldi0+Z21jLm1taHVi
X3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsNCj4gPiArCQlzdHJjcHkoYWRldi0+Z21jLm1t
aHViX3Jhc19pZi0+bmFtZSwgIm1taHViIik7DQo+ID4gKwl9DQo+ID4gKwltbWh1Yl9paF9pbmZv
LmhlYWQgPSBtbWh1Yl9mc19pbmZvLmhlYWQgPSAqYWRldi0NCj4gPiA+Z21jLm1taHViX3Jhc19p
ZjsNCj4gPiArCXIgPSBhbWRncHVfcmFzX2xhdGVfaW5pdChhZGV2LCBhZGV2LT5nbWMubW1odWJf
cmFzX2lmLA0KPiA+ICsJCQkJICZtbWh1Yl9mc19pbmZvLCAmbW1odWJfaWhfaW5mbyk7DQo+ID4g
KwlpZiAocikNCj4gPiArCQlrZnJlZShhZGV2LT5nbWMubW1odWJfcmFzX2lmKTsNCj4gPiArCXJl
dHVybiByOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBjb25zdCBzdHJ1Y3QgYW1kZ3B1X21taHViX2Z1
bmNzIG1taHViX3YxXzBfZnVuY3MgPSB7DQo+ID4gKwkucmFzX2xhdGVfaW5pdCA9IG1taHViX3Yx
XzBfcmFzX2xhdGVfaW5pdCwNCj4gPiAgCS5xdWVyeV9yYXNfZXJyb3JfY291bnQgPSBtbWh1Yl92
MV8wX3F1ZXJ5X3Jhc19lcnJvcl9jb3VudCwgIH07DQo+ID4gLS0NCj4gPiAyLjcuNA0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
