Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9552D540
	for <lists+amd-gfx@lfdr.de>; Thu, 19 May 2022 15:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106711A481;
	Thu, 19 May 2022 13:57:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2907211A481
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 May 2022 13:57:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKOCIxF3yjYeJoYPaZRuliw0Tzi/5Wy17aIIdlTuekcIW97G2hSYKmRQOj5tbskX4N+Vtfqv5vN3/Fy92Hfx8vio4BS92r8w77xECIb/kSYDbUSvc3JU/LGIYbgfg4bkoMf0xlETSVj4fkB1NzLvEabh7Ct45JSMJiBXMwfHtXysaaoWweQkmdMD3S3JqayXEYju4wq/7xgXdmYMStxXgFC5O/BKgJIRSpYptM0qNxTEcrWsx3gEqU1+HUppxQ+ZvyLS8yXWROK3ycwo+QOnX5ZGRKxgLobpzMIKgFWgB3IQYu6OpboMgQsEfSwh4D0css2BNQq16CcHNXI7iHIciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWbwrFQcxd5mlZNmjM1mqd5xcV8Uop3GtGsXlq/+Kck=;
 b=aJDMncdm3DFBrfXGRjMy8DeLCvpxaR1l4ZJ5STknAdOGewgzdYSow66h5HCxTCvAICcMsqCTsJfaUoMTHtHTzt55rqe8kExAEQKFOqDoC2vUumsJpEaI2jVY419Ga0JUvwuI8aWDu4zB42o4ofZ1AKgOiLvQraD+PdBivPTIwf3Qi4begN2JnLUarvx1u/ApDDUoD/9nGdypAZw+07I0KlZl5UCKbOFHTSd0SvotSAKSxzLl9Yv7CH9ayj69cgNI8HZsCvbMtEpytKwssGpjeuxEq2ewqb1LfvQVZQ6IjSv3hhCjZrpI/DlUfNoyoyIAK3wWRc8jstod1WqarrWnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWbwrFQcxd5mlZNmjM1mqd5xcV8Uop3GtGsXlq/+Kck=;
 b=kDX/sB10EUzGPT2bmt2zbMSP6IwECPG4IDc7pmvzTBU0I9CJHcT19knC/cdDoy/27EvaUR/KEPJedJGYwHBEdscghipk/ckmLZrHV9NlngFDx5SE2HO0sLzbymdhrzC4Wk79YE/ERSrtWYJashpRCk2UMsQMoLfesS1KeXWN0H4=
Received: from BN0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:408:142::12)
 by BN7PR12MB2706.namprd12.prod.outlook.com (2603:10b6:408:2a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Thu, 19 May
 2022 13:57:03 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::27) by BN0PR08CA0019.outlook.office365.com
 (2603:10b6:408:142::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Thu, 19 May 2022 13:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 13:57:03 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 19 May 2022 08:57:02 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <tj@kernel.org>, <jiangshanlai@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Revert "workqueue: remove unused cancel_work()"
Date: Thu, 19 May 2022 09:56:42 -0400
Message-ID: <20220519135642.83209-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bb525c5-ebfd-458f-f745-08da399f7431
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB270628BF640382ED0DB9F0A0EAD09@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwS1km/tvpDbkXnM5wf+MmDEmaoYlvqo4+ChnOCg29X88pScEcLeYofN7Eyz8eCxzhRLP9Dakzm8F2+w83b2he21LYWzTsFGGjdrqK75A0zHZbJMIDcE2YyOd6lMH+sIe8odWtj6j3pfpN4BVK1wAbaRxuWfiuNbj88J52I3hSaC3vobP2+bgyyw7UWT64PSvF8dFC98NIBpQ3fu9p34gJ0tAvytVktcOgJxgg/CnFhm/JAZsiVoe3GVWYTCOfNlU5D3Sc6e92RFQnZRELa0mPAtFXiAchUPglPBHPvfUasZFdUCjBAx92X3N+c/UxW3sU+RtzUWvTYILgqy6qKZ2HmoMqLeuioEx3U1lji1008yTzvpp4YGMpfjHzQhhDPAJDVu3j31kzQFhLoMXvSU6gTpF3iKmFn7a7yO25AD/loXb2Apoxfa2BTOrA9OXuzlPztMLbrOn3uTjX8dn+5yuT9ZqxgQxWA05vBtoy14K6xPud0A/WfW7eaGEh4D9qotfkBMzfI/jXx0lqh2r9zI4L6SLw8axaD+MwGXovw478ARqK0tANSqRUh94HaKv0kJcbQf6cMs+EMQsfxtq6ODEBhDZ/Avggt+wXyTA2ZXp08JSKw4vZdZeo9fHLorhUOSuff4zERfa5FMUYFQkdXrll0Ueq182NcVVZGFvX1Aqh4rt/R0bE/UlGiNXI81bDmKXEsPFiN8dFC7dTi4KXHEYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(508600001)(36756003)(6666004)(2906002)(82310400005)(8936002)(54906003)(5660300002)(1076003)(47076005)(26005)(7696005)(44832011)(186003)(81166007)(70206006)(40460700003)(426003)(86362001)(36860700001)(110136005)(336012)(316002)(16526019)(4326008)(2616005)(8676002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:57:03.7580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb525c5-ebfd-458f-f745-08da399f7431
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This reverts commit 6417250d3f894e66a68ba1cd93676143f2376a6f
and exports the function. 

We need this funtion in amdgpu driver to fix a bug.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 include/linux/workqueue.h | 1 +
 kernel/workqueue.c        | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 7fee9b6cfede..9e41e1226193 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -453,6 +453,7 @@ extern int schedule_on_each_cpu(work_func_t func);
 int execute_in_process_context(work_func_t fn, struct execute_work *);
 
 extern bool flush_work(struct work_struct *work);
+extern bool cancel_work(struct work_struct *work);
 extern bool cancel_work_sync(struct work_struct *work);
 
 extern bool flush_delayed_work(struct delayed_work *dwork);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 613917bbc4e7..f94b596ebffd 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3267,6 +3267,15 @@ static bool __cancel_work(struct work_struct *work, bool is_dwork)
 	return ret;
 }
 
+/*
+ * See cancel_delayed_work()
+ */
+bool cancel_work(struct work_struct *work)
+{
+	return __cancel_work(work, false);
+}
+EXPORT_SYMBOL(cancel_work);
+
 /**
  * cancel_delayed_work - cancel a delayed work
  * @dwork: delayed_work to cancel
-- 
2.25.1

