Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3CA7EB29
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 06:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47FC6E897;
	Fri,  2 Aug 2019 04:17:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB56E897
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 04:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/diF0OQkjTI6btXohn1tK28fXn+EtU7Q54bQjq4dLHTm5c6doQsvNqJyB6/YcMSDCW0HxAZ4PdQ1gU27/9KsCvZaNtgYdd01pAt+H708tkhTGi8EbKbFO9L/duJjVdPQqMaxsr9Geu5HZipUMMuOvV+WeSy9RT6GLbrq5Ak7awQVGRp0jrw6QortjQGD9zX8Zqz4smE2IYb1obOCaxMN69G+k3gxuHut7WbIY6jfNk6Y4A+3uzVhuRUEWnA8SuKYCsTFA+ui5clmm7KUPpYmdw/n32pWhNG4iBr8DL+2XoHtecDhh1l7RyROjhSvcE/Z+AwZ8lyeVQa/nfiCyVBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8N/Le4ZYEHZcaihFCvcKAFHvZlMjJWIRFjQbYmMLeA=;
 b=nmSBR8Xco6zkLv0ecc7A3gEFDwPHQgXdfJuto0CyP03fzD5nM6uyk87aga5Auq38waAe6KPIfG9ZTCy09dz/t3b+Dnxo8uZncC4i05o/L/lPiSj6tEENWY8DqNcrkUxWsFgYM2qEIg868FZto/dS98YKhQvZD9KKYZI1Skseo2uh/kCvYG/p4GufJb45jqug/3aY6bHpFnJRftLhB2uEm0C9p20imw3u1FQ0S5z74brjWfm0gOb9fMWV4XHwzy4Td+EyfnArszqSOLnWBj5ZMWuvuBzw7zyar5YvmI1WDgzHDdtyyxDjHneYbL7ItYe0L9DqC1IlsJPLPGu+xVq+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 04:17:42 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 04:17:42 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, dl.srdc_lnx_nv10
 <dl.srdc_lnx_nv10@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics
 data for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: honor hw limit on fetching metrics
 data for navi10
Thread-Index: AQHVSOip04KistZAF0mzSAX+5aGP6KbnQIeQ
Date: Fri, 2 Aug 2019 04:17:41 +0000
Message-ID: <MN2PR12MB3344A2BFCB678AD62A96E259E4D90@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190802041326.23404-1-kevin1.wang@amd.com>
In-Reply-To: <20190802041326.23404-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 023bbb4a-b581-4aa8-a32f-08d717005cc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-microsoft-antispam-prvs: <MN2PR12MB3104353B4FFE8D1FC287DF3AE4D90@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(13464003)(199004)(189003)(54906003)(55016002)(9686003)(6436002)(6246003)(7696005)(25786009)(110136005)(53936002)(76176011)(7736002)(229853002)(86362001)(478600001)(74316002)(99286004)(4326008)(8676002)(3846002)(6116002)(256004)(81156014)(81166006)(26005)(316002)(186003)(446003)(11346002)(476003)(486006)(71190400001)(71200400001)(52536014)(64756008)(14444005)(66446008)(6506007)(66556008)(305945005)(6636002)(53546011)(76116006)(2906002)(14454004)(5660300002)(8936002)(66066001)(33656002)(68736007)(66946007)(102836004)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6yFCYGG7SfHYJZz7pZe4ChAk9AZCVSEH3MOUm2F8uLZvxbkY32ddseEIlHx2Jm2FpLKQZflHhMNdEh5V7RLRoSWLTzu43CAhfmB/UW5Ukx9SD8Kwxs0Kr/uGbQNBK1Zk7BRWHaemPQzHItLPcn3KgT9S9Dlop2q8/DIqRWeWDMO7M+4mqsLpqyO+dI5jj0miga4Qrmrz3UO0q8opLnvqdHzTgKn8IRtdk4PY+49THJRHpw1BWTdYsfAw0dKnG3h3ZUrcqf3IZ0K81Hcar4nZhebrwk8ijwPLumiXkVkizeIB3zgJleNEo2wkpwosSLFX7dJQzE6tkN2z3ATipsknSDz2vqhYDomVL/1yHc/Wm6z3Y1maII3oNoEjrnVTvKQpL7I091KgN9a/3gaWdX5vKtUdUDAHWGHxkb8JJyO+LU8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023bbb4a-b581-4aa8-a32f-08d717005cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 04:17:41.8624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8N/Le4ZYEHZcaihFCvcKAFHvZlMjJWIRFjQbYmMLeA=;
 b=KHHyRRI0CfLf0EjKFoHC9f0YwkmXy/go3QXCFiXl2FlKTpBGDo20hVWSs8i9NDksrLt+XXOmmqTxbxFi2dSZiPH7YLnU+a+sWBZ9Zrgc9iNKot/qRLXWxzaWDeNWminySiveTdarjBkZhaZbW6aAFf9wAAvNwZVJIOoqPoEjXQ8=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cgo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFt
