Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B16CC7D
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 12:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75846E38D;
	Thu, 18 Jul 2019 10:02:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A86E38D
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 10:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdQS6kNfBiS/WU1mBQZkJduOytcKhFZdl5tPFGC0hxqP2Hy4EOpXESMf1UjjuGqxW/CQXeP1+xWwU6M2XriS9Efm/Wryaz9zlLYX2NfM4xXZ0MEOdkcIj72R+C/UMXPazi25imm4vfjxd2+Gwo0xwGsIDok+SqvdZJ0hL8t45jJQakrT1Ei7A3tqJRvMzw5M6aw/TkQoEawQkvqdeCUgtkJbL1H04/2nW6e1C/XW43ypug4/ACXWGwdkeMomlfygl8+/cQxkBtOSvBfkMHw4zBWnKGsrMmFfLh7V3zW8fw1Vun41/c+8+ccgLGrqhfFKHbAVSQaf8RCA1WwKL5HGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+LuTNMJ2O1YZUi7FqDULbpewXErie4GjYyHTbHAYpI=;
 b=eu9WEt4nE+FDQMDVn18/EL4FNr7w8lDxIo6uVxsNB4gbrpZHevL6BfMPK7NQADDaNWwbc4LkUVqKSCWX+Bdps3igwI83oofQUJ3BjxJIOOomQbi8eQx36FGE7ujvzDgnkSRi/af2WgvcxdhsO/gIELgtZCzLTSF9TNoYT31M4RvxdjFmvcZlDxv/I7pQ3GlgEh4COLoxNbBe/3lTGzTeUZdma11UyGxbqVS4sD1Xd1kOvN1k7YeX2Hl7zTUefb8TvDC7YYI6CxpDSU4AxjpbBwwZ15Ia4dKVGBpHXT9gxuw310twlFwohAE7MU53N7IpaoY0WmJWym089GjMRBdzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0043.namprd12.prod.outlook.com (2603:10b6:301:2::29)
 by BN6PR12MB1921.namprd12.prod.outlook.com (2603:10b6:404:fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.13; Thu, 18 Jul
 2019 10:02:44 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MWHPR12CA0043.outlook.office365.com
 (2603:10b6:301:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 18 Jul 2019 10:02:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 18 Jul 2019 10:02:43 +0000
Received: from gc-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 18 Jul 2019 05:02:42 -0500
From: Chengming Gui <Jack.Gui@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/powerplay: remove mutex lock for smu_handle_task
 when smu late init
Date: Thu, 18 Jul 2019 18:02:16 +0800
Message-ID: <1563444138-23948-1-git-send-email-Jack.Gui@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39850400004)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(81156014)(50226002)(53416004)(356004)(81166006)(4744005)(6666004)(47776003)(14444005)(50466002)(2351001)(36756003)(476003)(2616005)(336012)(4326008)(426003)(126002)(8676002)(2906002)(186003)(48376002)(70206006)(86362001)(51416003)(8936002)(316002)(7696005)(53936002)(6916009)(70586007)(26005)(478600001)(305945005)(68736007)(16586007)(486006)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad8cbf79-356f-4382-f387-08d70b6713ff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1921CCADBE2E99977C44F4CA8BC80@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-Forefront-PRVS: 01026E1310
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IAl1ZvampLXFK1A4v0QX6PE3M1KXW29b7/9L865zAswJ1CSI4Qj5eNwqEu7xCiUHDFBiOtQxOvdKwZmYe+JaF3/s6hcK0BvP0B8zSoU1l7I2F6wWJmac0H+qtTMy/hVBdjn0/7dvhZ+FLXCDNxA/fejYYkyWhQQUolqhxF4ltU4KdAQZtjubY9kWU6t3ohuGt5zv/UfQn+v6jrgCz61A/ZZ7vANXNyid1wiSidW7bxVl0QlyURc9JD+OiJtYR3eMxnHhJV4OpYemPRVzQseurNEyWtrFX0g6/ctv1WGgOduPL+RPBhLL/6zIcXL1t7XHa12ki4TrFpQpKuBk9mZLFYCw3cViVzn2rX1GMymIr8yA1SexVUO1lFbd3/1rfscuueFDAANTayo4JRNWqdadvi3KwDUkkngcNTqwpwP3J1Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2019 10:02:43.8744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8cbf79-356f-4382-f387-08d70b6713ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+LuTNMJ2O1YZUi7FqDULbpewXErie4GjYyHTbHAYpI=;
 b=b+v9Cc9Omz6IKGOEQiKbzMVAD25Pq/GD2XJuJLj3/ObX8Th1wjl5GRzKZpWLnd9/Usiu3kX0e/sQIEDbBHRvhjxkMFNegs5f6TFSrGsQ3s4EHsOi2L8o/aRNq8ItIOeFMSVx7iAXlFIK9l5McsXKuoFssBxeDtD1ZAOJTRujjII=
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
Cc: Chengming Gui <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVtb3ZlIG11dGV4IGxvY2sgd2hlbiBzbXUgbGF0ZSBpbml0IHRvIGNhbGwgc211X2hhbmRsZV90
YXNrCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZ21pbmcgR3VpIDxKYWNrLkd1aUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYwppbmRleCA3ZDFiZDA5Li4xMjI5ODVjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC01NjksMTEgKzU2OSw5IEBAIHN0YXRpYyBp
bnQgc211X2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiAKIAlpZiAoIXNtdS0+cG1fZW5hYmxlZCkK
IAkJcmV0dXJuIDA7Ci0JbXV0ZXhfbG9jaygmc211LT5tdXRleCk7CiAJc211X2hhbmRsZV90YXNr
KCZhZGV2LT5zbXUsCiAJCQlzbXUtPnNtdV9kcG0uZHBtX2xldmVsLAogCQkJQU1EX1BQX1RBU0tf
Q09NUExFVEVfSU5JVCk7Ci0JbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKIAogCXJldHVybiAw
OwogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
