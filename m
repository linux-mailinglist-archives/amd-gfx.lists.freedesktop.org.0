Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F3A3375
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 11:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232C96E29B;
	Fri, 30 Aug 2019 09:12:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6116E287
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 09:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaC1Gn4f89ZQ04uoKNedEPAUK3RjC57FraABNTpvDQJayDAC23E3X99ap8Mp/6q0U5mAcIGaUXtkol5HYZR9vM4wHzPOvbO4J3/gDDFzxXxhEH9BnH1gIdjsceQXm2qEE+Z2g9XsbTkPAanYn4mBdc16V//gW0cRF6J0Ka9crDsVeymILbaI7R69RWdOw+OEln8iY6/xz3ePmqBMHmksNfdBWaEmkNjCbYS0H8A5cmIf53a4y6nLbfEiBsz6jQ0GPxBvicsZmMPGY+Fqz86C/Ill58ujslvctF2A3E3QOV/hglyDh0Y+y3Tq51FrysAiKpV76TFQPuEYbfwt1Bqdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeyG8jjbPI0Vj0HKoKM2g/GHT/Gq2TT/KYbj3psG8kQ=;
 b=KQr/3VgFHXXi+TNMNJNMWg9i/f6boY+11Zzdy9NzGMLG6/YEIYCk+PfTM24BnhgT7UDAeVhwHUc7XrNWDlawAdMclyKGuEPvb7PWQvTGwY7z0D6nTY42naipRebv51ZZlxuQ3NJQZ7vtrlmbM8xYaREIl0Gg6b9ZIk6h7SeopnXhlqF3pKw+M/8FQdr4+IBPqk0l4Xz4ndWGI2q45mAaSSucdrrLk+zxS/bbP2as8xV0fEVGixQUJcyPduSo6UWLVxPPAccoxnbuEqrFoCSw4eJppOcSA4RI7mBCo7dGgvHsnWhT2HhsrZbPehuJWWpTYfZEUO1ddVrDfjmXnB1Clg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0026.namprd12.prod.outlook.com (2603:10b6:903:129::12)
 by CY4PR12MB1256.namprd12.prod.outlook.com (2603:10b6:903:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19; Fri, 30 Aug
 2019 09:12:15 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by CY4PR12CA0026.outlook.office365.com
 (2603:10b6:903:129::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 09:12:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:12:15 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 04:12:10 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amdgpu: fix no interrupt issue for renoir emu (v2)
Date: Fri, 30 Aug 2019 17:11:51 +0800
Message-ID: <1567156311-12872-2-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567156311-12872-1-git-send-email-aaron.liu@amd.com>
References: <1567156311-12872-1-git-send-email-aaron.liu@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(54906003)(316002)(70206006)(70586007)(44832011)(336012)(26005)(4326008)(486006)(11346002)(6916009)(47776003)(426003)(16586007)(36756003)(446003)(50226002)(476003)(2616005)(6666004)(356004)(51416003)(5660300002)(53416004)(2351001)(8676002)(81156014)(81166006)(48376002)(14444005)(76176011)(7696005)(50466002)(8936002)(126002)(2906002)(305945005)(186003)(86362001)(53936002)(478600001)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1256; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3aec540-5ebc-4873-98b2-08d72d2a268b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1256; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1256:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1256FAD889742A49858EBEB1F0BD0@CY4PR12MB1256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VbzDjVnUd0CWCdNXWe1ObCh2S3z2sdKTztoiajx24uAPM6R0949oDOFuCrl84h6MIYBTv3X6Rurc3yXpqHhussVWY6Z2+Sx6Ez+FA6jOAk+p4fItUXbXYlsOQjwqMUT7nICvMjMw03KkkUP9mflXKmgYaiOuP9ob5c8ZCbHRNrP4CPy/LtIPoUQNIhLsw3OK9BCxtChXEqbMWUsR7Kqv2u09HGbAA+FoImuIU4GlxIudTSle/Uv8pj0KWUJ2FYMmNKRIHBpj9gvVhhpj0egpaqICu6ya9G9L0eiPSeCpTr4Trq1ObtRrg4n9H7KJWzS4O9mn8T/OBVC56/ZTpwdj7uBiUqwwta527EjIv0iZgyKVSCNLNVeeYPDe3lhMT5cfaPbkajbaAvEja9tlPAjT0ZumRwEJICFkqVfYL4Gswzs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:12:15.3790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aec540-5ebc-4873-98b2-08d72d2a268b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1256
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeyG8jjbPI0Vj0HKoKM2g/GHT/Gq2TT/KYbj3psG8kQ=;
 b=HKYBT19RDpFp13HGd8jUWzKgIw5uV65CT7bNGrCnObbiI5efVJviLZ2qnd7kt/nzmmmH1DMcOM4C0z+KVIFdgtua+vPWXOgJ59NAphSxkxIb56tj/N6Tyzoi55vX7a/4dz/N6R/EdAkUIQv81sF4F5S9jPGS0Yj6habDz9Xvw3s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ray.Huang@amd.com,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gcmVub2lyJ3MgdmVnYTEwX2loIG1vZGVsLCB0aGVyZSdzIGEgc2VjdXJpdHkgY2hhbmdlIGlu
IG1tSUhfQ0hJQ0tFTgpyZWdpc3RlciwgdGhhdCBsaW1pdHMgSUggdG8gdXNlIHBoeXNpY2FsIGFk
ZHJlc3MgKEZCUEEsIEdQQSkgZGlyZWN0bHkuClRob3NlIGNoaWNrZW4gYml0cyBuZWVkIHRvIGJl
IHByb2dyYW1tZWQgZmlyc3QuCgpTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCmluZGV4IGYxOTI2OGEuLmIyNzNlYjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCkBAIC0yMzIsNyArMjMyLDEzIEBAIHN0YXRpYyBp
bnQgdmVnYTEwX2loX2lycV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCVdSRUcz
Ml9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQkFTRV9ISSwgKGloLT5ncHVfYWRkciA+PiA0MCkg
JiAweGZmKTsKIAogCWloX3JiX2NudGwgPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JC
X0NOVEwpOworCWloX2NoaWNrZW4gPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX0NISUNL
RU4pOwogCWloX3JiX2NudGwgPSB2ZWdhMTBfaWhfcmJfY250bChpaCwgaWhfcmJfY250bCk7CisJ
aWYgKGFkZXYtPmlycS5paC51c2VfYnVzX2FkZHIpIHsKKwkJaWhfY2hpY2tlbiA9IFJFR19TRVRf
RklFTEQoaWhfY2hpY2tlbiwgSUhfQ0hJQ0tFTiwgTUNfU1BBQ0VfR1BBX0VOQUJMRSwgMSk7CisJ
fSBlbHNlIHsKKwkJaWhfY2hpY2tlbiA9IFJFR19TRVRfRklFTEQoaWhfY2hpY2tlbiwgSUhfQ0hJ
Q0tFTiwgTUNfU1BBQ0VfRkJQQV9FTkFCTEUsIDEpOworCX0KIAlpaF9yYl9jbnRsID0gUkVHX1NF
VF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMLCBSUFRSX1JFQVJNLAogCQkJCSAgICEhYWRl
di0+aXJxLm1zaV9lbmFibGVkKTsKIApAQCAtMjQ1LDE0ICsyNTEsMTAgQEAgc3RhdGljIGludCB2
ZWdhMTBfaWhfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCVdSRUczMl9T
T0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTCwgaWhfcmJfY250bCk7CiAJfQogCi0JaWYgKChh
ZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyB8fCBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9SRU5PSVIpICYmCi0JCWFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9B
RF9ESVJFQ1QpIHsKLQkJaWYgKGFkZXYtPmlycS5paC51c2VfYnVzX2FkZHIpIHsKLQkJCWloX2No
aWNrZW4gPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX0NISUNLRU4pOwotCQkJaWhfY2hp
Y2tlbiB8PSAweDAwMDAwMDEwOwotCQkJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DSElD
S0VOLCBpaF9jaGlja2VuKTsKLQkJfQotCX0KKwlpZiAoKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQ
X0FSQ1RVUlVTCisJCSYmIGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9B
RF9ESVJFQ1QpCisJCXx8IGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKKwkJV1JFRzMy
X1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DSElDS0VOLCBpaF9jaGlja2VuKTsKIAogCS8qIHNldCB0
aGUgd3JpdGViYWNrIGFkZHJlc3Mgd2hldGhlciBpdCdzIGVuYWJsZWQgb3Igbm90ICovCiAJV1JF
RzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9XUFRSX0FERFJfTE8sCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
