Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D1AF628
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 08:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D36F6EA16;
	Wed, 11 Sep 2019 06:52:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710075.outbound.protection.outlook.com [40.107.71.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144B6EA16
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 06:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOe/v8eogrty5J62MyQn2lqJfmKNNYIHYCpYMyUvXx/LyZjQ9MzxLDNH1fhzfc3TwidRrTBbdeEGnb2Au0p3w8AVd2cMcjBMEXXT8q1lK095pnfdUoYdzr+v2ZszaqQFR7I5N+1O1wGbotNq3tngP9R2tpbZfeQf4FT16I7pXDFDV1Sau9v7SAi9+UWT975gsx4dX4Y+7xBLP+xxX+gF0+jBz3CVvmvzBqUPEb9Uicwlh/lfmLOkHG8crHLw8Mkw5kovZjYu4dKYV008KiN9tl8accfet6aZrCT54LxRp0XS+rxnL9UV2lEKXvtDZXbd0XqpZQqwliMgJ3OtOYR1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F52B+3CT9Ylcidb9mLcZO9dlIu2d3c6WQQ6xwE1e0dE=;
 b=EHSQUtTTPvFmw8qb+m/gM7Kfw4qdzIhvYDW0IHQzJb0DJD2O1VxHKdAYBoDqA1Khq/9NI7DDM+cb1Ht9jOTDs92OImtZHLjr7wt4SIqH7uaUXVA0S5KP1fp4zHHbIRK6wupxjke8D5gityEdctn8vZ67PZZJyPlWRbrStm9+5I5G8VQnDETOR4h+OTAvDlR0FEtXGqO0fYwkkGnyUx6e/JcndWhuoNSVoIaiBS8PgB++nMRmYgo8WVGmrdnUbmk/Y7i4jzjAR3ZwOvF8VFEuOGgdUz5oZlC2tlBYgs+a6uBWQnvcFaAOpFlQ20jZxOiK1wNHLBTSBm7mUBdU4HeaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 06:52:52 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::ad48:9c35:d74d:8e20%6]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 06:52:52 +0000
From: "S, Shirish" <Shirish.S@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD (V2)
Thread-Index: AQHVaG2HB6z7JcsTPE2B5uyPrFeG+Q==
Date: Wed, 11 Sep 2019 06:52:51 +0000
Message-ID: <1568184761-20949-1-git-send-email-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::24) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7988b95-ab1a-4946-8147-08d73684aa0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2911062C17B7431EEB6A832FF2B10@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(6506007)(5660300002)(110136005)(71190400001)(66476007)(66556008)(6512007)(64756008)(25786009)(99286004)(478600001)(53936002)(102836004)(2616005)(4326008)(26005)(186003)(386003)(50226002)(14454004)(81166006)(2906002)(86362001)(3846002)(6116002)(486006)(66946007)(52116002)(66446008)(316002)(8676002)(305945005)(6636002)(54906003)(7736002)(8936002)(256004)(476003)(36756003)(71200400001)(6436002)(6486002)(66066001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HQUy8tSNsnv5LMdLsdjfJW4bc8694XHhv2NdFF84I8MKaVh9+PfboUXoMdblNMcnfBNiIMDATSgWQdcsy3yUFTxVdHMO9NN+VKfneZGgmVpNxhjCZ6oNT7lqF3FOB5JEOZ+7452p+9qKkAk4y2MtTLYqCb535e/ysmjYPIT5roR3gOYJVPXPDBer3CbY7zFV82pUiEgfCGeKQ3tVV98DfH2BhTSGVwW8Yw2D8+4VZ1/NG2J3GSTM9BzKzjjGTHOmScudNLbhyculFEbXpKa5HLtwMJmcAeHneauYisZJdSYDgY9Pm+zRoGKCHZn+I2hSGDjUDcxT175Z2MhR6BXJyP7isksLpY6/SD0GqCF0rqJbx78yRtdinl+MKRxqy6+bVLPShk2Ks05paKNEQRaLarFyw6fTaSqMJP2/3Hfiw1Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7988b95-ab1a-4946-8147-08d73684aa0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 06:52:51.9036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KKy3etusvnj6MGBrX/TgSIpx/FDDaDkpaNavdMb5naTPIR5Q+dXxBbtTAm9Scl1GSNKqHAIMdCId1TLHoykGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F52B+3CT9Ylcidb9mLcZO9dlIu2d3c6WQQ6xwE1e0dE=;
 b=L+B5z1geD6+HHbhwQDaTJyQ3DB6LmmdTlsDmUpeLZJIy1OBsyA6lSPl7dI2BWOHdeQZsptWqvlxsrRxV4Xb6Aduhg3/HtPDNjnokMyzeXdP7MfxxXzn8gVsTgpUTnrqj/kypdI7J0u1NyXeGGZM1tk+TQ6UQh6SjpjRmFSTdiGM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0hTQV9BTUQgaXMgbm90IHNldCwgYnVpbGQgZmFpbHM6Cgpkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLm86IEluIGZ1bmN0aW9uIGBhbWRncHVfZGV2aWNl
X2lwX2Vhcmx5X2luaXQnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmM6MTYyNjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc2NoZWRfcG9saWN5JwoKVXNlIENPTkZJ
R19IU0FfQU1EIHRvIGd1YXJkIHRoaXMuCgpGaXhlczogMWFiYjY4MGFkMzcxICgiZHJtL2FtZGdw
dTogZGlzYWJsZSBnZnhvZmYgd2hpbGUgdXNlIG5vIEgvVyBzY2hlZHVsaW5nIHBvbGljeSIpCgpW
MjogZGVjbGFyZSBzY2hlZF9wb2xpY3kgaW4gYW1kZ3B1LmggYW5kIHJlbW92ZSBjaGFuZ2VzIGlu
IGFtZGdwdV9kZXZpY2UuYwoKU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKaW5kZXggMTAzMGNiMy4uNmZmMDJiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKQEAgLTE2OSw3ICsxNjksMTEgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5Owog
ZXh0ZXJuIGludCBhbWRncHVfbWVzOwogZXh0ZXJuIGludCBhbWRncHVfbm9yZXRyeTsKIGV4dGVy
biBpbnQgYW1kZ3B1X2ZvcmNlX2FzaWNfdHlwZTsKKyNpZmRlZiBDT05GSUdfSFNBX0FNRAogZXh0
ZXJuIGludCBzY2hlZF9wb2xpY3k7CisjZWxzZQorc3RhdGljIGNvbnN0IGludCBzY2hlZF9wb2xp
Y3kgPSBLRkRfU0NIRURfUE9MSUNZX0hXUzsKKyNlbmRpZgogCiAjaWZkZWYgQ09ORklHX0RSTV9B
TURHUFVfU0kKIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
