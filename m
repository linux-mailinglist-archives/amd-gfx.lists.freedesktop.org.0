Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696EB82BF2
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71A289E0E;
	Tue,  6 Aug 2019 06:46:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690889DFF
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1B4DfsLqQ+Ta/D7pd8Kr+gxPA1nrfs4hYQ456pV1UgRJpGiDZvKJFmgp89d4jmw7LbdCJ01YGO6gjFVmFx/+HoJayXZN18R24im7c2V6z5RJx1KVHSIgRB0/ahgcVfgao2ckV58iyjCbCnldqgNsiW7E23wY97KW4jSS5J2xwyQUNmZ4VFoJcGuW/lSURUNxuWoSsnnrIhr+AhqxcEgxPThVYOSs4UbBdwvzdcKRgvazLFj7QLO57sOf81NEhBZR83XaHU9b0B8BBpeudYumBcJgLToWScgqnXICPEO/o2kE/PCD4BxZSAdeDJn6v167Cn5Yujpf8MZA5H0vP6I3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3FPhm+E9Nni6HMrVAC12/luOZwMJz8hmf2k1Cl9Lms=;
 b=DGcv1neO3sYOFSmX7qX23RqHwYPn4daenLwfXE8nLyJ6CLfVmPi65WUclQ2uXvcDVQ2Uq/pAhcI+fVs+/1REMIv3/ujG0z27CnBV560FS1+r3vX9tFAyUMmUW4pwthr0GuOfPjMny2iIe45PfBmWNk8+C22CTOhB+91GX68+m0fViwt0d9HL22M3lmUQVxeWbFdVNlxO+GGMvx/2JbQdx7CivnaaOvexF6iDzKvyAZtkVG1ImJLa6YrNUTL1musqureFird9EZNVbraGHfLmo9NbQ/9+FqJ8lF8a6nm5lkEdZjzS5Y6RaoX5ch1ccRydqyEQSS68XXktXtPpqXNFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:35 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:35 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/amdgpu: enable mmhub clock gating for navi12
Thread-Topic: [PATCH 06/10] drm/amdgpu: enable mmhub clock gating for navi12
Thread-Index: AQHVTCKwKtj906hzoU6RiSP8UZ1eKg==
Date: Tue, 6 Aug 2019 06:46:35 +0000
Message-ID: <20190806064546.19434-7-xiaojie.yuan@amd.com>
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
x-ms-office365-filtering-correlation-id: 0204b047-88d2-4a71-6632-08d71a39d2bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540DA65BBB0C8B3DA133CBB89D50@BN8PR12MB3540.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: /sw+S6PfmIsMNf9DEj+3aCB2EefV0ENYCdSpvbwhLBBZG88cxIU2/5lTggNeRHNxBgp4gnPqZPVbdvU4m0r1wzuXCWYDJuVLSWvoX/mirtuAOL/DEoJRMLC+0Qy2M7KEVonYmZx+sQGCoDzUkBZ5IbeAF+PWAVWY1yfAeZk2j/SgUvV1kYn+t7Uby1tvedppljclGyt4hvrg5qDAp0uVE4/eeOve+RGb7/l9GGWWVZFG4AlRamGjUP/JDPAvjqW8WfFbL2U+0HMKOf4WVR9OjROAXgvWThfncnWbqqnEJU/T7Co55VH1XDkJoFqOKd2GR22JG38yOjLa5ITAwfuPN9HGr5T/h71Y/t7YFtnPFnQ6Rb4AUPpjOIBVCJLLeJCJSFDlGR6aifhMObrFR8gWLm//BIdpBPOgmPNKJ+pF/nE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0204b047-88d2-4a71-6632-08d71a39d2bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:35.1452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3FPhm+E9Nni6HMrVAC12/luOZwMJz8hmf2k1Cl9Lms=;
 b=swbUHEkU5/t2zg37JnYbJ7EZlfnzAi3b2vOKkdPeJbnMZqOzBqv/Cdu8rReAYqSkTBTZq8X8riGVA2MT9UE4uQBPz6mFhAlyU2LF6K/YLZ1oI1y7WU0M1NcaW99HJTgiPa5I3zDspt2bTVEP3Y+TJGpOdyZlqjwwpYCot8tLfns=
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

ZW5hYmxlcyBtbWh1YiBtZWRpdW0gZ3JhaW5lZCBjbG9jayBnYXRpbmcgYW5kIG1lbW9yeSBsaWdo
dCBzbGVlcAoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgNCArKystCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMKaW5kZXggNWM4ZjdiN2FiM2M1Li45Yjk3YjI1NDM0NTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnYuYwpAQCAtNTY5LDcgKzU2OSw5IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQo
dm9pZCAqaGFuZGxlKQogCQkJQU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfAogCQkJQU1EX0NHX1NV
UFBPUlRfSERQX0xTIHwKIAkJCUFNRF9DR19TVVBQT1JUX1NETUFfTUdDRyB8Ci0JCQlBTURfQ0df
U1VQUE9SVF9TRE1BX0xTOworCQkJQU1EX0NHX1NVUFBPUlRfU0RNQV9MUyB8CisJCQlBTURfQ0df
U1VQUE9SVF9NQ19NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX01DX0xTOwogCQlhZGV2LT5wZ19m
bGFncyA9IEFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9
IGFkZXYtPnJldl9pZCArIDB4YTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
