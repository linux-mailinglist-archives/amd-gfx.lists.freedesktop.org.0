Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFFCC9081
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283966E192;
	Wed,  2 Oct 2019 18:16:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813C76E192
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9YCZgHug10W0KCd2f7Q9HLMtlN0+zOCimwMfCnb7iypCbuD5anzMdEdZTZ942ZDRKQ+89eI+iBOFbeAqv7l7LciuIXyWhH3Ea7gQNiuVvs3WCOadCGGeRgIZc/P/ZWyAk7Afi2DsskPIiQqfuy+7p0kL0c6Mkj++nQP8FhZ96i+4R9QRCUA0D8MLraUWZt469/G2a3/k18KoQ+4WfDPaIAqtJc6qF6I1RBEDGGoq/C63xJ7dsUFGcz9v2GrRfUvIb1GMNai2VApZ8ObtA6IhgpQGTvxNGAnT+rtcE0RUoXRP0DvCmnHrrYd77+DxSVCvPW2w2nEfqRbnSqZI/Cidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhjKupPaIEk6wZdKtwLqpBvxSJ55ekCd6ehUDKuwO9A=;
 b=Ex6Y15eABXLQCoacBrv2IAgfaBngbS0kuTLoh171IhXhNWgI8qWJuac4aj/1LxOMe1t/tVvDEa1tYjW8PjWgpmjefBKoU9EilhcO0/fFz1rm1K84/3iKlz7DbQ6uZbTwmcBD4/Yu4BGMaBl5bYhcnbTquystc508WwrtzjMpwgCaVd8xz76ACap1Nlqm6tdu7kyoTVwXzmC3zgtR9SqOalrW3Y/ALQu5tcgCnxXNzwh5P2e01O/QIMNLLGhoDeKG/S+kGSs24JnDaC4b58EYQjXStlzW9Gya6NMDpcMZkWGRfB1nse1RzO3KWXU1S/1AEFar6g21JJfh69ZC1as7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 MN2PR12MB3424.namprd12.prod.outlook.com (2603:10b6:208:cc::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:39 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:38 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:37 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/38] drm/amd/display: Reprogram FMT on pipe change
