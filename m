Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199F3CE2EC
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Jul 2021 18:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1716E19C;
	Mon, 19 Jul 2021 16:16:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F376E19C
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 16:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH/761UEfbrNxJB3L0O1pMNtuA7lK/cLQ8q3cqjXuM1Cl4XToI9jZa3lTBwIqBC0Cn1S4JlN4X8MOXSVPPVGYWi37+5qGnBmC0Qd89ie2j/zsoS8u7Rk6Ta2qiOAXUhodrOS+wn2FkrUhsSZpQTeeNw6sx0yR7Sl9H0dRm/boBT4foaZp7iti+KGaQshmLvMIOnUEY6ryta+98IWCKk0WGsK9hBkdceOzvUpVHNf/jXIsgX51sLP+qHg556hm2xUDS6tfSu9gairL1f+Aw40BvJFklr03Bbt+THZpPM0mAYOKGb7uZu/LAkWCt2Rnqln9VyrZNhlJfNCMnr+40RDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q6l/MFl25anHkh2Gg9adWzn3KxJjinh4POe+JWQJzo=;
 b=atwxYsrRDpoCwyLFFoklBia1JP+WSID5UQTMe3OXDaBM+1Y+28s6zQQcvtnJ0FZBUFaejhW1+xQj9RRegwPwN1sFFwsKzczTlEQEw9ZEEHGCQTXsnnN4tjB71dIUfZX4NmqwYVcw6A7WM8YKmH/Kn7YyOBGZsYH8ckHH4D/7gjOxZSlphK0GfFhtGBohjijZWWrb+dpUNCHkSgS887Nd57zeYg1DWVwi0U4GbckPmzLt+gThoY3nKfyIOrhFEkn8bssRDecVlZvVfaHX3bfED291d4r+sCwWFWzDNpt4mLgxBZUtDVgygxzs5hhDYLjsLbBPhWyDoUg0e/iy4hkZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q6l/MFl25anHkh2Gg9adWzn3KxJjinh4POe+JWQJzo=;
 b=sixUPhIh9FslsJwfWjXuFIbK5PhaKA8wBeyuETlA0NoKMNd8x/GL1slw2Im8uoAVXXIKaTaQA96LlQeDN6r9ft8niWhxVIkpGczXAOWJE/gVWZuE3REGlEijMXZG4gUg6Ov0/G+TXr9WbL5dPLeo1eyXnOEC4MXLhgLYZpovlLM=
