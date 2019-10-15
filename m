Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DDD7594
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 13:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBD16E22B;
	Tue, 15 Oct 2019 11:52:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE906E22B
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q37+QI7qht7x/chy1YFRuYcdlWk7DNwYf1/0vQBDhd7smWwrZbeKWZUoY66i+k00k1DQYzFozuPgz0jWU1AqLn12/eXrmIIH52QlaE7NPgVwP4OUzkMyqzoRI8zaZ7I6rdMA5zIym4VhQXDB61/ylkeyNwOaLyln4eIU7JA0+mPWijE0JFU1MXWrVz19E7V/oqjFWYOsi14WrYSDzI3XXsX3bLmt1MDQYZAF/p5iTA3mnm4BSVm2VwfhnDf4Z/xNahvKYNlZxu8+9pskycaW0ngwZj4wXwPXcq+FKtPlfPi4OwAv/BkRkAv7X8qmapq3evtKBmCr844LFl67NxT/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwAAqoTuDq4ruUY8BXB59IVTD/1gvok38UREvRvtc6E=;
 b=hPnbCoUj2BlbpwNRELgJW2enesE7hIcOW6/nozkvw8/2l3CD+yO5wbVpAEnAUpaF4z6MycJNNftiuVvi0/4o23gOSQDMMP5ERcdl2Lzws6ydsOKzziBVqFKyd4buhTokzCdHeCh11CS2ln4dxK/wbqqXsBsXXcfH46gjOLQTLShHtdYg0JcjBgtt6MAiRKWNWeCSrgfxVcVu/Iuc+PD1h8wBEegBQl1MIKV6Qr0BbPN9s1/Zb/zL5w3YhCdb8YdNXs0GW7PXwsEYTqHWUhWJeQL4BrnUTWEePiV8IE8OEjYqN7doJtjRVPhDcLERUWwDc5+kyiHxpRmBFvCXhWqW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3535.namprd12.prod.outlook.com (20.179.83.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 11:52:44 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 11:52:44 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: add GFX_PIPELINE capacity check for
 updating gfx cgpg
Thread-Topic: [PATCH 1/2] drm/amdgpu: add GFX_PIPELINE capacity check for
 updating gfx cgpg
Thread-Index: AQHVgz318e4aF3za/0uRK0h+sFXqK6dbl4YQ
Date: Tue, 15 Oct 2019 11:52:43 +0000
Message-ID: <MN2PR12MB3309C8F63970C95F8193766EEC930@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1571133012-19837-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1571133012-19837-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 936e03ea-c795-4a45-7eb6-08d7516630a0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3535483BF5F3C40D1A782153EC930@MN2PR12MB3535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(189003)(13464003)(199004)(316002)(7736002)(478600001)(74316002)(54906003)(2501003)(25786009)(305945005)(14454004)(110136005)(33656002)(66066001)(71190400001)(71200400001)(8936002)(81156014)(81166006)(8676002)(256004)(14444005)(99286004)(6506007)(53546011)(102836004)(7696005)(76176011)(66946007)(52536014)(5660300002)(446003)(11346002)(6436002)(64756008)(476003)(86362001)(2906002)(26005)(486006)(186003)(66476007)(66556008)(66446008)(3846002)(6116002)(76116006)(6246003)(55016002)(9686003)(4326008)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3535;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JXDIwxDKXCFXwvIc5e1M3XSihHJhp+TtIxBgQCJ1Q8Kenxvo8kSgpgnmHkC/to14ZrAq7Mqwk538GFVW9M8KQz3p5YHzBr9igqZdNUnqb+EnND3A7f1ZoZcsx52oaJJbRbo5DX5dLUtt0k9gXhvBqGy721Ksjt4pf3EClJLWo3dQ0xNEw+3Zb3eep5f02gUARNZj9FWeJV8jyQeqF8PsJTtrtl8fRBMg5gJGlkLbRgP+nIF9qfIwbkf87IOXVE+27mL1YTzzR7bvuDaIbp3RBRcmXYSQhBlFylshWepVdp8KJkb1EP7UrrpY0/vaClfAY6zsuqiskATb9vCFwUm/5aF99zVkgivjoQK+ZuHFyOdT7Gftnzp5amyG+12B7ujVRR8YsAm3dcSES3dQlt+B2NV8GJ5ov10oeR/Aw1xZu8g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936e03ea-c795-4a45-7eb6-08d7516630a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 11:52:43.8794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V70nBbiVusr5wWbGUFf1wkBJFpBj033oPwSlqHXYFjpEPBkaxkIA3/7smu3pRfcDC/2Gf5xUxUsFkuF2r5Q1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwAAqoTuDq4ruUY8BXB59IVTD/1gvok38UREvRvtc6E=;
 b=x7mBm2Ch/3Nkw6FRTx4fDPhl2LnTl9qa6wjafDrq2aysNpfLxx+yTAJnXaOgj1elsBwwdVufkOmfoMhU5nCnWon+NXPXlVY7Dvfv3wFVtwtx/FjI4TridBFiztLJLkZiYH9Rd1DzExhQOXNyADVZs1bmXV43km2+tG9egCLYvTg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGFyZSBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdA
YW1kLmNvbT4gClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIwMTkgNTo1MCBQTQpUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPjsgRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBIdWFuZywgUmF5IDxS
YXkuSHVhbmdAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KU3Vi
amVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogYWRkIEdGWF9QSVBFTElORSBjYXBhY2l0eSBj
aGVjayBmb3IgdXBkYXRpbmcgZ2Z4IGNncGcKCkJlZm9yZSBkaXNhYmxlIGdmeCBwaXBlbGluZSBw
b3dlciBnYXRpbmcgbmVlZCBjaGVjayB0aGUgZmxhZyBBTURfUEdfU1VQUE9SVF9HRlhfUElQRUxJ
TkUuCgpTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYwppbmRleCBiNTc3YjY5Li5kZThmOWQ2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTQyOTYsNyArNDI5Niw4IEBAIHN0YXRpYyB2b2lkIGdm
eF92OV8wX3VwZGF0ZV9nZnhfY2dfcG93ZXJfZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJZ2Z4X3Y5XzBfZW5hYmxlX2dmeF9waXBlbGluZV9wb3dlcmdhdGluZyhhZGV2LCB0
cnVlKTsKIAl9IGVsc2UgewogCQlnZnhfdjlfMF9lbmFibGVfZ2Z4X2NnX3Bvd2VyX2dhdGluZyhh
ZGV2LCBmYWxzZSk7Ci0JCWdmeF92OV8wX2VuYWJsZV9nZnhfcGlwZWxpbmVfcG93ZXJnYXRpbmco
YWRldiwgZmFsc2UpOworCQlpZiAoYWRldi0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9HRlhf
UElQRUxJTkUpCisJCQlnZnhfdjlfMF9lbmFibGVfZ2Z4X3BpcGVsaW5lX3Bvd2VyZ2F0aW5nKGFk
ZXYsIGZhbHNlKTsKIAl9CiAKIAlhbWRncHVfZ2Z4X3JsY19leGl0X3NhZmVfbW9kZShhZGV2KTsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
