Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7816F2F
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F236F6E862;
	Wed,  8 May 2019 02:46:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0171F6E862
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:45:59 +0000 (UTC)
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 CY4PR12MB1221.namprd12.prod.outlook.com (2603:10b6:903:3d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Wed, 8 May 2019 02:45:58 +0000
Received: from DM3NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:45:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT046.mail.protection.outlook.com (10.152.83.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:45:57 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:45:56 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/9] drm/amdgpu: Add new PSP cmd GFX_CMD_ID_PROG_REG
Date: Wed, 8 May 2019 10:45:35 +0800
Message-ID: <1557283541-7877-4-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(14444005)(70206006)(81156014)(50226002)(16586007)(53936002)(8936002)(68736007)(53416004)(336012)(6666004)(356004)(26005)(72206003)(478600001)(186003)(77096007)(48376002)(4326008)(126002)(476003)(54906003)(2616005)(486006)(2351001)(86362001)(50466002)(47776003)(70586007)(316002)(6916009)(36756003)(76176011)(5660300002)(2906002)(426003)(81166006)(8676002)(7696005)(51416003)(11346002)(446003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1221; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b721dcc1-c9b5-41ca-6c88-08d6d35f4ca6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1221; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1221:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1221850267C03C7DBF5405BBFE320@CY4PR12MB1221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MMqaVmIZEz3VD9cfCHjh0J9AJCdfegUYo2EjyD/H91uglToMHmoiMKSrfpSbkYJTAsVvoc5cPcBsMZ0ebPcMM/4NtMqMVG+vsGtwDwtPe4Oa/xk47hkn9NZIEZhv1AgnUkAzH+7hHVpxc/yMefY8j1hkhvccXMu27Ofw27tYnUmd0p9QNLXrPXRkbtG24efsI+vcnO/QbmkMG6YrRhuzWJ6gEP3/8yak1XpRQpVFKt6vVjiCsazO/0Ug+c602lZi9NmjazT94mUot/rX71WhjraSbP+x/sx3wjwp+v3AeVaHNc+n/JW1ZODAEVfvGeZAQBNbh6a2EVrlmp86Hc871INJ3s2E7sSY83VVtgK2WO9cS/oVqNoYNbi7vcSz27hwMLW1UX1pNJJXsl+Y9xN9EiBoyh7YiAmprXtSxFiSkhw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:45:57.9548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b721dcc1-c9b5-41ca-6c88-08d6d35f4ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hBf4BXXa28wMzOAz/3xKG7j3PvSb5JzB/HGLjTL0Z8=;
 b=MEjvWCajCP8oAZQwXd3LpRpkE8XNKIEXMTg3TRdp7DZzXw3qxwe63SmfTzZZ6utumeszl7bn1oG/ccJSXYjVHeUInBZrAZ0eh41Ut2Ybwd+xc/GjvumSfFSXRr8j9x3AYIn9zPjDLcyRu837hWhVhzjBMI0d/MYQg5hEJyTACGs=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIG5ldyBQU1AgY29tbWFuZCBHRlhfQ01EX0lEX1BST0dfUkVHIGRlZmluaXRpb24KCkNoYW5n
ZS1JZDogSTY4NWJhYTJhMjE5Y2FjNjA0MTdjMmFhNjA5Y2QzZDZiOWZmMmIwY2YKU2lnbmVkLW9m
Zi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF9nZnhfaWYuaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9wc3BfZ2Z4X2lmLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfZ2Z4X2lm
LmgKaW5kZXggMmY3OTc2NS4uN2Y4ZWRjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX2dmeF9pZi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Bz
cF9nZnhfaWYuaApAQCAtOTQsNiArOTQsNyBAQCBlbnVtIHBzcF9nZnhfY21kX2lkCiAgICAgR0ZY
X0NNRF9JRF9TQVZFX1JFU1RPUkUgPSAweDAwMDAwMDA4LCAgIC8qIHNhdmUvcmVzdG9yZSBIVyBJ
UCBGVyAqLwogICAgIEdGWF9DTURfSURfU0VUVVBfVk1SICAgID0gMHgwMDAwMDAwOSwgICAvKiBz
ZXR1cCBWTVIgcmVnaW9uICovCiAgICAgR0ZYX0NNRF9JRF9ERVNUUk9ZX1ZNUiAgPSAweDAwMDAw
MDBBLCAgIC8qIGRlc3Ryb3kgVk1SIHJlZ2lvbiAqLworICAgIEdGWF9DTURfSURfUFJPR19SRUcg
ICAgID0gMHgwMDAwMDAwQiwgICAvKiBwcm9ncmFtIHJlZ3MgKi8KIH07CiAKIApAQCAtMjE3LDYg
KzIxOCwxMiBAQCBzdHJ1Y3QgcHNwX2dmeF9jbWRfc2F2ZV9yZXN0b3JlX2lwX2Z3CiAgICAgZW51
bSBwc3BfZ2Z4X2Z3X3R5cGUgICAgZndfdHlwZTsgICAgICAgICAgICAgIC8qIEZXIHR5cGUgKi8K
IH07CiAKKy8qIENvbW1hbmQgdG8gc2V0dXAgcmVnaXN0ZXIgcHJvZ3JhbSAqLworc3RydWN0IHBz
cF9nZnhfY21kX3JlZ19wcm9nIHsKKwl1aW50MzJfdAlyZWdfdmFsdWU7CisJdWludDMyX3QJcmVn
X2lkOworfTsKKwogLyogQWxsIEdGWCByaW5nIGJ1ZmZlciBjb21tYW5kcy4gKi8KIHVuaW9uIHBz
cF9nZnhfY29tbWFuZHMKIHsKQEAgLTIyNiw2ICsyMzMsNyBAQCB1bmlvbiBwc3BfZ2Z4X2NvbW1h
bmRzCiAgICAgc3RydWN0IHBzcF9nZnhfY21kX3NldHVwX3RtciAgICAgICAgY21kX3NldHVwX3Rt
cjsKICAgICBzdHJ1Y3QgcHNwX2dmeF9jbWRfbG9hZF9pcF9mdyAgICAgICBjbWRfbG9hZF9pcF9m
dzsKICAgICBzdHJ1Y3QgcHNwX2dmeF9jbWRfc2F2ZV9yZXN0b3JlX2lwX2Z3IGNtZF9zYXZlX3Jl
c3RvcmVfaXBfZnc7CisgICAgc3RydWN0IHBzcF9nZnhfY21kX3JlZ19wcm9nICAgICAgIGNtZF9z
ZXR1cF9yZWdfcHJvZzsKIH07CiAKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