Received: from BN6PR17CA0042.namprd17.prod.outlook.com (2603:10b6:405:75::31)
 by MWHPR1201MB0222.namprd12.prod.outlook.com (2603:10b6:301:54::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 16:16:50 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::1c) by BN6PR17CA0042.outlook.office365.com
 (2603:10b6:405:75::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Mon, 19 Jul 2021 16:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 16:16:49 +0000
Received: from localhost.localdomain.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 19 Jul 2021 11:16:48 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/pm: Fix a bug communicating with the SMU (v4)
Date: Mon, 19 Jul 2021 12:16:37 -0400
Message-ID: <20210719161637.57819-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9410b524-db07-48e8-f80d-08d94ad09d1b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0222:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0222CA05B70E0FD25480F75699E19@MWHPR1201MB0222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ezd3XxO2fv5ie701nH31ut9Gtob68oouxXxXwc6PID1pzTFUjGBrBbtBtC8XqlJgSJIT9jqViYNLbHgYFF18kXKdi6tSke68Fdpapkn13czyIjgeL5bHMJzfhObsLcUY5RJ0DXhK4sfG4mBa974SVZDuKSuX9HiP0bVkDwg1/p7sYBhOTex5hS1UuWLyiX7bd4gObeByNr7dns6CBmIo3CLyrWDrmmjUBgnF8ApDY4eDqayM3b1c0hmf3XM3spnL5cq8GQ/A0r9YNsPtsBEIye1oml41MamHHROSfeI3H9xRAy61NJT8hDaJbAEydIYB+h6fveUuyp6HwgyBvGtBNjw8bgv9EOKWyu2PNnKXR7DBycBylgt0vzeC4LY6gleT96/SJ+GBIhRo2N291Pbx0gTdFrN2hc2U8XF9Ns2vIW9OQXYnSrGICPAm6BHlKMPXroIB+RaQfc3O2xEV/3vkBzmkbJpSgA9tabnudh8//V2fx3P4jkfiMFjoX1XOivTx9QRz2HaQXp9RzWRVS8l4a7fL0ask7Pt+7tZ76nLYkEIbT72gCsfmL4EpamYxErMsTjeUuRC0w7J/yUSFri7T6ObOL85VtiEqkbj8XOwOIhzwnqfROcv894MtcjBR2aoiara2f0WFNWLT0UJctxHFKyWJ/8Zdjl5Livond6HWkCJnQJ7jo3wkFVA683PGiHJ7DKJYlwA7nIQHs5IN7RfFu3BSjqZwQ69nN9W4WwqQIO4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(81166007)(336012)(70586007)(36756003)(7696005)(316002)(44832011)(8676002)(83380400001)(1076003)(82740400003)(356005)(26005)(47076005)(5660300002)(82310400003)(16526019)(2616005)(36860700001)(86362001)(6666004)(426003)(186003)(54906003)(8936002)(30864003)(70206006)(2906002)(478600001)(4326008)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 16:16:49.8625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9410b524-db07-48e8-f80d-08d94ad09d1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0222
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, Lijo Lazar <Lijo.Lazar@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This fixes a bug which if we probe a non-existing
I2C device, and the SMU returns 0xFF, from then on
we can never communicate with the SMU, because the
code before this patch reads and interprets 0xFF
as a terminal error, and thus we never write 0
into register 90 to clear the status (and
subsequently send a new command to the SMU.)

It is not an error that the SMU returns status
0xFF. This means that the SMU executed the last
command successfully (execution status), but the
command result is an error of some sort (execution
result), depending on what the command was.

When doing a status check of the SMU, before we
send a new command, the only status which
precludes us from sending a new command is 0--the
SMU hasn't finished executing a previous command,
and 0xFC--the SMU is busy.

This bug was seen as the following line in the
kernel log,

amdgpu: Msg issuing pre-check failed(0xff) and SMU may be not in the right state!

when subsequent SMU commands, not necessarily
related to I2C, were sent to the SMU.

This patch fixes this bug.

v2: Add a comment to the description of
__smu_cmn_poll_stat() to explain why we're NOT
defining the SMU FW return codes as macros, but
are instead hard-coding them. Such a change, can
be followed up by a subsequent patch.

v3: The changes are,
a) Add comments to break labels in
   __smu_cmn_reg2errno().

b) When an unknown/unspecified/undefined result is
   returned back from the SMU, map that to
   -EREMOTEIO, to distinguish failure at the SMU
   FW.

c) Add kernel-doc to
   smu_cmn_send_msg_without_waiting(),
   smu_cmn_wait_for_response(),
   smu_cmn_send_smc_msg_with_param().

d) In smu_cmn_send_smc_msg_with_param(), since we
   wait for completion of the command, if the
   result of the completion is
   undefined/unknown/unspecified, we print that to
   the kernel log.

