Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00CA5180
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3ECD89078;
	Mon,  2 Sep 2019 08:25:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680078.outbound.protection.outlook.com [40.107.68.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B0D89078
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 08:25:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLLthxGB3yR5/Y0UF3o9nF67A/Bs3+fo2VSLAXSqKA2ILrJvBLBIY4gA3sNjH/7O0Q4M8UA1pnlI1yybho7DzWdLscFEjtM2AFLRKTmWQnTaVKZizj05XqIJMEkdBpdkQfrXR8DKVvU8Pfe3BvB9rRoIDOOE5JSWHFr+0VIcEGfzeAjiyOXjvtovcPP2KB/9E6fmylwQyDhjbU4E5x1oezT1lCIl7F9fs8Fvhq7DzrnQVi9PWloFTLwSNE0y1hSAG8jw7hb/aRS98Zi+7WtrcpUYJTEcTuiy6SC846vHiFw5E06nmL4FB58+Dlrm+Chocb/EleY3m0c399XTVa3+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOglRRo/HeBUrN71nHBORMuPIeLDLwh0DSDi5tevB1w=;
 b=NBeixcgwOjZiiPngV8UK367jrdWzXdbsFHGz7o98g6Ff7Qp9I8zXq76+vhwTC3YVOsFWK1DCoWr1+hi0yLfkA41Hx1C8HMJq4uSTwosqL+v5664uzOk/9aMubXm3gAMad2uGh/8OIdLUvTj/sOYlFwysv8Ik0v+NR2egb2RA5wtB7eQj/vNuT9+j6rbp9b62A/42ii1ibw5BJymZa6dFBhMEokPvgY5dWHIyivOPn0clS25f3fh/jkJLJnEs7Un+f7DbfA/K9i8Q5fekDMaNPJ+IvaygleAAapz8cAIskCQ2xBcdUpHbc+sR7AzdwweYdHlW4zQsVihfSIg4KW64yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN1PR12MB2592.namprd12.prod.outlook.com (52.132.199.19) by
 SN1PR12MB2573.namprd12.prod.outlook.com (52.132.197.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 2 Sep 2019 08:24:55 +0000
Received: from SN1PR12MB2592.namprd12.prod.outlook.com
 ([fe80::fda0:dfdf:7fce:65c5]) by SN1PR12MB2592.namprd12.prod.outlook.com
 ([fe80::fda0:dfdf:7fce:65c5%7]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 08:24:55 +0000
From: "Gui, Jack" <Jack.Gui@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: update cached feature enablement
 status V3
Thread-Topic: [PATCH] drm/amd/powerplay: update cached feature enablement
 status V3
Thread-Index: AQHVWW4ZJBHR34Qyb0+sGcCehSFcSacYGmqAgAACbUA=
Date: Mon, 2 Sep 2019 08:24:55 +0000
Message-ID: <SN1PR12MB2592530EEFDC223372CB21B28BBE0@SN1PR12MB2592.namprd12.prod.outlook.com>
References: <20190823044851.8133-1-evan.quan@amd.com>
 <MN2PR12MB3344AABEACD74C4DF9A46DBAE4BE0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344AABEACD74C4DF9A46DBAE4BE0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e34ae261-1b50-4430-f17e-08d72f7f08fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN1PR12MB2573; 
x-ms-traffictypediagnostic: SN1PR12MB2573:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2573B52C37B8D9C1FBA4BBC98BBE0@SN1PR12MB2573.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(13464003)(25786009)(6116002)(3846002)(476003)(74316002)(2501003)(6246003)(7736002)(256004)(14444005)(99286004)(305945005)(486006)(446003)(81166006)(81156014)(11346002)(6436002)(66556008)(64756008)(66446008)(33656002)(66476007)(76116006)(15650500001)(66946007)(8936002)(9686003)(2906002)(14454004)(5660300002)(55016002)(8676002)(71190400001)(52536014)(71200400001)(66066001)(7696005)(26005)(6506007)(102836004)(110136005)(316002)(229853002)(478600001)(53546011)(86362001)(53936002)(186003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2573;
 H:SN1PR12MB2592.namprd12.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fBjwh/dmejnWYQ4itm9LYf12s32d/O7JIY2K/AwYe6bi6t6eBenZUE5XPG7RfCJGabAKDzAG7FmNo/d5xxY3cP5iaStFvXIJKngQML6CEJ06vfM+ccQokeX7YILl050wP6LCbhp6zrHwmtVcQS7mJMlp9g3YUurus+FktRM5sGdKiEKspreuH0DISyVb2kk+U7M5b+/oJe3xHVdhiSvCmRsOMIY/XI3tegGOvlP3+P3AG8WuGAYaHfrALVKeMjSeaBHSarXZu6Otb7W9YkaJwG2fIRO1z1KP+j47wSyqikPIAbtd6E+Yxb/KCNWvaIGfGbvsTAFF/5Dq+wrJOglCflzeBdj7em44iw2h4NBQA49YdirByiHGW760qs3FIos4qiWWoz9dTwkWt6lb7jsRQG3jhwF8kUoSmqe+FBkJkQg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34ae261-1b50-4430-f17e-08d72f7f08fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 08:24:55.3522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6FPYkLW/aBJDsRkbaAt9yuXC9Qs9tp8f1oBfH5/Ydy71C26rvLzzPpYlMtzWNQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOglRRo/HeBUrN71nHBORMuPIeLDLwh0DSDi5tevB1w=;
 b=HzZlUWbgzMKcJ9ndQC67qm6vsGwcKdtcXAYz8OIYeiWTleORpVTug+glLEDG/pHT35GCqbMX2NYAbD4MMnDgft60JaKaEhVtJQbPFka6KyIgXrNBb/cIoPLpjDCEWqOa0jeVSMBSUIjltFvEUT4JiD8Yya1DmyZ8XPtQjBHfJAo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Gui@amd.com; 
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

UmV2aWV3ZWQtYnk6IEphY2sgR3VpIDxKYWNrLkd1aUBhbWQuY29tPgoKLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KRnJvbTogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+IApTZW50OiBN
b25kYXksIFNlcHRlbWJlciAyLCAyMDE5IDQ6MTYgUE0KVG86IFF1YW4sIEV2YW4gPEV2YW4uUXVh
bkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEd1aSwgSmFjayA8
SmFjay5HdWlAYW1kLmNvbT4KU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6
IHVwZGF0ZSBjYWNoZWQgZmVhdHVyZSBlbmFibGVtZW50IHN0YXR1cyBWMwoKUGluZy4uCgo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4KPiBTZW50OiAyMDE55bm0OOaciDIz5pelIDEyOjQ5Cj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPgo+IFN1
YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IHVwZGF0ZSBjYWNoZWQgZmVhdHVyZSBl
bmFibGVtZW50IAo+IHN0YXR1cyBWMwo+IAo+IE5lZWQgdG8gdXBkYXRlIGluIGNhY2hlIGZlYXR1
cmUgZW5hYmxlbWVudCBzdGF0dXMgYWZ0ZXIgcHBfZmVhdHVyZSAKPiBzZXR0aW5ncy4gQW5vdGhl
ciBmaXggZm9yIHRoZSBjb21taXQgYmVsb3c6Cj4gZHJtL2FtZC9wb3dlcnBsYXk6IGltcGxtZW50
IHN5c2ZzIGZlYXR1cmUgc3RhdHVzIGZ1bmN0aW9uIGluIHNtdQo+IAo+IFYyOiB1cGRhdGUgc211
X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZSgpIGFuZCByZWxhdGVzCj4gVjM6IHVzZSBiaXRt
YXBfb3IgYW5kIGJpdG1hcF9hbmRub3QKPiAKPiBDaGFuZ2UtSWQ6IEk5MGUyOWIwZDgzOWRmMjY4
MjVkNTk5MzIxMmY2MDk3YzdhZDRiZWJmCj4gU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFu
LnF1YW5AYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jICAgIHwgMTAxICsrKysrKysrKy0tLS0tLS0tCj4gLQo+ICAuLi4vZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgIDEgLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQ5IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGluZGV4IDRkZjdmYjZlYWYzYy4uYzhj
MDA5NjZhNjIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYwo+IEBAIC05NCw2ICs5NCw1MiBAQCBzaXplX3Qgc211X3N5c19nZXRfcHBfZmVhdHVyZV9t
YXNrKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1ZikKPiAgCXJldHVybiBzaXpl
Owo+ICB9Cj4gCj4gK3N0YXRpYyBpbnQgc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiArCQkJCQkgICB1aW50NjRfdCBmZWF0dXJlX21hc2ss
Cj4gKwkJCQkJICAgYm9vbCBlbmFibGVkKQo+ICt7Cj4gKwlzdHJ1Y3Qgc211X2ZlYXR1cmUgKmZl
YXR1cmUgPSAmc211LT5zbXVfZmVhdHVyZTsKPiArCXVpbnQzMl90IGZlYXR1cmVfbG93ID0gMCwg
ZmVhdHVyZV9oaWdoID0gMDsKPiArCWludCByZXQgPSAwOwo+ICsKPiArCWlmICghc211LT5wbV9l
bmFibGVkKQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJZmVhdHVyZV9sb3cgPSAoZmVhdHVyZV9t
YXNrID4+IDAgKSAmIDB4ZmZmZmZmZmY7Cj4gKwlmZWF0dXJlX2hpZ2ggPSAoZmVhdHVyZV9tYXNr
ID4+IDMyKSAmIDB4ZmZmZmZmZmY7Cj4gKwo+ICsJaWYgKGVuYWJsZWQpIHsKPiArCQlyZXQgPSBz
bXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LAo+IFNNVV9NU0dfRW5hYmxlU211RmVhdHVy
ZXNMb3csCj4gKwkJCQkJCSAgZmVhdHVyZV9sb3cpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVy
biByZXQ7Cj4gKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwKPiBTTVVf
TVNHX0VuYWJsZVNtdUZlYXR1cmVzSGlnaCwKPiArCQkJCQkJICBmZWF0dXJlX2hpZ2gpOwo+ICsJ
CWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwl9IGVsc2Ugewo+ICsJCXJldCA9IHNtdV9z
ZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsCj4gU01VX01TR19EaXNhYmxlU211RmVhdHVyZXNM
b3csCj4gKwkJCQkJCSAgZmVhdHVyZV9sb3cpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiBy
ZXQ7Cj4gKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwKPiBTTVVfTVNH
X0Rpc2FibGVTbXVGZWF0dXJlc0hpZ2gsCj4gKwkJCQkJCSAgZmVhdHVyZV9oaWdoKTsKPiArCQlp
ZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCW11dGV4X2xvY2soJmZlYXR1
cmUtPm11dGV4KTsKPiArCWlmIChlbmFibGVkKQo+ICsJCWJpdG1hcF9vcihmZWF0dXJlLT5lbmFi
bGVkLCBmZWF0dXJlLT5lbmFibGVkLAo+ICsJCQkJKHVuc2lnbmVkIGxvbmcgKikoJmZlYXR1cmVf
bWFzayksCj4gU01VX0ZFQVRVUkVfTUFYKTsKPiArCWVsc2UKPiArCQliaXRtYXBfYW5kbm90KGZl
YXR1cmUtPmVuYWJsZWQsIGZlYXR1cmUtPmVuYWJsZWQsCj4gKwkJCQkodW5zaWduZWQgbG9uZyAq
KSgmZmVhdHVyZV9tYXNrKSwKPiBTTVVfRkVBVFVSRV9NQVgpOwo+ICsJbXV0ZXhfdW5sb2NrKCZm
ZWF0dXJlLT5tdXRleCk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiAgaW50IHNtdV9z
eXNfc2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDY0X3QK
PiBuZXdfbWFzaykgIHsKPiAgCWludCByZXQgPSAwOwo+IEBAIC01OTEsNDEgKzYzNyw3IEBAIGlu
dCBzbXVfZmVhdHVyZV9pbml0X2RwbShzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211KQo+IAo+ICAJ
cmV0dXJuIHJldDsKPiAgfQo+IC1pbnQgc211X2ZlYXR1cmVfdXBkYXRlX2VuYWJsZV9zdGF0ZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDY0X3QgCj4gZmVhdHVyZV9tYXNrLCBib29sIGVu
YWJsZWQpIC17Cj4gLQl1aW50MzJfdCBmZWF0dXJlX2xvdyA9IDAsIGZlYXR1cmVfaGlnaCA9IDA7
Cj4gLQlpbnQgcmV0ID0gMDsKPiAtCj4gLQlpZiAoIXNtdS0+cG1fZW5hYmxlZCkKPiAtCQlyZXR1
cm4gcmV0Owo+IC0KPiAtCWZlYXR1cmVfbG93ID0gKGZlYXR1cmVfbWFzayA+PiAwICkgJiAweGZm
ZmZmZmZmOwo+IC0JZmVhdHVyZV9oaWdoID0gKGZlYXR1cmVfbWFzayA+PiAzMikgJiAweGZmZmZm
ZmZmOwo+IC0KPiAtCWlmIChlbmFibGVkKSB7Cj4gLQkJcmV0ID0gc211X3NlbmRfc21jX21zZ193
aXRoX3BhcmFtKHNtdSwKPiBTTVVfTVNHX0VuYWJsZVNtdUZlYXR1cmVzTG93LAo+IC0JCQkJCQkg
IGZlYXR1cmVfbG93KTsKPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0JCXJldCA9
IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsCj4gU01VX01TR19FbmFibGVTbXVGZWF0
dXJlc0hpZ2gsCj4gLQkJCQkJCSAgZmVhdHVyZV9oaWdoKTsKPiAtCQlpZiAocmV0KQo+IC0JCQly
ZXR1cm4gcmV0Owo+IC0KPiAtCX0gZWxzZSB7Cj4gLQkJcmV0ID0gc211X3NlbmRfc21jX21zZ193
aXRoX3BhcmFtKHNtdSwKPiBTTVVfTVNHX0Rpc2FibGVTbXVGZWF0dXJlc0xvdywKPiAtCQkJCQkJ
ICBmZWF0dXJlX2xvdyk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCQlyZXQg
PSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LAo+IFNNVV9NU0dfRGlzYWJsZVNtdUZl
YXR1cmVzSGlnaCwKPiAtCQkJCQkJICBmZWF0dXJlX2hpZ2gpOwo+IC0JCWlmIChyZXQpCj4gLQkJ
CXJldHVybiByZXQ7Cj4gCj4gLQl9Cj4gLQo+IC0JcmV0dXJuIHJldDsKPiAtfQo+IAo+ICBpbnQg
c211X2ZlYXR1cmVfaXNfZW5hYmxlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSAKPiBz
bXVfZmVhdHVyZV9tYXNrIG1hc2spICB7IEBAIC02NTEsOCArNjYzLDYgQEAgaW50IAo+IHNtdV9m
ZWF0dXJlX3NldF9lbmFibGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9mZWF0
dXJlX21hc2sgCj4gbWFzaywgIHsKPiAgCXN0cnVjdCBzbXVfZmVhdHVyZSAqZmVhdHVyZSA9ICZz
bXUtPnNtdV9mZWF0dXJlOwo+ICAJaW50IGZlYXR1cmVfaWQ7Cj4gLQl1aW50NjRfdCBmZWF0dXJl
X21hc2sgPSAwOwo+IC0JaW50IHJldCA9IDA7Cj4gCj4gIAlmZWF0dXJlX2lkID0gc211X2ZlYXR1
cmVfZ2V0X2luZGV4KHNtdSwgbWFzayk7Cj4gIAlpZiAoZmVhdHVyZV9pZCA8IDApCj4gQEAgLTY2
MCwyMiArNjcwLDkgQEAgaW50IHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHN0cnVjdCBzbXVfY29u
dGV4dCAKPiAqc211LCBlbnVtIHNtdV9mZWF0dXJlX21hc2sgbWFzaywKPiAKPiAgCVdBUk5fT04o
ZmVhdHVyZV9pZCA+IGZlYXR1cmUtPmZlYXR1cmVfbnVtKTsKPiAKPiAtCWZlYXR1cmVfbWFzayA9
IDFVTEwgPDwgZmVhdHVyZV9pZDsKPiAtCj4gLQltdXRleF9sb2NrKCZmZWF0dXJlLT5tdXRleCk7
Cj4gLQlyZXQgPSBzbXVfZmVhdHVyZV91cGRhdGVfZW5hYmxlX3N0YXRlKHNtdSwgZmVhdHVyZV9t
YXNrLAo+IGVuYWJsZSk7Cj4gLQlpZiAocmV0KQo+IC0JCWdvdG8gZmFpbGVkOwo+IC0KPiAtCWlm
IChlbmFibGUpCj4gLQkJdGVzdF9hbmRfc2V0X2JpdChmZWF0dXJlX2lkLCBmZWF0dXJlLT5lbmFi
bGVkKTsKPiAtCWVsc2UKPiAtCQl0ZXN0X2FuZF9jbGVhcl9iaXQoZmVhdHVyZV9pZCwgZmVhdHVy
ZS0+ZW5hYmxlZCk7Cj4gLQo+IC1mYWlsZWQ6Cj4gLQltdXRleF91bmxvY2soJmZlYXR1cmUtPm11
dGV4KTsKPiAtCj4gLQlyZXR1cm4gcmV0Owo+ICsJcmV0dXJuIHNtdV9mZWF0dXJlX3VwZGF0ZV9l
bmFibGVfc3RhdGUoc211LAo+ICsJCQkJCSAgICAgICAxVUxMIDw8IGZlYXR1cmVfaWQsCj4gKwkJ
CQkJICAgICAgIGVuYWJsZSk7Cj4gIH0KPiAKPiAgaW50IHNtdV9mZWF0dXJlX2lzX3N1cHBvcnRl
ZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSAKPiBzbXVfZmVhdHVyZV9tYXNrIG1hc2sp
IGRpZmYgLS1naXQgCj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
Cj4gaW5kZXggZTgwYzgxNTUyZDI5Li5mYmY2OGZkNDJiOTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBAQCAtODA3LDcgKzgwNyw2
IEBAIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwgCj4gc211X2dldF9wZXJmb3JtYW5jZV9sZXZl
bChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7ICBpbnQgCj4gc211X2ZvcmNlX3BlcmZvcm1hbmNl
X2xldmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIAo+IGFtZF9kcG1fZm9yY2VkX2xl
dmVsIGxldmVsKTsgIGludCBzbXVfc2V0X2Rpc3BsYXlfY291bnQoc3RydWN0IAo+IHNtdV9jb250
ZXh0ICpzbXUsIHVpbnQzMl90IGNvdW50KTsgIGJvb2wgc211X2Nsa19kcG1faXNfZW5hYmxlZChz
dHJ1Y3QgCj4gc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpOyAt
aW50IAo+IHNtdV9mZWF0dXJlX3VwZGF0ZV9lbmFibGVfc3RhdGUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIHVpbnQ2NF90IAo+IGZlYXR1cmVfbWFzaywgYm9vbCBlbmFibGVkKTsgIGNvbnN0IGNo
YXIgKnNtdV9nZXRfbWVzc2FnZV9uYW1lKHN0cnVjdCAKPiBzbXVfY29udGV4dCAqc211LCBlbnVt
IHNtdV9tZXNzYWdlX3R5cGUgdHlwZSk7ICBjb25zdCBjaGFyIAo+ICpzbXVfZ2V0X2ZlYXR1cmVf
bmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVhdHVyZV9tYXNrIAo+IGZl
YXR1cmUpOyAgc2l6ZV90IHNtdV9zeXNfZ2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3QKPiBzbXVf
Y29udGV4dCAqc211LCBjaGFyICpidWYpOwo+IC0tCj4gMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
