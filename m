Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9718D350
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 14:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB176E2D5;
	Wed, 14 Aug 2019 12:37:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083656E2D5
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 12:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3rkXpIGsF1d6ziKPUf94oeueax/xZyruJgptZJVfubTdAS5J13Ap4bKprMMWAlWLc0NzO/bjy/aKVw7fnXRcAdYEjhew6lWDgiqNnRAfOp3ktr7SI7q+kSZdoupmWDMONv4R68Wxw5ZlYkqfAzTWbpvdGEHffW0LCVjyxZ86KZGQwoO+WLraYLH8LW+6/6GqhW/f/RkHZh8RBKZz8bg/2Cv4dx2oLZaBVdJEAIlOHGOGFSe/INwmMy2l0EqkZtn9o6Uo4rDHYj+R8iYNDhaCX7sCj4EYxasjjZwuzf4iejJuGz8Vx4/BOVQnW1juMnQYP0RL1E1X62fV7x8YfOpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ntxhfJRtqebDEyNyVav9Hh2TREdRonAfTfGwYj7Zs=;
 b=PYFrvRxx06KYIHFmGPWRQRYVptJ1RUoQZzett10kgHXgrCDG/kt6tC3skvY8r68tjmtMgfTUfuwE1ax9r2j5tMqEqo2AEZFv6IzEHuyyYWjzhh08piSqMJPT84hPH1QUoTGLGCIPq+Ope8jwOF2/Q5v+goHvWx0NDEhn0RRSwtSV+D4pVKP3WYkH4K0ZuZWG4k3ECkAhuJOUeGj5nIbdDwDGXRWki+1uLkO8AsaBEm/VKRQLdaR3CYx84LFuq4iYLQqSH4dw4VlganGqYYMoXqN+7JOM1roPDDNJ+7Cv3O3Iyy2DrFliLuUGKC9CVwZuHLq4NBC/66G7JeU5aEUJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1898.namprd12.prod.outlook.com (10.175.88.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Wed, 14 Aug 2019 12:37:12 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 12:37:12 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add smu if version for navi12
Thread-Topic: [PATCH] drm/amd/powerplay: add smu if version for navi12
Thread-Index: AQHVUpOZGl1F5AG72k6/lyl5BfYTZKb6lK9g
Date: Wed, 14 Aug 2019 12:37:12 +0000
Message-ID: <DM5PR12MB14188BB737D446728D222F01FCAD0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190814112940.10644-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190814112940.10644-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da88d629-a5eb-49cf-042d-08d720b42193
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1898; 
x-ms-traffictypediagnostic: DM5PR12MB1898:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18985F105623A0AD1663A7ECFCAD0@DM5PR12MB1898.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(13464003)(6436002)(52536014)(316002)(8676002)(305945005)(25786009)(66556008)(66446008)(76176011)(54906003)(14454004)(55016002)(64756008)(110136005)(486006)(6116002)(11346002)(66066001)(256004)(446003)(53936002)(33656002)(9686003)(7696005)(66476007)(476003)(5660300002)(229853002)(3846002)(81156014)(99286004)(8936002)(6246003)(26005)(76116006)(186003)(81166006)(74316002)(7736002)(71190400001)(53546011)(4326008)(2906002)(102836004)(6506007)(66946007)(71200400001)(2501003)(478600001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1898;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EZMxUnC99N3Zni5cOkapEksgzSOjKXhdGKfqES8q/gvcU9VfwrYVrC2eeTrCLX21NmAbN3RyA3rKO3lXekgMIWEtbgpMWTiN7G9JTFP2/nAhkC7uQaIne4LIJZW7tShpUrwXb+5ynPSiDF+OERIWb41fhrFmQC69Ew/jWaeTRPzt1H4eUBzxH7ByH4Dgmy3vKxx7LGo4mflEPnbsG9IbhlW5oS9CqRTXYXPduBb76agPJXx+ehVvIS1Rd4hRQijjTTY5yi/W0hY+I7rYcpgCZZDl5NWqi7mnnJkonPGPMjC4ikjXhcqhw7bNw6MhVcIBjnirWEGs5O6fSvxQP63LLWU0Ql4Ncb0ys+7OJ7ATYBJhTNEMNzBOiFjI89SXim5GqSDPm/dVsUSgtkFnzOmgJ8uLjgVHEOd0+JIKpGJy6Pg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da88d629-a5eb-49cf-042d-08d720b42193
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 12:37:12.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAAQWdkqa0/D95nh+tD8oh1q/75jDgzWw2wYWf3dRb6Xo6Ie3jx6sJBdrq6YzrlqG7WiHC/20nv3ViVu4Fq/aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1898
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ntxhfJRtqebDEyNyVav9Hh2TREdRonAfTfGwYj7Zs=;
 b=odv4UW2Bc0cKnegPu+kRoROtvtMALE9hc+piBganKkmsgcmgVOM36srcbCxSc8AWxsiS7BfU65B/uM05soNMVov84t5DXKEmD3zapoK6Xj6wGJP93VBYrY5BIGnDBfaHPzuBs1O/r7J3i/vMPFDwT7Jr050Ir9kywGzwRmlETQE=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDE05pelIDE5
OjMwDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2lu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+
OyBZaW4sIFRpYW5jaSAoUmljbykgPFRpYW5jaS5ZaW5AYW1kLmNvbT47IFdhbmcsIEtldmluKFlh
bmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFt
ZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgc211IGlmIHZl
cnNpb24gZm9yIG5hdmkxMg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3Nt
dV92MTFfMC5oIHwgMSArDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgICAgIHwgMyArKysNCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFfMC5oDQppbmRleCA5NzYw
NWU5NjNjMmIuLmViMDRkMDY3NTdkMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9zbXVfdjExXzAuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaW5jL3NtdV92MTFfMC5oDQpAQCAtMjgsNiArMjgsNyBAQA0KICNkZWZpbmUgU01VMTFf
RFJJVkVSX0lGX1ZFUlNJT05fSU5WIDB4RkZGRkZGRkYgICNkZWZpbmUgU01VMTFfRFJJVkVSX0lG
X1ZFUlNJT05fVkcyMCAweDEzICAjZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05WMTAg
MHgzMw0KKyNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT05fTlYxMiAweDMzDQogI2RlZmlu
ZSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjE0IDB4MzMNCiANCiAvKiBNUCBBcGVydHVyZXMg
Ki8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQppbmRleCA5MWRm
YWUxYTJiMTYuLjFlNzY2YThhODQ0NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYw0KQEAgLTI3OCw2ICsyNzgsOSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9j
aGVja19md192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KIAljYXNlIENISVBfTkFW
STEwOg0KIAkJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OX05W
MTA7DQogCQlicmVhazsNCisJY2FzZSBDSElQX05BVkkxMjoNCisJCXNtdS0+c21jX2lmX3ZlcnNp
b24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTl9OVjEyOw0KKwkJYnJlYWs7DQogCWNhc2UgQ0hJ
UF9OQVZJMTQ6DQogCQlzbXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTFfRFJJVkVSX0lGX1ZFUlNJ
T05fTlYxNDsNCiAJCWJyZWFrOw0KLS0NCjIuMjAuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
