Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10216A44C
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0CB6E0D1;
	Tue, 16 Jul 2019 08:53:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DA86E0D1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfOLLJDusZcOUGSHiSI5cv4IgQNsRDnaB94ua8PX5XwiXfEZDhgkKw3F8BKFToGFLjKmTrIoLQVt2sWiTZMCMwzuC7Xb8+TXBImJYFqeQ4uGw8TaejCBZZFPpxZijAHT14zY13ktSXbH03UgXSQ7RLpVzOzxjswYcyquosMjuYay+THoU3pCsLp1D60inhPqq6tCgFyACuPx4D56++DXKHiQp1xPSDUXr++3YUmRmPfd07ZeupFXzXjhMMhSud1GJbmHz6UolUvTmeWQnbKjqb1feHgpwPL2m3w5qj462iMPQBn+WohS/NM0YgYCXGJYnYD8FPmpuop/V/rSQZj5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9YOY7bLECN9hoxAlrC/R7YM+6JvzSXRdCU6/sG09r8=;
 b=NvffeLZju7l4/9JBNWkN61YmI1VqMwc38//QibF7d5AKnXRcpwwcJc4mCTmMtSVAGlkrQSbay1mZWF9yTU5zbq1pScdxS17DpZYZzmDLpowFX04iY3WN6nTpV4K0ISF3Q33k75a6Zq6jJ9AOiuNxqdNFntRMdYSz80VSUyttCfI0VrR/9b38/VECxvhOl1w8n8WmYVlbmC+h7uofDOQnpVDVEALiuSNFmH6xJv8lCOPQrV/CkYDXEE5DUAvz5scgFDT/klLWuS2TPa6QJ8He2R/iYZBFCUDGiTOd/P8fqsD35SowOOwFeNpm9d7nSyhLZK6NO0b/CH+zo6LiqJDhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3101.namprd12.prod.outlook.com (20.178.241.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 08:53:35 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 08:53:35 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: maintain SMU FW backward
 compatibility
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: maintain SMU FW backward
 compatibility
Thread-Index: AQHVO7Og8KheyebIEECnzetVWjkjoqbM8GMw
Date: Tue, 16 Jul 2019 08:53:35 +0000
Message-ID: <MN2PR12MB3598699DFE48E022FBAD11ED8ECE0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190716085049.4613-1-evan.quan@amd.com>
In-Reply-To: <20190716085049.4613-1-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0159232b-0183-4dda-8b2c-08d709cb1697
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3101; 
x-ms-traffictypediagnostic: MN2PR12MB3101:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3101E1725D8D6DF6C48948DB8ECE0@MN2PR12MB3101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(13464003)(199004)(189003)(76176011)(6506007)(53546011)(4326008)(66066001)(52536014)(6436002)(86362001)(7696005)(2501003)(486006)(102836004)(71200400001)(99286004)(25786009)(55016002)(7736002)(5660300002)(76116006)(2906002)(6306002)(68736007)(66946007)(476003)(71190400001)(66446008)(64756008)(478600001)(66476007)(66556008)(229853002)(305945005)(14454004)(11346002)(446003)(53936002)(110136005)(33656002)(26005)(6116002)(54906003)(74316002)(966005)(3846002)(316002)(81156014)(6246003)(9686003)(81166006)(14444005)(256004)(8936002)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AJuZRm8Cj4MArZQkVtsynBEKMx0S1rVL1dZL7aR9lWNGcjnoin/OzoJvvrC5mmWlMzKhUeMUOg1zCsZWcShGAEUsRo9ewNSd/gLXYyqIe1pbKz7LXsIGLrfv48opD8l5l7nWTKjUfIKNLNddoc9LN8PJpjirFKMhPd63jZwN3I3TvS8jjw53Q3hrUrgmRTosoMYCm3I3IYkz4Cvp97yivtCCsnGmRKcyuwtQmANMTcRLEPrX2M4+/+EM1DEYMvFBgwTeP8CDRI03febZ1oyqX+aDW+kwdDdyfgIRTpzgIDtv/JrgRO/Qryf9uR+36QmkwrUBQh6xrd97MKYgCG9OfSrkdQjvdkJZ3n/kwlQZC1KrCUSCCSG7n7BF5i2NG16ILgmW06+sNl5e1LJSMUIIFuBpYw1Q9SwrrHt5VxUW6jQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0159232b-0183-4dda-8b2c-08d709cb1697
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 08:53:35.5977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9YOY7bLECN9hoxAlrC/R7YM+6JvzSXRdCU6/sG09r8=;
 b=b21fKHdwth0FhnIZzlT4HtLDEpy+3UszOO7Lcg/MI74taEgQMJLYtJW8O8Xm03kLfUZnqrguo6jIbvkROY1Hhe10mcO6TWBY9klMtcxIJ6dHr0mG/7hAk1tmwzuUrxlvubHOSoYOEmHfUuVgZRYhfg4kHRmL5NSg7WmX+GyXAYw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCBbbWFpbHRvOmFtZC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZiBFdmFuIFF1YW4NClNl
