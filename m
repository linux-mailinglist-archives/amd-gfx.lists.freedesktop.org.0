Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308617D9D34
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 17:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381CA10E9EA;
	Fri, 27 Oct 2023 15:43:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D8F10E9EA
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 15:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB7D8SN2YIHXDt+fagwPiBZj0gsdTKn460b4K53w81CkFgCSvShs6Ac0BFouFfYVry+S3m+3Bn/hBrpUv6wLWvmlz99YaV6DAIRd8pxymK9SZN+jvRbuFXQ/qElfTuohWmNeK6dE2TaYob6cNhCg8ZD8PWoKPbe3+OJ90PR9uJCkMaiFqpY+dCw/Jn7YJsAzQIzRg+LBL4XkfgtlffJiiYL2IXJW+DOvr7OemRZcFviKE/ivIgt0v5tJ8KYSn9DEpQzMSJ/pbr5vgQupu7Cz5MnuMEXwrRwxGsrxRxXlr3HDD7+vhbYjFtAkoCyPH4Vi8z3RmoCQtF7FoKvKsYd5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkr2FcA83aJ931Mlmwh6XSiV258tz8/T/IdQ+6o0bQY=;
 b=EfrPsyjWZJMHIBNiCX5l42JoLlfvmZX2q7tQ92cJE+uJ0N0mYhRuxf7I/8OItH1tauCv3iMfxFNrizqVZdltWsfPxy89CgXfYYHjvOyQnneXRJ2GAI1aV8HFRB0G5BA/6dqJRQV3fMkZgQZACAWn3343axYTvdJzPh1cN0CLf5Aosu5QlbX0gbuzgkRcZSKr5PKPRn0shH0VSOJNyJvweBBcf/G5gx7FSKJpSR0x9qOBVSiZ0IrcIlWrw/9R4DgOPaALbxUJKoAPqa2hHlapuFgIYtaTG/Kw0DcMEUQ+Ezx8xDp5IQvjw1kHOVy38gw2452YISGFC5jwWSF0pDpYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkr2FcA83aJ931Mlmwh6XSiV258tz8/T/IdQ+6o0bQY=;
 b=UMZd479B1XSbFWak3KsviwOqIq+0ZbG84k3I90HyO+sQ9xHS2QgiblGmOWDhpmlUkHmrNpQ5mG6AVhoAxzGzZA03LSTREjlMKrayI2R65eoNIgzrVqaT7pokp0m+3bmMjUJXGXboBCFxzKdNYJcY0/oaXPusxafX5cUjs/MOA4A=
