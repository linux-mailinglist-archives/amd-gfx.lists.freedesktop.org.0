Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCE230496
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Jul 2020 09:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79B6E213;
	Tue, 28 Jul 2020 07:50:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2116E1F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 07:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/d+GuHhDFxhwyYgVJ8L3ubAB+amxoDcBxzRYI7GGf6lM/HZWfY18qGLj5j7kR+zMn6UEE5Vzo5RFBUfBs1PFTLP5XhuPQ6xEALsSaxBfJpRUBXHPQUvrClRpaUmfjFoUCCrCwr09AluLIHQ+EyQLBQDfU0ZBtsnXesMTXoxHlyVahhvN8ro0dxzON1OKtwwgc80kJmXPi4ftLRc89giQRrjds2o6yNi63y0+2BEy0QPs4cnFax3dHdDRNaMUo6rL7OUnr4UeHUaS3ht2y7S4C/LwB1BmvlrDiwuM+nksFpUKaX2YHIRyOtFvXo5pOfLdD+47Vb8ogMlJ6i8qICXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P37OcHYlJ1C50DZ4H477Sq+eVNO5LNFYETJXj3pv4xY=;
 b=c043takxJl1Jw9qhm7LzmXXtDgwCeqIGq6Lc0JcIURbQELkyEZlaiVcVmw2z9TYUc1EnvUOTJ6oNQHI7woJ9iuKMv5t+9hAmlxIbFzFOEsVeFPuTMU38gSdyC+4Jt9CsXUuFLFEX+MzG03ujcp8Z/438Ql3jyvS079D4uxZEC2ajOqGrMdu68gCQkFUzNg6Ni2MA1NguqpaOvmf4M3jtlA6h+q9q8tFugcbdfIW6GszexdXxjmie4hIyUmYeHZLXVWDxluXHKVePamWpdYr4FF6ljqQ7gdkkJmdugMb+vi3MbMQ4qtS88I1850Ok+gU9gm2C4+tiA4U06N1Owr6sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P37OcHYlJ1C50DZ4H477Sq+eVNO5LNFYETJXj3pv4xY=;
 b=sCa0QkG39nBE7Z7TXsA/i5T5z0oY0EAJjM44JHavNbEiDAs58VXVikupIFpmSg4y5YDhyhPqeGY3OJtIAlnV6Bpvfxti+cQeOZjeIwFcnHsyoxm1qi3ivdFViBQ9HA2rzBGr0UJXknEWsN/yzyx3YpcxX3KgKLOH4SiuTra2SKk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1752.namprd12.prod.outlook.com (2603:10b6:903:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 07:50:01 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e0b1:48e7:bcbc:351c%11]) with mapi id 15.20.3216.033; Tue, 28 Jul
 2020 07:50:01 +0000
From: Guchun Chen <guchun.chen@amd.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, andrey.grodzovsky@amd.com,
 Tao.Zhou1@amd.com, John.Clements@amd.com, lijo.lazar@amd.com,
 christian.koenig@amd.com, stanley.yang@amd.com