v4: a) Add macros as requested, though redundant, to
    be removed when SMU consolidates for all
    ASICs--see comment in code.
    b) Get out if the SMU code is unknown.

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Lijo Lazar <Lijo.Lazar@amd.com>
Fixes: fcb1fe9c9e0031 ("drm/amd/powerplay: pre-check the SMU state before issuing message")
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 294 +++++++++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h |   3 +-
 2 files changed, 250 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index c902fdf322c1be..9b30737bd541d6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -55,7 +55,7 @@
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	#type
-static const char* __smu_message_names[] = {
+static const char * const __smu_message_names[] = {
 	SMU_MESSAGE_TYPES
 };
 
@@ -76,55 +76,264 @@ static void smu_cmn_read_arg(struct smu_context *smu,
 	*arg = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
 }
 
-int smu_cmn_wait_for_response(struct smu_context *smu)
+/* Redefine the SMU error codes here.
+ *
+ * Note that these definitions are redundant and should be removed
+ * when the SMU has exported a unified header file containing these
+ * macros, which header file we can just include and use the SMU's
+ * macros. At the moment, these error codes are defined by the SMU
+ * per-ASIC unfortunately, yet we're a one driver for all ASICs.
+ */
+
+#define SMU_BUSY           0
+#define SMU_GOOD           1
+#define SMU_CMD_FAIL       0xFF
+#define SMU_CMD_UNKNOWN    0xFE
+#define SMU_CMD_BAD_PREREQ 0xFD
+#define SMU_BUSY_OTHER     0xFC
+#define SMU_DEBUG_END      0xFB
+
+/**
+ * __smu_cmn_poll_stat -- poll for a status from the SMU
+ * smu: a pointer to SMU context
+ *
+ * Returns the status of the SMU, which could be,
+ *    0, the SMU is busy with your previous command;
+ *    1, execution status: success, execution result: success;
+ * 0xFF, execution status: success, execution result: failure;
+ * 0xFE, unknown command;
+ * 0xFD, valid command, but bad (command) prerequisites;
+ * 0xFC, the command was rejected as the SMU is busy;
+ * 0xFB, "SMC_Result_DebugDataDumpEnd".
+ *
+ * The values here are not defined by macros, because I'd rather we
+ * include a single header file which defines them, which is
+ * maintained by the SMU FW team, so that we're impervious to firmware
+ * changes. At the moment those values are defined in various header
+ * files, one for each ASIC, yet here we're a single ASIC-agnostic
+ * interface. Such a change can be followed-up by a subsequent patch.
+ */
+static u32 __smu_cmn_poll_stat(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	uint32_t cur_value, i, timeout = adev->usec_timeout * 20;
+	int timeout = adev->usec_timeout * 20;
+	u32 reg;
 
-	for (i = 0; i < timeout; i++) {
-		cur_value = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90);
-		if ((cur_value & MP1_C2PMSG_90__CONTENT_MASK) != 0)
-			return cur_value;
+	for ( ; timeout > 0; timeout--) {
+		reg = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90);
+		if ((reg & MP1_C2PMSG_90__CONTENT_MASK) != 0)
+			break;
 
 		udelay(1);
 	}
 
-	/* timeout means wrong logic */
-	if (i == timeout)
-		return -ETIME;
-
-	return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90);
+	return reg;
 }
 
