Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70B9B339
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68D66ECC6;
	Fri, 23 Aug 2019 15:21:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B636ECC6
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 15:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/51NlDqA0RJV4DamIziutU+vE77qgf6BOKZ4eJZnN/AUk7VozGexy6LfVWLLY+luXDqVyxHgPqYci1xf8JEvlvIBz4FRjlO9TLGv8MG1rU2HfBvncRRh4Ma2Sdb+VpEVq0ky/K/iBZvrV2jDi4RT9AUGMH5JBAnIgnnNsambqilFuFqqMVmp3KVTEtFynv6rJp6x+wQsq+3vlbgjsak341hj8G/TBcjlU3qSH6XAHXFbzacp0vf2RG0z2hrpAvPXIGwm1uR7QsvJdXtFazj5K/r2H1mm1UUcEr2jfFE5UsyNsRnEbIkEkuwkKpAs4mlb/5ENfmNcZPPp8YKxOMn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STOiDxybqrt1Aaa20Y57Q5ZSDWl8EHd6nkj24V43jk4=;
 b=KIbCdlw0TTzz/WlH1kc9zX7wGfU5ARqNSVzUj1nuUEylX4FQ2VSj/2DkMrnhrA0g+4zWivLHr1Uk9xH+8qjIAdbGm4MpWhadhKubU/f7SaMZxDIq9Y8R2ADIs9asaAV7i+hZai59LViI3FXA2hY13DusLasp+Px5t/2scNmvWGihGWWsVyjBxQrXcmYJnvF9jvB/bhqV7RbrRGzhHKCpynXkKaL5gAqwLA+g9TXy/EmqOQtUGwonebbnUaICRoBpNdKB7V4YyufAO9XOQyNopR83TL2U7HXWbTD+2QFW7Z7+o/z6vwYBQKPFizI+rtxIQ24ehIVj64gyvuVo0RTCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3380.namprd12.prod.outlook.com (20.178.210.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 23 Aug 2019 15:21:53 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::acf1:c2b4:2a91:c12%6]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 15:21:53 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: set adev->num_vmhubs for gmc6,7,8