ZC5jb20+Cj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMDIsIDIwMTkgMTI6MTQgUE0KPiBUbzogZGwu
c3JkY19sbnhfbnYxMCA8ZGwuc3JkY19sbnhfbnYxMEBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+Owo+IEZl
bmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykKPiA8
S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5
OiBob25vciBodyBsaW1pdCBvbiBmZXRjaGluZyBtZXRyaWNzCj4gZGF0YSBmb3IgbmF2aTEwCj4g
Cj4gdG9vIGZyZXF1ZW50bHkgdG8gdXBkYXRlIG1lcnRyaWNzIHRhYmxlIHdpbGwgY2F1c2Ugc211
IGludGVybmFsIGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53
YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyB8IDU2ICsrKysrKysrKysrKysrKy0tLS0tCj4gLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGluZGV4IGYzYWRiNzEzNzg0YS4uY2YyZTI2
NDA5NWE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
Ywo+IEBAIC01MTUsNiArNTE1LDggQEAgc3RhdGljIGludCBuYXZpMTBfc3RvcmVfcG93ZXJwbGF5
X3RhYmxlKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUpCj4gCj4gIHN0YXRpYyBpbnQgbmF2aTEw
X3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3RhYmxlCj4g
KnRhYmxlcykgIHsKPiArCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJnNt
dS0+c211X3RhYmxlOwo+ICsKPiAgCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1BQ
VEFCTEUsIHNpemVvZihQUFRhYmxlX3QpLAo+ICAJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9H
RU1fRE9NQUlOX1ZSQU0pOwo+ICAJU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfV0FU
RVJNQVJLUywKPiBzaXplb2YoV2F0ZXJtYXJrc190KSwgQEAgLTUyOSw5ICs1MzEsMzUgQEAgc3Rh
dGljIGludAo+IG5hdmkxMF90YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgc3Ry
dWN0IHNtdV90YWJsZSAqdGFibGVzKQo+ICAJCSAgICAgICBzaXplb2YoRHBtQWN0aXZpdHlNb25p
dG9yQ29lZmZJbnRfdCksIFBBR0VfU0laRSwKPiAgCSAgICAgICAgICAgICAgIEFNREdQVV9HRU1f
RE9NQUlOX1ZSQU0pOwo+IAo+ICsJc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlID0ga3phbGxvYyhz
aXplb2YoU211TWV0cmljc190KSwKPiBHRlBfS0VSTkVMKTsKPiArCWlmICghc211X3RhYmxlLT5t
ZXRyaWNzX3RhYmxlKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsJc211X3RhYmxlLT5tZXRyaWNz
X3RpbWUgPSAwOwo+ICsKPiAgCXJldHVybiAwOwo+ICB9Cj4gCj4gK3N0YXRpYyBpbnQgbmF2aTEw
X2dldF9tZXRyaWNzX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICsJCQkJICAgIFNt
dU1ldHJpY3NfdCAqbWV0cmljc190YWJsZSkKPiArewo+ICsJc3RydWN0IHNtdV90YWJsZV9jb250
ZXh0ICpzbXVfdGFibGU9ICZzbXUtPnNtdV90YWJsZTsKPiArCWludCByZXQgPSAwOwo+ICsKPiAr
CWlmICghc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgfHwgdGltZV9hZnRlcihqaWZmaWVzLCBzbXVf
dGFibGUtCj4gPm1ldHJpY3NfdGltZSArIEhaIC8gMTAwMCkpIHsKPiArCQlyZXQgPSBzbXVfdXBk
YXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLAo+IDAsCj4gKwkJCQkodm9pZCAq
KXNtdV90YWJsZS0+bWV0cmljc190YWJsZSwgZmFsc2UpOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJ
cHJfaW5mbygiRmFpbGVkIHRvIGV4cG9ydCBTTVUgbWV0cmljcyB0YWJsZSFcbiIpOwo+ICsJCQly
ZXR1cm4gcmV0Owo+ICsJCX0KPiArCQlzbXVfdGFibGUtPm1ldHJpY3NfdGltZSA9IGppZmZpZXM7
Cj4gKwl9Cj4gKwo+ICsJbWVtY3B5KG1ldHJpY3NfdGFibGUsIHNtdV90YWJsZS0+bWV0cmljc190
YWJsZSwKPiBzaXplb2YoU211TWV0cmljc190KSk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+
ICsKPiAgc3RhdGljIGludCBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQoc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUpICB7Cj4gIAlzdHJ1Y3Qgc211X2RwbV9jb250ZXh0ICpzbXVfZHBtID0gJnNt
dS0+c211X2RwbTsgQEAgLQo+IDYxMSwxNSArNjM5LDEwIEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dl
dF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4g
IAkJCQkgICAgICAgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCj4gIAkJCQkgICAgICAgdWlu
dDMyX3QgKnZhbHVlKQo+ICB7Cj4gLQlzdGF0aWMgU211TWV0cmljc190IG1ldHJpY3M7Cj4gIAlp
bnQgcmV0ID0gMCwgY2xrX2lkID0gMDsKPiArCVNtdU1ldHJpY3NfdCBtZXRyaWNzOwo+IAo+IC0J
aWYgKCF2YWx1ZSkKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiAtCj4gLQltZW1zZXQoJm1ldHJpY3Ms
IDAsIHNpemVvZihtZXRyaWNzKSk7Cj4gLQo+IC0JcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUs
IFNNVV9UQUJMRV9TTVVfTUVUUklDUywgMCwgKHZvaWQKPiAqKSZtZXRyaWNzLCBmYWxzZSk7Cj4g
KwlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7Cj4gIAlpZiAo
cmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gCj4gQEAgLTkwNyw4ICs5MzAsOSBAQCBzdGF0aWMgaW50
IG5hdmkxMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVfY29udGV4dAo+ICpzbXUsIHVpbnQzMl90
ICp2YWx1ZSkKPiAgCWlmICghdmFsdWUpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gLQlyZXQg
PSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCAwLCAodm9pZAo+
ICopJm1ldHJpY3MsCj4gLQkJCSAgICAgICBmYWxzZSk7Cj4gKwlyZXQgPSBuYXZpMTBfZ2V0X21l
dHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7
Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gCj4gQEAgLTkyNywxMCArOTUxLDcgQEAg
c3RhdGljIGludCBuYXZpMTBfZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudChzdHJ1Y3QKPiBz
bXVfY29udGV4dCAqc211LAo+ICAJaWYgKCF2YWx1ZSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAK
PiAtCW1zbGVlcCgxKTsKPiAtCj4gLQlyZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RB
QkxFX1NNVV9NRVRSSUNTLCAwLAo+IC0JCQkgICAgICAgKHZvaWQgKikmbWV0cmljcywgZmFsc2Up
Owo+ICsJcmV0ID0gbmF2aTEwX2dldF9tZXRyaWNzX3RhYmxlKHNtdSwgJm1ldHJpY3MpOwo+ICAJ
aWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+IAo+IEBAIC05NjksMTAgKzk5MCw5IEBAIHN0YXRp
YyBpbnQgbmF2aTEwX2dldF9mYW5fc3BlZWRfcnBtKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUs
Cj4gIAlpZiAoIXNwZWVkKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IAo+IC0JbWVtc2V0KCZtZXRy
aWNzLCAwLCBzaXplb2YobWV0cmljcykpOwo+IC0KPiAtCXJldCA9IHNtdV91cGRhdGVfdGFibGUo
c211LCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsIDAsCj4gLQkJCSAgICAgICAodm9pZCAqKSZtZXRy
aWNzLCBmYWxzZSk7Cj4gKwlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0
cmljcyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gIAlpZiAocmV0KQo+ICAJCXJl
dHVybiByZXQ7Cj4gCj4gQEAgLTEzMjUsNyArMTM0NSw3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3Ro
ZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4gIAlpZiAo
IXZhbHVlKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+IAo+IC0JcmV0ID0gc211X3VwZGF0ZV90YWJs
ZShzbXUsIFNNVV9UQUJMRV9TTVVfTUVUUklDUywgMCwgKHZvaWQKPiAqKSZtZXRyaWNzLCBmYWxz
ZSk7Cj4gKwlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7Cj4g
IAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gCj4gLS0KPiAyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