-int smu_cmn_send_msg_without_waiting(struct smu_context *smu,
-				     uint16_t msg, uint32_t param)
+static void __smu_cmn_reg_print_error(struct smu_context *smu,
+				      u32 reg_c2pmsg_90,
+				      int msg_index,
+				      u32 param,
+				      enum smu_message_type msg)
 {
 	struct amdgpu_device *adev = smu->adev;
-	int ret;
+	const char *message = smu_get_message_name(smu, msg);
 
-	ret = smu_cmn_wait_for_response(smu);
-	if (ret != 0x1) {
-		dev_err(adev->dev, "Msg issuing pre-check failed(0x%x) and "
-		       "SMU may be not in the right state!\n", ret);
-		if (ret != -ETIME)
-			ret = -EIO;
-		return ret;
+	switch (reg_c2pmsg_90) {
+	case SMU_BUSY:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: I'm not done with your previous command!");
+		break;
+	case SMU_GOOD:
+		/* The SMU executed the command. It completed with a
+		 * successful result.
+		 */
+		break;
+	case SMU_CMD_FAIL:
+		/* The SMU executed the command. It completed with an
+		 * unsuccessful result.
+		 */
+		break;
+	case SMU_CMD_UNKNOWN:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: unknown command: index:%d param:0x%08X message:%s",
+				    msg_index, param, message);
+		break;
+	case SMU_CMD_BAD_PREREQ:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: valid command, bad prerequisites: index:%d param:0x%08X message:%s",
+				    msg_index, param, message);
+		break;
+	case SMU_BUSY_OTHER:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: I'm very busy for your command: index:%d param:0x%08X message:%s",
+				    msg_index, param, message);
+		break;
+	case SMU_DEBUG_END:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: I'm debugging!");
+		break;
+	default:
+		dev_err_ratelimited(adev->dev,
+				    "SMU: response:0x%08X for index:%d param:0x%08X message:%s?",
+				    reg_c2pmsg_90, msg_index, param, message);
+		break;
+	}
+}
+
+static int __smu_cmn_reg2errno(struct smu_context *smu, u32 reg_c2pmsg_90)
+{
+	int res;
+
+	switch (reg_c2pmsg_90) {
+	case SMU_BUSY:
+		/* The SMU is busy--still executing your command.
+		 */
+		res = -ETIME;
+		break;
+	case SMU_GOOD:
+		res = 0;
+		break;
+	case SMU_CMD_FAIL:
+		/* Command completed successfully, but the command
+		 * status was failure.
+		 */
+		res = -EIO;
+		break;
+	case SMU_CMD_UNKNOWN:
+		/* Unknown command--ignored by the SMU.
+		 */
+		res = -EOPNOTSUPP;
+		break;
+	case SMU_CMD_BAD_PREREQ:
+		/* Valid command--bad prerequisites.
+		 */
+		res = -EIO;
+		break;
+	case SMU_BUSY_OTHER:
+		/* The SMU is busy with other commands. The client
+		 * should retry in 10 us.
+		 */
+		res = -EBUSY;
+		break;
+	case SMU_DEBUG_END:
+		/* Debug message.
+		 */
+		res = -EIO;
+		break;
+	default:
+		/* Unknown result from the SMU.
+		 */
+		res = -EREMOTEIO;
+		break;
 	}
 
+	return res;
+}
+
+static void __smu_cmn_send_msg(struct smu_context *smu,
+			       u16 msg,
+			       u32 param)
+{
+	struct amdgpu_device *adev = smu->adev;
+
 	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);
 	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82, param);
 	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66, msg);
+}
 
-	return 0;
+/**
+ * smu_cmn_send_msg_without_waiting -- send the message; don't wait for status
+ * @smu: pointer to an SMU context
+ * @msg_index: message index
+ * @param: message parameter to send to the SMU
+ *
+ * Send a message to the SMU with the parameter passed. Do not wait
+ * for status/result of the message, thus the "without_waiting".
+ *
+ * Return 0 on success, -errno on error if we weren't able to _send_
+ * the message for some reason. See __smu_cmn_reg2errno() for details
+ * of the -errno.
+ */
+int smu_cmn_send_msg_without_waiting(struct smu_context *smu,
+				     uint16_t msg_index,
+				     uint32_t param)
+{
+	u32 reg;
+	int res;
+
+	if (smu->adev->in_pci_err_recovery)
+		return 0;
+
+	mutex_lock(&smu->message_lock);
+	reg = __smu_cmn_poll_stat(smu);
+	res = __smu_cmn_reg2errno(smu, reg);
+	if (reg == SMU_BUSY ||
+	    reg == SMU_BUSY_OTHER ||
+	    res == -EREMOTEIO)
+		goto Out;
+	__smu_cmn_send_msg(smu, msg_index, param);
+	res = 0;
+Out:
+	mutex_unlock(&smu->message_lock);
+	return res;
 }
 