Subject: [PATCH 02/12] drm/amdgpu: validate bad page threshold in ras
Date: Tue, 28 Jul 2020 15:49:24 +0800
Message-Id: <20200728074934.12490-3-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728074934.12490-1-guchun.chen@amd.com>
References: <20200728074934.12490-1-guchun.chen@amd.com>
X-ClientProxiedBy: HKAPR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:203:c8::9) To CY4PR12MB1287.namprd12.prod.outlook.com
 (2603:10b6:903:40::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from guchchen-System-Product-Name.amd.com (58.247.170.242) by
 HKAPR03CA0004.apcprd03.prod.outlook.com (2603:1096:203:c8::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Tue, 28 Jul 2020 07:49:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b309add0-8fb3-4f1f-1eba-08d832cad4d8
X-MS-TrafficTypeDiagnostic: CY4PR12MB1752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1752DD874CC5CEF8A899ED9EF1730@CY4PR12MB1752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6Xr93EA/V5UMShKzXcW5BNgiLYF+mAgPObBnM30Z+BtsBpYbQ7yWZ0Oe+uAws5mQEhmvjh+P2THWHIZ5/LPHBtTqIqpyz01Qbus56zHBJMZtFohsjF8jAoUxPVDkW7VgTrlxgZBYeyvQknu0yZYmvE1IbyAmWhxFUskOd72Lw8HVl/zvU/LvaaW8oMiPIineEoBV1QkDlOWq9n2KlZs5a6Lls/2cdUkVWOxoIGITfYaNfoWks+to1pb4gQGpaPfKTX+ExvBXCi6kyezBoN5kmHk8xWTTNDV/f57Nj7nRSCL+gHyy4jSzXFvpd5HmHQSfyoj79gtvd9gCtfVINqTfNziRo/cxTfCDlju/QgM/nlxe+z3OaSFBIt9ditd99fR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(2906002)(956004)(2616005)(1076003)(6486002)(66476007)(66556008)(4326008)(6636002)(66946007)(52116002)(478600001)(36756003)(44832011)(86362001)(83380400001)(316002)(6666004)(16526019)(186003)(26005)(5660300002)(7696005)(8936002)(8676002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OiQd5DQrWwL9SwdMfHUyeQaCdABjtnN8OC4YAwHlIcyS8GIO9/rb+/fKnvm/ISYEfT4iwZOGRt26KUb1aAkAcoqFJ0QLErqsrcgn776vkUmgRy2Nq0hu2qglugMVhPiAtQ6XQ2s+Rk5bI8qTkJDSPsJ5j5Rrh6Z2nda1yRpVuty3WfZYM1QUGUJ+v5SXQ8AKhc1I06Xe8AlKh94S+GGqgKrQcJ6CBPyw8k2lSqhz/98raSAPim8q/Guk92wCvMwPBRSojamzQDjrMu4Fk/pbwLPnMw4v1i1OlurdVuVYyhA2dreIcJXJKNyxff8KbAppIBT2LkMr0dPgNYIf9C8mMoeLuTqBgpxuHXGitW4+SECxjY6j2LIXkuWYvZ+0kRnCmyfgNqMZr5SAwQKtr2R3BeO546/c1i2fko0OxYkdREUG3NJnwuZPubWsP0a/rooq3Q4AFQ99Mr9DxSNdJmJ1bxHBgwc1dz19ZrVGRyK7bBeHgSFrwob4gU7eDYkA9eTy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b309add0-8fb3-4f1f-1eba-08d832cad4d8
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 07:50:01.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVK6FHELfZ4twCRHAa4z8aRKXOPWxfn/RBmzQ2OebpfxLf+TGhmMwp0ekiDCTMcWM0dq1KtBN73PNdbfdWHvHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1752
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
saved bad pages exceed threshold value, and proceed corresponding
actions.

v2: When using the default typical value, it should be min
value between typical value and eeprom max records length.

v3: drop the case of setting bad_page_cnt_threshold to be
    0xFFFFFFFF, as it confuses user.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       | 48 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h       |  3 ++
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  5 ++
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h    |  2 +
 4 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 6f06e1214622..3c4c142e9d8a 100644
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
@@ -1700,6 +1703,47 @@ static bool amdgpu_ras_check_bad_page(struct amdgpu_device *adev,
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
+	 * in eeprom, and introduce two scenarios accordingly.
+	 *
+	 * Bad page retirement enablement:
+	 *    - If amdgpu_bad_page_threshold = -1,
+	 *      bad_page_cnt_threshold = typical value by formula.
+	 *
+	 *    - When the value from user is 0 < amdgpu_bad_page_threshold <
+	 *      max record length in eeprom, use it directly.
+	 *
+	 * Bad page retirement disablement:
+	 *    - If amdgpu_bad_page_threshold = 0, bad page retirement
+	 *      functionality is disabled, and bad_page_cnt_threshold will
+	 *      take no effect.
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
+	} else {
+		con->bad_page_cnt_threshold = tmp_threshold;
+	}
+}
+
 /* called in gpu recovery/init */
 int amdgpu_ras_reserve_bad_pages(struct amdgpu_device *adev)
 {
@@ -1777,6 +1821,7 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_err_handler_data **data;
+	uint32_t max_eeprom_records_len = 0;
 	int ret;
 
 	if (con)
@@ -1795,6 +1840,9 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
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
