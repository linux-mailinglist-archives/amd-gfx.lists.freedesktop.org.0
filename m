Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C2AF21D
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05726E990;
	Tue, 10 Sep 2019 19:59:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514406E990
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlxAtIAGHg/mYyrfq8BB9/v7xKxYjFlo0yAbYCPNDEpsf91expAiXAySG2QH4olkC4jk4gWf0qyP4EGVR4GSKbZym31+LupxCaSZkls9A1W9g19IHnmhxl7dHf48o6WV3SLySx8Vi/RSpuy7cpxxScZyv9jxmXH92uJDSDR4vrU2QgDuWeBUV/rMmlffUV9DucdAXJ/oysa6gP/Ct9qQRkUpawDgdeocP25q23qc5GpQv+WXnHUOORPVmnmTpy6OnpQICwUi8buYX7skAbwFcNQhr7c1FxFoqa2PHEe5py1nDbPuFA4/v5zuiBG/7CKtaBOp6L4VoFy3LTtl0dGYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhIX+TbBD+MIaq448oyOujpP6Xt/Q/kS88Ov4wBhA74=;
 b=VpiNmLGq76GUe082UzTj2zCVK3O8BA5x3bJ9Q6kuKCCy3ZfcqeMThlLC7HueAIrXMP2TXa7dp18O1ZU5yNMl5ZzFVom/GHHvmojxOBeSAEtTzUMHujxOhxBGRrhoCm6cOx/gSiJRCpbFoXwmxdQGd2i1oHovsbD0FA7FpyL/bHwPMtIRRWwYKwakXoEyICBmQ4MT2VagTJrSjzGAZznpkVeo207sW2gXiM6QIXM6NYsv4gwJLo5Rr8OsTdLtFcZMxXf50oeGmDYzjviWj1W3hI6bguzpXlbHXc48k4Vkw71C5KaDtFu/jCXeR6+pfUg0/0uSALHYJcHWDTAmAz9y/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1425.namprd12.prod.outlook.com (10.168.228.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Tue, 10 Sep 2019 19:59:33 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::ad7c:d010:4f5a:b3c4]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::ad7c:d010:4f5a:b3c4%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 19:59:33 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu/nbio7.4: add hw bug workaround for vega20"
Thread-Topic: [PATCH] Revert "drm/amdgpu/nbio7.4: add hw bug workaround for
 vega20"
Thread-Index: AQHVaBJDF4GqjrdwA0WExLetwhZyTQ==
Date: Tue, 10 Sep 2019 19:59:33 +0000
Message-ID: <20190910195922.16898-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::27) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae98d676-d8c3-44e3-426e-08d736296615
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1425; 
x-ms-traffictypediagnostic: BN6PR12MB1425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1425BDC8D5462852F5E7A31885B60@BN6PR12MB1425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:556;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(189003)(199004)(52116002)(25786009)(6486002)(86362001)(6436002)(99286004)(36756003)(478600001)(6916009)(53936002)(7736002)(3846002)(14454004)(6512007)(2501003)(6116002)(5640700003)(2906002)(66476007)(64756008)(66946007)(66556008)(66446008)(256004)(8936002)(14444005)(50226002)(486006)(2616005)(476003)(6506007)(8676002)(71200400001)(1076003)(71190400001)(102836004)(305945005)(81156014)(2351001)(386003)(5660300002)(26005)(4326008)(316002)(66066001)(186003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1425;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RNkvermu85DZ9JmQz9IWdy4/DWAd13AXGVjBwEKum8iCuQPvo+nvzRO8keUPq8y6qtl5IdVn/fVJiN8+NFEvmkTlbqYx04UuyS8SYkIUTYOGfgGr4aiaK0K28stwNYPEHrcZ58k/TXemFph3sFWXw5Twkz/vhauKzKksSXxh1tnCwe+OauEd2Q6vMbbV8PUOWzl4PxDBsu28NaGY4jNZs6EbWTzAyRamXXlxu54UfpcOk+T08WVeYpyh87N8GNrUW7voKokR91PsDQ7NW/N3aPA27AP+NnrmMDBU4GZjfYQH4KES0Koc6U7dd8IYFLFA+iwt5Yb3RLkfJC1SvpH15vJ3ob3IWIU2p7cQD+0daomdd9In3NoxUrYEpk382P0LrDholW1NcPe6hwzERdDWra4uop1o9P7SIk34ajGg0GU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae98d676-d8c3-44e3-426e-08d736296615
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 19:59:33.3561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Emf1H37f1A5b2RqRrUpTOY/0iATxLcnZn0KAzUE8x9kuvAFdO5QuM4Opmg0SDd1ZnlcRsXPw5Oyj7/Pohm9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1425
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhIX+TbBD+MIaq448oyOujpP6Xt/Q/kS88Ov4wBhA74=;
 b=WIi9eSZH48U5kmWWE/fl6hfYHBoTHngVL5bQ5+9dzHIjbzLQ2Uk5lQp6E0DZjR6DE/HKB4COHEuKcvMOT6zgiz96tftsfzO5iRW/fkkQKwxjALE/7wc5SEosYFD7Y+Byu12bqXPHyCZLnBNZjcCVIyl1achFzAgDF5Ozdzo0Nvs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBlMDFmMmQ0MTg5NTEwMmQ4MjRjNmI4ZjVlMDExZGQ1ZTI4NmQ1
ZThiLgoKVkcyMCBkaWQgbm90IHJlcXVpcmUgdGhpcyB3b3JrYXJvdW5kLCBhcyB0aGUgZml4IGlz
IGluIHRoZSBWQklPUy4KTGVhdmUgVkcxMC8xMiB3b3JrYXJvdW5kIGFzIHNvbWUgb2xkZXIgc2hp
cHBlZCBjYXJkcyBkbyBub3QgaGF2ZSB0aGUKVkJJT1MgZml4IGluIHBsYWNlLCBhbmQgdGhlIGtl
cm5lbCB3b3JrYXJvdW5kIGlzIHJlcXVpcmVkIGluIHRob3NlCnNpdHVhdGlvbnMKCkNoYW5nZS1J
ZDogSTJkN2MzOTRjZTlkMjA1ZDk3YmU2YWNmYTVlZGM0NjM1OTUxZmRhZGYKU2lnbmVkLW9mZi1i
eTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jCmluZGV4IDJk
MTcxYmYwN2FkNS4uZGFmZDliN2QzMWQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9uYmlvX3Y3XzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlv
X3Y3XzQuYwpAQCAtMzA4LDEzICszMDgsNyBAQCBzdGF0aWMgdm9pZCBuYmlvX3Y3XzRfZGV0ZWN0
X2h3X3ZpcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIHN0YXRpYyB2b2lkIG5iaW9f
djdfNF9pbml0X3JlZ2lzdGVycyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQl1aW50
MzJfdCBkZWYsIGRhdGE7Ci0KLQlkZWYgPSBkYXRhID0gUlJFRzMyX1BDSUUoc21uUENJRV9DSV9D
TlRMKTsKLQlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBQQ0lFX0NJX0NOVEwsIENJX1NMVl9P
UkRFUklOR19ESVMsIDEpOwogCi0JaWYgKGRlZiAhPSBkYXRhKQotCQlXUkVHMzJfUENJRShzbW5Q
Q0lFX0NJX0NOVEwsIGRhdGEpOwogfQogCiBzdGF0aWMgdm9pZCBuYmlvX3Y3XzRfaGFuZGxlX3Jh
c19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
