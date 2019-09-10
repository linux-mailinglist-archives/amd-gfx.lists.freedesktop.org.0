Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657EAEA37
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 14:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6986E062;
	Tue, 10 Sep 2019 12:22:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84296E062
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 12:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEgoTwxOaLZKdhLajXbsZuVAtMPG/U2F9yAx/4m0zVkqjNAvHdC3+gLnEbn/a5xikMaUF6x89KWQ+XKwjc69aIf6YT3PgvnRhUeEQy7WLoWHVmJYuwjm/tKjKY/qvXlCjcUYw6WGYIlkG1hrUmHMv+ic8acr+euXBqu8B5DuH1Eshr9nemhM5/e5aaQube/bjVLMaGr7Qj3Z1Fq4L8666B76A7u1IzwuNocmD6bu/9Us4eebaL+xLweBk8PNJyMHJrI+5dj2wx3oVw6JfsJU3jUXHQaDj1OejK12cYzrtCFyo0JADHLUUJ8gooGGC+n569/ekI0NDBkqK+ucaIuomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/7VQBih5hwseU85JtETr6Tu45MY25rqKILqcefpsNs=;
 b=g8dA8KYmgGLD+1x+q2kK4aqQVa17cTRawH5vgfniTLk7lysnbYUrag6MQCGqv4WlaZGMNhw6L5JI7Mcuz3omdeCtgcjXH9x33VwzGDfAttr8XbaNo5UMKDzR7wzDYXir4X9VcTVc0JnKKPw+l+/yuWKKwDT0HvgwCbPFjkljAIYuTbVrzT1YwiL5ewTCkw6QjQpGFk48VfL0N7if7LGqebQTDDxEgrju8cC5wRFS5wNra1GEm+XX3oFtjcuj7IWHZyiX8eGqKxh9hePgw4mdYH0d0gk0Tt2PqGQBJAG6Q8Z81kUCwHdAaW0S/0JKrzroPruSVdTm62EEU2JJbNTUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB4064.namprd12.prod.outlook.com (52.135.48.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 12:22:13 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::79c0:d856:da12:c4b2%2]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 12:22:13 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>
Subject: Re: [PATCH] drm/amdgpu: grab the id mgr lock while accessing
 passid_mapping
Thread-Topic: [PATCH] drm/amdgpu: grab the id mgr lock while accessing
 passid_mapping
Thread-Index: AQHVZwYEZSM6Y/TXqU6iwlgXFK+nZacknR6AgAA5h4A=
Date: Tue, 10 Sep 2019 12:22:12 +0000
Message-ID: <a46edabb-d6c4-e6c2-2d1b-3b9fec296eae@amd.com>
References: <20190909115908.43755-1-christian.koenig@amd.com>
 <65fe177d-e9fb-3eeb-b77a-479c92dcae6d@gmail.com>
