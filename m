Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A818BBC0A8
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 05:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C074989EEB;
	Tue, 24 Sep 2019 03:18:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61289EEB
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 03:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqJjwEAMSFt+BFsXhgJviuWNqbp8xx3j8UyjRs1zwEbAg66Q7tBdQC3QsWy9MlI8jhDotVsVoPK5acn1GTMX/Gg0ghw/0z7AyGyaz1eVwumJLZavTzTf+Q0pwbyjvktI5ewZWCuI7EZ6wRQzT1XxGr0hBbsWzI+Jnv77H4FkKgpOdg9oYkvo8zkkuEYsT+MOuj8hkRaKLyOjVXc3NcqdcYdTJRhEz0yf4jsHjQOyYFNrjUxyurIot7evBLSoEL2K2ttk5GQ9JoCDhBFpVTdhZ9UQuUvHchfnb87x+CjN4tNF9TDIIIB7AFDQjidpIu5XdkrklrvOuXWrESq0FyzF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjEJlSPHgpfUPuEmfcm/h8pF9cu0+EVSO+/SPLy9tHU=;
 b=a4UiYvcTrq6U/WZTZEwTxUars3y5X3qUUSLbJv7P7W7+cyKczZRLgXme60J0XPla36dJ3DE3B1wq8Hvte7yz8DSApABhxP9lq3OtrxzwnhcBqN4H3yZGUHb7wSYpjcDr6zDM0/mJ7TopJHILUgiePpNOlLNHIfsvocX4qLncilM6Dgmx2ey/JJSjFYMTRRVsFnCOmukkZ1EuTuKtEkT9Rzcu9xcpHIJBlHr0F2XEVZH1f7mhMXjvbZxOAD7cIjsOfsNqLVt9MRbuvTaFJUZDl3rfMXU5g4HbnclzyERGkczv5So8s0WRskKNF200SJMfqHZ6P9BjjLYSdHiCKumA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3187.namprd12.prod.outlook.com (20.179.66.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 03:18:29 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::edf4:61b:cc25:dc4b]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::edf4:61b:cc25:dc4b%4]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 03:18:29 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi12
