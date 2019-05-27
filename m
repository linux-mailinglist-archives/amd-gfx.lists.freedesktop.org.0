Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B442BAEB
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B68189AC2;
	Mon, 27 May 2019 19:52:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700048.outbound.protection.outlook.com [40.107.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A63389AC0
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:19 +0000 (UTC)
Received: from DM5PR12CA0020.namprd12.prod.outlook.com (10.172.32.158) by
 DM5PR12MB1273.namprd12.prod.outlook.com (10.168.238.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Mon, 27 May 2019 19:52:17 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0020.outlook.office365.com
 (2603:10b6:4:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:52:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:17 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:00 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/26] drm/amd/display: Add writeback_config to VBA vars
Date: Mon, 27 May 2019 15:50:58 -0400
Message-ID: <1558986665-12964-20-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(6916009)(16586007)(316002)(2876002)(486006)(51416003)(476003)(2906002)(47776003)(2616005)(70586007)(70206006)(2351001)(446003)(11346002)(126002)(68736007)(76176011)(48376002)(7696005)(50466002)(426003)(36756003)(305945005)(50226002)(336012)(8936002)(186003)(81166006)(26005)(77096007)(8676002)(81156014)(5660300002)(72206003)(4744005)(86152003)(4326008)(86362001)(356004)(478600001)(53416004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1273; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e4853a-de5c-4053-ea24-08d6e2dcd2a6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1273; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1273:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1273CA6652F4FE51AB2234F5821D0@DM5PR12MB1273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M4H4eQY5xjzV0JB/gv3WTUyAyHto29YIWK90jG7nsLL5whkic+cLtovmfFpDhUlrmK79eJgICE5AIdQNH9ARaoGpzG3GNiXK7Hzl1FmQXGrpRyKWAaICdrafOLk8Dz4I+KNdwYbVT11m6ZjGBRw6no9uHagZjpPSTm7T/HpzcZCDcyRQizUCLrJqF7ZiYmeyoE+Ro/DPAW/vCbHob/AqIUxTWASJJ3cVualL2s1KNtRPOwnx8vlHZbp6J7cnzyt0qUNwdtzbK4/VRM918NFsgY4F0ISVwh2tOCYkTVffs4+U7sin1Ob9s5WlMXHXVpWGWMlSHTxxaIEXy9F0qThwpJHS41rvP5AU/doCiID2JKMZBKR3U0dAYfjUS5LR9DsUr0OnYYh1RqpG8pNIajW4QgvQ3bdY3HLwkR4nd2xTTlA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:17.2299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e4853a-de5c-4053-ea24-08d6e2dcd2a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij01FJqXZ38CYyAiGPqEsCvPH2R/yjtog41kgXSFw2I=;
 b=DSJggcgh4luO1/CBz9OkdUpBJneXSWMTwN4RXCOpm5OAJqwcKOWn9q8OWgPqZIDSZLKVTKfmZNSjO1nLCnXmPPBcTsZ/nOGNZ+do+a+jHKf34wRY20fZpnozBR2fcgNgnFUYe/kX72WkFlRSQgHkLKXRsf6pBtiWNC/4GmHIIK0=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKQWRkaW5nIHdyaXRl
YmFja19jb25maWcgZW51bSB0byB2YmFfdmFyc19zdCwgcmVwbGFjaW5nIG9sZCBmbGFnLgpJbml0
aWFsaXplIHRvIGRtX25vcm1hbC4KClNpZ25lZC1vZmYtYnk6IElseWEgQmFrb3VsaW4gPElseWEu
QmFrb3VsaW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1
QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9lbnVtcy5oIHwgNiAr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9lbnVtcy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfZW51bXMuaAppbmRl
eCBjNTllNTgyLi4xNzRjNDE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9lbnVtcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX2VudW1zLmgKQEAgLTE0Nyw0ICsxNDcsMTAgQEAg
ZW51bSBkbV92YWxpZGF0aW9uX3N0YXR1cyB7CiAJRE1MX0ZBSUxfVl9SQVRJT19QUkVGRVRDSCwK
IH07CiAKK2VudW0gd3JpdGViYWNrX2NvbmZpZyB7CisJZG1fbm9ybWFsLAorCWRtX3dob2xlX2J1
ZmZlcl9mb3Jfc2luZ2xlX3N0cmVhbV9ub19pbnRlcmxlYXZlLAorCWRtX3dob2xlX2J1ZmZlcl9m
b3Jfc2luZ2xlX3N0cmVhbV9pbnRlcmxlYXZlLAorfTsKKwogI2VuZGlmCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