In-Reply-To: <65fe177d-e9fb-3eeb-b77a-479c92dcae6d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0047.APCP153.PROD.OUTLOOK.COM (52.133.155.35) To
 MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [101.87.176.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdb75137-304d-43c2-4b5a-08d735e98225
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4064; 
x-ms-traffictypediagnostic: MN2PR12MB4064:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB406419032E33BC8DD67FBA7DB4B60@MN2PR12MB4064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(446003)(66066001)(26005)(110136005)(476003)(386003)(81156014)(81166006)(25786009)(66446008)(71200400001)(71190400001)(7736002)(14454004)(66946007)(6116002)(66556008)(64756008)(2906002)(486006)(6506007)(8936002)(3846002)(256004)(14444005)(305945005)(66574012)(36756003)(52116002)(31696002)(2616005)(6246003)(76176011)(6306002)(5660300002)(8676002)(31686004)(66476007)(11346002)(478600001)(6512007)(316002)(966005)(186003)(99286004)(6436002)(2501003)(6636002)(229853002)(53936002)(6486002)(102836004)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4064;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CTscLpJZh60Neo4Wk/fgoMn1/u31+2SK6m/+zkGyatDGcdLPIf3UFSW6ohrfD6/ysTPuXgbmYJo5nqgytv686wE0iwMxKX162+Ql59NDJiQSUP79TcEnGSVXNnG5NbupmofJfg/Kv/z6YJqZOQmrDULZCYX1qlOLg1nke4s6rrNA57pLA6jyr+/+HQ0UjFMCoGobRVHQ7h9di4yTgSTwjYgM9C3Dm3b+UTYF36L2677Lav+fU4r4LEDzjgYZFBkX7YlAU7+n/LYfO1sWnUk6hfijYEjdYraKQOzUiyMo6HsWLInr/lokmq9wkod85/+O+Uc1ZGVMZvAL7+FbmShombw/UiO1Sp7/zLcMztL+5ZoGDz47tyZsq1euyGT0tLuVFXG1AXMZeb2UrSNfZfolbGC6FQEIsdfxpyXWlKjP+dM=
Content-ID: <1D8FEF3A300A1A46B5A6CFDD4588DEEF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb75137-304d-43c2-4b5a-08d735e98225
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 12:22:12.6457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3oDYKDr77f5lC+haZQwI0cNaxPMoja9PzRGoq7yOVxa6SPK4Fe4PiestuUnU7l5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/7VQBih5hwseU85JtETr6Tu45MY25rqKILqcefpsNs=;
 b=auPXlZOZUu5+XYdRrP54NL1jQmpPruf31nVT0HVBbIT9jjQwNNFMaWEdS8iTx7JIqvTDb+JaTfpCOjtrp9u1n7uEQrbJslhSEp3cyUhB72H0a+TPGO4ENgkv4maLwypih3p5XPVMBR9yXFseEmZaesRR7+oQt6JaBoVWQkW/xTE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

UmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+DQoNCuWcqCAy
MDE5LzkvMTAgMTY6NTYsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOg0KPiBQaW5nIQ0KPg0KPiBB
bSAwOS4wOS4xOSB1bSAxMzo1OSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+PiBOZWVkIHRv
IG1ha2Ugc3VyZSB0aGF0IHdlIGFjdHVhbGx5IGRyb3BwaW5nIHRoZSByaWdodCBmZW5jZS4NCj4+
IENvdWxkIGJlIGRvbmUgd2l0aCBSQ1UgYXMgd2VsbCwgYnV0IHRvIGNvbXBsaWNhdGVkIGZvciBh
IGZpeC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jIHwgMTIgKysrKysrKysrLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4+IGluZGV4IGIyODVhYjI1MTQ2ZC4uZTExNzY0MTY0Y2Jm
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+PiBAQCAt
MTAzNiwxMCArMTAzNiw4IEBAIGludCBhbWRncHVfdm1fZmx1c2goc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLCANCj4+IHN0cnVjdCBhbWRncHVfam9iICpqb2IsIGJvb2wgbmVlZF8NCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBpZC0+b2FfYmFzZSAhPSBqb2ItPm9hX2Jhc2UgfHwNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZC0+b2Ffc2l6ZSAhPSBqb2ItPm9hX3NpemUpOw0KPj4gwqDCoMKgwqDCoCBi
b29sIHZtX2ZsdXNoX25lZWRlZCA9IGpvYi0+dm1fbmVlZHNfZmx1c2g7DQo+PiAtwqDCoMKgIGJv
b2wgcGFzaWRfbWFwcGluZ19uZWVkZWQgPSBpZC0+cGFzaWQgIT0gam9iLT5wYXNpZCB8fA0KPj4g
LcKgwqDCoMKgwqDCoMKgICFpZC0+cGFzaWRfbWFwcGluZyB8fA0KPj4gLcKgwqDCoMKgwqDCoMKg
ICFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoaWQtPnBhc2lkX21hcHBpbmcpOw0KPj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IE5VTEw7DQo+PiArwqDCoMKgIGJvb2wgcGFzaWRf
bWFwcGluZ19uZWVkZWQ7DQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIHBhdGNoX29mZnNldCA9IDA7
DQo+PiDCoMKgwqDCoMKgIGludCByOw0KPj4gwqAgQEAgLTEwNDksNiArMTA0NywxMiBAQCBpbnQg
YW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyANCj4+ICpyaW5nLCBzdHJ1Y3QgYW1k
Z3B1X2pvYiAqam9iLCBib29sIG5lZWRfDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGFzaWRfbWFw
cGluZ19uZWVkZWQgPSB0cnVlOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCArwqDCoMKgIG11dGV4
X2xvY2soJmlkX21nci0+bG9jayk7DQo+PiArwqDCoMKgIGlmIChpZC0+cGFzaWQgIT0gam9iLT5w
YXNpZCB8fCAhaWQtPnBhc2lkX21hcHBpbmcgfHwNCj4+ICvCoMKgwqDCoMKgwqDCoCAhZG1hX2Zl
bmNlX2lzX3NpZ25hbGVkKGlkLT5wYXNpZF9tYXBwaW5nKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCBw
YXNpZF9tYXBwaW5nX25lZWRlZCA9IHRydWU7DQo+PiArwqDCoMKgIG11dGV4X3VubG9jaygmaWRf
bWdyLT5sb2NrKTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgZ2RzX3N3aXRjaF9uZWVkZWQgJj0gISFy
aW5nLT5mdW5jcy0+ZW1pdF9nZHNfc3dpdGNoOw0KPj4gwqDCoMKgwqDCoCB2bV9mbHVzaF9uZWVk
ZWQgJj0gISFyaW5nLT5mdW5jcy0+ZW1pdF92bV9mbHVzaCAmJg0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgam9iLT52bV9wZF9hZGRyICE9IEFNREdQVV9CT19JTlZBTElEX09GRlNFVDsN
Cj4+IEBAIC0xMDg4LDkgKzEwOTIsMTEgQEAgaW50IGFtZGdwdV92bV9mbHVzaChzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIA0KPj4gc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkXw0K
Pj4gwqDCoMKgwqDCoCB9DQo+PiDCoCDCoMKgwqDCoMKgIGlmIChwYXNpZF9tYXBwaW5nX25lZWRl
ZCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmlkX21nci0+bG9jayk7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgaWQtPnBhc2lkID0gam9iLT5wYXNpZDsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBkbWFfZmVuY2VfcHV0KGlkLT5wYXNpZF9tYXBwaW5nKTsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZC0+cGFzaWRfbWFwcGluZyA9IGRtYV9mZW5jZV9nZXQoZmVuY2UpOw0KPj4gK8Kg
wqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmaWRfbWdyLT5sb2NrKTsNCj4+IMKgwqDCoMKgwqAg
fQ0KPj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsNCj4NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