Date: Wed, 2 Oct 2019 14:16:01 -0400
Message-ID: <20191002181633.22805-7-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(376002)(346002)(136003)(39860400002)(428003)(189003)(199004)(7696005)(50466002)(36756003)(8676002)(478600001)(5660300002)(426003)(336012)(26005)(305945005)(186003)(4326008)(2906002)(486006)(70206006)(2616005)(2351001)(476003)(11346002)(16586007)(446003)(316002)(126002)(47776003)(70586007)(8936002)(6666004)(356004)(53416004)(86362001)(1076003)(6916009)(81166006)(76176011)(50226002)(81156014)(48376002)(51416003)(14444005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3424; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55903855-4631-44f3-67d5-08d74764ab0b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3424:
X-Microsoft-Antispam-PRVS: <MN2PR12MB342436F79D45A441C2263E49F99C0@MN2PR12MB3424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqP4I8K5VVxaLH+MUxweRYYAdvoKJf3Mly6Re+YAfrLcvftgD9XgbFU+9lwAF8XInCVec/ag1UQv74L49aOOZYMLBjDiDkTxBBgfP17ChbgXFGoAADQ4RrkZI+zi6n4xLhTPRuezdaq8vvCF+mAglBMQ23MFwI3/wq/ye1tp83J1cN1fk3viIJUPVWBVC5yQrTd8B1NxPBqXsIq7AcxxebVwHblni8/BI+E688L/Cf/2z+k6jH2cFh3P9g+9vFoPFFZ4hf/NgEgdNnUVziKcCCv3ecnxh2XT7d6BO1TciqCWwppkTGFRdio+fBEc5pYAx9F2FVbJKeH4EKhxOBF7BM8t0zOtVo/4KnKqNsxNzRAVhB8kVqW2J/K8Ukd4CvguScbvy7iGdX4LdyDMEJcBgvq+2CmjJS3Hx1UVS+nfVwc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:38.7086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55903855-4631-44f3-67d5-08d74764ab0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhjKupPaIEk6wZdKtwLqpBvxSJ55ekCd6ehUDKuwO9A=;
 b=dug3oP9TydnGK4sDUnChOiaEq27ap/7zzY2JwgsIyMPPbStL2WjqM4mJP+Q6MC0JwfB2VxCQoZWqoTzSbmHUtTC7X4xtooVJvAVDhblThQ/9DHgZves/KSHRf8g0Tl3sspIc+rpgW+9XPOa4U6RW1J0PxibPRxqqkU/Lqy+JfnM=
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
Cc: Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKW1doeV0KV2hlbiBw
bGFuZXMgYXJlIGFkZGVkIG9yIHJlbW92ZWQgZnJvbSBhIHN0cmVhbSwgdGhlIGNoYW5nZQppbiBw
aXBlIHVzYWdlIGZyb20gZHluYW1pYyBNUEMgY29tYmluZSBjYW4gY2F1c2UgYSBzZWNvbmQKc3Ry
ZWFtIHVzaW5nIE9ETSBjb21iaW5lIHRvIHBpY2sgYSBkaWZmZXJlbnQgcGlwZSB0byBjb21iaW5l
IHdpdGguCgpJbiB0aGlzIHNjZW5hcmlvLCBhIGRpZmZlcmVudCBPUFAgaXMgY29ubmVjdGVkIHRv
IHRoZSBPRE0gd2l0aG91dApwcm9ncmFtbWluZyBpdHMgRk1ULgoKW0hvd10KUmVwcm9ncmFtIHRo
ZSBGTVQgaW4gZGNuMjBfcHJvZ3JhbV9waXBlIHdoZW5ldmVyIGEgcGlwZSBpcwpuZXdseSBlbmFi
bGVkLCBvciB3aGVuIGl0cyBvcHAgY2hhbmdlcy4KCkNoYW5nZS1JZDogSTJkMzBiNDdjNzM3MDA5
MTEzM2U0MGQ4Nzk1OTJiNTVlZTFhNTQzODIKU2lnbmVkLW9mZi1ieTogSnVsaWFuIFBhcmtpbiA8
anVsaWFuLnBhcmtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxE
bXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHdzZXEuYyAgICB8IDIwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCAxYjRhYWMxODVmM2YuLjRhMDAzODI5MzU2
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKQEAgLTEzOTksNiArMTM5OSwyNiBAQCBzdGF0aWMgdm9pZCBkY24yMF9wcm9ncmFt
X3BpcGUoCiAJICovCiAJaWYgKHBpcGVfY3R4LT51cGRhdGVfZmxhZ3MuYml0cy5lbmFibGUgfHwg
cGlwZV9jdHgtPnN0cmVhbS0+dXBkYXRlX2ZsYWdzLmJpdHMub3V0X3RmKQogCQlkYy0+aHdzcy5z
ZXRfb3V0cHV0X3RyYW5zZmVyX2Z1bmMocGlwZV9jdHgsIHBpcGVfY3R4LT5zdHJlYW0pOworCisJ
LyogSWYgdGhlIHBpcGUgaGFzIGJlZW4gZW5hYmxlZCBvciBoYXMgYSBkaWZmZXJlbnQgb3BwLCB3
ZQorCSAqIHNob3VsZCByZXByb2dyYW0gdGhlIGZtdC4gVGhpcyBkZWFscyB3aXRoIGNhc2VzIHdo
ZXJlCisJICogaW50ZXJhdGlvbiBiZXR3ZWVuIG1wYyBhbmQgb2RtIGNvbWJpbmUgb24gZGlmZmVy
ZW50IHN0cmVhbXMKKwkgKiBjYXVzZXMgYSBkaWZmZXJlbnQgcGlwZSB0byBiZSBjaG9zZW4gdG8g
b2RtIGNvbWJpbmUgd2l0aC4KKwkgKi8KKwlpZiAocGlwZV9jdHgtPnVwZGF0ZV9mbGFncy5iaXRz
LmVuYWJsZQorCSAgICB8fCBwaXBlX2N0eC0+dXBkYXRlX2ZsYWdzLmJpdHMub3BwX2NoYW5nZWQp
IHsKKworCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5vcHAtPmZ1bmNzLT5vcHBfc2V0X2R5bl9leHBh
bnNpb24oCisJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5vcHAsCisJCQlDT0xPUl9TUEFDRV9ZQ0JD
UjYwMSwKKwkJCXBpcGVfY3R4LT5zdHJlYW0tPnRpbWluZy5kaXNwbGF5X2NvbG9yX2RlcHRoLAor
CQkJcGlwZV9jdHgtPnN0cmVhbS0+c2lnbmFsKTsKKworCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5v
cHAtPmZ1bmNzLT5vcHBfcHJvZ3JhbV9mbXQoCisJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5vcHAs
CisJCQkmcGlwZV9jdHgtPnN0cmVhbS0+Yml0X2RlcHRoX3BhcmFtcywKKwkJCSZwaXBlX2N0eC0+
c3RyZWFtLT5jbGFtcGluZyk7CisJfQogfQogCiBzdGF0aWMgYm9vbCBkb2VzX3BpcGVfbmVlZF9s
b2NrKHN0cnVjdCBwaXBlX2N0eCAqcGlwZSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
