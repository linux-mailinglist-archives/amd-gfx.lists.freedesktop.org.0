Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E86F7CE
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31BF899B5;
	Mon, 22 Jul 2019 03:15:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D028C899B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+YxqhLdYlJIvLXLOSwUFNB94vZ69SnRbXhBBVJzX40ldP15Mw2Km062KVsk4x4INPcy59Xobc+ZaRxmL2dHYRAzISayx1JGvQKedo/NRreJWfRX99ztq4dDVGouF/idJiNtFqcfwOxIQUXCf/vzxyZI99wXikAy+bSM7TclQXgFzNZVpUE4ZmdoZomPkIOtpp5BN/hgDSfan2Y5AS6KJBveOrbncqgCgunRQQOu5MSp5/7WBc66t8lsoJzCBvDQ5gREXEE/G+sHyCSBQ22vhI8iIrnNFBqX+bh38a9xdHvb9yeccCpKWZRdx8I8E2CN44uWC/8Znj1aifGxQo3sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CC46j8+ntRG18/cOVEA3ubTCjlYcGQ7C2fSJt6IsZvk=;
 b=bUsXW9DNGfTMwi7obpdIM78+HiO8dWUN9ih8+K24ALF+sfMQvu8eO+GoYgnmWmDXvehG0Z3BTCfsrJv9P9stylRaxv0yz8SKtLjoXBI8TOCmX04jYJnzpP9p4p/48Jd0L0kdZdg18IqF8KcEQQHgoA7nzqejJgvlXA74dVQzMCF8NIkB7fsq0ZeeRz3NVBuwE80h9wSkAkWLWNpR13znAxi/lvoAPmuz3TgwWsXbMFkwRkBu5YAPZkbiCPd2GbYQtCKX/yMfapQLXvxQjjhNBMmpBPREVMHZq4a4F8k1DIRf5UOJwngS47F3Ppxww9sVHbOXyNbJCapZ8p0SQsi1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by DM5PR12MB1577.namprd12.prod.outlook.com (2603:10b6:4:f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 03:15:51 +0000
Received: from DM3NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 03:15:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT008.mail.protection.outlook.com (10.152.82.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:15:49 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:15:48 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/5] Correct UVD/VCE/VCN powergate status retrieval
Date: Mon, 22 Jul 2019 11:15:26 +0800
Message-ID: <20190722031531.23437-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39850400004)(346002)(376002)(2980300002)(428003)(199004)(189003)(81166006)(305945005)(356004)(6666004)(4744005)(51416003)(7696005)(426003)(26005)(5660300002)(2616005)(53936002)(2870700001)(68736007)(36756003)(2906002)(336012)(81156014)(86362001)(8936002)(1076003)(126002)(70586007)(2351001)(47776003)(316002)(186003)(50226002)(4326008)(476003)(50466002)(48376002)(70206006)(54906003)(53416004)(478600001)(486006)(44832011)(6916009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1577; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ee725e-18f7-43ac-d0e1-08d70e52e5d9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1577; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1577:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15776D99C603058927165425E4C40@DM5PR12MB1577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b2upvCFOTKYoBPB/jDmptHwrOm1TR9wgA3PyuvCmPnh8bfOlB2LOUzzZJyTWFQ+pzZ04JzZM8nQIM21ctxnx/AB7UrBrGuELXikkiWitWfbMPcnWlI8Eq1ZSMDBsWjzF3sk5Cro1PEJGot26f9zNnc408MtwAw8sP53l58m0TqUH2rK5+4TlzJpVS7D36SEr/RNUnySgpO69BK+VbT4zdRe8KWBXmQKFWMXL4M2NIdLrq4AsnoN3PM3QRNbT/MDdmPGzgZ7do70IOoiAnsW7hBUExR1t4OSBSbTL22U5KQA/G2C9oZkhBoghLE1Ns0Jh2OFMtkEx16xhxznF7ldDfgOGSzyrx/KyVFis8tO+PHrCsOtgNI4EQ1HJDmX9JW72NjX2icjpV4Zm2dW9tgJuWf+LHmDmk/QsnSZGD9vSle0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:15:49.8482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ee725e-18f7-43ac-d0e1-08d70e52e5d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CC46j8+ntRG18/cOVEA3ubTCjlYcGQ7C2fSJt6IsZvk=;
 b=USag3R7nRdaR7W+eeavv8LI8qtHnOuK3gGQz1bD/flmPUdjlVDpBuLzWKm1UhcGUBsptyyzg+aH54cGCujl3o8PCKk53fOD5ufap3hGwyhrBu7vwv7oCEuO91BbUG0jHJFDl0jlhM0uSlJfFQgmsXlEOBcqZbsxqN2wbTU4BwpA=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIHNob3VsZCBiZSB1c2VkIGZvciBWZWdhMjAgbGF0ZXIgQVNJQ3MuCgpFdmFuIFF1YW4gKDUp
OgogIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgbmV3IHNlbnNvciB0eXBlIGZvciBWQ04gcG93ZXJn
YXRlIHN0YXR1cwogIGRybS9hbWQvcG93ZXJwbGF5OiBzdXBwb3J0IFZDTiBwb3dlcmdhdGUgc3Rh
dHVzIHJldHJpZXZhbCBvbiBSYXZlbgogIGRybS9hbWQvcG93ZXJwbGF5OiBzdXBwb3J0IFZDTiBw
b3dlcmdhdGUgc3RhdHVzIHJldHJpZXZhbCBmb3IgU1cgU01VCiAgZHJtL2FtZC9wb3dlcnBsYXk6
IGNvcnJlY3QgTmF2aTEwIFZDTiBwb3dlcmdhdGUgY29udHJvbAogIGRybS9hbWQvcG93ZXJwbGF5
OiBjb3JyZWN0IFVWRC9WQ0UvVkNOIHBvd2VyIHN0YXR1cyByZXRyaWV2YWwKCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAgICAgfCA1NiArKysrKysrKysrKystLS0t
LS0tCiAuLi4vZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmggICAgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCAgNCArKwog
Li4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jIHwgIDkgKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICAgfCAyNiArKystLS0t
LS0KIDUgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
