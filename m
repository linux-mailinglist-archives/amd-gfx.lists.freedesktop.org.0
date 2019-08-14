Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B18DF06
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327616E83D;
	Wed, 14 Aug 2019 20:40:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EE36E83F
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8nQtA03YRwMmVsilcC8Cqj58zjT6Lq9Z8o6efilhyldbG82zr7m7o1bxol/mXSOSmOve3tOsiBk7RcShjm2ncu+yxq1WT5IaLL49ILh9MJTwedNrqeLkZKcY37XrOElA5uQcFKAaQ8zdy7bnTq81ZrMDdaQsxnYqyzNKorHIPjtOiA4kJG0l5H3AogzYMx7gRcSb/qAD5FH1acZxEFufHuX9zPueQM4tZuXldYGllQElNN0seJMJDRAKgPByoX0tSioRCPh1TB7qckflP6Za8nQB8jM9E2B+KFvV9lAemTwKrb1nu6+RN+4TPjSPPk8ZKz83qoLiXrE/MzjBn48cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/hkcbURrxA0nu+BbznVBUhdtHK4JQK+hJb2RYyzQC4=;
 b=VQDk1R0spXTHd/udirudPxjCnvy4gfwR+6tGFTdJrZBeOgxMixYFWamQB99NUg2+wxhindkcu6e29pN/w3CQ2SX0akhBtwtsoWGkPf+xtEnjbdRyk0cy7ppUDniOlDn1uJpVixX3KYEi/ZzeWZts7xuLeSeacWVRQ0CLLvX8jKF4WiPj9GLvbUnGC8TA7vxyfyJvXlkdL7aauzR+Fk+jY3ZZ4iU4ndANQlIfBA5vF5AlUlPPYmTbCATdPf51KXbmv6WDEbGnpS1FsDHWgXhEIcxq0FttRxgaLhIyM4JaOCdfRCQv1s0lY9M7+tkcKvQIZL+o1nZT/tqUx+EKO8/ihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:301:4a::24) by DM6PR12MB2715.namprd12.prod.outlook.com
 (2603:10b6:5:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Wed, 14 Aug
 2019 20:40:35 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by MWHPR1201CA0014.outlook.office365.com
 (2603:10b6:301:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:35 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:33 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/5] drm/amd/powerplay: add mode2 reset callback for
 pp_smu_mgr
Date: Wed, 14 Aug 2019 16:40:14 -0400
Message-ID: <1565815217-9533-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(446003)(6666004)(47776003)(486006)(44832011)(53416004)(51416003)(2616005)(7696005)(356004)(336012)(126002)(186003)(5660300002)(26005)(2351001)(476003)(2906002)(426003)(76176011)(316002)(478600001)(16586007)(50466002)(86362001)(48376002)(53936002)(4326008)(81166006)(70586007)(81156014)(70206006)(305945005)(8936002)(50226002)(11346002)(54906003)(6916009)(8676002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a736744-f3e0-49ef-33af-08d720f7a8a2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27150C621CD8D14D8F935560EAAD0@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rmNMGigSkIVPQtCsH98GZXF9Mvn1sDgtVzgJzWKNh8K97pF5GM6koQAf12Z6YREOg6uwtAPANdYRMXLWYkpJ6wKldE0MNITg3PA3GA/kn6sEIt7t++n5eZYtxG1hoIzRG+Na6rsX6AsP60l0LkKs6mOSvZlgk79aIoKydS1tkDWyhxPULIEnpv+vJyBkRsXt25cXz+7YX1g706rBdI7rPTu+77C8VruiZdSAhDRHdXLSBdfZit4d2j8mnml8IqPGTvCaNJKWhfogYEK+vOELErPysQb8sVak/MkrZxRpFX0/pOJBdM5e4bQmAAc0Z1a3QMbwyG/KomMulF5YDb4PV0y0pnF8jm9UUkA6i3Iw8U9CFb5UZXC2Fl9wYB1cELQjCFBUAqubkH0NoDwQfBg+UfRw0QDRMLTIcXfTa37k95A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:35.2416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a736744-f3e0-49ef-33af-08d720f7a8a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/hkcbURrxA0nu+BbznVBUhdtHK4JQK+hJb2RYyzQC4=;
 b=NXCQrXWnxBp4UDyXes4LAfOxIxHdl7VjikPXEzQEeCoF46O3bfTu2GyEJV+FqyRKJmfwvTXV7zuCff4elnXhd8V7YO6aSfQ+3BA/3oItmR1p4WncbTOgKk8wo9hdAlLeIMI6nE1UENyLlOCAFv65DFI3Fwx4PKfz8q1LXjC4qic=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxzbyBkZWZpbmUgcmVzZXQgbW9kZXMgKDAsIDEgYW5kIDIpCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaCB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2h3bWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
aHdtZ3IuaAppbmRleCAwN2ZkNjRhLi5hYmVmZjE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvaHdtZ3IuaApAQCAtMTg5LDYgKzE4OSwxNCBAQCBzdHJ1Y3QgcGhtX3ZjZV9j
bG9ja192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgewogCXN0cnVjdCBwaG1fdmNlX2Nsb2NrX3Zv
bHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQgZW50cmllc1sxXTsKIH07CiAKKworZW51bSBTTVVfQVNJ
Q19SRVNFVF9NT0RFCit7CisgICAgU01VX0FTSUNfUkVTRVRfTU9ERV8wLAorICAgIFNNVV9BU0lD
X1JFU0VUX01PREVfMSwKKyAgICBTTVVfQVNJQ19SRVNFVF9NT0RFXzIsCit9OworCiBzdHJ1Y3Qg
cHBfc211bWdyX2Z1bmMgewogCWNoYXIgKm5hbWU7CiAJaW50ICgqc211X2luaXQpKHN0cnVjdCBw
cF9od21nciAgKmh3bWdyKTsKQEAgLTM0NSw2ICszNTMsNyBAQCBzdHJ1Y3QgcHBfaHdtZ3JfZnVu
YyB7CiAJaW50ICgqZ2V0X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBwcF9od21nciAqaHdtZ3Is
IGNoYXIgKmJ1Zik7CiAJaW50ICgqc2V0X3BwZmVhdHVyZV9zdGF0dXMpKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsIHVpbnQ2NF90IHBwZmVhdHVyZV9tYXNrcyk7CiAJaW50ICgqc2V0X21wMV9zdGF0
ZSkoc3RydWN0IHBwX2h3bWdyICpod21nciwgZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKTsK
KwlpbnQgKCphc2ljX3Jlc2V0KShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBlbnVtIFNNVV9BU0lD
X1JFU0VUX01PREUgbW9kZSk7CiB9OwogCiBzdHJ1Y3QgcHBfdGFibGVfZnVuYyB7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