+/**
+ * smu_cmn_wait_for_response -- wait for response from the SMU
+ * @smu: pointer to an SMU context
+ *
+ * Wait for status from the SMU.
+ *
+ * Return 0 on success, -errno on error, indicating the execution
+ * status and result of the message being waited for. See
+ * __smu_cmn_reg2errno() for details of the -errno.
+ */
+int smu_cmn_wait_for_response(struct smu_context *smu)
+{
+	u32 reg;
+
+	reg = __smu_cmn_poll_stat(smu);
+	return __smu_cmn_reg2errno(smu, reg);
+}
+
+/**
+ * smu_cmn_send_smc_msg_with_param -- send a message with parameter
+ * @smu: pointer to an SMU context
+ * @msg: message to send
+ * @param: parameter to send to the SMU
+ * @read_arg: pointer to u32 to return a value from the SMU back
+ *            to the caller
+ *
+ * Send the message @msg with parameter @param to the SMU, wait for
+ * completion of the command, and return back a value from the SMU in
+ * @read_arg pointer.
+ *
+ * Return 0 on success, -errno on error, if we weren't able to send
+ * the message or if the message completed with some kind of
+ * error. See __smu_cmn_reg2errno() for details of the -errno.
+ *
+ * If we weren't able to send the message to the SMU, we also print
+ * the error to the standard log.
+ *
+ * Command completion status is printed only if the -errno is
+ * -EREMOTEIO, indicating that the SMU returned back an
+ * undefined/unknown/unspecified result. All other cases are
+ * well-defined, not printed, but instead given back to the client to
+ * decide what further to do.
+ *
+ * The return value, @read_arg is read back regardless, to give back
+ * more information to the client, which on error would most likely be
+ * @param, but we can't assume that. This also eliminates more
+ * conditionals.
+ */
 int smu_cmn_send_smc_msg_with_param(struct smu_context *smu,
 				    enum smu_message_type msg,
 				    uint32_t param,
 				    uint32_t *read_arg)
 {
-	struct amdgpu_device *adev = smu->adev;
-	int ret = 0, index = 0;
+	int res, index;
+	u32 reg;
 
 	if (smu->adev->in_pci_err_recovery)
 		return 0;
@@ -136,31 +345,24 @@ int smu_cmn_send_smc_msg_with_param(struct smu_context *smu,
 		return index == -EACCES ? 0 : index;
 
 	mutex_lock(&smu->message_lock);
-	ret = smu_cmn_send_msg_without_waiting(smu, (uint16_t)index, param);
-	if (ret)
-		goto out;
-
-	ret = smu_cmn_wait_for_response(smu);
-	if (ret != 0x1) {
-		if (ret == -ETIME) {
-			dev_err(adev->dev, "message: %15s (%d) \tparam: 0x%08x is timeout (no response)\n",
-				smu_get_message_name(smu, msg), index, param);
-		} else {
-			dev_err(adev->dev, "failed send message: %15s (%d) \tparam: 0x%08x response %#x\n",
-				smu_get_message_name(smu, msg), index, param,
-				ret);
-			ret = -EIO;
-		}
-		goto out;
+	reg = __smu_cmn_poll_stat(smu);
+	res = __smu_cmn_reg2errno(smu, reg);
+	if (reg == SMU_BUSY ||
+	    reg == SMU_BUSY_OTHER ||
+	    res == -EREMOTEIO) {
+		__smu_cmn_reg_print_error(smu, reg, index, param, msg);
+		goto Out;
 	}
-
+	__smu_cmn_send_msg(smu, (uint16_t) index, param);
+	reg = __smu_cmn_poll_stat(smu);
+	res = __smu_cmn_reg2errno(smu, reg);
+	if (res == -EREMOTEIO)
+		__smu_cmn_reg_print_error(smu, reg, index, param, msg);
 	if (read_arg)
 		smu_cmn_read_arg(smu, read_arg);
-
-	ret = 0; /* 0 as driver return value */
-out:
+Out:
 	mutex_unlock(&smu->message_lock);
-	return ret;
+	return res;
 }
 
 int smu_cmn_send_smc_msg(struct smu_context *smu,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
index 9add5f16ff562a..16993daa2ae042 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
@@ -27,7 +27,8 @@
 
 #if defined(SWSMU_CODE_LAYER_L2) || defined(SWSMU_CODE_LAYER_L3) || defined(SWSMU_CODE_LAYER_L4)
 int smu_cmn_send_msg_without_waiting(struct smu_context *smu,
-				     uint16_t msg, uint32_t param);
+				     uint16_t msg_index,
+				     uint32_t param);
 int smu_cmn_send_smc_msg_with_param(struct smu_context *smu,
 				    enum smu_message_type msg,
 				    uint32_t param,
-- 
2.32.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
