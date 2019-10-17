Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75995DAE88
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 15:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAAB6E489;
	Thu, 17 Oct 2019 13:36:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3166E489
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 13:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFrgx5hqxkcbmJlg7knsZciKunEIgsCE9HA3vy2RA+QjsS0ps7V7vXbu9o2vQXXaG/2mgsM7GOmzFN1+gRPlT/q3l9QMqGwnIkpdk6AUPbu3APNGPQdUIc8iQw88wHQ+P0F1FAsdleJdsX82ATV0MHufLOYAR2HnY5M1062lVx3ITBjmlB+FQ+91mJZgSqxDq9ZNeW0PRboHhlpU9hmgWM2kOpD224AHjqEXLrZ7PgKE71DoH9agH3Oon0HA2sWiAlY3U10amAyICz1lJ6Dddjo6ahwvJH3Pyy2InWWFXOCHXk2efiGLQ6Ct1jCEphMr5Yr6038wwBc+WVqAjyLQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmGrWoiq48sIqRVXCmq6unj4gUFOPmARQIkQ1RkthgY=;
 b=hi8t82dt/R/1Upeim1PCHcQcnPLC45RPI3xZVWvt34Qvnhe8DTU8xFML/wqvI4MGwur6HSfmQfcCcZwEbtNYJ5Nedl8QhDby524nGIizin/mhzjAE03diJeJ0wX6+0X7pelAakpYsQy3Us5wtw0rPygIgl0a3z4Od/9xy1UsienitCHHf65mX4T3wpMSD39bHQRcR3giJUGPt35l0pEq9phW3AXTiNeY1sAKrXc8TbTWqr1T023ZrzkZaqukxls0OD0v9r1KeR+NwsGDBhQKnb968F7HVqJPDNQc/CCjnMSYFlrRtQ2eEbVACFT9kKOSpgVkryVZbb5LanIGyI/fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3287.namprd12.prod.outlook.com (20.179.93.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 13:36:33 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::5598:12d2:404c:5373%7]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 13:36:33 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Liu, Zhan" <Zhan.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Topic: [PATCH] drm/amd/display: Modify display link stream setup
 sequence.
