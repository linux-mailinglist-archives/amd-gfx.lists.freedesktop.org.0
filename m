Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9585879
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 05:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D8A6E365;
	Thu,  8 Aug 2019 03:20:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740055.outbound.protection.outlook.com [40.107.74.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409B6E365
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 03:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKNNH4RQ0yeywjDppFMBcgbCDiB87GuNwGZuYgmSg1ROjWlTZLDaVT0AGILJM6d0cd95jSbVnHKg44tC0MiSgoPioU1JKw5p4A7zuRrc0h7Z0qSSSTdOfzuPN16gUy3BDkWrjdaAqA4wwllrvvCPWhDu7HYPUjFw0l8d0Fifp85eC6Lg4X/s1L9K9h4ps0fwcNmgdOR3jt1DUxKVvxDj5KxtE/rtI0E1sgbIUFI4HjH3jJ1KeaTy69Zc+lsvrfSbDwLZEEcMc2RcjXeM0tVp6KlFW3l78Xlck9A83QjDOxeKj74sX/G5ACnhkWy5qgaMeqqKm8rjsMo6XmhvWbyQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE39vWRXFrepcHLy3mc2DuzG/Q7g/1+91xbFlREgqqI=;
 b=morBhKVb/0xUFw4VQdXLURWPW93e3x9fOGBDs2QUhId1tEfR2JgmUM9S2W252qQZPx66tKz9joP4Pd6ELYZqt/7yfE925AQuyNL0HcaYIHtTQTb9+zDu7wdlWNGeNeGjMbwAuRZ+Gf7AJhEYxkDoSTRsI0sZPuQTNWy18heQXdh3tFn/h5qF+Op/xCuQ71sJ+S/NkhLSUNMUAmJfH2+vuVT53YZLtc9TVlA1Ef1siH4qHmOdjuSmWDXgQ6OM62GfsJQUiSlyALJlM9WVajcdgeOouj/KfEsf3GnKaNjAyX2ASq2kyL0o7erLJC2/qSXdBMLb+5xcpq7gUnsciq/cMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3218.namprd12.prod.outlook.com (20.179.65.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 8 Aug 2019 03:20:22 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 03:20:22 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: add navi14 PCI ID
Thread-Topic: [PATCH] drm/amdgpu: add navi14 PCI ID
Thread-Index: AQHVTVgXPYEivAIcDUauVvRMBChYVabwlauh
Date: Thu, 8 Aug 2019 03:20:22 +0000
Message-ID: <BN8PR12MB36022E83DDDBCA9B04D022A489D70@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190807194109.8821-1-alexander.deucher@amd.com>
In-Reply-To: <20190807194109.8821-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dcb56b7-c6e0-4303-7123-08d71baf5939
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3218; 
x-ms-traffictypediagnostic: BN8PR12MB3218:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB32187AFD0D64E3DD241CA4AB89D70@BN8PR12MB3218.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:312;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(476003)(86362001)(486006)(446003)(11346002)(71190400001)(71200400001)(52536014)(7736002)(26005)(305945005)(81156014)(186003)(81166006)(8676002)(5660300002)(478600001)(8936002)(966005)(102836004)(6506007)(76116006)(53546011)(53936002)(14454004)(66446008)(76176011)(64756008)(66946007)(66556008)(99286004)(66476007)(7696005)(6436002)(2501003)(25786009)(256004)(9686003)(4326008)(6246003)(229853002)(6306002)(74316002)(55016002)(6116002)(3846002)(33656002)(316002)(66066001)(2906002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3218;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AZIQJGAWOcPcAEhuuwKjtFJYFtZh98pnYIwIoLVF6KKnpWh0coPKXcsFdZLRtUsRN+xl9W23V1nuYG5zPnOOFWJm5AKRkbleAa3V7QpX8QoXgnF3anElCQyE4jk6Ov8gA+Gy13Ogmr3aGL/JpzMVNoecOBb3yWubRk68ySQVRAbECZzmeHmd5iDUIUQSgw4n1AV55HQtDN9GSSD+SZ+wnSONB1ORzO8pG4AcRW0EA2Dc4OlO61lbQc9jXZjLB4C38TbSFfwGPxEP2Ov3P/rTw99p8eq5DUlrF/UA4pAjSMfPZqy7ME5xAH/sJ9P+G4dPESoOvrHTjsna9rbNkBkP8LQXRQe6WqpMnlVt+1Wos1kX/pjyP7FlBnr9tKbIk4HYclsOEyvqDuYa0D/3ZX6IDHbo/s97LJgMH0EveBSDReE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcb56b7-c6e0-4303-7123-08d71baf5939
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 03:20:22.5518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KiQBhsXl76C3ySk1BHMd6aJDbKGHs5hdvBlTOgtkYF7KgzgZAiqFrhArFWXYuor/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE39vWRXFrepcHLy3mc2DuzG/Q7g/1+91xbFlREgqqI=;
 b=vqWrYrn7xqwMnKy5aB5El2y1o5n60hvkgiYmtUIKv82afN8Di4Uye0ouPymbMEtQyxrAHXoqsFxosCIJRnTiYjkqXi4HxwFRNZDpgT++W5WVZJucA5Pa7JK73Z/1jt8OhKkWZgmnv1HFGprme3eYLzmcpLVoa/vbfXMyw3TvMm4=
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
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IFRodXJzZGF5LCBBdWd1
c3QgOCwgMjAxOSAzOjQxIEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
RGV1Y2hlciwgQWxleGFuZGVyClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogYWRkIG5hdmkx
NCBQQ0kgSUQKCkFkZCB0aGUgbmF2aTE0IFBDSSBkZXZpY2UgaWQuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCBj
ZjMzNGM0NjU4MDUuLjc5ZTIyYzIyMWI3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwpAQCAtMTAwNyw2ICsxMDA3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewogICAgICAgIHsweDEwMDIsIDB4NzMxQSwgUENJX0FO
WV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTB9LAogICAgICAgIHsweDEwMDIsIDB4
NzMxQiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTB9LAogICAgICAg
IHsweDEwMDIsIDB4NzMxRiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJ
MTB9LAorICAgICAgIC8qIE5hdmkxNCAqLworICAgICAgIHsweDEwMDIsIDB4NzM0MCwgUENJX0FO
WV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTR9LAoKICAgICAgICB7MCwgMCwgMH0K
IH07Ci0tCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
