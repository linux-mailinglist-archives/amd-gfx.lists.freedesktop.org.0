Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBE88F96A
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 05:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4C56E462;
	Fri, 16 Aug 2019 03:21:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577C46E462
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 03:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlgabc1qa1DdrJv/IiDlR2EDUDpRUX4ePOSuOl4ri2GsCWzQWOAmieeRQ6hjUVnKF3YpHpw4AFevw34zvRuAYJL8vC/moZxOQKvTt8eJihMXSFlgl2G13V3Ok8V/bxdFopugWFCmZ8AAh83B/5LKHml5CUYxGm7nrv5buqc+dVLOWTiIpqtSaw4GYdRa1yzaY9nHevY37VB8Vl0PoCTYvAvCWS+nJm/miZuSfduPPUOK9A87UUfS9mMkDHQ+r88MxnbcVPKnz7YsLDvYot+FmxSiqCP1c0wdudFEGYw4p16cmk9ht0twN4x7PnbEp6xZ8s7sRPWFJrCLR6oU9H3SFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj/E4riwZHBJaJkGpWl47HuIIXq0vIclX/HCf9zHU8s=;
 b=I01DoTM7GwUvBukI2ngbqk8CCW5jtn60QW4Kkwc9AmIQ0OjA7htRzws2q6TQ8Usg+gqpYeyq3ihQZPEf1KPQ34dkXbQ1vdY/SBxnVoxdPwot1LeoK0qM3BcacW0ZqZQEtwOQFEKkRP7k85meXLx/Pd1FAaGvgYom2uh2UbERDHARApOse/bmzpl/6ZaPJywBHbzwOMgOcZPPf21V+y/sOyc/Qn0NB7/SiWCqBt/V9XhYFVeJAukA+yVbT0+71A6qKtfBhJ8lnVe2mR1130cCl09driqPcPPIo6rmojmZ0bLOcBtUyMvb08ZsROsJF0LRfnQj03Sv71xiW5ACQDB11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:301:4a::20) by BYAPR12MB2710.namprd12.prod.outlook.com
 (2603:10b6:a03:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Fri, 16 Aug
 2019 03:21:37 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR1201CA0010.outlook.office365.com
 (2603:10b6:301:4a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 03:21:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 03:21:36 +0000
Received: from fiona-codemachine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 15 Aug 2019
 22:21:36 -0500
From: Feifei Xu <Feifei.Xu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Set no-retry as default.
Date: Fri, 16 Aug 2019 11:21:31 +0800
Message-ID: <20190816032131.3232-1-Feifei.Xu@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(428003)(199004)(189003)(316002)(53936002)(2616005)(336012)(126002)(426003)(16586007)(476003)(54906003)(8676002)(186003)(2906002)(486006)(26005)(70586007)(70206006)(51416003)(7696005)(36756003)(86362001)(48376002)(2351001)(14444005)(53416004)(81166006)(50466002)(6916009)(81156014)(356004)(478600001)(6666004)(47776003)(305945005)(5660300002)(1076003)(50226002)(8936002)(4326008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2710; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e602852c-61da-46d4-8255-08d721f8d8bf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2710; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2710:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27106B7577F2EC220EA51274FEAF0@BYAPR12MB2710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AnwgG+XV97d5gF1FFcfckgpFCCeRurTxKwdjgkh3jjEcq4BVxe6OTmntF/8s4432zhoWGRB/ivnkzKDLlfs6zB9NzuQj0z/RcpUanWgkbZNjYh9nMcgTpOdXqz+UPfFE9A2IbQcj7k7RDrjg+f3UyVlHl9BGxmhk4Vm/AGLuq5i5l5bfQBVxTDGvukA2BBd+tujh/ZBWE0FVOqTiQkb2U59JzliWFa2mQWPjd+Z2irfWzr14QDk13YzypnWSuqpXDD2TF+8yuozOf00L3uU96ejfyR6Kya82h+X0yJMmYriUKx2PVYsCrCUpLhQ0yEWh+cZr1FF7pFkK87FTMRejYpMvjpiWZCehnHJIm42XBbSjo6mDsXaDN9nvQe9sU97WDHscm0NcBBdSkLQJOmoPKfx5AWc6ruTsWTxYmNUEjSo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 03:21:36.6758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e602852c-61da-46d4-8255-08d721f8d8bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj/E4riwZHBJaJkGpWl47HuIIXq0vIclX/HCf9zHU8s=;
 b=MmUAOuB39Z8svzubWqAEmd2W54qFE87+Wdk8ARfvPYglVXyMijTpGPd1mi1RHgvlN5QJM8jGpG/j2vrK8HfuHj9saD+4WkvjUyIJDmdd8i6as5cikcpec+9arrcT/+x/LDP8ODA0QIyG2NB6oI/0FUQBUrUhewUgBmmoO88rmas=
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
Cc: Feifei.Xu@amd.com, Candice.Li@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLgoKU2lnbmVkLW9mZi1ieTogRmVpZmVpIFh1
IDxGZWlmZWkuWHVAYW1kLmNvbT4KVGVzdGVkLWJ5OiBDYW5kaWNlIExpIDxjYW5kaWNlLmxpQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCAxNTM3MDU4NDhjYzguLjBk
ZjU0ZDQ1MzY5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAt
MTQ1LDcgKzE0NSw3IEBAIGludCBhbWRncHVfYXN5bmNfZ2Z4X3JpbmcgPSAxOwogaW50IGFtZGdw
dV9tY2JwID0gMDsKIGludCBhbWRncHVfZGlzY292ZXJ5ID0gLTE7CiBpbnQgYW1kZ3B1X21lcyA9
IDA7Ci1pbnQgYW1kZ3B1X25vcmV0cnk7CitpbnQgYW1kZ3B1X25vcmV0cnkgPSAxOwogCiBzdHJ1
Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CiAJLm11dGV4ID0gX19NVVRFWF9JTklU
SUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLApAQCAtNjIxLDcgKzYyMSw3IEBAIE1PRFVMRV9QQVJN
X0RFU0MobWVzLAogbW9kdWxlX3BhcmFtX25hbWVkKG1lcywgYW1kZ3B1X21lcywgaW50LCAwNDQ0
KTsKIAogTU9EVUxFX1BBUk1fREVTQyhub3JldHJ5LAotCSJEaXNhYmxlIHJldHJ5IGZhdWx0cyAo
MCA9IHJldHJ5IGVuYWJsZWQgKGRlZmF1bHQpLCAxID0gcmV0cnkgZGlzYWJsZWQpIik7CisJIkRp
c2FibGUgcmV0cnkgZmF1bHRzICgwID0gcmV0cnkgZW5hYmxlZCwgMSA9IHJldHJ5IGRpc2FibGVk
IChkZWZhdWx0KSkiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChub3JldHJ5LCBhbWRncHVfbm9yZXRy
eSwgaW50LCAwNjQ0KTsKIAogI2lmZGVmIENPTkZJR19IU0FfQU1ECi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
