Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AA910BBB
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2024 18:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D6D10EB00;
	Thu, 20 Jun 2024 16:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XndV8gUp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855D410EB00
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2024 16:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6lhS377N8413Gg0jHrPGUA35lrv1mtdl+0J4wNzM1lQi6h+rPhOIW5xCX/9qu4G2EXn5jCccd153Ulkfd6Mpu61I2jtF24FSg78axw1eBTs32YqhqXsH6ccIEhZeH+QOdKPabZYqiJBCZ1l1ZtR+ja01JyjjnZDj/MKxXMTgO4SrnxmhD8ec1EJ1fmHQZyUWmuvnNOsGnO6xgz2loaYqZKOVjwRgAbZ7HSULzc/FKBLVfpqMHf5taoWk92ki5IlqaOcZyzuQsEUCDXIG3o4gVRblVsuMLUMhX5wgMaWxFYdZDJyrvQS3OwQlCOxWZC1tP5EoDGLamU+u1RWHkasVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrAwCMECKQwNUmFindQyhD1P6KwPBu+/7n72mpLgdEs=;
 b=PwqCu0y1+Dqy7cPkeDB/DSvLpmcxdeOmQ8SAPHEwClqc3z/OS1Q/DTLNumnBKqtG2u+HIt8xRCgAW1PXQE4ZhwwWfVxEDWG61Pu253lpi/WA3tWvgxq1foco8NCi2EEnmMrrbZREXukNeu5x1lixW4vNN7EHanzzASdVC22Gff+dLxyMa3i97PQTGKvjvyhFAqg+cmKKRdBn9hjlS2vWA3HWRh4lFncPXCqT8SsihXQHbg+sF655Aa5wan6wLo+/U2phk1e8S+iiyXzGnG3/4qOBT3rd/01rlMc/Ek/hMLl26B8TwF03aQO6rVfCIMUEP/8FpCK5rMiHEipfVY/+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrAwCMECKQwNUmFindQyhD1P6KwPBu+/7n72mpLgdEs=;
 b=XndV8gUpED+hspG8Qp4Nv+UTNNK9nR4Q8Urivq0jMYnlwlWZuRPMlYZV4TGMhz2Pq7q1ByV4YN5sXY6OdQqC8Le8pctgYKOdRSb5ju7UDYLUunf5heI0tRr47NK78kkF9DnZsyRAgNItotoBmWquLIeJIeAtJyCIW4qCW6+i964=
