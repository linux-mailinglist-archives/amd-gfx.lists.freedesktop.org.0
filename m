Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1967760C
	for <lists+amd-gfx@lfdr.de>; Sat, 27 Jul 2019 04:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66E46EE7F;
	Sat, 27 Jul 2019 02:41:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254FF6EE7F
 for <amd-gfx@lists.freedesktop.org>; Sat, 27 Jul 2019 02:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic5joSCfpYjex/p2UwHSCLJNKmS67l87HuC5Gg6EYMOGWjkaxighayTsTgg8J2lx8vXstqyK9mDw+QIKHSyTSZBl+odLbW6vR+1LLDj/ocBsSwlaDzgcT8YVNssrReVCN3UcGq/ySneQDIJ+BkSOAtL8wiKZNKtbjr0YjzHlpWXw8jIqzGEhqTDhufLtPavE8yBmrCf06RX1635VoTSDlVX/hIpcvpW69Tv+a2W+GQ79SXLA1Qr7C66gSnpbB/JC9tXBn0JBLIqEx5/gJSgP2NRN1b6wuHM733sH1Bcky2UMbUhQeT3hLQNGRnp25aKEeASxnRkZ4JktXp8PSajkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ2ed/hgUX4xKQp0Q5y+f6qfY3fA2g2ommcNYUGOVp4=;
 b=chIi49ArSWyHlenyi5UU0A+f0vec2E9F65xg6lHM0gdgIBTG4rG4aW+XUEYRpSvtollDTrJw3jlwfKu5zqIN0e4e9d4MiIxEa3a4J14f86OhUGSzyXWUJ7HNOmV5iHoTc0kTd4R1TXRarBWsGraFeNxfKndcq1i48XYm2JM782nJErcaTM12ImXDoS9i+7Luv8k5EKSQzxNpJQ3PwMW/FXpsjEH3SlKVFlZZaJom3qXEsxmnjU0o63x5A8HcAxTsNCBJyulWac6gfu/RiM2ZSyomkzWP6YfAyZ+5T+/p+dg656CECH5bhIC1zG2InXdE9TwifzLqgj7OJdVGUQViOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Sat, 27 Jul 2019 02:41:29 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2094.017; Sat, 27 Jul 2019
 02:41:29 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/gfx10: update golden settings for navi14
Thread-Topic: [PATCH 1/2] drm/amdgpu/gfx10: update golden settings for navi14
Thread-Index: AQHVQ+aifgP8JLsgyEiGNvXgPwWSd6bdwbIn
Date: Sat, 27 Jul 2019 02:41:28 +0000
Message-ID: <BN8PR12MB3602F0F7763810A749D093EE89C30@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190726191615.20351-1-alexander.deucher@amd.com>
In-Reply-To: <20190726191615.20351-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [121.239.131.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49f67b0c-7828-425d-0d51-08d7123bed63
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3283; 
x-ms-traffictypediagnostic: BN8PR12MB3283:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB32839751E3190741AFBBCD4B89C30@BN8PR12MB3283.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:240;
x-forefront-prvs: 01110342A5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(15650500001)(6436002)(966005)(53936002)(9686003)(5660300002)(8936002)(6306002)(53546011)(2501003)(229853002)(33656002)(256004)(66066001)(4326008)(2906002)(6246003)(102836004)(6506007)(52536014)(14454004)(74316002)(76176011)(81166006)(81156014)(8676002)(26005)(7696005)(186003)(68736007)(66946007)(486006)(305945005)(66476007)(64756008)(66446008)(14444005)(76116006)(86362001)(99286004)(446003)(11346002)(476003)(71190400001)(6116002)(3846002)(55016002)(71200400001)(91956017)(25786009)(110136005)(7736002)(478600001)(316002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3283;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jCAAT/eJhb+80jLzuHh6mZNnfl6lAQp6o6dLrKKWNsL7DUJ8ZbB6KTlyjRCneVMA6Yc6LEE7HBBueytGGzfikukQLoghPz6gXBkC4ZJ2K6exP5TJcEoyQX+z5n4kcHWmRxKx/QyPeIvdn5DyLu/7EeAFkgdmqSSs1zu5eyAAdR0ixGlXxpyKG3zSZmPM9G5hiBA+8FoOZB1wgHpk31TCRUn8X0Y9uUwxs5bm40mnUjoOg1aqGoYECLxnU2YMLZ4YStP78HEQIGkodG8OWAodh6k+eQhhA1A1nrMOmpq6hlmFgkhxPR9J1TeY6+B3eb11sIYYJ48yT9tgqCILEo04bZfOVNl2ZZUyAAby3yBsETZYjWNBActYW4yqb7WmaJlXzunqEv6Tis9F6ZaFpJIH3gc+cPa36fXavhZH/+P/HCM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f67b0c-7828-425d-0d51-08d7123bed63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2019 02:41:28.9207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3283
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ2ed/hgUX4xKQp0Q5y+f6qfY3fA2g2ommcNYUGOVp4=;
 b=Di0E6XSF/bycESkjt6tYB9ejOFNWYV6M9EV6yGzgCOSa3LTo4M8TdE+lFkMtZyNA2U5XtONXkE3wYil7BZGlOSVQ4vKJX3riIzPu+U7AkA2bw2etJZZV6piD5zLSQFOgkyX6SbHT4HkO5E08t4H8jGPmMKpcT+d3CZFeXpitgSw=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IFNhdHVyZGF5LCBKdWx5
IDI3LCAyMDE5IDM6MTYgQU0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBE
ZXVjaGVyLCBBbGV4YW5kZXIKU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdS9nZngxMDog
dXBkYXRlIGdvbGRlbiBzZXR0aW5ncyBmb3IgbmF2aTE0CgpVcGRhdGVkIHNldHRpbmdzIGZvciBo
dyB0ZWFtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMKaW5kZXggNjE2MjcwM2UyMGQyLi44ZTdlNjI0OTJiZmIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC0xMzgsNyArMTM4LDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xXzFbXSA9
CiAgICAgICAgU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERUJVRzQsIDB4ZmZm
ZmZmZmYsIDB4MDQ5MDAwMDApLAogICAgICAgIFNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAs
IG1tREJfREZTTV9USUxFU19JTl9GTElHSFQsIDB4MDAwMGZmZmYsIDB4MDAwMDAwM2YpLAogICAg
ICAgIFNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfTEFTVF9PRl9CVVJTVF9DT05G
SUcsIDB4ZmZmZmZmZmYsIDB4MDM4NjAyMDQpLAotICAgICAgIFNPQzE1X1JFR19HT0xERU5fVkFM
VUUoR0MsIDAsIG1tR0JfQUREUl9DT05GSUcsIDB4MGMxODAwZmYsIDB4MDAwMDAwNDMpLAogICAg
ICAgIFNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0NSX0dFTkVSQUxfQ05UTCwgMHgx
ZmYwZmZmZiwgMHgwMDAwMDUwMCksCiAgICAgICAgU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywg
MCwgbW1HRV9QUklWX0NPTlRST0wsIDB4MDAwMDA3ZmYsIDB4MDAwMDAxZmUpLAogICAgICAgIFNP
QzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0wxX1BJUEVfU1RFRVIsIDB4ZmZmZmZmZmYs
IDB4ZTRlNGU0ZTQpLAotLQoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
