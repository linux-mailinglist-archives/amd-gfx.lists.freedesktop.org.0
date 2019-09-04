Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1417A7B25
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 08:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA6F8953E;
	Wed,  4 Sep 2019 06:06:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8658953E
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 06:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDMsdsBg+cabEgmFxsRu1fTwLXFTGjkfuJDjbYBrm945q8TaSpWFSWqKy9mTaDCPSpeAtG8oLBndureL7+cA7sFSfJoWGc5z+nTjfO/ajZ4ZZ6dC1ilykQZNmkkndFagJLR3Bl2tPu0lRpZWo0T8+ukGBBNdkUoZ2A6JHK59TfFVofn1KvnznliYUEx6u5wJmBG6Zyml6FgJB5G1OLs7LLqdUIRx8/EBQGI/XeaFFW6xipVE5qyz2qMjyBBzC7zak0QsdPLqpbcbkICeSDwI5J/K5yszAIYuSjwuENxUFwzxIjEbTGEXXwNTMouFy5e3daatnt14LnDcdlwaeNA8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVdcjS0BRiZGsKCKRviDKX9dx2o6fr8gZaMJ74GVOIo=;
 b=g8i1gajeD9CTl4y7tHAjfH+071J2fNOOvh0CNjXb8UK7jWLjuHKYpf5QBDldxxp03vQxokKEammHxirZ//dg6ysYHN4RkzNhaLINXXpy4cW+7l+/Ei47A9wKUdEcoOIJzz9qsVuPPhdKjqKmaxIVwNpK6jnL/aC/xQb1MI016bz/hFrTiYJzrvAZnyjE5P12pWz34jz7sGhpKYXMIEPr0OOz1lT888SUqTppSKRCLaOeZ8K6/v7CCIEJgwqv9Me2ScuXJLS/IUAnqWvyTwJTtjSSq0dqIb8CFcsckkGwKM1gmfF8bDox35rnkTNUQx53vvdZZvxU7DXRAtm81dtXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3936.namprd12.prod.outlook.com (10.255.238.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Wed, 4 Sep 2019 06:06:22 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 06:06:22 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: bypass stereo programming
Thread-Topic: [PATCH 1/2] drm/amd/display: bypass stereo programming
Thread-Index: AQHVYubfbbI+ljBsaE6+Y+P6GYbj0w==
Date: Wed, 4 Sep 2019 06:06:21 +0000
Message-ID: <1567577166-18064-1-git-send-email-aaron.liu@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To MN2PR12MB3838.namprd12.prod.outlook.com
 (2603:10b6:208:166::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73ef5e47-3131-497a-2ba9-08d730fe0234
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3936; 
x-ms-traffictypediagnostic: MN2PR12MB3936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3936108AF6539A593B77B8C8F0B80@MN2PR12MB3936.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(53936002)(8936002)(6512007)(316002)(4326008)(6916009)(6116002)(3846002)(25786009)(64756008)(66446008)(305945005)(2501003)(6486002)(86362001)(52116002)(6436002)(36756003)(5640700003)(7736002)(71200400001)(71190400001)(54906003)(66476007)(66946007)(8676002)(256004)(66066001)(99286004)(386003)(6506007)(478600001)(50226002)(186003)(81156014)(81166006)(26005)(4744005)(2351001)(486006)(2616005)(102836004)(66556008)(2906002)(5660300002)(14454004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3936;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LBhX1ZMwGoC0ci0ptigYBL/WE3IcTmzYCnJZZIDadIVQF3I3p6ngeKIXlgH3U5R2mpS0zioxmhON1WDUYOrdG5ce72vuqmskRygGleP5gTfhRnLHhxsiPY1ZfEUyna3Bt9WcQAoC+aycYQvAJDSH1pj/4vwuoq5KADn3BNQticL0zBVlE3n8yJUFyAMgBwulprnTBQiQCSVVbqf7Px9bTFBBUDWPPeTgPqu6muL3ETmx5j63pYjJsaSw1LHZzh2zrbqrZsBA3bSBtUoY4glNPwMNbbk40Q1/OK8uwYiNX8uDNz0Y1rTBCbChVhJTBYU/Lpddqf9qaQgpSu1sv4mRaUkeoxsxy4sW0kxTKqNhKRLQASXeAM/yuqiRyD6z4gLicjIBELCqIzzVmSJbVa0JSLTE/EXNNHzOiSngbAaW90M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ef5e47-3131-497a-2ba9-08d730fe0234
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 06:06:21.9250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqipSW3+O6ZX6N3LMoqT8PHPolHYewKGrnYZ9UsDBj80/e7oxxcF80lJxl+UUDgD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVdcjS0BRiZGsKCKRviDKX9dx2o6fr8gZaMJ74GVOIo=;
 b=01KpJMKFDb76NQ9FTfQx/WYPYF9NqCg/61+gPsRZ3KH+ajGzL1VcwszYAFaWsFUyLiA1FWYENd+QqDqKoKk7FvoGaG7MQ4zTzs3O/Nie4EBGiu48o5kcImlBz6oVUrM19QY+mTk7YwuQhyRRx+GNtYz5M3tNbUG5N8iAcfRbpyk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Li, Roman" <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpoYWNrIHRvIGF2b2lkIGNyYXNoIG9u
IHJlbm9pcgpzaG91bGQgYmUgcmVzb2x2ZWQgYWZ0ZXIgdXBjb21pbmcgZ3BpbyByZWZhY3Rvcmlu
ZyBwcm9tb3Rpb24KClNpZ25lZC1vZmYtYnk6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVl
bmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jCmluZGV4IDViOWRkMTYuLmVlMjE4NmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKQEAg
LTI4NDQsNiArMjg0NCwxMiBAQCBzdGF0aWMgdm9pZCBkY24xMF9zZXR1cF9zdGVyZW8oc3RydWN0
IHBpcGVfY3R4ICpwaXBlX2N0eCwgc3RydWN0IGRjICpkYykKIHsKIAlzdHJ1Y3QgY3J0Y19zdGVy
ZW9fZmxhZ3MgZmxhZ3MgPSB7IDAgfTsKIAlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0g
PSBwaXBlX2N0eC0+c3RyZWFtOworI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMQorLyog
VE9ETzogcmVtb3ZlIGFmdGVyIGdwaW8gcmVmYWN0b3IgZ2V0cyBwcm9tb3RlZAorKiAgICAgICAg
b3RoZXJ3aXNlIGl0IGNhdXNpbmcgY3Jhc2ggb24gUmVub2lyCisqLworCXJldHVybjsKKyNlbmRp
ZgogCiAJZGNuMTBfY29uZmlnX3N0ZXJlb19wYXJhbWV0ZXJzKHN0cmVhbSwgJmZsYWdzKTsKIAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
