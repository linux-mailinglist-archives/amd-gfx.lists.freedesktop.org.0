Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A248A11A
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jan 2022 21:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95AE10E1E0;
	Mon, 10 Jan 2022 20:46:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C7510E1E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jan 2022 20:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5laT/LkOW6+nKGKogyI9UzxwmJFK2h//F72fNfIrHgNkNmrTfQROTCeb4sxXr8Qh0YDWotaPZ761+RvxglWYgdRMkjPtz0uxQvI44+xOeoPlUSWel7xRsmfJsCxafuUppGTQScec7jyXdpFK15hLy+T5fRcP4wxnlG9FrvnArqB4mf7cfiV19OMBNFJxGkVyx3nujE7sfy4ERO84DQdCn+O8TxVr5seBIHwQJvYRwKr2JjWKdO8ROdtKPpGlNZ7kgwO6gEuzdn1E0Dr+7yCIzODUnDggHfUD483aq1ZvSETc8c8FzXTbjIRlXNTdG7aoYmv1QGideXDhOzR268euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kUmTwqGLCKFomRvuyka7V8h+aw1vOGgtxKF7EqKlRg=;
 b=mdRJHgduld/C3Jb95Mt/HsWZcSIGMUKhH3v+Z2FdEmlw1CE0/f7kTXyzmNe9yzPMH6GqmMFW0BAA/7ARxeL0ATWVLRAfSqnP1ye+0ZBhd1pryX0f0QsaBqmBcXBZ/30Fxf7+FNmPVbZlnAabkUlTfolYDgRURImuUiil4rdZPat8+lFrEP6up77Qx2hfR2BbsuhsCv847wM/aerJzZpkY76MXo5bjO5bv4uu3P+WgSvB9TcXb316srHrRWW7C6ybkrWq5cMVvXMprUMPSteMZxSkmuHAMO3c/qHHZT32DqhTa2wUg43++Yl2BoIF7b4/mRH/fDiF/49lRbPu8k0iSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kUmTwqGLCKFomRvuyka7V8h+aw1vOGgtxKF7EqKlRg=;
 b=xTv32SSZwV4sQLjpqyQx0tBb9DsAwJrSvU5BJplE1aVdZi+C5yW55sWAu1+l/4urzToMs1EgjqzOM6Bw+RakI/0Od3czif1ryYWFDMd555I+jAzHjROnMtCNlfwFOTdClu8RnSqnXlE15T2qVNT0H17qs+Xoc81wQX/hwyUvN8I=
