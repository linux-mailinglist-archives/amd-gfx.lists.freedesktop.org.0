Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D9222AAB6
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Jul 2020 10:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698C26E867;
	Thu, 23 Jul 2020 08:34:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473FD89C03
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jul 2020 08:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu0nhdGb2E9K4ztjU++isJuzXyyo44o4gBHoviyJfn/6TO22YOrjFm6Fiu/uutW76kHCzT2tewHceejswAl9KCs4pFU4XPxhbFZLD5MRxiHt7FZhDvQeRCOrtmRbkE2dXsOnIij35EZZSrHnp4E2Xt4HRE103VnY08ED2z1OObQv4rLfzbil6GtmSflhYyebkfShbcM7J5Vowj5xQdlzUvG0Y+zhhO73jdSYHHt1ntoFXDTJnBdY35tO5YIP9e9K6kSjS17FirvB0E8+CGcILDeSnTiIEH3lkQiwzC3h7yhXBfjl6JTp40CEDIrHcwAc8mizrMjsuNPgIWjxbTvkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+Pcu0rmZFyml2SuJSnB8TrAYVFmDP17CkU3XbYRtDY=;
 b=Bb0ELT1o42f2kJzDzOYZgAAXdj459JxRxyJKPF7MZ+hDrkvJg9wSLL+LHYY36SSDpkUJ856H7B60JGnfpBgLhbiQTsffEPcMQ4Dz9GkFVIX1a4tGqS6EJH5CO0h+dZFrHsGkMxh2p7arjKBmQLBAJsa81/grHAcdJ8j4L0EFoBkFFMIQRHJ6A0Huf962sopKh5ySU9uOoZI0e/y4h4F0A9UjyRG8alCcXnO/dXCN1h09xeN5R2bZtwBTrwliBAqQCjk3YvCUh6Pc/i1vzELM1qqMy0kWfjicoMxG0UFOVK34PPyWLDdA2jcPMW7NGf1ExzHH1XTfJVjsxzrJUngS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+Pcu0rmZFyml2SuJSnB8TrAYVFmDP17CkU3XbYRtDY=;
 b=qS9lZPea+nQwpG/QEGI8JTzPycMLvHxX/Q7S7hLUASZBcjjYV5uGkW2RwKWnQabUr87IH0lWss9i10+VoLKOZ87wt7+JNFhx3X59PPmdMDmuI0x+F5qW0atd2zByklzKglyDMp1K8kn6PIBPu2DJCE8lWx/tpbS8YqYpbpoksoE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR1201MB0005.namprd12.prod.outlook.com (2603:10b6:903:d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 08:34:12 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c%11]) with mapi id 15.20.3216.024; Thu, 23 Jul
 2020 08:34:12 +0000
From: Guchun Chen <guchun.chen@amd.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, Stanley.Yang@amd.com,
 Tao.Zhou1@amd.com, John.Clements@amd.com, lijo.lazar@amd.com