Thread-Topic: [PATCH] drm/amdgpu: set adev->num_vmhubs for gmc6,7,8
Thread-Index: AQHVWcFuoWpimytlk0i1PTF/O5IlyKcI2Xnc
Date: Fri, 23 Aug 2019 15:21:53 +0000
Message-ID: <B8D97B9E-4D80-41C9-A10F-0F65F2DBE391@amd.com>
References: <20190823144514.21354-1-alexander.deucher@amd.com>
In-Reply-To: <20190823144514.21354-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [121.236.120.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad70ce07-6c43-48ef-82f9-08d727dda09d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3380; 
x-ms-traffictypediagnostic: BN8PR12MB3380:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3380294E4D048C713D8EFC3789A40@BN8PR12MB3380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(199004)(189003)(3846002)(5660300002)(2616005)(6916009)(64756008)(66556008)(446003)(11346002)(476003)(186003)(6116002)(91956017)(76116006)(229853002)(8676002)(486006)(66946007)(76176011)(66476007)(81166006)(4326008)(36756003)(256004)(66446008)(7736002)(305945005)(99286004)(478600001)(316002)(86362001)(53936002)(6436002)(14454004)(1411001)(25786009)(81156014)(2906002)(6512007)(33656002)(6486002)(6306002)(26005)(66066001)(102836004)(8936002)(53546011)(6506007)(54906003)(71190400001)(6246003)(966005)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3380;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9oPBQQQlZuEV78GWkDgCMAzS7NQl+L5lkl/FJY1HHicjqLRb940iF9Ux3Ge+1yfedmMHtDfpS+ZqC/oY1SBCwH0Z0PpXpzsvt7LnTe+PMcAY8Z+TilzgFlbhSowitK/Fk6tJkZl8h96THU56ubsmYh+k03gh29UxQlTgpQlIM20gvu7bUkCRlSDTignLJkzXAHHUUw0v1tcSd2Sr/nvlxEE6l3SbvFXRsyxKGADzkEeU5ElKKMEHT6cR+lgCPe8q9le9dZIVzMctIxv+Gg0BMUQsBvkd9vbjNSiuFgtkiQRc4gl+3z5hTfT789DgMGHBKyPDvv46x1PcZEx0sApm2Fr8N6ifH8B3rv0Mx6mRRWtZMIZi/Jb6lEDOXNXs7vS5ttRhiN8wnRLbAopznxGtkMmiTvpz9113pRRx6nyfKsw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad70ce07-6c43-48ef-82f9-08d727dda09d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:21:53.0628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCzX7MogxbuJNCPVfd00s46fn/xyIbLn2DELofx4+CKKW2qenIj3H36zMl/G/ska
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STOiDxybqrt1Aaa20Y57Q5ZSDWl8EHd6nkj24V43jk4=;
 b=vPNw3Ac9dbklwYXj8RyMF+5EMjD7UeNI3NGhnzPqzYIVwU8F97XJ1P/Gd+h8eRV4TItuRFoQZ0kf8F7LJoyu1jJQfiXPxaCvE5ec7yXdq7hw5F6V7dUEHfK0GakHFQ3ujr5A2+TI4zeMkTeNwZ/1Ol0bBJqhB1ZmVIWqHocxRHU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKPiBPbiBBdWcgMjMsIDIwMTksIGF0IDEwOjQ1IFBNLCBBbGV4IERldWNoZXIgPGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gU28gdGhhdCB3ZSBwcm9wZXJseSBoYW5kbGUg
dGhlbSBvbiBvbGRlciBhc2ljcy4KPiAKPiBGaXhlczogM2ZmOTg1NDg1YjI5ICgiZHJtL2FtZGdw
dTogRXhwb3J0IGZ1bmN0aW9uIHRvIGZsdXNoIFRMQiBvZiBzcGVjaWZpYyB2bSBodWIiKQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiAt
LS0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jIHwgMiArKwo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgfCAyICsrCj4gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y4XzAuYyB8IDIgKysKPiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwo+IGluZGV4IDU2
NGZiMWNlMjkyZi4uMzI2NDU0OGUzNzVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192Nl8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjZfMC5jCj4gQEAgLTgzOSw2ICs4MzksOCBAQCBzdGF0aWMgaW50IGdtY192Nl8wX3N3X2lu
aXQodm9pZCAqaGFuZGxlKQo+ICAgIGludCBkbWFfYml0czsKPiAgICBzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKPiAKPiArICAgIGFk
ZXYtPm51bV92bWh1YnMgPSAxOwo+ICsKPiAgICBpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBV
KSB7Cj4gICAgICAgIGFkZXYtPmdtYy52cmFtX3R5cGUgPSBBTURHUFVfVlJBTV9UWVBFX1VOS05P
V047Cj4gICAgfSBlbHNlIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKPiBp
bmRleCA5ZTZhMjMzMDRmZDcuLmNjMGFhMTc4ZWIyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y3XzAuYwo+IEBAIC05NTksNiArOTU5LDggQEAgc3RhdGljIGludCBnbWNfdjdf
MF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPiAgICBpbnQgZG1hX2JpdHM7Cj4gICAgc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4gCj4g
KyAgICBhZGV2LT5udW1fdm1odWJzID0gMTsKPiArCj4gICAgaWYgKGFkZXYtPmZsYWdzICYgQU1E
X0lTX0FQVSkgewo+ICAgICAgICBhZGV2LT5nbWMudnJhbV90eXBlID0gQU1ER1BVX1ZSQU1fVFlQ
RV9VTktOT1dOOwo+ICAgIH0gZWxzZSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhf
MC5jCj4gaW5kZXggZjdkNmEwN2JhNGUxLi44OGYzYTE3MTQ1MmYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKPiBAQCAtMTA3OSw2ICsxMDc5LDggQEAgc3RhdGljIGlu
dCBnbWNfdjhfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPiAgICBpbnQgZG1hX2JpdHM7Cj4gICAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5k
bGU7Cj4gCj4gKyAgICBhZGV2LT5udW1fdm1odWJzID0gMTsKPiArCj4gICAgaWYgKGFkZXYtPmZs
YWdzICYgQU1EX0lTX0FQVSkgewo+ICAgICAgICBhZGV2LT5nbWMudnJhbV90eXBlID0gQU1ER1BV
X1ZSQU1fVFlQRV9VTktOT1dOOwo+ICAgIH0gZWxzZSB7Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