Thread-Index: AQHVcoRJ/hPL7jNvCkCPVhA00il2HKc6J2VQ
Date: Tue, 24 Sep 2019 03:18:29 +0000
Message-ID: <BN8PR12MB3329DDCAF8D6276EFDB2AA9AE4840@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20190924030042.5545-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190924030042.5545-1-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 986b6669-1c0f-4255-f915-08d7409ddf35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3187; 
x-ms-traffictypediagnostic: BN8PR12MB3187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3187059AE863EED7465F28D2E4840@BN8PR12MB3187.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(13464003)(66946007)(66476007)(66446008)(66556008)(64756008)(86362001)(5660300002)(8936002)(2906002)(6246003)(66066001)(52536014)(256004)(14444005)(4326008)(2501003)(110136005)(316002)(54906003)(33656002)(3846002)(76116006)(6116002)(478600001)(74316002)(81166006)(81156014)(7736002)(8676002)(25786009)(305945005)(71190400001)(71200400001)(476003)(11346002)(14454004)(486006)(446003)(53546011)(186003)(6436002)(76176011)(6506007)(102836004)(7696005)(26005)(9686003)(55016002)(229853002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3187;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lwG1GG2spD3+0QB9z65BHZKHuDi2sMBEv0uViJBuHjeNcVm33cGA6QAHPBPJ/2v3q7TflktBke2UelZqAkHPoJw7oNBZUEM72i+UGuWccJ88so1Wiz1uNVTyjMhAQ8LcZu8VirTOpK7kl5OeBy1A2SfD5BSjfJbGr1hMF0o16HdlacA4knAltIlaVRWBifT7Y1MT9Fov2m2yCYoIfWx0RQ+h3KiefZd2m/+RG245WxcSlLc91ZGzdG/ayvrZmmKP766qCFDpJPr+YgRTXicAOST1rWsvgRoC1hHl1Er0JS2jrI5o8RKOj0GHKZ/kfa17H1cqbGOjG0SYFC01rNfJDz6UwiVtUzyfkTJkWt98z/fijaNDRPqGcEBlsW9gfYdXXuF5nwPxNp57w266LbWGZXi7RJKMXoxR9b7rkvy6tuc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986b6669-1c0f-4255-f915-08d7409ddf35
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:18:29.2975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxbxU45zQXEG9unZjOuoCGL6mSD2Lk587dMp+t8Uei/zxcf7CIJpKJfVrNYFzUVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3187
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjEJlSPHgpfUPuEmfcm/h8pF9cu0+EVSO+/SPLy9tHU=;
 b=Z80CvoIOLpTkskQ303+b+pL9NdrAzenAa/27s2WL7hJqBv6hGFN/Z8r2rIhHB2cXywASmHgv2aGaP7wUAN3NpvHJWc0px2w0XC6+8wYxtJcFsNnEhKS/Xri1pe41R0D3U7s5Y/MRhd8PJ29Dks6KR17js8+XO9oYqVVbudDQv7Q=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QSBzbWFsbCBuaXRwaWNrOiBpZiB0aGlzIHdvcmthcm91bmQgaXMgbmVlZGVkIGZvciBhbGwgTkFW
aSBBU0lDcywgY2FuIHdlIG1ha2UgYSBtYWNybyBmb3IgdGhpcz8KZS5nLiAgI2RlZmluZSBBU0lD
X0lTX05BVklfU0VSSUVTKGFkZXYpICAgICAgICAgICAgICAgKGFkZXYtPmFzaWNfdHlwZSA+PSBD
SElQX05BVkkxMCAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gTkFWSTEyKQoKVGhlbiB3ZSBjYW4gdXNl
CglpZiAoIWFkZXYtPm1tYW4uYnVmZmVyX2Z1bmNzX2VuYWJsZWQgfHwKIAkgICAgIWFkZXYtPmli
X3Bvb2xfcmVhZHkgfHwKLQkgICAgYWRldi0+YXNpY190eXBlID4gQ0hJUF9OQVZJMTQgfHwKKwkg
ICAgIUFTSUNfSVNfTkFWSV9TRVJJRVMoYWRldikgfHwKIAkgICAgYWRldi0+aW5fZ3B1X3Jlc2V0
KSB7CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamllIDxYaWFv
amllLll1YW5AYW1kLmNvbT4gClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSAxMTow
MSBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFpoYW5nLCBIYXdraW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47
IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZh
bi5RdWFuQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L2dtYzEwOiBhcHBseSB0aGUgJ2ludmFsaWRhdGlvbiBm
cm9tIHNkbWEnIHdvcmthcm91bmQgZm9yIG5hdmkxMgoKd2hlbiBnZnhvZmYgaXMgZW5hYmxlZCwg
c2RtYSBoYW5ncyB3aGlsZSBlbnRlcmluZyBkZXNrdG9wIHdpdGhvdXQgdGhpcyB3b3JrYXJvdW5k
CgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYwppbmRleCBlZDFjM2I4ODNmNmEuLjAzMDRjYThmZTcyMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKQEAgLTI5MSw3ICsyOTEsNyBAQCBzdGF0
aWMgdm9pZCBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDMyX3Qgdm1pZCwKIAogCWlmICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxl
ZCB8fAogCSAgICAhYWRldi0+aWJfcG9vbF9yZWFkeSB8fAotCSAgICBhZGV2LT5hc2ljX3R5cGUg
PiBDSElQX05BVkkxNCB8fAorCSAgICBhZGV2LT5hc2ljX3R5cGUgPiBDSElQX05BVkkxMiB8fAog
CSAgICBhZGV2LT5pbl9ncHVfcmVzZXQpIHsKIAkJZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1YihhZGV2
LCB2bWlkLCBBTURHUFVfR0ZYSFVCXzAsIDApOwogCQltdXRleF91bmxvY2soJmFkZXYtPm1tYW4u
Z3R0X3dpbmRvd19sb2NrKTsKLS0KMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
