Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CD515327
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 20:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A5D10F8A8;
	Fri, 29 Apr 2022 18:02:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AD510F893
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 18:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwR7lqn94bK0zEYQIjnSG4zlxcNKxRTgmy0Ihe9NpWRS/JqeOOzfUtKLsm155KNxjn7OKRdEAebRsEm88smaGfUUViaQ31/zQq3Ryw/ZlvZ7HOAb4JYAGSO/94BL9P1TD2Q7tQBA8rUKtpa1/l4D5R3ZxnPFFgEB6QHKc5+O7gPjLD+cL6DChvYz4P7YFP6VqMW+LGIlj+tniuy47N9bej9wo653eHhyItpq6FwQAk6/M163/2uU+cvDg9omfgrvlrEHmqJKPk7CLGZxxUJZTvyh/MRJkcUaqrqaelzh3FghJOWXU7YLzej39btTbfr6cw+i7wKl8R0IhtBtLf2ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nshJxIx1/pqS7gcQZDQaFjzLAKREq86c2EiLzyj2DXM=;
 b=kX5OR5DmyQ4Mopt8jWCsbnQZ8q0C7/C2H8kTwC9zsPjXkLSCtVRTh5RIw30cZ4sw7No25unFkltQCxRNivr1bZ5VjZMfDlWIWRkeYYtI/WbYLNQn95WSIqmJG5U/cEmkY2qZyNR1//tKW0nWswGy8h1Q8aRjubhrbfD2SDjD1nBaQ7/w4jeRdVvQHQiofpuu+fvSctM+/L1zXcApYWYUAemDFQCxsHyDmNPsMjBUADAmyNNGxgFEyk8drQkEY+MOmbDwIchA+ZBG7dAAORtd6jezAjh8wibc23sLmMIf3Ink89edA5fIWHeORgDT4XOEFflAIKJbsXamiaegXOpQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nshJxIx1/pqS7gcQZDQaFjzLAKREq86c2EiLzyj2DXM=;
 b=WYRLZA7Fbg9tul70aRE08EpVj55CgZHdDoYL4AcNNye0HmeZw9QZBagUqWSTsmRReyP2qkcwCh3G62f0Erq7inJKQgwIJMPWOd2hWcV2zNhzVIsI/juWRGTW7EPY0bVKdAfqrdDNYgxcKKxIyVP6F6nsS3dPI0laGed11L8hoE0=
Received: from MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15) by
 MWHPR1201MB0127.namprd12.prod.outlook.com (2603:10b6:301:58::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 18:02:43 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::65) by MW2PR16CA0002.outlook.office365.com
 (2603:10b6:907::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 18:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 18:02:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 13:02:40 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/29] drm/amdgpu: add new CP_MES ucode ids
Date: Fri, 29 Apr 2022 14:02:01 -0400
Message-ID: <20220429180226.536084-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429180226.536084-1-alexander.deucher@amd.com>
References: <20220429180226.536084-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 442c5368-6dfb-45cd-be6e-08da2a0a7545
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0127:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01279AD76ABC3DFA7E8AA099F7FC9@MWHPR1201MB0127.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g48RWKP0WzFTJOTfbJYok368w/U8jHaQtDfVO+CipEsfZiA6c0PWf6wWLh76HnE4D9ZWEaEVjPtyCTuOHUg3hn2IvotGpWIuWRLMs/zvBtZ0g2UOH8Pet+LIS+qL9K9dQvZqsR8xR8uopjLnJ9AwBd+emEEoH1S4xjlNOcFgnYYs2zyFzMrdNJ56ZxBfw0xD3L0SzUj3VyaKIfW5PksFaYjmIoOfLemsDLsFz+X1DXFqyXfOR0ol8r7PJ0CA0nLJWV5CP8yS2oEFp4SrH2dx7G+rFUfaO5HqHgrHr7OR/3DAO7s7Qa8+ZnS22JhFfHa5eJGBXmSDtMqh30Oc7I4OTmgNS6d6D5K7SmoIhYdULrGQz7XlQRQSvBu5wBygpyDFCVC+qZGZnJB1ugmhUyVUTIStqSHagNk93VSsqLxMZIv7l5kjwiY1m4B2Yu9WIkF8Z7evP7PHqc/GFxKmTEBE2OJqcKu6xlxJ8aXWTR6aOtDJYp/geQ9hfqbCQt2wGiWGKim/GAfD7buoI5gQQXVv3JMtZH6BTMrq6Yvjp3gePodWXOz6XbW6PEA83afJvzUN6I+3qfhOJT95/8pCkYa75DpXrhCyCyg7b1FcJdfV4NNfNBn421xkWgbF9W6ycJnhrPjrJSmSOqEb+0UrMpUvOG56qKav7WaIvsRPi2+M1isXtY4p5JP0fE8d3vabalCQQ4QgWPgZJe4c5CpyfGAqLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(83380400001)(36756003)(6916009)(316002)(36860700001)(54906003)(336012)(426003)(2616005)(70206006)(1076003)(2906002)(70586007)(4326008)(8676002)(16526019)(186003)(356005)(6666004)(82310400005)(86362001)(508600001)(81166007)(40460700003)(26005)(4744005)(7696005)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 18:02:43.0016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 442c5368-6dfb-45cd-be6e-08da2a0a7545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0127
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

Needed for MES KIQ firmware loading.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index c3018eea4ae3..c6417778510c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -395,6 +395,8 @@ enum AMDGPU_UCODE_ID {
 	AMDGPU_UCODE_ID_CP_MEC2_JT,
 	AMDGPU_UCODE_ID_CP_MES,
 	AMDGPU_UCODE_ID_CP_MES_DATA,
+	AMDGPU_UCODE_ID_CP_MES1,
+	AMDGPU_UCODE_ID_CP_MES1_DATA,
 	AMDGPU_UCODE_ID_RLC_RESTORE_LIST_CNTL,
 	AMDGPU_UCODE_ID_RLC_RESTORE_LIST_GPM_MEM,
 	AMDGPU_UCODE_ID_RLC_RESTORE_LIST_SRM_MEM,
-- 
2.35.1

