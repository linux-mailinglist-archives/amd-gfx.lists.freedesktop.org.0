Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026DB326A10
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Feb 2021 23:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82D6E444;
	Fri, 26 Feb 2021 22:37:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5396E448
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Feb 2021 22:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT7BhcAZCr4HjA2BuymfpnjgvX7lWXFgSiygyzdodNIxgFd+dlXoYF5zToxLekE8s0/L2XTX6aN7wEv4i36wFtYuM9p/wl3o4lemp1pg5zngd1XTrKaW0h3IGXjnJJPPULBya+3NL21PNfnCIk9lbr21CKywozXkBeOhKIYEvw6dWN5HtG/F2vcQhrtDoMXfn+ffGsglfj0pwxt3znP6Gf8cqiqUzH1c81cL2hPDWsKSndmu/kP9ruHzSqj8tnNrCWvlGc+b3L8tAQOvlXwU6+eb7IG2UNLPyi7NdqhIgr5pW0SIrNIg2JEzGnBPPM50HRDdtB7KZgQQzuKTIbQ0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCBfP3N9Kq77tjw1rLvfA1dqQkUiyt7X2EFzFd7pcSw=;
 b=fV5+n/YKIGiT7CuVFjMQthAY7sEy5Xyab9318jTyeW1VCSSeRa8U84VJ5qiFyQUkVjEG1LEg7KQs5OCdyWgxQipO8dJRfjbrd9yjYxGPJn3g8qwcyEzmRk/0g4ei4j1gV5bdjoTmaLI9H+d8+qLBYMif9EDdeLUH0ih7QT1TLjtu28+1NuHsZxYsAOy1hxhbWqCxh7HOM44MP8R/6APIpYjv/7ccVJSGRSR1Al3Ewy0wb+DEEhiUWQhP4lbgnRRCnsDnePosiTypHFO09XrmJHB5QaztwsoS1qsn89zYrRgaLpocrNW7R00XFmNL9eUrtnUOgnH/uqdP+AfZ/w84Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCBfP3N9Kq77tjw1rLvfA1dqQkUiyt7X2EFzFd7pcSw=;
 b=kikWC7d5KuLzuYWOhY4T2aTTA2cgPUEIbIUZSMphgbLh0gRkD3Q/8LRzctnKDMjNOBt0X9LM1GLMwylrqGuzIh2iLFV7j3gTL1x/ILAc9xBa2hvhc/FZ7S78ufhphFLWP2HYSLijAxV0uTK0Aud5OXvTqqEJMNRR3Bjg/sPc3y0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM5PR12MB1883.namprd12.prod.outlook.com (2603:10b6:3:113::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Fri, 26 Feb 2021 22:37:37 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::e887:3273:c806:d089]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::e887:3273:c806:d089%7]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 22:37:37 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/amd/display: Support for DMUB AUX