bnQ6IFR1ZXNkYXksIEp1bHkgMTYsIDIwMTkgNDo1MSBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBkcm0vYW1kL3Bvd2VycGxheTogbWFpbnRhaW4gU01VIEZXIGJhY2t3YXJkIGNvbXBhdGli
aWxpdHkNCg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpEbyBub3QgaGFsdCBkcml2ZXIg
bG9hZGluZyBvbiBpZl92ZXJzaW9uIG1pc21hdGNoLiBBcyBvdXIgZHJpdmVyIGFuZCBGV3MgYXJl
IGJhY2t3YXJkIGNvbXBhdGlibGUuDQoNCkNoYW5nZS1JZDogSTAxMjcxMjAyZDA4YTYyZTc3NWVm
YWJmYjY2MzEwZjZjYzc0MmI5ZGQNClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAu
YyB8IDEyICsrKysrKysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
DQppbmRleCBiYzRmOGRlNjI5YjUuLjEyYzY0ODJkMzdmNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KQEAgLTI2MiwxNCArMjYyLDIwIEBAIHN0YXRpYyBp
bnQgc211X3YxMV8wX2NoZWNrX2Z3X3ZlcnNpb24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpDQog
ICAgICAgIHNtdV9taW5vciA9IChzbXVfdmVyc2lvbiA+PiA4KSAmIDB4ZmY7DQogICAgICAgIHNt
dV9kZWJ1ZyA9IChzbXVfdmVyc2lvbiA+PiAwKSAmIDB4ZmY7DQoNCi0NCisgICAgICAgLyoNCisg
ICAgICAgICogMS4gaWZfdmVyc2lvbiBtaXNtYXRjaCBpcyBub3QgY3JpdGljYWwgYXMgb3VyIGZ3
IGlzIGRlc2lnbmVkDQorICAgICAgICAqIHRvIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUuDQorICAg
ICAgICAqIDIuIE5ldyBmdyB1c3VhbGx5IGJyaW5ncyBzb21lIG9wdGltaXphdGlvbnMuIEJ1dCB0
aGF0J3MgdmlzaWJsZQ0KKyAgICAgICAgKiBvbmx5IG9uIHRoZSBwYWlyZWQgZHJpdmVyLg0KKyAg
ICAgICAgKiBDb25zaWRlcmluZyBhYm92ZSwgd2UganVzdCBsZWF2ZSB1c2VyIGEgd2FybmluZyBt
ZXNzYWdlIGluc3RlYWQNCisgICAgICAgICogb2YgaGFsdCBkcml2ZXIgbG9hZGluZy4NCisgICAg
ICAgICovDQogICAgICAgIGlmIChpZl92ZXJzaW9uICE9IHNtdS0+c21jX2lmX3ZlcnNpb24pIHsN
CiAgICAgICAgICAgICAgICBwcl9pbmZvKCJzbXUgZHJpdmVyIGlmIHZlcnNpb24gPSAweCUwOHgs
IHNtdSBmdyBpZiB2ZXJzaW9uID0gMHglMDh4LCAiDQogICAgICAgICAgICAgICAgICAgICAgICAi
c211IGZ3IHZlcnNpb24gPSAweCUwOHggKCVkLiVkLiVkKVxuIiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgIHNtdS0+c21jX2lmX3ZlcnNpb24sIGlmX3ZlcnNpb24sDQogICAgICAgICAgICAgICAg
ICAgICAgICBzbXVfdmVyc2lvbiwgc211X21ham9yLCBzbXVfbWlub3IsIHNtdV9kZWJ1Zyk7DQot
ICAgICAgICAgICAgICAgcHJfZXJyKCJTTVUgZHJpdmVyIGlmIHZlcnNpb24gbm90IG1hdGNoZWRc
biIpOw0KLSAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQorICAgICAgICAgICAgICAgcHJf
d2FybigiU01VIGRyaXZlciBpZiB2ZXJzaW9uIG5vdCBtYXRjaGVkXG4iKTsNCiAgICAgICAgfQ0K
DQogICAgICAgIHJldHVybiByZXQ7DQotLQ0KMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