Received: from BL1PR13CA0181.namprd13.prod.outlook.com (2603:10b6:208:2be::6)
 by DM6PR12MB4863.namprd12.prod.outlook.com (2603:10b6:5:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Fri, 27 Oct
 2023 15:43:09 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::ff) by BL1PR13CA0181.outlook.office365.com
 (2603:10b6:208:2be::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8 via Frontend
 Transport; Fri, 27 Oct 2023 15:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 15:43:09 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 10:43:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: add a retry for IP discovery init
Date: Fri, 27 Oct 2023 11:42:25 -0400
Message-ID: <20231027154225.1662448-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027154225.1662448-1-alexander.deucher@amd.com>
References: <20231027154225.1662448-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM6PR12MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b084cf-cc38-4f84-3827-08dbd7036b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxcqaIftG2luWuxamB/wsHvTluXekDALp0O/tyiFYGd03BbaffPcSCmjGiClGBRfu1HoSwYWJBeY2NPLga51+jvd0+CvbUD1XCtZXo94r795Eu+b10C3lzUUJVNVoAVm0JFFyUvFbUH/XBGOTHqXPq+a0iXXSvYFKgCI9LJkYxvMD8qozOu/+HNC89AvkdF4XZQh+Zwb58f8FZfMCDTWjTWgGD+C2ebrIadhvQyHj32MyONy7gwsJIl6VVhrwWSi/RAN1yC6qi0ERiFi9wzrxD60xbB/mv+iIcm3GBD4x0XCd1e+WsQ8/AdvyOy5TJpOPvitCT3/7L2/7x8gO8fKq4cDvVI6Hko8Z4zgkMSSRFgmy08SyIgAbDdi3p/KqwuNjGviW4OtJ7lpgCu72V8O/a+un2x/uu0kwusNUB1QNnwJstixZZ29bL74mV14PuCSh3gSW1ecBDXvXsislsq3DKU4gaCZo/HehDlEknT4Cu0fyuhQxfDkXuoNgC8Ov9Rd52IEl1AJPglcwMbfNTEPkSK+fW7pTpd/zfqdo1BMraUfFTk5FWOZJ4QW+mn1GvmJQYFAsuiTv+ACR8lWkPY4HuilV1fa1Zr5c1tXJZtNhVuPn2/fNZvINEiHz9mzC6yEIEB2ZGuVEZZOBAwTtWOwK+wYnR+LrP21gKGNL+DsIIy4zu11sGpzyJlRoT2yHmmZgbIb5/TubT9VXyMaBGywYH9vEj5CASq8nBEKVoOoA8oedYq0uuEloXqid2lLQR/g
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(82740400003)(2616005)(41300700001)(426003)(336012)(81166007)(5660300002)(356005)(40480700001)(1076003)(16526019)(26005)(8676002)(966005)(8936002)(4326008)(478600001)(70206006)(70586007)(316002)(6916009)(36756003)(7696005)(6666004)(40460700003)(86362001)(2906002)(36860700001)(47076005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:43:09.2927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b084cf-cc38-4f84-3827-08dbd7036b9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4863
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

AMD dGPUs have integrated FW that runs as soon as the
device gets power and initializes the board (determines
the amount of memory, provides configuration details to
the driver, etc.).  For direct PCIe attached cards this
happens as soon as power is applied and normally completes
well before the OS has even started loading.  However, with
hotpluggable ports like USB4, the driver needs to wait for
this to complete before initializing the device.

This normally takes 60-100ms, but could take longer on
some older boards periodically due to memory training.

Retry for up to a second.  In the non-hotplug case, there
should be no change in behavior and this should complete
on the first try.

v2: adjust test criteria
v3: adjust checks for the masks, only enable on removable devices
v4: skip bif_fb_en check

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 5f9d75900bfa..9ca4d89352d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -99,6 +99,7 @@
 MODULE_FIRMWARE(FIRMWARE_IP_DISCOVERY);
 
 #define mmRCC_CONFIG_MEMSIZE	0xde3
+#define mmMP0_SMN_C2PMSG_33	0x16061
 #define mmMM_INDEX		0x0
 #define mmMM_INDEX_HI		0x6
 #define mmMM_DATA		0x1
@@ -239,8 +240,26 @@ static int amdgpu_discovery_read_binary_from_sysmem(struct amdgpu_device *adev,
 static int amdgpu_discovery_read_binary_from_mem(struct amdgpu_device *adev,
 						 uint8_t *binary)
 {
-	uint64_t vram_size = (uint64_t)RREG32(mmRCC_CONFIG_MEMSIZE) << 20;
-	int ret = 0;
+	uint64_t vram_size;
+	u32 msg;
+	int i, ret = 0;
+
+	/* It can take up to a second for IFWI init to complete on some dGPUs,
+	 * but generally it should be in the 60-100ms range.  Normally this starts
+	 * as soon as the device gets power so by the time the OS loads this has long
+	 * completed.  However, when a card is hotplugged via e.g., USB4, we need to
+	 * wait for this to complete.  Once the C2PMSG is updated, we can
+	 * continue.
+	 */
+	if (dev_is_removable(&adev->pdev->dev)) {
+		for (i = 0; i < 1000; i++) {
+			msg = RREG32(mmMP0_SMN_C2PMSG_33);
+			if (msg & 0x80000000)
+				break;
+			msleep(1);
+		}
+	}
+	vram_size = (uint64_t)RREG32(mmRCC_CONFIG_MEMSIZE) << 20;
 
 	if (vram_size) {
 		uint64_t pos = vram_size - DISCOVERY_TMR_OFFSET;
-- 
2.41.0