Date: Fri, 26 Feb 2021 17:36:54 -0500
Message-Id: <20210226223704.400472-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226223704.400472-1-Rodrigo.Siqueira@amd.com>
References: <20210226223704.400472-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:acb7:edb9:ffaa:d7cf]
X-ClientProxiedBy: BN9PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:408:fc::12) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:acb7:edb9:ffaa:d7cf)
 by BN9PR03CA0067.namprd03.prod.outlook.com (2603:10b6:408:fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Fri, 26 Feb 2021 22:37:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 931c53c6-1e17-4e25-c588-08d8daa71da8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18834FF164BADDE96BD62275989D9@DM5PR12MB1883.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T35PeHQeTURTvLFvHk/F3NJjM348bFPuPdIxkPaIGMB9IyZLeF87AWRUJ/pFHlSUoVK/baDQh4KkVMYLA6BWvOktMwnAptP0mCDFgs/ClKFaZ7YsSz+/X3du4UkX8ByNqvRqoOUZSvdKX2FavSH7dLTBtb/fqZiAGYhExshmOONi6gLKe8eCKN1hzFrwScxDXygJo/lcZ9VaRJLwYwlDyNpFm1wibeRQT7faaGX1DhIv9NZXvJK1bwkwaT3Mq/ADvP5h31HIFiDeEHVwaxYZAgGO0yulohktX0qEFZgbosgvx/7cmWHVuPD+VLaapmpRynV05EBs8gBiM8VWMrRjYjdeA6n+bufggVjkJ+tiFki2tdk83hYFSLyH4ySXoueN4Qcfvkhc2XTBIsB3vqpSHMlhc2pbpipwR5S2uEci9vxgn7uJ4MS6KLpZ82ojaeP6WtD1RpdPbMqaqVT3EyeRFC4Szb5+cfWaWb2zr5XpuLXO4y0+SGXMtnvE50ftbbxctn/vktjHNiKmJN3yQwgTuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(2906002)(6916009)(2616005)(5660300002)(66946007)(316002)(16526019)(186003)(1076003)(54906003)(83380400001)(36756003)(6486002)(478600001)(66556008)(52116002)(4326008)(6506007)(66476007)(6512007)(8936002)(8676002)(6666004)(30864003)(86362001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4q+H0UJgtMtaqe7jqSqQ2+5V80OwFyQpbg3znwNQVvfwcvq1QYZy8/94o7SL?=
 =?us-ascii?Q?542Hd2sErJq4hLkiTBrjVzHn5lHVAYqTstPG4/BAR4/PcljDyCjnb4pJNSqt?=
 =?us-ascii?Q?OkXYpjVdC2k8a4xgaPnPLOOykZdhCIlaqJFwjFHiRYmFYJdlS2/Yx8yKkfSS?=
 =?us-ascii?Q?KwpSYZ/2x6ZsQzW7TZuXwxCyygkdLdxlWoN/f/yNsR1ezYq397RB2T4rx17V?=
 =?us-ascii?Q?dOwXpSTfBH7jEoELbstxudoXzSifvjz+/wuFC1mBWJKfJRFSjOHEW9tvpTKA?=
 =?us-ascii?Q?5KIu9ssAAFqpyanB6TcAFwHK2DCzj92NG1oDPI4/47Hr80L3WmmGNgIy94d3?=
 =?us-ascii?Q?wB7RvlKJotk42ouIju2/Z6EeKsj5RVB4J8BCe8Vs2QrUodCuISpGEGb0SAs+?=
 =?us-ascii?Q?5/fp1gsLnUmRkiDYJemsLeaCPVe87ddI+AVPwtG5snWxO/g1yNQpLW3bBH4R?=
 =?us-ascii?Q?iwdOKzSAU4P4T09l2D4UZAy2tjGaJC005Z8Ew7b8UYIFGBflZbT9Q2pr1zn2?=
 =?us-ascii?Q?OVsaktYfTreApw038ht6V+uhd42zPq4RjnxuCX7f6rz9XiXxpGf99qVbsxN+?=
 =?us-ascii?Q?I2JjMHSA8e6oXt3t1gdlGIBNPnXlknIWbPlHmu4MAqM6mNH1+Kn+RyKNbad0?=
 =?us-ascii?Q?/YwjLtxdMQoLqElwpFeD5mch9eF0EljGyzYo+5JqAqjA/fRBUQak+A9fDiuB?=
 =?us-ascii?Q?Gn0/Zc2chXpQlpZLRmiEDQVT91raHbn58pqeMpHFcARQlz8G7P53hmAGTjBh?=
 =?us-ascii?Q?6YVr+ozZv/pr0DTGcitmtpeGShiJgs/HPhD2glDbtAZK7fXidyZAO8+puY8D?=
 =?us-ascii?Q?6QFLGtVmkNWW37v5iK0ts/Oq8n9dFVStuWF7tJPLrM17/ugFMao0yeCfHEIl?=
 =?us-ascii?Q?JwY4IMzZR6XSp7VQNRrqXaWb1OlQ27Bsf/pGkJ/g6vwgRdth4ksru6ZLctCi?=
 =?us-ascii?Q?AjG23rhqMWrvDpqi23bGt4CaK5CDToacfgPNF4vXT++ijAH6CKGzPJqFsjMH?=
 =?us-ascii?Q?iCU0mU2C5JwBkpmD2EVQ0rqMfPyYNVm9suzoS0rY9rL/6gtj90RC0+h25bhm?=
 =?us-ascii?Q?H3efQbzMQ2ABurPquj6EM/V2z6HStrwaCVJ1GOSGh3f8NBnUuRlPmwtc8FDz?=
 =?us-ascii?Q?XGlh9LqNf89/30ZvOY7kU9NYL9GBPDPJUiWn/JJtHDspECayI/hWCkTrn3JT?=
 =?us-ascii?Q?FfyaoMH9YJ+AH1pvYCjW0s6OqnMuhfd1cldvFzIdEcdma2ljYfk/4tKTCM1y?=
 =?us-ascii?Q?SQyEwysOOEtE+gU2q5f3xEOG21VkTdI8S+4Wim5ySCPfiVs0l6QvcBiS1YZo?=
 =?us-ascii?Q?DeDefJZZr9Rj2uFY1+3WJgkB3ncOmvRhYYmwQvodwaHgxxvti1mGMRwmwBUu?=
 =?us-ascii?Q?JkuTfqNMGAdhznZyhNwgmIYJLln2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931c53c6-1e17-4e25-c588-08d8daa71da8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 22:37:37.0045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuaorGFYo2OBv18f8BtSXtdJN7nevlPxO6jz6J5MGkJdh68dxBQ0q5cvGtGYggovYM3c7eBJbydOlekRJbRUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1883
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
Cc: Eryk.Brol@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Anson.Jacob@amd.com, Aurabindo.Pillai@amd.com, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[WHY]
To process AUX transactions with DMUB using inbox1 and outbox1 mail boxes.

[HOW]
1) Added inbox1 command DMUB_CMD__DP_AUX_ACCESS to issue AUX commands
   to DMUB in dc_process_dmub_aux_transfer_async(). DMUB processes AUX cmd
   with DCN and sends reply back in an outbox1 message triggering an
   outbox1 interrupt to driver.
2) In existing driver implementation, AUX commands are processed
   synchronously by configuring DCN reg. But in DMUB AUX, driver sends an
   inbox1 message and waits for a conditional variable (CV) which will be
   signaled by outbox1 ISR.
3) As the driver holds dal and dc locks while waiting for CV, the outbox1
   ISR is registered with noMutexWait set to true, which allows ISR to run
   and signal CV. This sets a constraint on ISR to not modify variables
   such as dc, dmub, etc.
4) Created dmub_outbox.c with dmub_enable_outbox_notification() to enable
   outbox1 mailbox.
5) New mailbox address ranges allocated for outbox1 of size DMUB_RB_SIZE.
   Created dmub functions for Outbox1: dmub_dcn20_setup_out_mailbox(),
   dmub_dcn20_get_outbox1_wptr() and dmub_dcn20_set_outbox1_rptr().
6) Added functions dc_stat_get_dmub_notification() and
   dmub_srv_stat_get_notification() to retrieve Outbox1 message.
7) Currently, DMUB doesn't opens DDC in AUX mode before issuing AUX
   transaction. A workaround is added in dce_aux_transfer_dmub_raw() to
   open in DDC in AUX mode for every AUX transaction.
8) Added dc debug option enable_dmub_aux_for_legacy_ddc enable/disable
   DMUB AUX. This debug option is checked dce_aux_transfer_with_retries()
   to select the method to process AUX transactions.

Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  17 +--
 drivers/gpu/drm/amd/display/dc/Makefile       |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  94 ++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_link_ddc.c |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c |  64 +++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  12 ++
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h |  10 --
 drivers/gpu/drm/amd/display/dc/dc_stat.h      |  42 +++++++
 drivers/gpu/drm/amd/display/dc/dce/Makefile   |   2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c  |  40 ++++---
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h  |   3 +-
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.c  |  60 ++++++++++
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.h  |  33 ++++++
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   5 +
 .../gpu/drm/amd/display/dc/inc/dc_link_ddc.h  |   3 +-
 .../drm/amd/display/dc/inc/hw/aux_engine.h    |   4 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h    |   2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |  41 +++++++
 .../gpu/drm/amd/display/dmub/dmub_srv_stat.h  |  41 +++++++
 drivers/gpu/drm/amd/display/dmub/src/Makefile |   2 +-
 .../gpu/drm/amd/display/dmub/src/dmub_dcn20.c |  32 ++++++
 .../gpu/drm/amd/display/dmub/src/dmub_dcn20.h |  11 ++
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  31 +++++-
 .../drm/amd/display/dmub/src/dmub_srv_stat.c  | 105 ++++++++++++++++++
 24 files changed, 612 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_stat.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_stat.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/dmub_srv_stat.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 46d1efd44461..42c01a606402 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -37,6 +37,7 @@
 #include "dc_link_ddc.h"
 
 #include "i2caux_interface.h"
