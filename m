Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231781041
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 04:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BB89DC9;
	Mon,  5 Aug 2019 02:25:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750043.outbound.protection.outlook.com [40.107.75.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5689DC9
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 02:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2huGcgFS7ix2A8MdzwtEVOUkKdEaJA4yAvlP3F+HvmmpjLGlBZbk5lz+RCs+dXTJqgcPyGPqVLjPYE4UlQ4jXVZVaWJnqbg1XxrhaAyrvFblCGM9R4S0CNyg8kPY6/DcR6o3du8mR3KUZlP7dey24Zu0JqJRwnH1nJDudO2AzS4l4UpwBovm72DwF1ZdZbe9neKZ6jMrFwa6XO9yYfyNZfyeHFyX32TW7OWkb4gIQg6XoBMGhyG7eT/Jm4+hvRCBo0mkRpCVyPogAoMm+ONXAPxpQkPjJ4l1Ag2pLqogYhUddz7TlFaloW+AIliT6n5cZx8kNHxIE6RSa8XFcfirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY21HHEEU1RdeK+MCviGBp+jn9AnQhrxscQEt+Bp79Y=;
 b=WPE5sv+lQUPbOpUGQgLk3LsKdJMPxybs0JmId4acQhe3PGVJtre7x2TxrTe2ybKYADcd9JsC8oXW/9U8Std9W9USySu0C4e1flMOUVw2HjlIwhuKzOujZWVBS78ryFvbO67l4+T/gMp938G2EIMNUSBoIPs2RvF/QwFPN72ghRZNfwhyjwbwYbiNexRKHOrB/sHGkXC5YrHAz2gec5P1gP/crBh2njje6mXkDG4CutrO79xd/081lTgvS0P0ZhyXHxTtyLJG09JIlLjmQtTDULT/x4hc4835OTWmm0zNTFNwvkOvUzOZOI7ucV58AqeUKtfppMRNkM43KqfJrgTwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3282.namprd12.prod.outlook.com (20.179.67.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 02:25:35 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 02:25:35 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>
Subject: Re: [PATCH] drm/amdgpu: pin the csb buffer on hw init for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: pin the csb buffer on hw init for gfx v8
Thread-Index: AQHVSzKFMk/mQil1kUi7Jru2LcaSP6br0iqAgAABkTY=
Date: Mon, 5 Aug 2019 02:25:35 +0000
Message-ID: <20D53D7D-C2BF-469E-BBFA-E00EFCCAB1BC@amd.com>
References: <1564970809-31487-1-git-send-email-likun.gao@amd.com>,
 <CH2PR12MB3767F6605AC1A097D9D5586DFEDA0@CH2PR12MB3767.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3767F6605AC1A097D9D5586DFEDA0@CH2PR12MB3767.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 962d6a54-0b1c-403d-274f-08d7194c32b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3282; 
x-ms-traffictypediagnostic: BN8PR12MB3282:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3282B69F4302D154AA1FD7DE89DA0@BN8PR12MB3282.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(13464003)(199004)(6116002)(6862004)(54906003)(91956017)(86362001)(76116006)(4326008)(25786009)(6636002)(37006003)(256004)(6512007)(6306002)(26005)(6246003)(66476007)(66946007)(66556008)(7736002)(6436002)(64756008)(66446008)(305945005)(316002)(3846002)(486006)(186003)(229853002)(476003)(2616005)(53936002)(11346002)(6486002)(36756003)(33656002)(81166006)(81156014)(8676002)(446003)(8936002)(71190400001)(71200400001)(102836004)(99286004)(68736007)(5660300002)(76176011)(6506007)(53546011)(2906002)(14454004)(66066001)(478600001)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3282;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EUtq/ZFgaDo2AW/LaboqqoC+2jwtC6Yr7zac/xaf5RGa8oJIB6a5L39uXh9c8+okc53JMyBVcbkqObY0X80AT5PI3qRZI1hnQaux1hy3HCfSPp5X/CxZByC8M/8aS/GbwziD8RZJCkf2cANqMkLkfQ6VdbmqKafkOnx/cVg61QOm0TBx85ZM+w6bab7E/V1OqOKXS448ISYLuDNcXyP03rJcayVh9v+DA3pnt22lOR63Ju2rHgET07YHY0Kc16cbCDl24xt8FJp3Y9NM4dNKKAoLz68dY8iPPhWVuIYQUSgCFnjtBAdY89nmJXWpQhNnisDrY7dNW1p5irKBG74ijuX01QHjJmKm8urxXXdeOw7jfD1LUUKPsikmphIDmyKJX/m6zG8Vm8jk5hBz7KH6zGAQwt1I4aMl+V/Q/CZuwAA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962d6a54-0b1c-403d-274f-08d7194c32b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 02:25:35.3338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3282
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY21HHEEU1RdeK+MCviGBp+jn9AnQhrxscQEt+Bp79Y=;
 b=P2rJWitlRcRdiveQjcM4FN6Ha5wtgkSX89ejChs0PLDmfb9BI+y6LM0KyV01KcTClpmF9zXX90SNukv64OyfhFCJKKFsVtZO14Dmb17DJ4xrd0bv9gukieu6uq8ZpLjtxcML92ipgVOc0G2/WXHW03ta74ytqfQA1KPEfDjc1E4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Gao,
 Likun" <Likun.Gao@amd.com>, Paul Gover <pmw.gover@yahoo.co.uk>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKPiBPbiBBdWcgNSwgMjAxOSwgYXQgMTA6MjAgQU0sIFh1LCBGZWlmZWkgPEZlaWZlaS5Y
dUBhbWQuY29tPiB3cm90ZToKPiAKPiBSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVA
YW1kLmNvbT4KPiAKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGFtZC1nZngg
PGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBHYW8g
TGlrdW4KPiBTZW50OiBNb25kYXksIEF1Z3VzdCA1LCAyMDE5IDEwOjA3IEFNCj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgUGF1
bCBHb3ZlciA8cG13LmdvdmVyQHlhaG9vLmNvLnVrPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5Z
dWFuQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBwaW4gdGhlIGNzYiBi
dWZmZXIgb24gaHcgaW5pdCBmb3IgZ2Z4IHY4Cj4gCj4gRnJvbTogTGlrdW4gR2FvIDxMaWt1bi5H
YW9AYW1kLmNvbT4KPiAKPiBXaXRob3V0IHRoaXMgcGluLCB0aGUgY3NiIGJ1ZmZlciB3aWxsIGJl
IGZpbGxlZCB3aXRoIGluY29uc2lzdGVudCBkYXRhIGFmdGVyIFMzIHJlc3VtZS4gQW5kIHRoYXQg
d2lsbCBjYXVzZXMgZ2Z4IGhhbmcgb24gZ2Z4b2ZmIGV4aXQgc2luY2UgdGhpcyBjc2Igd2lsbCBi
ZSBleGVjdXRlZCB0aGVuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpa3VuIEdhbyA8TGlrdW4uR2Fv
QGFtZC5jb20+Cj4gLS0tCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyB8
IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQs
IDQwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMK
PiBpbmRleCBkMjkwNzE4Li45OGU1YWE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjhfMC5jCj4gQEAgLTEzMTcsNiArMTMxNywzOSBAQCBzdGF0aWMgaW50IGdmeF92OF8wX3Js
Y19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgIHJldHVybiAwOwo+IH0KPiAK
PiArc3RhdGljIGludCBnZnhfdjhfMF9jc2JfdnJhbV9waW4oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpIHsKPiArICAgIGludCByOwo+ICsKPiArICAgIHIgPSBhbWRncHVfYm9fcmVzZXJ2ZShh
ZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2UpOwo+ICsgICAgaWYgKHVubGlrZWx5
KHIgIT0gMCkpCj4gKyAgICAgICAgcmV0dXJuIHI7Cj4gKwo+ICsgICAgciA9IGFtZGdwdV9ib19w
aW4oYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosCj4gKyAgICAgICAgICAgIEFNREdQVV9H
RU1fRE9NQUlOX1ZSQU0pOwo+ICsgICAgaWYgKCFyKQo+ICsgICAgICAgIGFkZXYtPmdmeC5ybGMu
Y2xlYXJfc3RhdGVfZ3B1X2FkZHIgPQo+ICsgICAgICAgICAgICBhbWRncHVfYm9fZ3B1X29mZnNl
dChhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Cj4gKwo+ICsgICAgYW1kZ3B1X2JvX3Vu
cmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Cj4gKwo+ICsgICAgcmV0dXJu
IHI7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGdmeF92OF8wX2NzYl92cmFtX3VucGluKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KSB7Cj4gKyAgICBpbnQgcjsKPiArCj4gKyAgICBpZiAoIWFk
ZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4gKyAg
ICByID0gYW1kZ3B1X2JvX3Jlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosIHRy
dWUpOwo+ICsgICAgaWYgKGxpa2VseShyID09IDApKSB7Cj4gKyAgICAgICAgYW1kZ3B1X2JvX3Vu
cGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKPiArICAgICAgICBhbWRncHVfYm9f
dW5yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKPiArICAgIH0KPiArfQo+
ICsKPiBzdGF0aWMgdm9pZCBnZnhfdjhfMF9tZWNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikgIHsKPiAgICBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5tZWMuaHBkX2Vv
cF9vYmosIE5VTEwsIE5VTEwpOyBAQCAtNDc5MSw2ICs0ODI0LDEwIEBAIHN0YXRpYyBpbnQgZ2Z4
X3Y4XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAgZ2Z4X3Y4XzBfaW5pdF9nb2xkZW5fcmVn
aXN0ZXJzKGFkZXYpOwo+ICAgIGdmeF92OF8wX2NvbnN0YW50c19pbml0KGFkZXYpOwo+IAo+ICsg
ICAgciA9IGdmeF92OF8wX2NzYl92cmFtX3BpbihhZGV2KTsKPiArICAgIGlmIChyKQo+ICsgICAg
ICAgIHJldHVybiByOwo+ICsKPiAgICByID0gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+cmVzdW1lKGFk
ZXYpOwo+ICAgIGlmIChyKQo+ICAgICAgICByZXR1cm4gcjsKPiBAQCAtNDkwNyw2ICs0OTQ0LDkg
QEAgc3RhdGljIGludCBnZnhfdjhfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKPiAgICBlbHNlCj4g
ICAgICAgIHByX2VycigicmxjIGlzIGJ1c3ksIHNraXAgaGFsdCBybGNcbiIpOwo+ICAgIGFtZGdw
dV9nZnhfcmxjX2V4aXRfc2FmZV9tb2RlKGFkZXYpOwo+ICsKPiArICAgIGdmeF92OF8wX2NzYl92
cmFtX3VucGluKGFkZXYpOwo+ICsKPiAgICByZXR1cm4gMDsKPiB9Cj4gCj4gLS0KPiAyLjcuNAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
