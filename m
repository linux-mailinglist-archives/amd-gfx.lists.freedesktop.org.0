Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE727493AB5
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jan 2022 13:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1B010F2BA;
	Wed, 19 Jan 2022 12:58:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7310F2B9
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jan 2022 12:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2jC5lSZwUB4H3UlvD+fCe3olpVD6lFQIPQxmczemkW6ssiHms6YF/mgc+aPLggnMuCbEzPflOigAzHp+f/SvhEGqIX1lRNlt8nb64gqqcFLPfYulE1MPrRehhEnQ96VAOn/P/rtQH4YsRQMaQj3HeoWd7UOFWDpR/q8BhyArX3gcHWoZArOrWqD+1Iyy7JdbeDa5oC7JLrhKNDVHSsVvzO2/3fLcFe/BXVy2q4ur4nDcdHXqAVdGeq6KxAvt7zAmfYu8pfoEPB2iMFtCSvQIxY6zRn0y5cLQlN0OpDH92J4fXZppxji99QaYXooknbAEvfO1ZaInxdihsPkb4j7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usStzygSW5DGlQyrrmjcta3y3T594/Yg6zJBfpyk6II=;
 b=flF83TiEtG4iLZ/oS/0mBhWztjpDNkR8AbkrVJKlFPR+7VsyGDZSeMd2w/JaF1Go08I1K8BJOBrF244gg83lRNSTsSSO+X0FoqAlETvFKMQPKetY9ef3dTQOWHQUXbZ8uNmjW09mMlBkFjVvhY7mllFoUlzi3xuhhOZnckxVMSsupXq3SimzMdaB3+G+csBqqJmzr9H+VFJsIDJ2qMdUDeqvCiMmQAoyuohq/PUi777PmRrq/8/wPW1a+gu1e5e+6/ptCZb3XDAZkQzzSIJVSQX0RclFt21wCc4JOk3rF5EvrQTiShRNsn/J/toZ5WUHA0k7O0d+eeasFuMb4zB4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usStzygSW5DGlQyrrmjcta3y3T594/Yg6zJBfpyk6II=;
 b=KbC1jFkv0NEBQw1u9jIYFwsVwoPJbPmUc5yEmzj1Iomu4q0FmS2qNxowfgq3d2sG55qJG51ECb7cPyHRHiKIqj33sdlUW5vOeN9Y8KfiX9Uayz61I/PK3N0cadWvDaNt26qXqmKvVafaNKS9MJjFccHmVTSoV/b5ztwEV17JfpU=
Received: from MW4PR03CA0346.namprd03.prod.outlook.com (2603:10b6:303:dc::21)
 by BY5PR12MB4998.namprd12.prod.outlook.com (2603:10b6:a03:1d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 12:58:01 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::6e) by MW4PR03CA0346.outlook.office365.com
 (2603:10b6:303:dc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 12:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 12:58:00 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 06:57:58 -0600
From: majun <majun@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] amd/amdkfd:Fix the return value in kfd_process_queue_manager
Date: Wed, 19 Jan 2022 20:57:21 +0800
Message-ID: <20220119125721.278221-1-majun@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be237cdf-4fe3-478b-1eea-08d9db4b5295
X-MS-TrafficTypeDiagnostic: BY5PR12MB4998:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB49983152FD6AEB6F84088A8FBC599@BY5PR12MB4998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P2KZAmJiI5tjRqoXzh3UMm0wdrXGx/TZtWz/Vg8vS1eVOK5Ysp4FfCdDG7IED9dVPVsmICJ+aS9gmRaTpiRh99fRCrzOH6kaQpRrZox7LUhJI19uztfKdO9oJCo5qixvsMWf1eRyNzvjBTCp3ruSIFseDutUV9OGw8hs0hzi4VllrHiRhEoxuTUuv93xwLIjyQSuSwUgBcjt/MgBZoLVAeNGZ0ILQSpNCU/aGI0NeSu1d9Rs0OBmteOjKUQClbDCrA/xB9B93JuT21Elqr1wAta1IHiRCpJSo5MfBZf6uus1hPRLl5WeDONdXmcwMC0Gn5UuHojVMHeighJdYxfoDQPLM4TFeJf5zqF6+8Ig7gml+Lczff9ttKPRMd1SEI2UZJvujn8gJFIWdqQvgXlJzZIOefXlLMizN8iwUXeRahYBMjc70zt4tRurdkJMWkU8Oz6tvo0GnhhvJLnXcBPUJkNpnUjxmAjB5nbb5RvTw74XgrjYLPHqhdpM54Ag2+1srUaMfW8dIQV5a4werlHdQzi6Y6owtiKGt/8NyUE0fVXO4oTChXgh7H6bPYcCnHyBtWYmxvzA0R7rQ1VXQfD6ScRIIBLao0HX/9Q+YKnrPiUUYZAXs/OPLWxJgJr/Ld0oQVjMkqdvBJlQ4q0o7COtWG5CSBkUAXJPhDFcWCHzvzxm33/6PTeftgBQnxZ8AiWKMGvC7vSf0A9KW5qY+NIH06o+sB2ceTTD31JqICNyWtRnwMWbCMuXaQznfQ58uerCoEskZ177oDZ98qpslYdAOIE/gWDybGEwwI2vAkan+J4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(36756003)(6916009)(8676002)(82310400004)(7696005)(2616005)(47076005)(36860700001)(316002)(4326008)(70206006)(356005)(8936002)(426003)(2906002)(336012)(508600001)(83380400001)(81166007)(5660300002)(40460700001)(26005)(6666004)(186003)(4744005)(16526019)(1076003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 12:58:00.2608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be237cdf-4fe3-478b-1eea-08d9db4b5295
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4998
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Change the return value of set_queue_properties_from_criu()

Signed-off-by: majun <majun@amd.com>
Change-Id: I11362eb76eee84e64c5207c24a2b78141f62e63a
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index ec62897914da..f70e972d1d33 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -826,7 +826,7 @@ static void set_queue_properties_from_criu(struct queue_properties *qp,
 	qp->type = q_data->type;
 	qp->format = q_data->format;
 
-	return 0;
+	return;
 }
 
 
-- 
2.25.1

