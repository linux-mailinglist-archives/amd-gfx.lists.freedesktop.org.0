Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AD8850A
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89D86EEC5;
	Fri,  9 Aug 2019 21:38:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A116EEBE
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3dw9SntQAQSAsFuzxMvq8rpZ+C6or43SpaUDJuuWHde5BKRekByMhwBe/nUgw6uyyv0MJgZeQQUCO+uoWujam9FoZ0T7j/mpxexZ+WZN5NSjp9CpTnlGpwo0JPxJKaCfEhS/NR88Uaxumx7Epni8l/HARLUzRXvg3n5mt6irZqbvktTsL/LWpcXjOnrp/UZgsrEwCZ+Ww3315JkSf6vSuCgBaXEDStmXUxHhX5yIO2X8RD/V0z1JmESCRW4cdfRTILNzDGpPDpZPo0/Gc1daoD4FjGOy0ZZjg9qpS5RIADAsIYtf9jS1qKkpnG8paehr+pVRuxNiR+SRWFT+b+CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+Ex1vtz7GAhGjODwHfdKk6bSkrigT/4jDyttDOUzHA=;
 b=C3Y5KzOsZZM+0VT9XSTjDXlUSzEA3mDajGBvAby7jDf0/Ffoo2Qmup4cs6qBBcB8px0RrqASF+JohNLA1KDPGNpx/czvB/2LUYR+IxNBNuVoBlqYl4D5uBhrPFNW5435Wt8KiTUvAGzRcBqUwO/rxVYMlImNxAGhhVDMNf9rhsQuSazhElXWMaFzEf6uvYNmh1JRgqGvIs9iGXfBNXyqx30f4FiI6eYvtPvLBuy5tQmJwTTsSJsVGcfuhlSGrSW//YqA+snsvlcUHujEG4BWpAYGQWKzoWwztalLJ9XBrhs7oaXuT/x/hp2KUMhhvVjRBUBbQ72pNNWLNQduLY9xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by BN6PR12MB1268.namprd12.prod.outlook.com
 (2603:10b6:404:1a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Fri, 9 Aug
 2019 21:38:48 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 32/49] drm/amd/display: Add Logging for Gamma Related
 information (1/2)
