Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92563B5866
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 01:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BFC6ED91;
	Tue, 17 Sep 2019 23:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690087.outbound.protection.outlook.com [40.107.69.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733FB6ED91
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 23:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKi4Jg0QpvYv3K5KhfIcVpVl+ndUtVgF3UisFTekVo98vLT+mDRl07BVXdS0TRil05dJothHRWXO2R0iklLJF4H80Xdfq6Ffr6LQyqSd5YKGkFEje4/U+P+wuqQTKE8JL2ElIrFsdqPAD3xatiPOf8Y+UjKFT/xuNMlWokxK+2DKmlPjfXIJhGkH58BU+tPJXn+sSzG/abUW8Z0PO4s5yQ1bOLC/dlF9Zin4E7uAWgqgj90Xw5ogTBe77znGJ5POvRTcHd76EWjXODRYd9OzjORJa+vt2R3K+JIJWSOBlj5B9z52Vohtq8r2KIcnzQNH/EqBePfS6+OcH285Ls1JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2vsp+GQ7mnhtH4GzGiuPBItgvWjR3wfV5olvlWdTrU=;
 b=aM8axglRscYXuTPbacXGExIA5QTLDIIlOcSQfQUvCT8QBotd2zy0JQhzI+V2KnqqMLHOayBw5DFmFggN0WcW/mhitt0H4nzCCZt0CmYnTmBDEaPj7Ere+7pIXncWPYYMEXj9U8r786smYenzFrs5FvCs/RfLS/UPuEi4nVrPV3aAGJawsqdz8bO+9Uhy0ZJgnD6hYYBXoa6a2xQMwIpiB2Jlt2m8+8feWIVTAwp5kobTUpvs7jsGUB1ddfV9G3mvEsizY7dLxa2tAAyZgFCZojPPAqS2b0ed/0g8QxVnTwS3OLlbnYh3LZs/fkjTc2jYqUJREMWWc6By9wGEG1y4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Tue, 17 Sep 2019 23:08:43 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 23:08:43 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Clements, John"
 <John.Clements@amd.com>
Subject: [PATCH] drm/amdgpu: do not init mec2 jt for renoir
Thread-Topic: [PATCH] drm/amdgpu: do not init mec2 jt for renoir
Thread-Index: AQHVbazac6f2MA7mIkOvhQ85Vcv7Mw==
Date: Tue, 17 Sep 2019 23:08:43 +0000
Message-ID: <20190917230828.6818-2-Hawking.Zhang@amd.com>
References: <20190917230828.6818-1-Hawking.Zhang@amd.com>
In-Reply-To: <20190917230828.6818-1-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c680d28-3bb4-4df1-0983-08d73bc3fc69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1564; 
x-ms-traffictypediagnostic: DM5PR12MB1564:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15644947965E27BF7E47687EFC8F0@DM5PR12MB1564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(66066001)(50226002)(3846002)(25786009)(6486002)(66946007)(14454004)(6636002)(110136005)(316002)(6116002)(86362001)(8936002)(6436002)(2906002)(5660300002)(6506007)(386003)(76176011)(99286004)(8676002)(81156014)(81166006)(52116002)(36756003)(476003)(11346002)(446003)(2501003)(71200400001)(71190400001)(486006)(2616005)(66446008)(26005)(66476007)(186003)(478600001)(66556008)(64756008)(256004)(102836004)(4326008)(7736002)(1076003)(305945005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gjHVLtbAOP6+oTXq0oDu04dcimwUUHdMfh+Kg2dTuTxiz6EccrWamp3jZCT/5xlfeKiBuGs/egDRglAogqG68/bq2qicpp7jN9LUO94m1RdsO8rxA3p0DViJM4BYR58/u2riPeZ1zhgEVgNzNcQYDPYe79XAQn+TtxiLjqjn8vTe2EjYWesTXgSWsjlNNHipydX9ZUowzGX8kEss6NNnO5lk68zeM5UxXKMW17aZXuoY4VjMCIN08KH0igVVFf+sA4cZ5mo2h6O3m0q8cz7YlBCrjt76500PBXtDPJXszuuf2bN1ScQlLrysi8V6voAifQ+yY7kGhEYGcKn0LGCXHZffryaPn5jdbbuLtK7jRmTl1Lxv8Tkg8xYph8gOmHd2Dr89/Q63V6oyXtE9Zbriumppr/QNdFN+Lfax+8hMu2A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c680d28-3bb4-4df1-0983-08d73bc3fc69
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 23:08:43.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CzMrWm+09S8J0FgCB4hOUcpK7xGIfrhQalJQvRpoHyRD1u5xR48Vdtdax57a1SPWa0/0sukZx6R42cAJqvTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2vsp+GQ7mnhtH4GzGiuPBItgvWjR3wfV5olvlWdTrU=;
 b=PiLT2mlTO3fFbvpDoj2ubGb+zzcg58+qZgVrOO7h0cByeTPOtb0ai616KPBnCAGdfCe8dF4rSX1qZIU/Ykn2oXtn3WFLWx9Yqep9hV2WV72TGBMxoF11bSNLPjA5q3rR7wLFmfonXC6rKJdt4jNPP1ZIW1xq0jt3mXTpPU5XlAY=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIEFTSUNzIGxpa2UgcmVub2lyL2FyY3QsIGRyaXZlciBkb2Vzbid0IG5lZWQgdG8gbG9hZCBt
ZWMyIGp0Lgp3aGVuIG1lYzEganQgaXMgbG9hZGVkLCBtZWMyIGp0IHdpbGwgYmUgbG9hZGVkIGF1
dG9tYXRpY2FsbHkKc2luY2UgdGhlIHdyaXRlIGlzIGFjdGF1bGx5IGJyb2FkY2FzdGVkIHRvIGJv
dGguCgpXZSBuZWVkIHRvIG1vcmUgdGltZSB0byB0ZXN0IG90aGVyIGdmeDkgYXNpYy4gYnV0IGZv
ciBub3cgd2Ugc2hvdWxkCmJlIGFibGUgdG8gZHJhdyBjb25jbHVzaW9uIHRoYXQgbWVjMiBqdCBp
cyBub3QgbmVlZGVkIGZvciByZW5vaXIgYW5kCmFyY3QuCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jIHwgNCAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jICAgfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4
IDZlNDk0MzNkZDg3NC4uY2UzNjg3NmQ2NGRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCkBAIC0xMDY4LDEwICsxMDY4LDYgQEAgc3RhdGljIGludCBwc3BfbnBfZndf
bG9hZChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAkJICAgICB1Y29kZS0+dWNvZGVfaWQgPT0g
QU1ER1BVX1VDT0RFX0lEX0NQX01FQzJfSlQpKQogCQkJLyogc2tpcCBtZWMgSlQgd2hlbiBhdXRv
bG9hZCBpcyBlbmFibGVkICovCiAJCQljb250aW51ZTsKLQkJLyogUmVub2lyIG9ubHkgbmVlZHMg
dG8gbG9hZCBtZWMganVtcCB0YWJsZSBvbmUgdGltZSAqLwotCQlpZiAoYWRldi0+YXNpY190eXBl
ID09IENISVBfUkVOT0lSICYmCi0JCSAgICB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RF
X0lEX0NQX01FQzJfSlQpCi0JCQljb250aW51ZTsKIAogCQlwc3BfcHJpbnRfZndfaGRyKHBzcCwg
dWNvZGUpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA0OWM2ODZl
ODBlYTUuLmIxM2U0ODMzMmRjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
CkBAIC0xMzIxLDcgKzEzMjEsOCBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2luaXRfY3BfY29tcHV0
ZV9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAkJCS8qIFRPRE86IERl
dGVybWluZSBpZiBNRUMyIEpUIEZXIGxvYWRpbmcgY2FuIGJlIHJlbW92ZWQKIAkJCQkgZm9yIGFs
bCBHRlggVjkgYXNpYyBhbmQgYWJvdmUgKi8KLQkJCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJ
UF9BUkNUVVJVUykgeworCQkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTICYm
CisJCQkgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfUkVOT0lSKSB7CiAJCQkJaW5mbyA9ICZh
ZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9KVF07CiAJCQkJaW5m
by0+dWNvZGVfaWQgPSBBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9KVDsKIAkJCQlpbmZvLT5mdyA9
IGFkZXYtPmdmeC5tZWMyX2Z3OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
