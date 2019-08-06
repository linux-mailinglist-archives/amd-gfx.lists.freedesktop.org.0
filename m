Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7782BF7
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498A89E41;
	Tue,  6 Aug 2019 06:46:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053CA89E3F
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USQVVglMqZ5zz7KiJMuOUrG7Q37wmyXxa33e1zALWR7pY5bRook5G5xt1MP8ZKKVNHpqVr2ABk5wee8q821IL1cLrdIu05Vfh6zayJaOnhqKgqX59uGhnsOg/nQbCAMkw9BjvHHgYr9VTJuf3yr3hYaz1hl6Q/C4h+nTqLsfTGOSR+OIwUdqwBG4YbCNcEHQ+LrDgt+Tev1gcLL/lVm3A8NXBJGq0U0feChYTOl3AOeajaI167pNBZjAqayLUZlPb6aB87STOsEfjQvAsj9exDijFd+1c7AdNj1CIiigIKXvuGapAWjxT7cSFI0rP3FEZnSnAaGXzpmIBg1McMyNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y1iqJK8mx8w4fFoe2bqLh4OF7HnPblGz6Ea8FUMgUk=;
 b=Wj7RsWsfujx9NfTRjqg/bTEUW7AcTrPa1xLb3A/wW77Nqt1ICR3can570AwNOHfhOkOVpoo/h42JoGWWWnzKqHTUPhus8VMNG95/S4lvKDD6OSqpUap8cESPiAZ7KQh3cF2X96MR3jBYc6ZnbQM3oEWHEPqj2dqml/csGrFkmTtuUiD7xaknX2q3U7eeeIAiJxlG3pETH+SSVVth1gunikX/oLMjASSdahDVqZ9A8SJZyTI+F95YUOhAuiWn+kgdmvKEZDMIEuPljTw76GaK8ch4070IAkPoJ2bVywtBtNOUQoV1P497/qJpQbR7tl7gwiv2OEoi5CeBvGfZ1yVSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:42 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:42 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/amdgpu: enable athub clock gating for navi12
Thread-Topic: [PATCH 09/10] drm/amdgpu: enable athub clock gating for navi12
Thread-Index: AQHVTCK0FOQIzWHvwkqHQ+1kCj59Fg==
Date: Tue, 6 Aug 2019 06:46:41 +0000
Message-ID: <20190806064546.19434-10-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d00cbe0-7e9b-4ba8-979c-08d71a39d6ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540AB14FEA2ADDBB65875CF89D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 45VMtC7SxdmEbCp+jrEWDBMZYNUBI+3DHX4YMfuFBIcZU49menZQaViBq9NCDI4m83Id317wkatXrlfzHbmMQe/jGGjVXe8DDeX2CqkjxRAdPOO3ynyVKPguPtnXSLryZngwEgDY3x6Pt8Kh2V+NMtymhr2FM20ONerwuP0Jm2YXvEusiTiI/Aw8rabb/T4o8Ee/baze5MH22NiveCTsS6MrrQpnoh+I3S73cuI/VG5IHlwdyQ6qS+3NwJ7mK/qW9XN5wM3bJkgJbW1kqxrlTXnjQQRjzJgs6zH169e51sedOZplzuf5YVq5SGmUOv88orjyk61x3O7mB9byyi3376kaCwIETcNXJQkwcqeu3x1fd2l4sbuTw646xMYgpGXWTUGxoXH+jsIfBxNP8W0NVfyU0IIi+uQVoen2HakSHJM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d00cbe0-7e9b-4ba8-979c-08d71a39d6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:41.9273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y1iqJK8mx8w4fFoe2bqLh4OF7HnPblGz6Ea8FUMgUk=;
 b=VeRuPkM9ej7XTV/b7iIHRKTTxs1wwWTv/pg2SSFRwNGyJEuI5CMnUSpZCzfcWQ57DLiWe24XhLWrwB79wp+Ntqorec0Ju4ZrKuevF17yMerUmrml6ZhIEgwerXfOx4s+n9CxqDIdZ58utketv96PMVQI4JcJdMl/8kJxQclTdZY=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlcyBhdGh1YiBtZWRpdW0gZ3JhaW5lZCBjbG9jayBnYXRpbmcgYW5kIG1lbW9yeSBsaWdo
dCBzbGVlcAoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgNCArKystCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMKaW5kZXggYmM1MjlmMGE2YjViLi4zMDJjNjBiMTQxOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnYuYwpAQCAtNTcyLDcgKzU3Miw5IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQo
dm9pZCAqaGFuZGxlKQogCQkJQU1EX0NHX1NVUFBPUlRfU0RNQV9NR0NHIHwKIAkJCUFNRF9DR19T
VVBQT1JUX1NETUFfTFMgfAogCQkJQU1EX0NHX1NVUFBPUlRfTUNfTUdDRyB8Ci0JCQlBTURfQ0df
U1VQUE9SVF9NQ19MUzsKKwkJCUFNRF9DR19TVVBQT1JUX01DX0xTIHwKKwkJCUFNRF9DR19TVVBQ
T1JUX0FUSFVCX01HQ0cgfAorCQkJQU1EX0NHX1NVUFBPUlRfQVRIVUJfTFM7CiAJCWFkZXYtPnBn
X2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOX0RQRzsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lk
ID0gYWRldi0+cmV2X2lkICsgMHhhOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
