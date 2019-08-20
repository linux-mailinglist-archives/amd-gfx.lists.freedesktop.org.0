Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11365957B0
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 08:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1BD6E5E8;
	Tue, 20 Aug 2019 06:51:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CB86E5E8
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 06:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee+VBYlbntNLG222RGrDBfso93cldYEgWwNehLG9BUSIr1+J7Ujc/+Wjk79pzJ0t9cwMs6O3tZhs9ufovt61ctGZqgwv8g2sDo35x7jL3krya0SBLNO5fjLMHUBwlzX44dXM9WaGWddg5V1GCZDY3vnMlUS8YNbyAyyaSOO6/cgy0o+Y+6RiAnOR+AYMxt5N64VQmR/TNeEaiYuaJsHfozFq9T2z9Wur6Oo/bY0REeZQ+yh2iuhI+v1p5hFAUAcYoIiFMlIPP0+qhkr/+ZuPfYea/lhhXmrbW7Bv7a6XsFG0BCW8f7M6DkZnQZ1iMonWBi/iMRJ1VSj8mH2UIayyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxyHuRyqHrR3o5FwDid1SKoL3MxS6NQQY6XBuq2FG+w=;
 b=oe8DbxYAdcvyUQuSey9hPWxVOdeSSMYfqipKkQ10v7Kz7YpX7T5j5s+EeSCM+jTrfDx0qZDY01+kpFrttf0ryrL1+7EWJR3ioHcK2oU2Xd8wUksqFIUkLhwQlRRgHFkhRxsD3rVpG4fYQAn7FSjxoz5Ygb+FdxPT+EPVblEozXfr/cn8yHCXkC1mg2KsQgVLgdXVPeUCXpW9dCgN+ezG6//13Xni9Epjp0zyPJkOMwkIjmZ/Jt70dQT7yjKJQrt3cp9NLpzmYCFveQVaBK9SCb58HotON0yy7KObkChpFcdBirUCbfgeJXfELeLS9G/QbHjbwEQbFI+u4i4StXFf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 06:51:50 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 06:51:50 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: disable MMHUB PG on navi10/14
Thread-Topic: [PATCH] drm/amd/powerplay: disable MMHUB PG on navi10/14
Thread-Index: AQHVVyFLj4o8QPVbb0mRpFKjldGoE6cDmO5g
Date: Tue, 20 Aug 2019 06:51:50 +0000
Message-ID: <DM5PR12MB14183EF7144894962032471CFCAB0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566282828-12032-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1566282828-12032-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82f12817-5003-4ada-85e5-08d7253ae0e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1546; 
x-ms-traffictypediagnostic: DM5PR12MB1546:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1546CD64F3A6337737A2588BFCAB0@DM5PR12MB1546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(199004)(189003)(13464003)(6436002)(8936002)(256004)(9686003)(99286004)(76176011)(33656002)(4326008)(6246003)(966005)(7696005)(478600001)(14454004)(25786009)(71190400001)(71200400001)(11346002)(53936002)(186003)(26005)(102836004)(486006)(110136005)(446003)(476003)(66066001)(53546011)(2501003)(6506007)(2906002)(316002)(3846002)(229853002)(6116002)(7736002)(55016002)(76116006)(8676002)(74316002)(5660300002)(86362001)(66946007)(66476007)(66556008)(64756008)(52536014)(66446008)(81166006)(81156014)(6306002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1546;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IUkls/MH/5PvlRLFD+YQiElWsIFcFtr+1QnDPQYYz/wJt7eyLwBUhKvmCvE4FRpsRhAs0CbTpl9bVDPnPR0VX0m/qmuOrnj0D6+5Y3aRjGLeSMmrlQ5Q7gHKqxUFfn+yKEXFmBgfLx1Xd0eO6e+9Y3AtKCRjHuq4XwTVZfkn604YaF27vTCc5FPZmuOwSyDWYj5rKm9DIsoT/zhZ1GIIHMC5DXjd4a0y/1ul8+bd/fTwW82TtdYM5aC/2rGnM0kOeeYSJr/OCvc/RTrgqW8KCPeOyPozYUEAz1OUG6X7mLL2DqbgLt4RzTY2N+neRbyH5MZiGz0gc5YZ/gVTaUOGUKi/OOvtfDc2h6edjJ8SGPckkrhfYtjyQcIsD2RaiXov0M3SccgrM/hgd/7mm4TBeQZkMEQ0cRQ8GSigvQjW9+o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f12817-5003-4ada-85e5-08d7253ae0e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 06:51:50.5402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSNfnTqSsRy7rnP2n6rxqSjFjD6ZMhaFtDgx52K2B08QyVKMhPid64t3xk4WI1OztK2iLZABtp9nYTdr0um1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxyHuRyqHrR3o5FwDid1SKoL3MxS6NQQY6XBuq2FG+w=;
 b=3oxKIt476iezWpsayAedWN46X5K2Pi2ldN7v76/qenfEgwsoewRqlJb2pvy2/QdWD6tIwP8CzFNlSrBEQI5x/r/il8ePJMKXAoTa+QJ0iAxiJKmHI57M67wbq/4PSoaZeBITiAGk2mg6vWGUq6P7wWkWSZRkZBbO4YlatIYgUFA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgS2VubmV0aCwNCg0KV2Ugc2hvdWxkIGNvbnRyb2wgUEcgZmVhdHVyZSBvbi9vZmYgZnJvbSBu
dl9jb21tb25fZWFybHlfaW5pdCBieSBzZXR0aW5nIGluaXRpYWwgdmFsdWUgb2YgcGdfZmxhZywg
aW5zdGVhZCBvZiBoYXJkLWNvZGUgaXQgZnJvbSBTTVUgc2lkZS4NCg0KUmVnYXJkcywNCkhhd2tp
bmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2VubmV0aCBGZW5nDQpT
ZW50OiAyMDE55bm0OOaciDIw5pelIDE0OjM0DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4NClN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGRpc2FibGUgTU1IVUIgUEcgb24gbmF2aTEwLzE0
DQoNCkRpc2FibGUgTU1IVUIgUEcgb24gbmF2aTEwIGFuZCBuYXZpMTQgYWNjb3JkaW5nIHRvIHRo
ZSBwcm9kdWN0aW9uIHJlcXVpcmVtZW50Lg0KDQpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcg
PGtlbm5ldGguZmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jIHwgMyAtLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KaW5kZXggOTIw
MTU2ZS4uOGIzMDZkMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jDQpAQCAtMzYxLDkgKzM2MSw2IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21h
c2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQogCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNr
ICY9IH5GRUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKTsNCiAJfQ0KIA0KLQlpZiAo
c211LT5hZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX01NSFVCKQ0KLQkJKih1aW50NjRf
dCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9NTUhVQl9QR19CSVQpOw0K
LQ0KIAlpZiAoc211LT5hZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX0FUSFVCKQ0KIAkJ
Kih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9BVEhVQl9Q
R19CSVQpOw0KIA0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