Thread-Index: AQHVhKHEf7z6O+vtZ0KYLzN3Nfjkz6de1n+A
Date: Thu, 17 Oct 2019 13:36:33 +0000
Message-ID: <123d03bd-3c75-c4ad-522f-1f9c7ddae0a5@amd.com>
References: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB346669D491903EB8D5D671919E6D0@DM6PR12MB3466.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab27fff-3468-4d0c-bd69-08d753070629
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3287:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3287DDDEAACA2A666D7B1509EC6D0@BYAPR12MB3287.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(99286004)(6306002)(305945005)(446003)(36756003)(6436002)(53546011)(3846002)(7736002)(6246003)(6506007)(2616005)(76176011)(52116002)(6116002)(11346002)(5660300002)(6512007)(102836004)(2906002)(186003)(386003)(31686004)(26005)(229853002)(316002)(86362001)(966005)(110136005)(256004)(2501003)(71190400001)(25786009)(6486002)(486006)(81156014)(476003)(66946007)(64756008)(66446008)(66476007)(31696002)(66556008)(81166006)(66066001)(4001150100001)(71200400001)(478600001)(8936002)(14454004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3287;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +PYnIghtkU+fPKhmbuRrO86Ppsr5XycnZpRRjmYZlpexz6Th2E2SBHmBow7AKIa+OrV2TUcFDsq+IKhAkWTii0R7i9oAWD8S/EshnCJ0ik7tpRc5teZfO931vI4Z8ghNREnVYq/fW0JBeclEq40Ux1g7UipGm4p27aY4kzc8tmxzZLCzZ6gmsnzzovvoLVvgU8U/52FvJBXuLMVF7OyuV3K8tcw55e61jvOlXH2VzuNrBpUmzWZeR0ukoNxPiFIuJWRcCqJfEGFjl6I8MoP9j8QiRzAR2JDUkv10IYpeflahHtf2YCyxyouFsPAPQxlnDix/vdv3GS1C5fUOk6bAXIamtdw6P6I0mqNyVlfIN8Yy4lFQL+BF9h5BG58IKi7a8tPhIJeDQKcf0Bykbr6ge8nghyFsmHhYeQRMH4Gj+Dy+zQ4SKgZnpYJAVF+uCQQR999wb5UsD0YpeOaIgEd7eg==
Content-ID: <6EA704C7C43389448F7940B046B226F3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab27fff-3468-4d0c-bd69-08d753070629
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 13:36:33.1908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pksGODkN5JFHa5VvAGKgnXMxWKiUhcgTzOcGdmz/zUpMu8GBSJ7T6Cxr5jOOm2ez6AY5M3P+ok2qqcA2dMgT1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3287
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmGrWoiq48sIqRVXCmq6unj4gUFOPmARQIkQ1RkthgY=;
 b=GDsgyZP7rVqgU83Cb7J5ER2QybWPjfBRFEmVMW1AE9DVYPZ9GEQO7Urr+GOTufWxxXDBS+cX32zRn0EYC2ZndHs9OVE2q1zTlC4hcN8IC8e6rEiKooPQxbWafItinNgGHMgKKhlVgZR7JaiOmwxP9g2DyDdouj1WcHIAbtk8JOU=
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

T24gMjAxOS0xMC0xNyAxMjoyOCBhLm0uLCBMaXUsIFpoYW4gd3JvdGU6DQo+IEZyb206IFpoYW4g
TGl1IDx6aGFuLmxpdUBhbWQuY29tPg0KPiANCj4gW1doeV0NCj4gV2hlbiBhIHNwZWNpZmljIGtp
bmQgb2YgY29ubmVjdG9yIGlzIGRldGVjdGVkLA0KPiBEQyBuZWVkcyB0byBzZXQgdGhlIGF0dHJp
YnV0ZSBvZiB0aGUgc3RyZWFtLg0KPiBUaGlzIHN0ZXAgbmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUg
ZW5hYmxpbmcgbGluaywNCj4gb3Igc29tZSBidWdzIChlLmcuIGRpc3BsYXkgd29uJ3QgbGlnaHQg
dXApDQo+IHdpbGwgYmUgb2JzZXJ2ZWQuDQo+IA0KPiBbSG93XQ0KPiBTZXR0aW5nIHRoZSBhdHRy
aWJ1dGUgb2YgdGhlIHN0cmVhbSBmaXJzdCwgdGhlbg0KPiBlbmFibGluZyBzdHJlYW0uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBaaGFuIExpdSA8emhhbi5saXVAYW1kLmNvbT4NCg0KTkFLOg0KDQox
LiBJdCdzIGRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIHdoYXQgaXNzdWUgdGhpcyBjaGFuZ2UgaXMg
YXR0ZW1wdGluZyB0byANCnNvbHZlIGFuZCB3aHkgaXQgYWN0dWFsbHkgZG9lcyBpdC4gU3BlY2lm
aWNzIHdvdWxkIGhlbHAgaGVyZS4NCg0KMi4gSXQgYWZmZWN0cyBhIGNvbW1vbiBjb2RlIHBhdGgg
Zm9yIGFsbCBBU0lDcyB3aGljaCBoYXMgYmVlbiB0ZXN0ZWQgYW5kIA0Ka25vd24gdG8gYmUgd29y
a2luZyBjb3JyZWN0bHkgZm9yIHRob3NlIHRlc3QgY2FzZXMuDQoNCjMuIFRoZSBkZXNjcmlwdGlv
biBpcyBpbmNvcnJlY3QgLSB0aGUgbGluayBlbmFibGUvc3RyZWFtIGVuYWJsZSB3ZXJlIA0KYm90
aCBwcmV2aW91c2x5IGhhcHBlbmluZyBhZnRlciB0aGUgc3RyZWFtIHNldHVwLiBXaGF0J3MgY2hh
bmdlZCBpbiB0aGUgDQpwYXRjaCBpcyB0aGUgbGluayBlbmFibGUgbm93IGhhcHBlbnMgYmVmb3Jl
IHRoZSBsaW5rIHNldHVwLg0KDQpCb3RoIG9mIHRoZXNlIGNhbGxzIGludGVybmFsbHkgZ28gdGhy
b3VnaCB0aGUgY29tbWFuZCB0YWJsZSB0byBWQklPUyBzbyANCndoYXQgYmVoYXZpb3IgZGlmZmVy
ZW5jZXMgeW91J3JlIHNlZWluZyBtYXkgYmUgY2F1c2VkIGJ5IHRoZSBpbnB1dCANCnBhcmFtZXRl
cnMgdG8gdGhlIEFUT01fRU5DT0RFUl9DTURfU1RSRUFNX1NFVFVQIG9yIA0KVFJBTlNNSVRURVJf
Q09OVFJPTF9FTkFCTEUgY29tbWFuZHMgb3IgdGhlIGFjdHVhbCBleGVjdXRpb24gb2YgdGhvc2Ug
DQpjb21tYW5kcy4NCg0KTmljaG9sYXMgS2F6bGF1c2thcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDIwICsrKysrKysrKy0tLS0t
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
ay5jDQo+IGluZGV4IGZiMTg2ODFiNTAyYi4uNzEzY2FhYjgyODM3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jDQo+IEBAIC0yNzQ1LDE2
ICsyNzQ1LDYgQEAgdm9pZCBjb3JlX2xpbmtfZW5hYmxlX3N0cmVhbSgNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIGRjX2lzX3ZpcnR1YWxfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25h
bCkpDQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiANCj4gLSAgICAgICBpZiAoIWRjX2lz
X3ZpcnR1YWxfc2lnbmFsKHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpIHsNCj4gLSAgICAgICAg
ICAgICAgIHN0cmVhbS0+bGluay0+bGlua19lbmMtPmZ1bmNzLT5zZXR1cCgNCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgc3RyZWFtLT5saW5rLT5saW5rX2VuYywNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKTsNCj4gLSAgICAgICAgICAgICAgIHBp
cGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5zZXR1cF9zdGVyZW9fc3luYygN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2Vu
YywNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmlu
c3QsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHN0cmVhbS0+dGltaW5nLnRpbWluZ18zZF9m
b3JtYXQgIT0gVElNSU5HXzNEX0ZPUk1BVF9OT05FKTsNCj4gLSAgICAgICB9DQo+IC0NCj4gICAg
ICAgICAgaWYgKGRjX2lzX2RwX3NpZ25hbChwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWwpKQ0KPiAg
ICAgICAgICAgICAgICAgIHBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMtPmZ1bmNzLT5k
cF9zZXRfc3RyZWFtX2F0dHJpYnV0ZSgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBpcGVf
Y3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsDQo+IEBAIC0yODQxLDYgKzI4MzEsMTYgQEAgdm9p
ZCBjb3JlX2xpbmtfZW5hYmxlX3N0cmVhbSgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDT05UUk9MTEVSX0RQX1RFU1RfUEFUVEVSTl9WSURFT01PREUsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ09MT1JfREVQVEhfVU5ERUZJ
TkVEKTsNCj4gDQo+ICsgICAgICAgICAgICAgICBpZiAoIWRjX2lzX3ZpcnR1YWxfc2lnbmFsKHBp
cGVfY3R4LT5zdHJlYW0tPnNpZ25hbCkpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Ry
ZWFtLT5saW5rLT5saW5rX2VuYy0+ZnVuY3MtPnNldHVwKA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cmVhbS0+bGluay0+bGlua19lbmMsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKTsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYy0+ZnVuY3MtPnNldHVw
X3N0ZXJlb19zeW5jKA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpcGVfY3R4
LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmluc3QsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RyZWFtLT50aW1pbmcudGltaW5nXzNkX2Zvcm1hdCAhPSBUSU1JTkdfM0Rf
Rk9STUFUX05PTkUpOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArDQo+ICAgI2lmZGVmIENPTkZJ
R19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUDQo+ICAgICAgICAgICAgICAgICAgaWYgKHBpcGVfY3R4
LT5zdHJlYW0tPnRpbWluZy5mbGFncy5EU0MpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChkY19pc19kcF9zaWduYWwocGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKSB8fA0KPiAtLQ0K
PiAyLjE3LjENCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
