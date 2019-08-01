Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DD7D5E7
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA716E3A0;
	Thu,  1 Aug 2019 06:55:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508636E3A0
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km6PIUhLs1N0HsfwWoAQA7CjlnAQMVhq+M8p5QARgUg45U5cB5quVQdjREAWP0+6io3wdmL5GpLvDBfMQHw9IdjwOXfpQOK04Z3MAZJiWxxO7xVD9Bqdzn8a8mKbiVLGJfxlo2h8UMnNkbiyA/4w3tWtOOnqU1C4BRuOGqzPO4mvU6J2WPMyo0Zr4kwiJBxBbx+UEVTKHY+wS1Kx4C4S11VmSkU7f/Fgy8oHOL7PytqRASMjJxh5UbDC0Qs0jHqOVzSjVPSWTiwTkBqbIrCFSdFdp1f6XTo07f0Ark8HScyn62txke4OG8uWatJ3KFriWrqfomndySaWCKfDISJLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHgnBOsvst9DlmDagkEUzGgqAMBbVLx790VtZ+kL+qI=;
 b=ESw7oxHDvyuv256sqINrzcChfJSoA0FXE0iMciLQQCkN1W10/8hioVBpVr6M4Ck5fnaeh/zplBLXo5ggGxg2o2Qm+in02UtUIO2SXeFAIguCdknJ76bzwH7SiYIM/+LtSl/EoJVPUfZbcjtIocxLfLEhbbvtYUxsYxgODGt0Nt92SZwDlzRcLdpWJe4bdlyUezJVRE+MpbzCNT+Zg4h6/GTObKAUeeGbgIgnZ4Ix3W3A7LUKV/Wh/txTeeltEUgy1/MGzNyejaCQdfvfYr6mYhXtd/ZuZPG1bufY5vInV+FvxiYxN6cEZzvHkGai5ErMj9fYQAiT5g0uZATHY4tNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by DM5PR12MB2423.namprd12.prod.outlook.com
 (2603:10b6:4:b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 1 Aug
 2019 06:54:57 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Thu, 1 Aug 2019 06:54:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:54:57 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:54:54 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: only uncorrectable error needs gpu reset
Date: Thu, 1 Aug 2019 14:53:42 +0800
Message-ID: <20190801065342.8450-5-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801065342.8450-1-tao.zhou1@amd.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(305945005)(110136005)(16586007)(81156014)(316002)(8676002)(1076003)(53416004)(14444005)(2201001)(6636002)(68736007)(4744005)(2906002)(5660300002)(6666004)(48376002)(26005)(356004)(70586007)(70206006)(76176011)(8936002)(478600001)(50226002)(446003)(336012)(81166006)(36756003)(53936002)(86362001)(476003)(50466002)(486006)(47776003)(2616005)(126002)(426003)(186003)(51416003)(11346002)(7696005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2423; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a798b4-660a-4bfb-d0df-08d7164d2a2d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB2423; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2423:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24239D7D436AEAB6B50242DFB0DE0@DM5PR12MB2423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CBH6G6aAEBL1zqTNTKqWUmHd5Xyb5y429+WLW+uEHSqO5iHacRQzeA0Qfrabcl03ScRIWYtP00LSi2NM62ezE/Utme0KDQy+XnJwrzlbztaT4E828da4N1GqOhioCugS3ydJkFi+VdeTO8TD9oe43HorqNrvhMTw+W1VPdAk9WfxUfOJBaRbhCgoxP4Mt9Yi/DCe82cwmtzreiB7Y9jQdFqcatatc1CbGKoHnK2Th/7ZoASxxrX3dsquqC8c1c+8zIRmdxrPXkkXp6QAhNYuoWOKmi6FiD58F3kXE99bJ/PY32wMfCEoSJVzy+i5x82VK6b5916THNUeTAcOuAiEREXAfwTf7j/C0mAIbS5URPPsUczSQzXmbqcVchbI0mnwwjU36Dh3vyL0EBYfpcyt7ELa4OzwFJgJBtrEGOhVhe4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:54:57.0156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a798b4-660a-4bfb-d0df-08d7164d2a2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHgnBOsvst9DlmDagkEUzGgqAMBbVLx790VtZ+kL+qI=;
 b=PaCAZGFzWQNOSRnbt0iWntYJByF0KX4TDhauiKFwZhKXSbclriIlUNeXsdQRaQ6fe2ehOFA6YsgzaaaO/9K9oo2Qx7A5U6TM6hXZUwkgE/knm3TCyv+cgHoCBH3p6/Ph3t+1g5b8JW09BorX3TfTbjZ7IEyYbShS+/UEVkTIYdA=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCmluZGV4IDA1Y2JkOTBkOWI2Yy4uYjZlZGFkOGJiMzFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTI1MCw3ICsyNTAsMTEgQEAgc3RhdGljIGludCBn
bWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CSAqLwogCWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKQogCQlh
ZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKGFkZXYsIGVycl9kYXRhKTsK
LQlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsKKwkKKwkvKiBvbmx5IHVuY29ycmVjdGFi
bGUgZXJyb3IgbmVlZHMgZ3B1IHJlc2V0ICovCisJaWYgKGVycl9kYXRhLT51ZV9jb3VudCkKKwkJ
YW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7CisKIAlyZXR1cm4gQU1ER1BVX1JBU19VRTsK
IH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