Date: Fri, 9 Aug 2019 17:37:25 -0400
Message-ID: <20190809213742.30301-33-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(8936002)(47776003)(2906002)(2870700001)(1076003)(2876002)(305945005)(50226002)(356004)(5660300002)(8676002)(6666004)(48376002)(2351001)(11346002)(446003)(49486002)(51416003)(76176011)(6916009)(86362001)(50466002)(126002)(81166006)(53936002)(486006)(2616005)(476003)(336012)(4326008)(70586007)(81156014)(426003)(70206006)(478600001)(36756003)(26005)(316002)(54906003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91b85eb6-dadb-4028-441c-08d71d11f66a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126891DDC8770A93C75B7B9482D60@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7W8lPLhayB9VksGyidF3cUc0y9zjmobPMVknwnjqpfUCuXlMNnkr4u+9+7850urqr+FnCjAaAt8u+67MXKuXQV6eJVY402Ea2APGlnsAjLGcjtQXzX0cnOrO5FpEsWJ7RBOZIg1bg8lrpLr1ub5Z1ub63bl7VY21QdXTWYspY6Fmp/RlVYtsAZG+E1jdfWSHOHYTUvgcRdMydas0YSUtwYMWqEntaoJAeE3P91Y0JAb15K77xpYLDlQT2KjV7qR+lDSI1bRFLFlwVu6G0xoDdxVE/QDz+U7MyDJAG2SnD97xKOkF5DC6jQJQ8EGaVGznWEZa/TJ3fuI8f1+A0G7tzDYngPX5XL0jFQUpHosnRRORRYFjJy8LbhaAITFJP1MOJu/i7j1UVOxVuNtbVGCv8dlPXHIcDD6oifntyOfPBbo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:48.1052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b85eb6-dadb-4028-441c-08d71d11f66a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+Ex1vtz7GAhGjODwHfdKk6bSkrigT/4jDyttDOUzHA=;
 b=jq1jSOF4Yk4ibyxJIeFwd9OqsVS3MT5Nxz6mcaD5Mi53Z6grnRl3sYlgghpuQzULPisw+kfag3A3Tut/rwhsjU9hk3fpMsFhCLRkWWTzdzP8DJgTsa90iiqsIHg8iKkpp9D7wqTjfbYDhTIlTObgHBVArbGmvT7rCOofT3+ycBc=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Wyatt Wood <wyatt.wood@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV3lhdHQgV29vZCA8d3lhdHQud29vZEBhbWQuY29tPgoKW1doeV0KQSByZWNlbnQgYnVn
IHNob3dlZCB0aGF0IGxvZ2dpbmcgd291bGQgYmUgdXNlZnVsIGluCmRlYnVnZ2luZyB2YXJpb3Vz
IGdhbW1hIGlzc3Vlcy4KCltIb3ddCkFkZCBuZXcgbG9nIHR5cGVzIGFuZCBsb2dnaW5nIGNvZGUg
dG8gdGhlIGNvbG9yIG1vZHVsZS4KClNpZ25lZC1vZmYtYnk6IFd5YXR0IFdvb2QgPHd5YXR0Lndv
b2RAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tl
ZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvaW5jbHVkZS9sb2dnZXJfaW50ZXJmYWNlLmggICB8ICAyICsrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9sb2dnZXJfdHlwZXMuaCAgIHwgIDEgKwogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jICB8IDEyICsrKysrKysr
KysrKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5o
ICB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2xvZ2dlcl9pbnRlcmZhY2UuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2xvZ2dlcl9pbnRlcmZhY2UuaApp
bmRleCBhMGI2OGMyNjZkYWIuLjZlMDA4ZGUyNTYyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvbG9nZ2VyX2ludGVyZmFjZS5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2xvZ2dlcl9pbnRlcmZhY2UuaApAQCAtMTU1LDQg
KzE1NSw2IEBAIHZvaWQgY29udGV4dF9jbG9ja190cmFjZSgKIAogI2RlZmluZSBESVNQTEFZX1NU
QVRTX0VORChlbnRyeSkgKHZvaWQpKGVudHJ5KQogCisjZGVmaW5lIExPR19HQU1NQV9XUklURSht
c2csIC4uLikKKwogI2VuZGlmIC8qIF9fREFMX0xPR0dFUl9JTlRFUkZBQ0VfSF9fICovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9sb2dnZXJfdHlwZXMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2xvZ2dlcl90eXBlcy5oCmlu
ZGV4IGVhOGQ0NDU4MTZiOC4uODE2NTBlZTQwZjBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9sb2dnZXJfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9sb2dnZXJfdHlwZXMuaApAQCAtMTE3LDYgKzExNyw3IEBA
IGVudW0gZGNfbG9nX3R5cGUgewogCUxPR19EU0MsCiAjZW5kaWYKIAlMT0dfRFdCLAorCUxPR19H
QU1NQV9ERUJVRywKIAlMT0dfU0VDVElPTl9UT1RBTF9DT1VOVAogfTsKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMK
aW5kZXggNDgwODExM2I5MWJlLi44Zjc4ZWEyMjZkYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYwpAQCAtOTQs
NiArOTQsMTggQEAgdm9pZCBzZXR1cF94X3BvaW50c19kaXN0cmlidXRpb24odm9pZCkKIAl9CiB9
CiAKK3ZvaWQgbG9nX3hfcG9pbnRzX2Rpc3RyaWJ1dGlvbihzdHJ1Y3QgZGFsX2xvZ2dlciAqbG9n
Z2VyKQoreworCWludCBpID0gMDsKKworCWlmIChsb2dnZXIgIT0gTlVMTCkgeworCQlMT0dfR0FN
TUFfV1JJVEUoIl1Mb2cgWCBEaXN0cmlidXRpb25cbiIpOworCisJCWZvciAoaSA9IDA7IGkgPCBN
QVhfSFdfUE9JTlRTOyBpKyspCisJCQlMT0dfR0FNTUFfV1JJVEUoIl0lbGx1XG4iLCBjb29yZGlu
YXRlc194W2ldLngudmFsdWUpOworCX0KK30KKwogc3RhdGljIHZvaWQgY29tcHV0ZV9wcShzdHJ1
Y3QgZml4ZWQzMV8zMiBpbl94LCBzdHJ1Y3QgZml4ZWQzMV8zMiAqb3V0X3kpCiB7CiAJLyogY29u
c3RzIGZvciBQUSBnYW1tYSBmb3JtdWxhLiAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmgKaW5kZXggNjljZWNkMmVj
MjUxLi40NGRkZWE1ODUyM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuaApAQCAtOTIsNiArOTIsNyBAQCBzdHJ1
Y3QgdHJhbnNsYXRlX2Zyb21fbGluZWFyX3NwYWNlX2FyZ3MgewogfTsKIAogdm9pZCBzZXR1cF94
X3BvaW50c19kaXN0cmlidXRpb24odm9pZCk7Cit2b2lkIGxvZ194X3BvaW50c19kaXN0cmlidXRp
b24oc3RydWN0IGRhbF9sb2dnZXIgKmxvZ2dlcik7CiB2b2lkIHByZWNvbXB1dGVfcHEodm9pZCk7
CiB2b2lkIHByZWNvbXB1dGVfZGVfcHEodm9pZCk7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