+#include "dmub_cmd.h"
 #if defined(CONFIG_DEBUG_FS)
 #include "amdgpu_dm_debugfs.h"
 #endif
@@ -50,7 +51,7 @@ static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 {
 	ssize_t result = 0;
 	struct aux_payload payload;
-	enum aux_channel_operation_result operation_result;
+	enum aux_return_code_type operation_result;
 
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
@@ -72,17 +73,19 @@ static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 
 	if (result < 0)
 		switch (operation_result) {
-		case AUX_CHANNEL_OPERATION_SUCCEEDED:
+		case AUX_RET_SUCCESS:
 			break;
-		case AUX_CHANNEL_OPERATION_FAILED_HPD_DISCON:
-		case AUX_CHANNEL_OPERATION_FAILED_REASON_UNKNOWN:
+		case AUX_RET_ERROR_HPD_DISCON:
+		case AUX_RET_ERROR_UNKNOWN:
+		case AUX_RET_ERROR_INVALID_OPERATION:
+		case AUX_RET_ERROR_PROTOCOL_ERROR:
 			result = -EIO;
 			break;
-		case AUX_CHANNEL_OPERATION_FAILED_INVALID_REPLY:
-		case AUX_CHANNEL_OPERATION_FAILED_ENGINE_ACQUIRE:
+		case AUX_RET_ERROR_INVALID_REPLY:
+		case AUX_RET_ERROR_ENGINE_ACQUIRE:
 			result = -EBUSY;
 			break;
-		case AUX_CHANNEL_OPERATION_FAILED_TIMEOUT:
+		case AUX_RET_ERROR_TIMEOUT:
 			result = -ETIMEDOUT;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 5bf2f2375b40..bbde6e6a4e43 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -54,7 +54,7 @@ AMD_DC = $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/dc/,$(DC_LI
 
 include $(AMD_DC)
 
-DISPLAY_CORE = dc.o dc_link.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
+DISPLAY_CORE = dc.o dc_stat.o dc_link.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
 dc_surface.o dc_link_hwss.o dc_link_dp.o dc_link_ddc.o dc_debug.o dc_stream.o
 
 ifdef CONFIG_DRM_AMD_DC_DCN
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 8a873af5ff42..1cdef90c03aa 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -68,6 +68,7 @@
 
 #include "dmub/dmub_srv.h"
 
+#include "i2caux_interface.h"
 #include "dce/dmub_hw_lock_mgr.h"
 
 #include "dc_trace.h"
@@ -3190,3 +3191,96 @@ void dc_hardware_release(struct dc *dc)
 		dc->hwss.hardware_release(dc);
 }
 #endif
+
+/**
+ *****************************************************************************
+ *  Function: dc_enable_dmub_notifications
+ *
+ *  @brief
+ *		Returns whether dmub notification can be enabled
+ *
+ *  @param
+ *		[in] dc: dc structure
+ *
+ *	@return
+ *		True to enable dmub notifications, False otherwise
+ *****************************************************************************
+ */
+bool dc_enable_dmub_notifications(struct dc *dc)
+{
+	/* dmub aux needs dmub notifications to be enabled */
+	return dc->debug.enable_dmub_aux_for_legacy_ddc;
+}
+
+/**
+ *****************************************************************************
+ *  Function: dc_process_dmub_aux_transfer_async
+ *
+ *  @brief
+ *		Submits aux command to dmub via inbox message
+ *		Sets port index appropriately for legacy DDC
+ *
+ *  @param
+ *		[in] dc: dc structure
+ *		[in] link_index: link index
+ *		[in] payload: aux payload
+ *
+ *	@return
+ *		True if successful, False if failure
+ *****************************************************************************
+ */
+bool dc_process_dmub_aux_transfer_async(struct dc *dc,
+				uint32_t link_index,
+				struct aux_payload *payload)
+{
+	uint8_t action;
+	union dmub_rb_cmd cmd = {0};
+	struct dc_dmub_srv *dmub_srv = dc->ctx->dmub_srv;
+
+	ASSERT(payload->length <= 16);
+
+	cmd.dp_aux_access.header.type = DMUB_CMD__DP_AUX_ACCESS;
+	cmd.dp_aux_access.header.payload_bytes = 0;
+	cmd.dp_aux_access.aux_control.type = AUX_CHANNEL_LEGACY_DDC;
+	cmd.dp_aux_access.aux_control.instance = dc->links[link_index]->ddc_hw_inst;
+	cmd.dp_aux_access.aux_control.sw_crc_enabled = 0;
+	cmd.dp_aux_access.aux_control.timeout = 0;
+	cmd.dp_aux_access.aux_control.dpaux.address = payload->address;
+	cmd.dp_aux_access.aux_control.dpaux.is_i2c_over_aux = payload->i2c_over_aux;
+	cmd.dp_aux_access.aux_control.dpaux.length = payload->length;
+
+	/* set aux action */
+	if (payload->i2c_over_aux) {
+		if (payload->write) {
+			if (payload->mot)
+				action = DP_AUX_REQ_ACTION_I2C_WRITE_MOT;
+			else
+				action = DP_AUX_REQ_ACTION_I2C_WRITE;
+		} else {
+			if (payload->mot)
+				action = DP_AUX_REQ_ACTION_I2C_READ_MOT;
+			else
+				action = DP_AUX_REQ_ACTION_I2C_READ;
+			}
+	} else {
+		if (payload->write)
+			action = DP_AUX_REQ_ACTION_DPCD_WRITE;
+		else
+			action = DP_AUX_REQ_ACTION_DPCD_READ;
+	}
+
+	cmd.dp_aux_access.aux_control.dpaux.action = action;
+
+	if (payload->length && payload->write) {
+		memcpy(cmd.dp_aux_access.aux_control.dpaux.data,
+			payload->data,
+			payload->length
+			);
+	}
+
+	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dmub_srv);
+	dc_dmub_srv_wait_idle(dmub_srv);
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
index 42a4177e829a..64414c51312d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
@@ -36,6 +36,7 @@
 #include "core_types.h"
 #include "dc_link_ddc.h"
 #include "dce/dce_aux.h"
+#include "dmub/inc/dmub_cmd.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -655,7 +656,7 @@ bool dal_ddc_submit_aux_command(struct ddc_service *ddc,
  */
 int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *payload,
-		enum aux_channel_operation_result *operation_result)
+		enum aux_return_code_type *operation_result)
 {
 	return dce_aux_transfer_raw(ddc, payload, operation_result);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
new file mode 100644
index 000000000000..31761f3595a6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
@@ -0,0 +1,64 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ */
+
+#include "dc/dc_stat.h"
+#include "dmub/dmub_srv_stat.h"
+#include "dc_dmub_srv.h"
+
+/**
+ * DOC: DC STAT Interface
+ *
+ * These interfaces are called without acquiring DAL and DC locks.
+ * Hence, there is limitations on whese interfaces can access. Only
+ * variables exclusively defined for these interfaces can be modified.
+ */
+
+/**
+ *****************************************************************************
+ *  Function: dc_stat_get_dmub_notification
+ *
+ *  @brief
+ *		Calls dmub layer to retrieve dmub notification
+ *
+ *  @param
+ *		[in] dc: dc structure
+ *		[in] notify: dmub notification structure
+ *
+ *  @return
+ *     None
+ *****************************************************************************
+ */
+void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification *notify)
+{
+	/**
+	 * This function is called without dal and dc locks, so
+	 * we shall not modify any dc, dc_dmub_srv or dmub variables
+	 * except variables exclusively accessed by this function
+	 */
+	struct dmub_srv *dmub = dc->ctx->dmub_srv->dmub;
+	enum dmub_status status;
+
+	status = dmub_srv_stat_get_notification(dmub, notify);
+	ASSERT(status == DMUB_STATUS_OK);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index bd1cb665a585..49e055a8309c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -42,6 +42,9 @@
 #include "inc/hw/dmcu.h"
 #include "dml/display_mode_lib.h"
 
+/* forward declaration */
+struct aux_payload;
+
 #define DC_VER "3.2.124"
 
 #define MAX_SURFACES 3
@@ -531,6 +534,9 @@ struct dc_debug_options {
 	bool enable_dram_clock_change_one_display_vactive;
 	union mem_low_power_enable_options enable_mem_low_power;
 	bool force_vblank_alignment;
+
+	/* Enable dmub aux for legacy ddc */
+	bool enable_dmub_aux_for_legacy_ddc;
 };
 
 struct dc_debug_data {
@@ -1293,6 +1299,12 @@ void dc_hardware_release(struct dc *dc);
 
 bool dc_set_psr_allow_active(struct dc *dc, bool enable);
 
+bool dc_enable_dmub_notifications(struct dc *dc);
+
+bool dc_process_dmub_aux_transfer_async(struct dc *dc,
+				uint32_t link_index,
+				struct aux_payload *payload);
+
 /*******************************************************************************
  * DSC Interfaces
  ******************************************************************************/
diff --git a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
index 4f8f576d5fcf..7769bd099a5a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
@@ -44,16 +44,6 @@ enum i2caux_transaction_action {
 	I2CAUX_TRANSACTION_ACTION_DP_READ = 0x90
 };
 
-enum aux_channel_operation_result {
-	AUX_CHANNEL_OPERATION_SUCCEEDED,
-	AUX_CHANNEL_OPERATION_FAILED_REASON_UNKNOWN,
-	AUX_CHANNEL_OPERATION_FAILED_INVALID_REPLY,
-	AUX_CHANNEL_OPERATION_FAILED_TIMEOUT,
-	AUX_CHANNEL_OPERATION_FAILED_HPD_DISCON,
-	AUX_CHANNEL_OPERATION_FAILED_ENGINE_ACQUIRE
-};
-
-
 struct aux_request_transaction_data {
 	enum aux_transaction_type type;
 	enum i2caux_transaction_action action;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stat.h b/drivers/gpu/drm/amd/display/dc/dc_stat.h
new file mode 100644
index 000000000000..2a000ba54ddb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_stat.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DC_STAT_H_
+#define _DC_STAT_H_
+
+/**
+ * DOC: DC STAT Interface
+ *
+ * These interfaces are called without acquiring DAL and DC locks.
+ * Hence, there is limitations on whese interfaces can access. Only
+ * variables exclusively defined for these interfaces can be modified.
+ */
+
+#include "dc.h"
+#include "dmub/dmub_srv.h"
+
+void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification *notify);
+
+#endif /* _DC_STAT_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce/Makefile b/drivers/gpu/drm/amd/display/dc/dce/Makefile
index 973be8f9fd10..0d7db132a20f 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dce/Makefile
@@ -30,7 +30,7 @@ DCE = dce_audio.o dce_stream_encoder.o dce_link_encoder.o dce_hwseq.o \
 dce_mem_input.o dce_clock_source.o dce_scl_filters.o dce_transform.o \
 dce_opp.o dce_dmcu.o dce_abm.o dce_ipp.o dce_aux.o \
 dce_i2c.o dce_i2c_hw.o dce_i2c_sw.o dmub_psr.o dmub_abm.o dce_panel_cntl.o \
-dmub_hw_lock_mgr.o
+dmub_hw_lock_mgr.o dmub_outbox.o
 
 AMD_DAL_DCE = $(addprefix $(AMDDALPATH)/dc/dce/,$(DCE))
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
index d51b5fe91287..87d57e81de12 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
@@ -31,6 +31,8 @@
 #include "dce_aux.h"
 #include "dce/dce_11_0_sh_mask.h"
 #include "dm_event_log.h"
+#include "dm_helpers.h"
+#include "dmub/inc/dmub_cmd.h"
 
 #define CTX \
 	aux110->base.ctx
@@ -324,7 +326,7 @@ static int read_channel_reply(struct dce_aux *engine, uint32_t size,
 	return 0;
 }
 
-static enum aux_channel_operation_result get_channel_status(
+static enum aux_return_code_type get_channel_status(
 	struct dce_aux *engine,
 	uint8_t *returned_bytes)
 {
@@ -335,7 +337,7 @@ static enum aux_channel_operation_result get_channel_status(
 	if (returned_bytes == NULL) {
 		/*caller pass NULL pointer*/
 		ASSERT_CRITICAL(false);
-		return AUX_CHANNEL_OPERATION_FAILED_REASON_UNKNOWN;
+		return AUX_RET_ERROR_UNKNOWN;
 	}
 	*returned_bytes = 0;
 
@@ -346,7 +348,7 @@ static enum aux_channel_operation_result get_channel_status(
 	value = REG_READ(AUX_SW_STATUS);
 	/* in case HPD is LOW, exit AUX transaction */
 	if ((value & AUX_SW_STATUS__AUX_SW_HPD_DISCON_MASK))
-		return AUX_CHANNEL_OPERATION_FAILED_HPD_DISCON;
+		return AUX_RET_ERROR_HPD_DISCON;
 
 	/* Note that the following bits are set in 'status.bits'
 	 * during CTS 4.2.1.2 (FW 3.3.1):
@@ -359,14 +361,14 @@ static enum aux_channel_operation_result get_channel_status(
 	if (value & AUX_SW_STATUS__AUX_SW_DONE_MASK) {
 		if ((value & AUX_SW_STATUS__AUX_SW_RX_TIMEOUT_STATE_MASK) ||
 			(value & AUX_SW_STATUS__AUX_SW_RX_TIMEOUT_MASK))
-			return AUX_CHANNEL_OPERATION_FAILED_TIMEOUT;
+			return AUX_RET_ERROR_TIMEOUT;
 
 		else if ((value & AUX_SW_STATUS__AUX_SW_RX_INVALID_STOP_MASK) ||
 			(value & AUX_SW_STATUS__AUX_SW_RX_RECV_NO_DET_MASK) ||
 			(value &
 				AUX_SW_STATUS__AUX_SW_RX_RECV_INVALID_H_MASK) ||
 			(value & AUX_SW_STATUS__AUX_SW_RX_RECV_INVALID_L_MASK))
-			return AUX_CHANNEL_OPERATION_FAILED_INVALID_REPLY;
+			return AUX_RET_ERROR_INVALID_REPLY;
 
 		*returned_bytes = get_reg_field_value(value,
 				AUX_SW_STATUS,
@@ -374,17 +376,17 @@ static enum aux_channel_operation_result get_channel_status(
 
 		if (*returned_bytes == 0)
 			return
-			AUX_CHANNEL_OPERATION_FAILED_INVALID_REPLY;
+			AUX_RET_ERROR_INVALID_REPLY;
 		else {
 			*returned_bytes -= 1;
-			return AUX_CHANNEL_OPERATION_SUCCEEDED;
+			return AUX_RET_SUCCESS;
 		}
 	} else {
 		/*time_elapsed >= aux_engine->timeout_period
 		 *  AUX_SW_STATUS__AUX_SW_HPD_DISCON = at this point
 		 */
 		ASSERT_CRITICAL(false);
-		return AUX_CHANNEL_OPERATION_FAILED_TIMEOUT;
+		return AUX_RET_ERROR_TIMEOUT;
 	}
 }
 
@@ -541,7 +543,7 @@ static enum i2caux_transaction_action i2caux_action_from_payload(struct aux_payl
 
 int dce_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *payload,
-		enum aux_channel_operation_result *operation_result)
+		enum aux_return_code_type *operation_result)
 {
 	struct ddc *ddc_pin = ddc->ddc_pin;
 	struct dce_aux *aux_engine;
@@ -556,7 +558,7 @@ int dce_aux_transfer_raw(struct ddc_service *ddc,
 
 	aux_engine = ddc->ctx->dc->res_pool->engines[ddc_pin->pin_data->en];
 	if (!acquire(aux_engine, ddc_pin)) {
-		*operation_result = AUX_CHANNEL_OPERATION_FAILED_ENGINE_ACQUIRE;
+		*operation_result = AUX_RET_ERROR_ENGINE_ACQUIRE;
 		return -1;
 	}
 
@@ -575,8 +577,9 @@ int dce_aux_transfer_raw(struct ddc_service *ddc,
 	submit_channel_request(aux_engine, &aux_req);
 	*operation_result = get_channel_status(aux_engine, &returned_bytes);
 
-	if (*operation_result == AUX_CHANNEL_OPERATION_SUCCEEDED) {
+	if (*operation_result == AUX_RET_SUCCESS) {
 		int __maybe_unused bytes_replied = 0;
+
 		bytes_replied = read_channel_reply(aux_engine, payload->length,
 					 payload->data, payload->reply,
 					 &status);
@@ -604,7 +607,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 	int i, ret = 0;
 	uint8_t reply;
 	bool payload_reply = true;
-	enum aux_channel_operation_result operation_result;
+	enum aux_return_code_type operation_result;
 	bool retry_on_defer = false;
 
 	int aux_ack_retries = 0,
@@ -620,8 +623,9 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 
 	for (i = 0; i < AUX_MAX_RETRIES; i++) {
 		ret = dce_aux_transfer_raw(ddc, payload, &operation_result);
+
 		switch (operation_result) {
-		case AUX_CHANNEL_OPERATION_SUCCEEDED:
+		case AUX_RET_SUCCESS:
 			aux_timeout_retries = 0;
 			aux_invalid_reply_retries = 0;
 
@@ -667,14 +671,14 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 			}
 			break;
 
-		case AUX_CHANNEL_OPERATION_FAILED_INVALID_REPLY:
+		case AUX_RET_ERROR_INVALID_REPLY:
 			if (++aux_invalid_reply_retries >= AUX_MAX_INVALID_REPLY_RETRIES)
 				goto fail;
 			else
 				udelay(400);
 			break;
 
-		case AUX_CHANNEL_OPERATION_FAILED_TIMEOUT:
+		case AUX_RET_ERROR_TIMEOUT:
 			// Check whether a DEFER had occurred before the timeout.
 			// If so, treat timeout as a DEFER.
 			if (retry_on_defer) {
@@ -696,9 +700,9 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 			}
 			break;
 
-		case AUX_CHANNEL_OPERATION_FAILED_HPD_DISCON:
-		case AUX_CHANNEL_OPERATION_FAILED_ENGINE_ACQUIRE:
-		case AUX_CHANNEL_OPERATION_FAILED_REASON_UNKNOWN:
+		case AUX_RET_ERROR_HPD_DISCON:
+		case AUX_RET_ERROR_ENGINE_ACQUIRE:
+		case AUX_RET_ERROR_UNKNOWN:
 		default:
 			goto fail;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
index 277484cf853e..775e24926380 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
@@ -29,6 +29,7 @@
 #include "i2caux_interface.h"
 #include "inc/hw/aux_engine.h"
 
+enum aux_return_code_type;
 
 #define AUX_COMMON_REG_LIST0(id)\
 	SRI(AUX_CONTROL, DP_AUX, id), \
@@ -302,7 +303,7 @@ bool dce110_aux_engine_acquire(
 
 int dce_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *cmd,
-		enum aux_channel_operation_result *operation_result);
+		enum aux_return_code_type *operation_result);
 
 bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
 		struct aux_payload *cmd);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
new file mode 100644
index 000000000000..295596d1f47f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
@@ -0,0 +1,60 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ */
+
+#include "dmub_outbox.h"
+#include "dc_dmub_srv.h"
+#include "dmub/inc/dmub_cmd.h"
+
+/**
+ *****************************************************************************
+ *  Function: dmub_enable_outbox_notification
+ *
+ *  @brief
+ *		Sends inbox cmd to dmub to enable outbox1 messages with interrupt.
+ *		Dmub sends outbox1 message and triggers outbox1 interrupt.
+ *
+ *  @param
+ *		[in] dc: dc structure
+ *
+ *  @return
+ *     None
+ *****************************************************************************
+ */
+void dmub_enable_outbox_notification(struct dc *dc)
+{
+	union dmub_rb_cmd cmd;
+	struct dc_context *dc_ctx = dc->ctx;
+
+	memset(&cmd, 0x0, sizeof(cmd));
+	cmd.outbox1_enable.header.type = DMUB_CMD__OUTBOX1_ENABLE;
+	cmd.outbox1_enable.header.sub_type = 0;
+	cmd.outbox1_enable.header.payload_bytes =
+		sizeof(cmd.outbox1_enable) -
+		sizeof(cmd.outbox1_enable.header);
+	cmd.outbox1_enable.enable = true;
+
+	dc_dmub_srv_cmd_queue(dc_ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc_ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc_ctx->dmub_srv);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h
new file mode 100644
index 000000000000..4e0aa0d1a2d5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DMUB_OUTBOX_H_
+#define _DMUB_OUTBOX_H_
+
+#include "dc.h"
+
+void dmub_enable_outbox_notification(struct dc *dc);
+
+#endif /* _DMUB_OUTBOX_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 72b845911dcf..74c2edae08f2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -53,6 +53,7 @@
 #include "dsc.h"
 #include "dce/dmub_hw_lock_mgr.h"
 #include "dc_trace.h"
+#include "dce/dmub_outbox.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -1355,6 +1356,10 @@ void dcn10_init_hw(struct dc *dc)
 				hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
 	}
 
+	/* Enable outbox notification feature of dmub */
+	if (dc->debug.enable_dmub_aux_for_legacy_ddc)
+		dmub_enable_outbox_notification(dc);
+
 	/* we want to turn off all dp displays before doing detection */
 	if (dc->config.power_down_display_on_boot) {
 		uint8_t dpcd_power_state = '\0';
diff --git a/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h b/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
index b324e13f3f78..4d7b271b6409 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h
@@ -56,6 +56,7 @@ struct dp_receiver_id_info;
 
 struct i2c_payloads;
 struct aux_payloads;
+enum aux_return_code_type;
 
 void dal_ddc_i2c_payloads_add(
 		struct i2c_payloads *payloads,
@@ -100,7 +101,7 @@ bool dal_ddc_submit_aux_command(struct ddc_service *ddc,
 
 int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 		struct aux_payload *payload,
-		enum aux_channel_operation_result *operation_result);
+		enum aux_return_code_type *operation_result);
 
 bool dc_link_aux_transfer_with_retries(struct ddc_service *ddc,
 		struct aux_payload *payload);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h b/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
index e77b3a76766d..2ae630bf2aee 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h
@@ -29,6 +29,8 @@
 #include "dc_ddc_types.h"
 #include "include/i2caux_interface.h"
 
+enum aux_return_code_type;
+
 enum i2caux_transaction_operation {
 	I2CAUX_TRANSACTION_READ,
 	I2CAUX_TRANSACTION_WRITE
@@ -162,7 +164,7 @@ struct aux_engine_funcs {
 		uint8_t *buffer,
 		uint8_t *reply_result,
 		uint32_t *sw_status);
-	enum aux_channel_operation_result (*get_channel_status)(
+	enum aux_return_code_type (*get_channel_status)(
 		struct aux_engine *engine,
 		uint8_t *returned_bytes);
 	bool (*is_engine_available)(struct aux_engine *engine);
diff --git a/drivers/gpu/drm/amd/display/dc/irq_types.h b/drivers/gpu/drm/amd/display/dc/irq_types.h
index 87812d81fed3..125b9beb505a 100644
--- a/drivers/gpu/drm/amd/display/dc/irq_types.h
+++ b/drivers/gpu/drm/amd/display/dc/irq_types.h
@@ -150,7 +150,7 @@ enum dc_irq_source {
 	DC_IRQ_SOURCE_DC4_VLINE1,
 	DC_IRQ_SOURCE_DC5_VLINE1,
 	DC_IRQ_SOURCE_DC6_VLINE1,
-
+	DC_IRQ_DMCUB_OUTBOX1,
 
 	DAL_IRQ_SOURCES_NUMBER
 };
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index 863cd9cc93ff..6e4f558fe97e 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -107,6 +107,15 @@ enum dmub_window_id {
 	DMUB_WINDOW_TOTAL,
 };
 
+/* enum dmub_notification_type - dmub outbox notification identifier */
+enum dmub_notification_type {
+	DMUB_NOTIFICATION_NO_DATA = 0,
+	DMUB_NOTIFICATION_AUX_REPLY,
+	DMUB_NOTIFICATION_HPD,
+	DMUB_NOTIFICATION_HPD_IRQ,
+	DMUB_NOTIFICATION_MAX
+};
+
 /**
  * struct dmub_region - dmub hw memory region
  * @base: base address for region, must be 256 byte aligned
@@ -256,6 +265,13 @@ struct dmub_srv_hw_funcs {
 
 	void (*set_inbox1_wptr)(struct dmub_srv *dmub, uint32_t wptr_offset);
 
+	void (*setup_out_mailbox)(struct dmub_srv *dmub,
+			      const struct dmub_region *outbox1);
+
+	uint32_t (*get_outbox1_wptr)(struct dmub_srv *dmub);
+
+	void (*set_outbox1_rptr)(struct dmub_srv *dmub, uint32_t rptr_offset);
+
 	uint32_t (*emul_get_inbox1_rptr)(struct dmub_srv *dmub);
 
 	void (*emul_set_inbox1_wptr)(struct dmub_srv *dmub, uint32_t wptr_offset);
@@ -338,6 +354,11 @@ struct dmub_srv {
 	struct dmub_srv_base_funcs funcs;
 	struct dmub_srv_hw_funcs hw_funcs;
 	struct dmub_rb inbox1_rb;
+	/**
+	 * outbox1_rb is accessed without locks (dal & dc)
+	 * and to be used only in dmub_srv_stat_get_notification()
+	 */
+	struct dmub_rb outbox1_rb;
 
 	bool sw_init;
 	bool hw_init;
@@ -350,6 +371,26 @@ struct dmub_srv {
 	struct dmub_feature_caps feature_caps;
 };
 
+/**
+ * struct dmub_notification - dmub notification data
+ * @type: dmub notification type
+ * @link_index: link index to identify aux connection
+ * @result: USB4 status returned from dmub
+ * @pending_notification: Indicates there are other pending notifications
+ * @aux_reply: aux reply
+ * @hpd_status: hpd status
+ */
+struct dmub_notification {
+	enum dmub_notification_type type;
+	uint8_t link_index;
+	uint8_t result;
+	bool pending_notification;
+	union {
+		struct aux_reply_data aux_reply;
+		enum dp_hpd_status hpd_status;
+	};
+};
+
 /**
  * DMUB firmware version helper macro - useful for checking if the version
  * of a firmware to know if feature or functionality is supported or present.
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv_stat.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv_stat.h
new file mode 100644
index 000000000000..6c78aa406e90
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv_stat.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DMUB_SRV_STAT_H_
+#define _DMUB_SRV_STAT_H_
+
+/**
+ * DOC: DMUB_SRV STAT Interface
+ *
+ * These interfaces are called without acquiring DAL and DC locks.
+ * Hence, there is limitations on whese interfaces can access. Only
+ * variables exclusively defined for these interfaces can be modified.
+ */
+#include "dmub_srv.h"
+
+enum dmub_status dmub_srv_stat_get_notification(struct dmub_srv *dmub,
+						struct dmub_notification *notify);
+
+#endif /* _DMUB_SRV_STAT_H_ */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index 945287164cf2..7495c23c73a9 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -20,7 +20,7 @@
 # OTHER DEALINGS IN THE SOFTWARE.
 #
 
-DMUB = dmub_srv.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
+DMUB = dmub_srv.o dmub_srv_stat.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
 DMUB += dmub_dcn30.o dmub_dcn301.o
 DMUB += dmub_dcn302.o
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
index ea30da4f794f..071331bcc427 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
@@ -135,6 +135,8 @@ void dmub_dcn20_reset(struct dmub_srv *dmub)
 	REG_UPDATE(MMHUBBUB_SOFT_RESET, DMUIF_SOFT_RESET, 1);
 	REG_WRITE(DMCUB_INBOX1_RPTR, 0);
 	REG_WRITE(DMCUB_INBOX1_WPTR, 0);
+	REG_WRITE(DMCUB_OUTBOX1_RPTR, 0);
+	REG_WRITE(DMCUB_OUTBOX1_WPTR, 0);
 	REG_WRITE(DMCUB_SCRATCH0, 0);
 }
 
@@ -287,6 +289,36 @@ void dmub_dcn20_set_inbox1_wptr(struct dmub_srv *dmub, uint32_t wptr_offset)
 	REG_WRITE(DMCUB_INBOX1_WPTR, wptr_offset);
 }
 
+void dmub_dcn20_setup_out_mailbox(struct dmub_srv *dmub,
+			      const struct dmub_region *outbox1)
+{
+	/* New firmware can support CW4 for the outbox. */
+	if (dmub_dcn20_use_cached_inbox(dmub))
+		REG_WRITE(DMCUB_OUTBOX1_BASE_ADDRESS, outbox1->base);
+	else
+		REG_WRITE(DMCUB_OUTBOX1_BASE_ADDRESS, 0x80002000);
+
+	REG_WRITE(DMCUB_OUTBOX1_SIZE, outbox1->top - outbox1->base);
+}
+
+uint32_t dmub_dcn20_get_outbox1_wptr(struct dmub_srv *dmub)
+{
+	/**
+	 * outbox1 wptr register is accessed without locks (dal & dc)
+	 * and to be called only by dmub_srv_stat_get_notification()
+	 */
+	return REG_READ(DMCUB_OUTBOX1_WPTR);
+}
+
+void dmub_dcn20_set_outbox1_rptr(struct dmub_srv *dmub, uint32_t rptr_offset)
+{
+	/**
+	 * outbox1 rptr register is accessed without locks (dal & dc)
+	 * and to be called only by dmub_srv_stat_get_notification()
+	 */
+	REG_WRITE(DMCUB_OUTBOX1_RPTR, rptr_offset);
+}
+
 bool dmub_dcn20_is_hw_init(struct dmub_srv *dmub)
 {
 	uint32_t is_hw_init;
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
index 30c6d631a431..df85c3b86607 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
@@ -40,6 +40,10 @@ struct dmub_srv;
 	DMUB_SR(DMCUB_INBOX1_SIZE) \
 	DMUB_SR(DMCUB_INBOX1_RPTR) \
 	DMUB_SR(DMCUB_INBOX1_WPTR) \
+	DMUB_SR(DMCUB_OUTBOX1_BASE_ADDRESS) \
+	DMUB_SR(DMCUB_OUTBOX1_SIZE) \
+	DMUB_SR(DMCUB_OUTBOX1_RPTR) \
+	DMUB_SR(DMCUB_OUTBOX1_WPTR) \
 	DMUB_SR(DMCUB_REGION3_CW0_OFFSET) \
 	DMUB_SR(DMCUB_REGION3_CW1_OFFSET) \
 	DMUB_SR(DMCUB_REGION3_CW2_OFFSET) \
@@ -185,6 +189,13 @@ uint32_t dmub_dcn20_get_inbox1_rptr(struct dmub_srv *dmub);
 
 void dmub_dcn20_set_inbox1_wptr(struct dmub_srv *dmub, uint32_t wptr_offset);
 
+void dmub_dcn20_setup_out_mailbox(struct dmub_srv *dmub,
+			      const struct dmub_region *outbox1);
+
+uint32_t dmub_dcn20_get_outbox1_wptr(struct dmub_srv *dmub);
+
+void dmub_dcn20_set_outbox1_rptr(struct dmub_srv *dmub, uint32_t rptr_offset);
+
 bool dmub_dcn20_is_hw_init(struct dmub_srv *dmub);
 
 bool dmub_dcn20_is_supported(struct dmub_srv *dmub);
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 61f64a295f06..6943bf679b42 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -46,8 +46,8 @@
 /* Context size. */
 #define DMUB_CONTEXT_SIZE (512 * 1024)
 
-/* Mailbox size */
-#define DMUB_MAILBOX_SIZE (DMUB_RB_SIZE)
+/* Mailbox size : Ring buffers are required for both inbox and outbox */
+#define DMUB_MAILBOX_SIZE ((2 * DMUB_RB_SIZE))
 
 /* Default state size if meta is absent. */
 #define DMUB_FW_STATE_SIZE (64 * 1024)
@@ -157,6 +157,11 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 		funcs->enable_dmub_boot_options = dmub_dcn20_enable_dmub_boot_options;
 		funcs->skip_dmub_panel_power_sequence = dmub_dcn20_skip_dmub_panel_power_sequence;
 
+		// Out mailbox register access functions for RN and above
+		funcs->setup_out_mailbox = dmub_dcn20_setup_out_mailbox;
+		funcs->get_outbox1_wptr = dmub_dcn20_get_outbox1_wptr;
+		funcs->set_outbox1_rptr = dmub_dcn20_set_outbox1_rptr;
+
 		if (asic == DMUB_ASIC_DCN21) {
 			dmub->regs = &dmub_srv_dcn21_regs;
 
@@ -397,7 +402,7 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 
 	struct dmub_rb_init_params rb_params;
 	struct dmub_window cw0, cw1, cw2, cw3, cw4, cw5, cw6;
-	struct dmub_region inbox1;
+	struct dmub_region inbox1, outbox1;
 
 	if (!dmub->sw_init)
 		return DMUB_STATUS_INVALID;
@@ -444,8 +449,17 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 		cw4.region.base = DMUB_CW4_BASE;
 		cw4.region.top = cw4.region.base + mail_fb->size;
 
+		/**
+		 * Doubled the mailbox region to accomodate inbox and outbox.
+		 * Note: Currently, currently total mailbox size is 16KB. It is split
+		 * equally into 8KB between inbox and outbox. If this config is
+		 * changed, then uncached base address configuration of outbox1
+		 * has to be updated in funcs->setup_out_mailbox.
+		 */
 		inbox1.base = cw4.region.base;
-		inbox1.top = cw4.region.top;
+		inbox1.top = cw4.region.base + DMUB_RB_SIZE;
+		outbox1.base = inbox1.top;
+		outbox1.top = cw4.region.top;
 
 		cw5.offset.quad_part = tracebuff_fb->gpu_addr;
 		cw5.region.base = DMUB_CW5_BASE;
@@ -465,6 +479,8 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 
 		if (dmub->hw_funcs.setup_mailbox)
 			dmub->hw_funcs.setup_mailbox(dmub, &inbox1);
+		if (dmub->hw_funcs.setup_out_mailbox)
+			dmub->hw_funcs.setup_out_mailbox(dmub, &outbox1);
 	}
 
 	if (mail_fb) {
@@ -474,6 +490,13 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 		rb_params.capacity = DMUB_RB_SIZE;
 
 		dmub_rb_init(&dmub->inbox1_rb, &rb_params);
+
+		// Initialize outbox1 ring buffer
+		rb_params.ctx = dmub;
+		rb_params.base_address = (void *) ((uint64_t) (mail_fb->cpu_addr) + DMUB_RB_SIZE);
+		rb_params.capacity = DMUB_RB_SIZE;
+		dmub_rb_init(&dmub->outbox1_rb, &rb_params);
+
 	}
 
 	if (dmub->hw_funcs.reset_release)
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
new file mode 100644
index 000000000000..e6f3bfab33d3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv_stat.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dmub/dmub_srv_stat.h"
+#include "dmub/inc/dmub_cmd.h"
+
+/**
+ * DOC: DMUB_SRV STAT Interface
+ *
+ * These interfaces are called without acquiring DAL and DC locks.
+ * Hence, there is limitations on whese interfaces can access. Only
+ * variables exclusively defined for these interfaces can be modified.
+ */
+
+/**
+ *****************************************************************************
+ *  Function: dmub_srv_stat_get_notification
+ *
+ *  @brief
+ *		Retrieves a dmub outbox notification, set up dmub notification
+ *		structure with message information. Also a pending bit if queue
+ *		is having more notifications
+ *
+ *  @param [in] dmub: dmub srv structure
+ *  @param [out] pnotify: dmub notification structure to be filled up
+ *
+ *  @return
+ *     dmub_status
+ *****************************************************************************
+ */
+enum dmub_status dmub_srv_stat_get_notification(struct dmub_srv *dmub,
+						struct dmub_notification *notify)
+{
+	/**
+	 * This function is called without dal and dc locks, so
+	 * we shall not modify any dmub variables, only dmub->outbox1_rb
+	 * is exempted as it is exclusively accessed by this function
+	 */
+	union dmub_rb_out_cmd cmd = {0};
+
+	if (!dmub->hw_init) {
+		notify->type = DMUB_NOTIFICATION_NO_DATA;
+		notify->pending_notification = false;
+		return DMUB_STATUS_INVALID;
+	}
+
+	/* Get write pointer which is updated by dmub */
+	dmub->outbox1_rb.wrpt = dmub->hw_funcs.get_outbox1_wptr(dmub);
+
+	if (!dmub_rb_out_front(&dmub->outbox1_rb, &cmd)) {
+		notify->type = DMUB_NOTIFICATION_NO_DATA;
+		notify->pending_notification = false;
+		return DMUB_STATUS_OK;
+	}
+
+	switch (cmd.cmd_common.header.type) {
+	case DMUB_OUT_CMD__DP_AUX_REPLY:
+		notify->type = DMUB_NOTIFICATION_AUX_REPLY;
+		notify->link_index = cmd.dp_aux_reply.control.instance;
+		notify->result = cmd.dp_aux_reply.control.result;
+		dmub_memcpy((void *)&notify->aux_reply,
+			(void *)&cmd.dp_aux_reply.reply_data, sizeof(struct aux_reply_data));
+		break;
+	default:
+		notify->type = DMUB_NOTIFICATION_NO_DATA;
+		break;
+	}
+
+	/* Pop outbox1 ringbuffer and update read pointer */
+	dmub_rb_pop_front(&dmub->outbox1_rb);
+	dmub->hw_funcs.set_outbox1_rptr(dmub, dmub->outbox1_rb.rptr);
+
+	/**
+	 * Notify dc whether dmub has a pending outbox message,
+	 * this is to avoid one more call to dmub_srv_stat_get_notification
+	 */
+	if (dmub_rb_empty(&dmub->outbox1_rb))
+		notify->pending_notification = false;
+	else
+		notify->pending_notification = true;
+
+	return DMUB_STATUS_OK;
+}
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
