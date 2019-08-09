Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0F6884E4
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3366B6EEA8;
	Fri,  9 Aug 2019 21:38:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9DC6EEA4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKyX67d1MFc2ph20w7/uA//d0dlkyQFVcNem7Vwyj2oQEBqbaEwxagkl7DTBuFSLThgYpv1QgdpNreqIPIXgwT9YkHKAIckAO0Ti/ZyFi+fiaPlI82vCBrAVb2ZVmn00mUqNw1HNlUNdP7yrqx0awJcOxZdrEXIFcxK4PxUCQcwXIpA75u2adwqymF2p5v0i6EmuR6BIqq/yHnsLLXli/XjlPVQ91GglaGesLnfZmFnH/jtEsypHKLtWn/6xIYUqwD8/l3Un/+pQd9SXbKudIGAEIo56K+7t2uYam811j/tGAmqDpjlrXSqPS2B03INSprl3S4CELFpbFC/hAg/x2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVjml+5FqEf+/tM8zJ7itcL867O+tzjXC1X56hIQuN0=;
 b=QV2p9VLZ+6utxANGT8qclCaLR/z932emxdnXGizG4Oy3Hbfg8WgoexwBpvmeVe4KneuDhp91gOlUuvKBzLoqRTcsDFHFYr6NWwJlhNM6NR8v+NX2xZM5jW2ZDn4+pgRT8/kc98aTqIayEFOswC1b3ua9dOnoabxY6htxF8ICD60Fmf/adyQJqbZFZw/TDEqDXqD/AB43dDu30uwWLSYel09y2XIu2g9zRkVvjC9/s3OFrKf+9kOA6WIcuo3XEACR5HJStSzUNFaiQ610qVWEVyJ10UrjbxhOVSmx1MUJWJc1+AXdNwmLfYgb0K0uTuZ5SBLMdfZzIDo6wcSkOQ6gSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (10.175.82.142) by
 DM5PR12MB1529.namprd12.prod.outlook.com (10.172.33.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 9 Aug 2019 21:38:16 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:16 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/49] drm/amd/display: fix issue where 252-255 values are
 clipped
Date: Fri, 9 Aug 2019 17:36:58 -0400
Message-ID: <20190809213742.30301-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(4326008)(2906002)(5660300002)(6916009)(70206006)(49486002)(1076003)(2870700001)(356004)(70586007)(478600001)(6666004)(50466002)(336012)(2876002)(446003)(2616005)(48376002)(426003)(11346002)(36756003)(126002)(476003)(51416003)(50226002)(8936002)(76176011)(47776003)(2351001)(54906003)(186003)(486006)(316002)(305945005)(8676002)(26005)(81156014)(81166006)(86362001)(53936002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1529; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2564906a-af3c-4017-c48f-08d71d11e36c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1529; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1529:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1529FFC499E8F5A60E58C61882D60@DM5PR12MB1529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zm6OJUsjXMZpdwg+dv9wGuxxVd5A0VE/VmA8vOYhbJjThzxMLhveQyyPsJTQue+T8jve2cXOCualxnc4ELweeE3pjkSf9BdPDCXB8P2yNDszg6TRLcNmcyqO618uqJXq3W7CXV60TeegL/o3W0wzAxjpaAVVTljRVrgePlaquZX4e+QDIr3Zi01RleQTM3xVkA9Uizy9d6Vx89bgfokpA+BWUiYNj/Pp2BtJafZA1rFIHVwCF0tYjWXrDovcD53kgaPXuXM0pidqCxguQsINRLnVSX6ZD+3LwprUeXlFqSagl+UCCZiR7iAvvLzfpZcwEgvCD1/2gEB3wepn604sWa2iKoRgm0QrlNnYjl2yV2z90on+Y0KwAGqybWypzovQfT01tqd6u0okKKWh0gyVlQAC+BCMySwUYrKVU19BtqA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:16.1688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2564906a-af3c-4017-c48f-08d71d11e36c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVjml+5FqEf+/tM8zJ7itcL867O+tzjXC1X56hIQuN0=;
 b=qMcK2vUEydJ9t96ZLaokbSgLZb7QPhgDxMU0ZeWi0JWEM20WdK6NCGIvAkUkNIbCawf1+T9uPfDg0VrSS4CqyZdNqhu3FhCAvEAfay8VFiwVGu2dlKkO920pz8PvQhgYw4CanBEkBHpV+iyQ8fnLLIyM1O9/n7R0RHmquKE2IWY=
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
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpXaGVuIGVuZHBv
aW50IGlzIGF0IHRoZSBib3VuZGFyeSBvZiBhIHJlZ2lvbiwgc3VjaCBhcyBhdCAyXjA9MQp3ZSBm
aW5kIHRoYXQgdGhlIGxhc3Qgc2VnbWVudCBoYXMgYSBzaGFycCBzbG9wZSBhbmQgc29tZSBwb2lu
dHMKYXJlIGNsaXBwZWQgYXQgdGhlIHRvcC4KCltIb3ddCklmIGVuZCBwb2ludCBpcyAxLCB3aGlj
aCBpcyBleGFjdGx5IGF0IHRoZSAyXjAgcmVnaW9uIGJvdW5kYXJ5LCB3ZQpuZWVkIHRvIHByb2dy
YW0gYW4gYWRkaXRpb25hbCByZWdpb24gYmV5b25kIHRoaXMgcG9pbnQuCgpTaWduZWQtb2ZmLWJ5
OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3ly
IDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2NtX2NvbW1v
bi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfY21fY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfY21fY29tbW9uLmMKaW5kZXggNzQ2OTMzM2EyYzhhLi44MTY2ZmRiYWNkNzMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9jbV9jb21tb24u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21fY29t
bW9uLmMKQEAgLTM1Nyw5ICszNTcsMTAgQEAgYm9vbCBjbV9oZWxwZXJfdHJhbnNsYXRlX2N1cnZl
X3RvX2h3X2Zvcm1hdCgKIAkJc2VnX2Rpc3RyWzddID0gNDsKIAkJc2VnX2Rpc3RyWzhdID0gNDsK
IAkJc2VnX2Rpc3RyWzldID0gNDsKKwkJc2VnX2Rpc3RyWzEwXSA9IDE7CiAKIAkJcmVnaW9uX3N0
YXJ0ID0gLTEwOwotCQlyZWdpb25fZW5kID0gMDsKKwkJcmVnaW9uX2VuZCA9IDE7CiAJfQogCiAJ
Zm9yIChpID0gcmVnaW9uX2VuZCAtIHJlZ2lvbl9zdGFydDsgaSA8IE1BWF9SRUdJT05TX05VTUJF
UiA7IGkrKykKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
