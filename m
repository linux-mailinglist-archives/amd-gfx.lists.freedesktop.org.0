Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED5591DD
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 05:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2656E872;
	Fri, 28 Jun 2019 03:15:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFE46E872
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 03:15:38 +0000 (UTC)
Received: from SN1PR12CA0108.namprd12.prod.outlook.com (2603:10b6:802:21::43)
 by BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:46::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Fri, 28 Jun
 2019 03:15:36 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by SN1PR12CA0108.outlook.office365.com
 (2603:10b6:802:21::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Fri, 28 Jun 2019 03:15:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Fri, 28 Jun 2019 03:15:36 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 27 Jun 2019
 22:15:34 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: use hardware fan control if no powerplay
 fan table
Date: Fri, 28 Jun 2019 11:15:29 +0800
Message-ID: <20190628031529.12017-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(86362001)(70206006)(476003)(336012)(2351001)(2906002)(53936002)(72206003)(5660300002)(50466002)(486006)(44832011)(53416004)(126002)(81166006)(426003)(70586007)(2616005)(48376002)(305945005)(478600001)(81156014)(8676002)(68736007)(50226002)(356004)(6666004)(8936002)(14444005)(186003)(36756003)(2870700001)(7696005)(51416003)(6916009)(47776003)(77096007)(316002)(26005)(1076003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3473; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bec220f-3b35-4464-2a5d-08d6fb76e397
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3473; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3473:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34737BC5F9CE1B83FEF1340AE4FC0@BN8PR12MB3473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 00826B6158
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OWMf/R4B8w9GWcd9UK025BEIK+s6kw2h+BpijgAMEzM1u49CiJi2KOhDNd0mn/pZof4wUSadERa54/MacJ95GGcBgnWzW51ssDT8Eh7+b773jfWHUOre/XUA5tH5tpIUZm74eSYfwRDRrgMbFyu3Hf9MmJK4ZVyLmzXQwTqXdeIbIwFhM2ibCva6usodVKJ6h7jg3gfBaRCGDiVc1u8+mWtQT7/2T5/YRF7ROebPnZ9hT6z8mMMJlJPwHeJQ+cdT0mIGvTzKxgflcSGbnLmkRV4lf7JvgjC37rCPWJzm8UxiREqMpNZBzLgrntlSCFfbPjs5/avceNi7HDeDyv5vNlnWP8fd7TVTKrtljIxR9iX8v77byxjGDDqU8Z5AG2SO7qKO/2BPK0lZhF4z9VNc40q05i/D/i6pJ97D4jw5pQs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2019 03:15:36.1324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec220f-3b35-4464-2a5d-08d6fb76e397
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXlYBLkuwK4SjbCu2wobWEcV0Ng4LDLM1IyyrEKD1IM=;
 b=iYIk6LlJ3Fa3NcnTJlDsx2Nfm9DzQG3Y9YM1FdrDceoJpcqQxI++QxNWPWhe0bZ0OdNDDab1XPpj0fezvc+YmhaCoMCflZCuNNipB39l/nP2VRS7m0bLNObZnqdUoLsCSC7SqCon2nH8mZNZwHZxRbusVC0UgILK0mApoqnCiOE=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIFNNQyBkZWZhdWx0IGZhbiB0YWJsZSBpZiBubyBleHRlcm5hbCBwb3dlcnBsYXkgZmFuIHRh
YmxlLgoKQ2hhbmdlLUlkOiBJY2Q3NDY3YTdmYzUyODdhOTI5NDViYTBmY2MxOTY5OTE5MmIxNjgz
YQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Byb2Nlc3NfcHB0YWJsZXNfdjFfMC5jIHwg
NCArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaCAgICAgICAg
ICAgICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3Bv
bGFyaXMxMF9zbXVtZ3IuYyAgICAgfCA0ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9wcm9jZXNzX3BwdGFibGVzX3YxXzAuYwppbmRleCBhZTY0ZmY3
MTUzZDYuLjFjZDVhOGI1Y2RjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMKQEAgLTkxNiw4ICs5
MTYsMTAgQEAgc3RhdGljIGludCBpbml0X3RoZXJtYWxfY29udHJvbGxlcigKIAkJCVBITV9QbGF0
Zm9ybUNhcHNfVGhlcm1hbENvbnRyb2xsZXIKIAkJICApOwogCi0JaWYgKDAgPT0gcG93ZXJwbGF5
X3RhYmxlLT51c0ZhblRhYmxlT2Zmc2V0KQorCWlmICgwID09IHBvd2VycGxheV90YWJsZS0+dXNG
YW5UYWJsZU9mZnNldCkgeworCQlod21nci0+dGhlcm1hbF9jb250cm9sbGVyLnVzZV9od19mYW5f
Y29udHJvbCA9IDE7CiAJCXJldHVybiAwOworCX0KIAogCWZhbl90YWJsZSA9IChjb25zdCBQUFRh
YmxlX0dlbmVyaWNfU3ViVGFibGVfSGVhZGVyICopCiAJCSgoKHVuc2lnbmVkIGxvbmcpcG93ZXJw
bGF5X3RhYmxlKSArCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9od21nci5oCmlu
ZGV4IDJmMTg2ZmNiZGZjNS4uZWM1M2JmMjQzOTZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9pbmMvaHdtZ3IuaApAQCAtNjk3LDYgKzY5Nyw3IEBAIHN0cnVjdCBwcF90aGVybWFs
X2NvbnRyb2xsZXJfaW5mbyB7CiAJdWludDhfdCB1Y1R5cGU7CiAJdWludDhfdCB1Y0kyY0xpbmU7
CiAJdWludDhfdCB1Y0kyY0FkZHJlc3M7CisJdWludDhfdCB1c2VfaHdfZmFuX2NvbnRyb2w7CiAJ
c3RydWN0IHBwX2Zhbl9pbmZvIGZhbkluZm87CiAJc3RydWN0IHBwX2FkdmFuY2VfZmFuX2NvbnRy
b2xfcGFyYW1ldGVycyBhZHZhbmNlRmFuQ29udHJvbFBhcmFtZXRlcnM7CiB9OwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVtZ3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211bWdy
LmMKaW5kZXggZmJhYzJkMzMyNmI1Li5hMWE5ZjYxOTYwMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci9wb2xhcmlzMTBfc211bWdyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMxMF9zbXVtZ3IuYwpAQCAt
MjA5Miw2ICsyMDkyLDEwIEBAIHN0YXRpYyBpbnQgcG9sYXJpczEwX3RoZXJtYWxfc2V0dXBfZmFu
X3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCXJldHVybiAwOwogCX0KIAorCS8qIHVz
ZSBoYXJkd2FyZSBmYW4gY29udHJvbCAqLworCWlmIChod21nci0+dGhlcm1hbF9jb250cm9sbGVy
LnVzZV9od19mYW5fY29udHJvbCkKKwkJcmV0dXJuIDA7CisKIAl0bXA2NCA9IGh3bWdyLT50aGVy
bWFsX2NvbnRyb2xsZXIuYWR2YW5jZUZhbkNvbnRyb2xQYXJhbWV0ZXJzLgogCQkJdXNQV01NaW4g
KiBkdXR5MTAwOwogCWRvX2Rpdih0bXA2NCwgMTAwMDApOwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