Received: from CH2PR15CA0029.namprd15.prod.outlook.com (2603:10b6:610:51::39)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 16:16:25 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::eb) by CH2PR15CA0029.outlook.office365.com
 (2603:10b6:610:51::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 16:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 16:16:24 +0000
Received: from 10.254.92.128.in-addr.arpa (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:16:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, TungYu Lu <tungyu.lu@amd.com>, Alvin Lee
 <alvin.lee2@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 18/39] drm/amd/display: resync OTG after DIO FIFO resync
Date: Thu, 20 Jun 2024 10:11:24 -0600
Message-ID: <20240620161145.2489774-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620161145.2489774-1-alex.hung@amd.com>
References: <20240620161145.2489774-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: a45ae37b-ba61-42b6-ee69-08dc91445505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|82310400023|1800799021|36860700010; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2bcgLukPJPRokq4YrI5WX7AB2U900jcVLs9MSGn+E3/0lx1cUo5S81u3rp8x?=
 =?us-ascii?Q?UdfnUWLYXyoRTmPYQi6StaOA+KTqHtQ7odDgb/u181U5t/0bKN12ADtx0giS?=
 =?us-ascii?Q?yxGOM7PXqc1n30sSDtXeI50RDTOlYHlJGFXaPHGKQwsz+lNRgG97Ld8tjxJz?=
 =?us-ascii?Q?f7xCVx1JWsGfdY6B9WCTKxRIA8hQlGYqmVC6Wlzp/JlU6+KMKk+YAHbDgVZM?=
 =?us-ascii?Q?xqAfyYPsoxCoZ00Jl0n8dvgZhWpioGtxxif2ftSlFQ8/xeByl+iaU0JLoTG0?=
 =?us-ascii?Q?XS3L5N1bPfya5PdUwn7x9bZTvjZg7KtERYHLQw2mf1bMTy0zyP3UMK+6uGHT?=
 =?us-ascii?Q?RV3lbk9hWe5Xjs3mcEyfUdunhrnTNosVS8sPykDWPQtHUL1Zar8p8PeAoZVn?=
 =?us-ascii?Q?eCkEqvtA63ro5Lp79aMJOHsCeT5NzpvCTRRXBoo8bmX820tihA+ZPqL9fS5z?=
 =?us-ascii?Q?j670LtEnLWSdTD2wMHzgAAJFsTDBb505WR4t7y/Di6ZM92X1vETQJ6dXjhJg?=
 =?us-ascii?Q?Lf6WUw7p6BETAPbV3vEkjAEJs5OnaH6iGLoJeUoWZdJKRbhHGGUIgTVEp+cR?=
 =?us-ascii?Q?YNoa2O1dDsy+kqbi/Gh7RLNvQpQcwEZ6M8d7RvUJXN0AB2WyO7Z+JSif16AB?=
 =?us-ascii?Q?jdeiVWImAaWn+3qiLYMByzHodM4oynxO0faMFU0LWqBcQ3HgWQVTzoo0uqc9?=
 =?us-ascii?Q?tqbivv2FT16zxiRc5gyb+hfNxj73jvqS/63Z3RMJ8fjmr/RUjpS2W1c9gMW+?=
 =?us-ascii?Q?oQ/uWFNdfDuOZeu9HIplhg9OSQfUEpvI7mJdwt2mKMP4KZS2GIqyCmYUe7dl?=
 =?us-ascii?Q?eSjlOpskSYC1ZAkbPpt8QQX442Z8ovR+3dSBt0/HyY8ofrHl4xw6yl8WY5sm?=
 =?us-ascii?Q?JEWYZ5nmasG3DjB9FspBfeESKNeX4rq36Uj1EvadjAUKh3JnK8Tcbz4FbZ42?=
 =?us-ascii?Q?6oG3JKvhg0zgbHyN49dj1hNTw5ita2gBnseGHW0dO3NYZZ54gWJp6TC0qpt4?=
 =?us-ascii?Q?C9TrqzAjU/kTru88pvInO+QKtlvEA/6MBB4WmyuuCo1/sBa67+3ftD7f7jZh?=
 =?us-ascii?Q?c4U98egDAQOq2zNb0rkqdVtA2Lb7qvgnDkdt1WKzAzy+6/YJ3gCdgQ3bZ6o5?=
 =?us-ascii?Q?QnJi4XqB11Jp5FdyqmMMC743qhUjnee4v+m/uHs/4unjMn8HeCS1CM81lACe?=
 =?us-ascii?Q?kJhr6Rdm7jqSjGJxGo8ZY6B3vAfp1bFdgiRDB7cCDCREKLqN2Jhgh69dwPKZ?=
 =?us-ascii?Q?Gzs04s9sfr0kkvnORpydIFwr20MnKgGNxYNQn5m7glaTHOJbjISuaMidYmuu?=
 =?us-ascii?Q?Mdf4JXSmVj93RCBytwrgsK0rbsiBddGc3mdQ5Df+v9Cxu9vaB0c5dk6nH3FF?=
 =?us-ascii?Q?UyBgPTtlrDmqi+hLxvtlheoU594+hffSy8DnJ3lj3FpQMQSkMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(82310400023)(1800799021)(36860700010); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:16:24.9242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45ae37b-ba61-42b6-ee69-08dc91445505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
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

From: TungYu Lu <tungyu.lu@amd.com>

[WHY]
Tiled displays showed not aligned on 8K60hz when system resumed
from S3/S4.

[HOW]
Do dc_trigger_sync to re-sync pipes to ensure OTG become synced.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: TungYu Lu <tungyu.lu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index bdbb4a71651f..fe62478fbcde 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -1254,6 +1254,8 @@ void dcn32_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc_
 			pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
 		}
 	}
+
+	dc_trigger_sync(dc, dc->current_state);
 }
 
 void dcn32_unblank_stream(struct pipe_ctx *pipe_ctx,
-- 
2.34.1