Received: from DM6PR02CA0049.namprd02.prod.outlook.com (2603:10b6:5:177::26)
 by BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:310::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 20:46:44 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::c1) by DM6PR02CA0049.outlook.office365.com
 (2603:10b6:5:177::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Mon, 10 Jan 2022 20:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Mon, 10 Jan 2022 20:46:43 +0000
Received: from AWS-Host-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 14:46:42 -0600
From: Bokun Zhang <Bokun.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add interface to load SRIOV cap FW
Date: Mon, 10 Jan 2022 15:46:27 -0500
Message-ID: <20220110204627.408424-1-Bokun.Zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41526309-eda8-4389-b50f-08d9d47a4fd6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5029:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB50297008CDB1E213A61A3A0BF4509@BL1PR12MB5029.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9csgsYPcIuBwFBBLuRbvD8SZFkY2a7MykYpCNNbozpuYMQVc7MuCrI+xfsn7Iup3gGk4/4RxWTBesEpxzQYwBAzfOjLIX7cEthpW7k4mlmbTPkj0mhLJG8OBn+ZKXmmM4fotkgwIUKFtyvn9qr/EDmKPXsvWTFhgExs53QADh41+csz/WRbHtxduz0k4iXGRPcQdj2HsPMQBKlHAeFXJkJFHtpRQVOgXnWBu+8MulKpCqqBCj/ta3w0an6gZMCqce8Nnywmugzr6LL3MXtBq/yBPQU6UoBZBuTgOFXM4Ci6ZIN2Wz58fmFnjSLjys9XtmhkNJP6XCyOeRycnkiItQDp8cDFrkCVhUoP5+Ey/9Dy/8E7CyGbjSXy5l6dkcdSGF+2EJ1EXJqr7q5/Elxev7ZftEFZhLIe3uJDCd7MD2Lydyye/sL3aTgQMqBuadRGKzsmpmLb6Hi8SfsxEfQb+rs4DQ/2vwrYtl6C5CKq+ZtqIEd7eTIlzKHd8kRZZxRZACSTSpxYhI1dXATg23bQyc4Tl0nfoJ+GlWJEMLSWR/yG1HdlxEH+NihRmB/dpbhO5Cfj7DuKvfu6kFwDZj5/leqTGgoIYpq99AED97J8bXb4v6dQWGPLWOxVBSF3s+l9D2/yQ3fl1VA0kGKjMHwE95vZoF8waDUl5+i5GIMpKxoOB5T2aJ+NT0tlZjn9OqpjL8IbNKXinZ3buQcGJylfohXoEPg4T9zX18CoofAefNZTr60f63Qrpa0vTVRumhqxfxd/Xw7ybKm9OAo2j2Ak8IjramBgUzvrtxOKZyhzIqJ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(40460700001)(7696005)(1076003)(2616005)(186003)(36860700001)(4326008)(70206006)(82310400004)(356005)(83380400001)(54906003)(30864003)(86362001)(5660300002)(16526019)(26005)(336012)(2906002)(81166007)(47076005)(508600001)(8676002)(316002)(36756003)(70586007)(6916009)(426003)(8936002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:46:43.9268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41526309-eda8-4389-b50f-08d9d47a4fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
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
Cc: Bokun Zhang <Bokun.Zhang@amd.com>, Monk Liu <monk.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- Add interface to load SRIOV cap FW. If the FW does not
  exist, simply skip this FW loading routine.
  This FW will only be loaded under SRIOV. Other driver
  setup will not be affected.
  By adding this interface, it will make us easier to
  prepare SRIOV Linux guest driver for different users.

- Update sysfs interface to read cap FW version.

- Refactor PSP FW loading routine under SRIOV to use a
  unified SWITCH statement instead of using IF statement

- Remove redundant amdgpu_sriov_vf() check in FW loading
  routine

Ack-by: Monk Liu <monk.liu@amd.com>
Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c   |  14 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c   | 108 +++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h   |   9 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   1 +
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c     |   1 +
 include/uapi/drm/amdgpu_drm.h             |   2 +
 8 files changed, 125 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 35bee9dabe1c..dc7f24a98c44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -400,6 +400,10 @@ static int amdgpu_firmware_info(struct drm_amdgpu_info_firmware *fw_info,
 		fw_info->ver = adev->psp.toc.fw_version;
 		fw_info->feature = adev->psp.toc.feature_version;
 		break;
+	case AMDGPU_INFO_FW_CAP:
+		fw_info->ver = adev->psp.cap_fw_version;
+		fw_info->feature = adev->psp.cap_feature_version;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1665,6 +1669,16 @@ static int amdgpu_debugfs_firmware_info_show(struct seq_file *m, void *unused)
 	seq_printf(m, "TOC feature version: %u, firmware version: 0x%08x\n",
 		   fw_info.feature, fw_info.ver);
 
+	/* CAP */
+	if (adev->psp.cap_fw) {
+		query_fw.fw_type = AMDGPU_INFO_FW_CAP;
+		ret = amdgpu_firmware_info(&fw_info, &query_fw, adev);
+		if (ret)
+			return ret;
+		seq_printf(m, "CAP feature version: %u, firmware version: 0x%08x\n",
+				fw_info.feature, fw_info.ver);
+	}
+
 	seq_printf(m, "VBIOS version: %s\n", ctx->vbios_version);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 07d563c6641f..2095866bdf81 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -259,6 +259,32 @@ static bool psp_get_runtime_db_entry(struct amdgpu_device *adev,
 	return ret;
 }
 
+static int psp_init_sriov_microcode(struct psp_context *psp)
+{
+	struct amdgpu_device *adev = psp->adev;
+	int ret = 0;
+
+	switch (adev->ip_versions[MP0_HWIP][0]) {
+	case IP_VERSION(9, 0, 0):
+		ret = psp_init_cap_microcode(psp, "vega10");
+		break;
+	case IP_VERSION(11, 0, 9):
+		ret = psp_init_cap_microcode(psp, "navi12");
+		break;
+	case IP_VERSION(11, 0, 7):
+		ret = psp_init_cap_microcode(psp, "sienna_cichlid");
+		break;
+	case IP_VERSION(13, 0, 2):
+		ret = psp_init_ta_microcode(psp, "aldebaran");
+		break;
+	default:
+		BUG();
+		break;
+	}
+
+	return ret;
+}
+
 static int psp_sw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -273,19 +299,13 @@ static int psp_sw_init(void *handle)
 		ret = -ENOMEM;
 	}
 
-	if (!amdgpu_sriov_vf(adev)) {
+	if (amdgpu_sriov_vf(adev))
+		ret = psp_init_sriov_microcode(psp);
+	else
 		ret = psp_init_microcode(psp);
-		if (ret) {
-			DRM_ERROR("Failed to load psp firmware!\n");
-			return ret;
-		}
-	} else if (amdgpu_sriov_vf(adev) &&
-		   adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2)) {
-		ret = psp_init_ta_microcode(psp, "aldebaran");
-		if (ret) {
-			DRM_ERROR("Failed to initialize ta microcode!\n");
-			return ret;
-		}
+	if (ret) {
+		DRM_ERROR("Failed to load psp firmware!\n");
+		return ret;
 	}
 
 	memset(&boot_cfg_entry, 0, sizeof(boot_cfg_entry));
@@ -353,6 +373,10 @@ static int psp_sw_fini(void *handle)
 		release_firmware(psp->ta_fw);
 		psp->ta_fw = NULL;
 	}
+	if (adev->psp.cap_fw) {
+		release_firmware(psp->cap_fw);
+		psp->cap_fw = NULL;
+	}
 
 	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
 	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
@@ -491,7 +515,10 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		DRM_WARN("psp gfx command %s(0x%X) failed and response status is (0x%X)\n",
 			 psp_gfx_cmd_name(psp->cmd_buf_mem->cmd_id), psp->cmd_buf_mem->cmd_id,
 			 psp->cmd_buf_mem->resp.status);
-		if (!timeout) {
+		/* If we load CAP FW, PSP must return 0 under SRIOV
+		 * also return failure in case of timeout
+		 */
+		if ((ucode && (ucode->ucode_id == AMDGPU_UCODE_ID_CAP)) || !timeout) {
 			ret = -EINVAL;
 			goto exit;
 		}
@@ -2052,6 +2079,9 @@ static int psp_get_fw_type(struct amdgpu_firmware_info *ucode,
 			   enum psp_gfx_fw_type *type)
 {
 	switch (ucode->ucode_id) {
+	case AMDGPU_UCODE_ID_CAP:
+		*type = GFX_FW_TYPE_CAP;
+		break;
 	case AMDGPU_UCODE_ID_SDMA0:
 		*type = GFX_FW_TYPE_SDMA0;
 		break;
@@ -3218,6 +3248,58 @@ int psp_init_ta_microcode(struct psp_context *psp,
 	return err;
 }
 
+int psp_init_cap_microcode(struct psp_context *psp,
+			  const char *chip_name)
+{
+	struct amdgpu_device *adev = psp->adev;
+	char fw_name[PSP_FW_NAME_LEN];
+	int err = 0;
+	const struct psp_firmware_header_v1_0 *cap_hdr_v1_0;
+	struct amdgpu_firmware_info *info = NULL;
+
+	if (!chip_name) {
+		dev_err(adev->dev, "invalid chip name for cap microcode\n");
+		return -EINVAL;
+	}
+
+	if (!amdgpu_sriov_vf(adev)) {
+		dev_err(adev->dev, "cap microcode should only be loaded under SRIOV\n");
+		return -EINVAL;
+	}
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_cap.bin", chip_name);
+	err = request_firmware(&adev->psp.cap_fw, fw_name, adev->dev);
+	if (err) {
+		dev_warn(adev->dev, "cap microcode does not exist, skip\n");
+		err = 0;
+		goto out;
+	}
+
+	err = amdgpu_ucode_validate(adev->psp.cap_fw);
+	if (err) {
+		dev_err(adev->dev, "fail to initialize cap microcode\n");
+		goto out;
+	}
+
+	info = &adev->firmware.ucode[AMDGPU_UCODE_ID_CAP];
+	info->ucode_id = AMDGPU_UCODE_ID_CAP;
+	info->fw = adev->psp.cap_fw;
+	cap_hdr_v1_0 = (const struct psp_firmware_header_v1_0 *)
+		adev->psp.cap_fw->data;
+	adev->firmware.fw_size += ALIGN(
+			le32_to_cpu(cap_hdr_v1_0->header.ucode_size_bytes), PAGE_SIZE);
+	adev->psp.cap_fw_version = le32_to_cpu(cap_hdr_v1_0->header.ucode_version);
+	adev->psp.cap_feature_version = le32_to_cpu(cap_hdr_v1_0->sos.fw_version);
+	adev->psp.cap_ucode_size = le32_to_cpu(cap_hdr_v1_0->header.ucode_size_bytes);
+
+	return 0;
+
+out:
+	release_firmware(adev->psp.cap_fw);
+	adev->psp.cap_fw = NULL;
+	return err;
+}
+
 static int psp_set_clockgating_state(void *handle,
 				     enum amd_clockgating_state state)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index f29afabbff1f..ff7d533eb746 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -306,6 +306,9 @@ struct psp_context
 	/* toc firmware */
 	const struct firmware		*toc_fw;
 
+	/* cap firmware */
+	const struct firmware		*cap_fw;
+
 	/* fence buffer */
 	struct amdgpu_bo		*fence_buf_bo;
 	uint64_t			fence_buf_mc_addr;
@@ -327,6 +330,10 @@ struct psp_context
 	const struct firmware		*ta_fw;
 	uint32_t			ta_fw_version;
 
+	uint32_t			cap_fw_version;
+	uint32_t			cap_feature_version;
+	uint32_t			cap_ucode_size;
+
 	struct ta_context		asd_context;
 	struct psp_xgmi_context		xgmi_context;
 	struct psp_ras_context		ras_context;
@@ -440,6 +447,8 @@ int psp_init_sos_microcode(struct psp_context *psp,
 			   const char *chip_name);
 int psp_init_ta_microcode(struct psp_context *psp,
 			  const char *chip_name);
+int psp_init_cap_microcode(struct psp_context *psp,
+			  const char *chip_name);
 int psp_get_fw_attestation_records_addr(struct psp_context *psp,
 					uint64_t *output_ptr);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
index 7c2538db3cd5..428f4df184d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
@@ -378,6 +378,7 @@ enum AMDGPU_UCODE_ID {
 	AMDGPU_UCODE_ID_VCN0_RAM,
 	AMDGPU_UCODE_ID_VCN1_RAM,
 	AMDGPU_UCODE_ID_DMCUB,
+	AMDGPU_UCODE_ID_CAP,
 	AMDGPU_UCODE_ID_MAXIMUM,
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h b/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
index dd0dce254901..1f276ddd26e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
+++ b/drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h
@@ -258,6 +258,7 @@ enum psp_gfx_fw_type {
 	GFX_FW_TYPE_SDMA6                           = 56,   /* SDMA6                    MI      */
 	GFX_FW_TYPE_SDMA7                           = 57,   /* SDMA7                    MI      */
 	GFX_FW_TYPE_VCN1                            = 58,   /* VCN1                     MI      */
+	GFX_FW_TYPE_CAP                             = 62,   /* CAP_FW                           */
 	GFX_FW_TYPE_REG_LIST                        = 67,   /* REG_LIST                 MI      */
 	GFX_FW_TYPE_MAX
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index d0e76b36d4ab..9518b4394a6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -53,11 +53,13 @@ MODULE_FIRMWARE("amdgpu/navi14_ta.bin");
 MODULE_FIRMWARE("amdgpu/navi12_sos.bin");
 MODULE_FIRMWARE("amdgpu/navi12_asd.bin");
 MODULE_FIRMWARE("amdgpu/navi12_ta.bin");
+MODULE_FIRMWARE("amdgpu/navi12_cap.bin");
 MODULE_FIRMWARE("amdgpu/arcturus_sos.bin");
 MODULE_FIRMWARE("amdgpu/arcturus_asd.bin");
 MODULE_FIRMWARE("amdgpu/arcturus_ta.bin");
 MODULE_FIRMWARE("amdgpu/sienna_cichlid_sos.bin");
 MODULE_FIRMWARE("amdgpu/sienna_cichlid_ta.bin");
+MODULE_FIRMWARE("amdgpu/sienna_cichlid_cap.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_sos.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_ta.bin");
 MODULE_FIRMWARE("amdgpu/vangogh_asd.bin");
@@ -177,8 +179,6 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		err = psp_init_asd_microcode(psp, chip_name);
 		if (err)
 			return err;
-		if (amdgpu_sriov_vf(adev))
-			break;
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
 		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
 		if (err) {
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index 1ed357cb0f49..01f3bcc62a6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -44,6 +44,7 @@
 
 MODULE_FIRMWARE("amdgpu/vega10_sos.bin");
 MODULE_FIRMWARE("amdgpu/vega10_asd.bin");
+MODULE_FIRMWARE("amdgpu/vega10_cap.bin");
 MODULE_FIRMWARE("amdgpu/vega12_sos.bin");
 MODULE_FIRMWARE("amdgpu/vega12_asd.bin");
 
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index eef6e7e95a11..7b7190609ad0 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -790,6 +790,8 @@ struct drm_amdgpu_cs_chunk_data {
 	#define AMDGPU_INFO_FW_DMCUB		0x14
 	/* Subquery id: Query TOC firmware version */
 	#define AMDGPU_INFO_FW_TOC		0x15
+	/* Subquery id: Query CAP firmware version */
+	#define AMDGPU_INFO_FW_CAP		0x16
 
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED		0x0f
-- 
2.25.1