Subject: [PATCH 2/9] drm/amdgpu: validate bad page threshold in ras
Date: Thu, 23 Jul 2020 16:33:39 +0800
Message-Id: <20200723083346.8743-3-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723083346.8743-1-guchun.chen@amd.com>
References: <20200723083346.8743-1-guchun.chen@amd.com>
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To CY4PR12MB1287.namprd12.prod.outlook.com
 (2603:10b6:903:40::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from guchchen-System-Product-Name.amd.com (58.247.170.242) by
 HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 08:34:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57ab5608-0f23-4cff-4266-08d82ee32cfb
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0005:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0005256D8B9D62137742CEF2F1760@CY4PR1201MB0005.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xi9z/omo0uC6fLEe0CbkcZsMizgGJctvsk/tUOiUd9/77jx/RbskjjrLpQsp0QV1j4wRd5DfvVvgRY8EWz2Z6nl+AwqQx80OGkD/xilbaP6YZCklJcJWhA7XX3mntQ4sjwc93Oct7lBVeuXbPGNiL96IFTyoQruWIWWkxRKWnzHpJMsJ2ss36ieOdt1pzVwUxyXx8mYNsuZdz3CnHlpn5drCE/1ajqWfreDLlE99LmPyMZ92yndiU3M/SDw5BrRyDKSaqaEUdNZDkGrPlPe4uXVGauIsDUeatcpB5DFcokZqT04gfwCXkq2VZO7jPWnnP+t4L+Dx4BdDTMKMaq9Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(8936002)(316002)(2616005)(36756003)(2906002)(16526019)(186003)(8676002)(6486002)(44832011)(4326008)(956004)(26005)(7696005)(478600001)(52116002)(5660300002)(66476007)(66556008)(66946007)(83380400001)(1076003)(6636002)(86362001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: toQ0N5jeOsp7bHxl6hW0tpAqDCdfv3z7ZP5bMyMLxMD5GizBIs0Pkg8ZKXK0zl2WbcsLOfuHNHiFW59axrmgcwe5ldAbiY/j1kvlk+GtfYMrL0wbJLbtWAFsuEv6dkBXKCkugKkQXIkzcfRP9RfAcSvxY38vFbdBVPVvAqIL+OLae3jQSeQ2PYlA7MNJMJl8Y2GHTkkKPBcZPfeAmgRt9BkHmpBmlpRwIOnKZWe/X4pyo5jzIvOl71k16ywk1yqF2xJqMjKmCWLK5IXuBnP/IT1hKTdNwvsVe/gelKrzoCEVm23j/K3G2lEffpi1QMX/qt1t9Qfye0R9ovoVO+CrxFT4ZAsEuo6t2bo5qlUwC9QDFCLSFgSO3Ch0e362/SJ3mYbTUwMbXoYQWthD/GmRodXpt03yhDTEOybGxxuF9qrPTDMbilCBG93sNEiBX1lvzMlcAH3bOQKsgnOK+H8EVP6b/dzv+LP6zCGjwZhnNxsCO1vlZ19ldT9Zkz5Sin4X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ab5608-0f23-4cff-4266-08d82ee32cfb
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 08:34:12.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpmNl+O8g8VR6aPyGCCEfHnoN5YTwPlStyc+5+U5wKtO6R2sGzSDD9+0AAHGphUmCIoBt3ZrQ+G1Zh872pW0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0005
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Bad page threshold value should be valid in the range between
-1 and max records length of eeprom. It could determine when
the GPU should be retired.

v2: When using the default typical value, it should be min
value between typical value and eeprom max records length.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 45 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h       |  3 ++
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  5 +++
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h    |  2 +
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 6f06e1214622..8daeb54917ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -69,6 +69,9 @@ const char *ras_block_string[] = {
 /* inject address is 52 bits */
 #define	RAS_UMC_INJECT_ADDR_LIMIT	(0x1ULL << 52)
 
+/* typical ECC bad page rate(1 bad page per 100MB VRAM) */
+#define RAS_BAD_PAGE_RATE		(100 * 1024 * 1024ULL)
+
 enum amdgpu_ras_retire_page_reservation {
 	AMDGPU_RAS_RETIRE_PAGE_RESERVED,
 	AMDGPU_RAS_RETIRE_PAGE_PENDING,
@@ -1700,6 +1703,44 @@ static bool amdgpu_ras_check_bad_page(struct amdgpu_device *adev,
 	return ret;
 }
 
+static void amdgpu_ras_validate_threshold(struct amdgpu_device *adev,
+					uint32_t max_length)
+{
+	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
+	int tmp_threshold = amdgpu_bad_page_threshold;
+	u64 val;
+
+	/*
+	 * Justification of value bad_page_cnt_threshold in ras structure
+	 *
+	 * Generally, -1 <= amdgpu_bad_page_threshold <= max record length
+	 * in eeprom.
+	 *    - If amdgpu_bad_page_threshold = -1,
+	 *      bad_page_cnt_threshold = typical value by formula.
+	 *    - If amdgpu_bad_page_threshold = 0,
+	 *      bad_page_cnt_threshold = 0xFFFFFFFF,
+	 *      and disable GPU retirement feature accordingly.
+	 *    - When the value from user is 0 < amdgpu_bad_page_threshold <
+	 *      max record length in eeprom, use it directly.
+	 */
+
+	if (tmp_threshold < -1)
+		tmp_threshold = -1;
+	else if (tmp_threshold > max_length)
+		tmp_threshold = max_length;
+
+	if (tmp_threshold == -1) {
+		val = adev->gmc.mc_vram_size;
+		do_div(val, RAS_BAD_PAGE_RATE);
+		con->bad_page_cnt_threshold = min(lower_32_bits(val),
+						max_length);
+	} else if (tmp_threshold == 0) {
+		con->bad_page_cnt_threshold = 0xFFFFFFFF;
+	} else {
+		con->bad_page_cnt_threshold = tmp_threshold;
+	}
+}
+
 /* called in gpu recovery/init */
 int amdgpu_ras_reserve_bad_pages(struct amdgpu_device *adev)
 {
@@ -1777,6 +1818,7 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_err_handler_data **data;
+	uint32_t max_eeprom_records_len = 0;
 	int ret;
 
 	if (con)
@@ -1795,6 +1837,9 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
 	atomic_set(&con->in_recovery, 0);
 	con->adev = adev;
 
+	max_eeprom_records_len = amdgpu_ras_eeprom_get_record_max_length();
+	amdgpu_ras_validate_threshold(adev, max_eeprom_records_len);
+
 	ret = amdgpu_ras_eeprom_init(&con->eeprom_control);
 	if (ret)
 		goto free;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index b2667342cf67..4672649a9293 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -336,6 +336,9 @@ struct amdgpu_ras {
 	struct amdgpu_ras_eeprom_control eeprom_control;
 
 	bool error_query_ready;
+
+	/* bad page count threshold */
+	uint32_t bad_page_cnt_threshold;
 };
 
 struct ras_fs_data {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index c0096097bbcf..a2c982b1eac6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -499,6 +499,11 @@ int amdgpu_ras_eeprom_process_recods(struct amdgpu_ras_eeprom_control *control,
 	return ret == num ? 0 : -EIO;
 }
 
+inline uint32_t amdgpu_ras_eeprom_get_record_max_length(void)
+{
+	return EEPROM_MAX_RECORD_NUM;
+}
+
 /* Used for testing if bugs encountered */
 #if 0
 void amdgpu_ras_eeprom_test(struct amdgpu_ras_eeprom_control *control)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
index 7e8647a05df7..b272840cb069 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
@@ -85,6 +85,8 @@ int amdgpu_ras_eeprom_process_recods(struct amdgpu_ras_eeprom_control *control,
 					    bool write,
 					    int num);
 
+inline uint32_t amdgpu_ras_eeprom_get_record_max_length(void);
+
 void amdgpu_ras_eeprom_test(struct amdgpu_ras_eeprom_control *control);
 
 #endif // _AMDGPU_RAS_EEPROM_H
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
