Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CD1C8632
	for <lists+amd-gfx@lfdr.de>; Thu,  7 May 2020 11:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADFD6E966;
	Thu,  7 May 2020 09:59:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E24E6E0D4
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 May 2020 09:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpdFBgi8ZCTAqh3ZfwRx6lVJuD0dOBcjlgUQha/oHSteWSh6zx7u3/joNTAkKKrgkNCA9TOA4w6fRyobv3Z3hMREGkuQEQdtspXtZ27uH14dqbwkvJBj6sYKQwRu3VFyDyJnicYD9q3VHQmLkbEvrAnAq1w626X84fLzEhcvPoroSN12KdX/AmESPrlaPqjyNzm2KVHt/u6XEsXMz2KJxuCa52Flm7vj0Cpaa6zzNntzLudwnw8po9KFN2eiHyaiwHnk/OgTqOzFO3tPo337YdLP5239BdkJ3h6weyJcIXHa+fNBcDDyWKPMuh28M8C83WnfAHCorEGm5eNZnIJZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w7gG136v+3AyflO/JHBLuyjtICykBfwO4i3CYoHIHs=;
 b=fh8xcyho2VoP1uLPic9uymKfWgUemwivOZUtXyxqAE7jYqcsvXnp1q85VAcUASb/+PWfGozBb/k9UCDJfYNYGr5w2H5Ld8Cxt+kviN3PRqqkF6dZormsIDgiHLW/oHkZrfbXRbo2JPMhQLqNU8aMoSXP1FjINqmkd9YQxOnjjXnOwk1VxVtg8ju1Os/ndhgeoKyTadw/2KST+v3f5CSD3or0UgOkqcczkZ/QC3t4n/8pxT62cgAwR8O9EQtrvQ+OOYtNaRgqCd55hCP5fMGryTYi3ZseEa/qeYZtONo+ZhSDBI0SGIYxhwcQcPmfxhRDSM7J3asileNYLf+xJTuWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w7gG136v+3AyflO/JHBLuyjtICykBfwO4i3CYoHIHs=;
 b=nahjLmi8eTD3kVO9rZuw3auvN0FUGjOBMaoYUyZzZGQ+yaVKmt+fcZo3fRc59ShNEmwlhUJ3F72Ct1kLDPQUpa53GiZ0iznwZk1foUnA1UqlLdta8pGHvqNSJC0ILehGn5xeBsrZHmgIYACN6y3+2QOSpnKlqBTyXLYtPmm0t7I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 by BY5PR12MB3666.namprd12.prod.outlook.com (2603:10b6:a03:1a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 09:59:12 +0000
Received: from BY5PR12MB4068.namprd12.prod.outlook.com
 ([fe80::1897:7b63:ee7e:5d2c]) by BY5PR12MB4068.namprd12.prod.outlook.com
 ([fe80::1897:7b63:ee7e:5d2c%2]) with mapi id 15.20.2958.030; Thu, 7 May 2020
 09:59:12 +0000
From: Kevin Wang <kevin1.wang@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: optimize amdgpu device attribute code
Date: Thu,  7 May 2020 17:57:02 +0800
Message-Id: <20200507095704.25623-2-kevin1.wang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507095704.25623-1-kevin1.wang@amd.com>
References: <20200507095704.25623-1-kevin1.wang@amd.com>
X-ClientProxiedBy: HK0PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:203:b0::14) To BY5PR12MB4068.namprd12.prod.outlook.com
 (2603:10b6:a03:203::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kevin-kaka-kvm.amd.com (58.247.170.245) by
 HK0PR03CA0098.apcprd03.prod.outlook.com (2603:1096:203:b0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26 via Frontend Transport; Thu, 7 May 2020 09:59:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [58.247.170.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c56bab0a-666e-446e-538a-08d7f26d4b21
X-MS-TrafficTypeDiagnostic: BY5PR12MB3666:|BY5PR12MB3666:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB36664B57375BCE4C7A113BA1A2A50@BY5PR12MB3666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUhX88Phb6kM35/5fsebPLhfHnW5AD6nvwwFPo/gphTMP7/EFC9ygnZYlAuH92ealh0B28V8H2gMajxE3H/Qe/+tkJLUUGpTgla2SFbjZYYvq0hRGBw3t8eJkEnTbpLCWWOq1Z88LOy0gx6uox1bxPjxt3Sd5chTaSnd8YN9Tpdqs8CK1PUcEgtJ5ARs/vsYmYB9i7RJrPFsHZef3RFXN1e3UtVeaPS5l2alD7kI2he97DRIUvRpzdX0W5JdN83EsiW2caii0DOqjtwK1u18cTuO+ZLbofL648V8eVc/gfTuYFstT9VNRUSRWSt5rZI+KJgMgfzlUsRG8io8tST+BZUOh+tFnuMJiIYgznGhfzgCAPYg0dc0ayTf9dzBztUNeaAFfvzF2EMr5ICUPlFxlwR6er3KzZRr7twJEODWeCoMXo0uEMwXZb7DZATEvCRkBxQj0zRotki3DRFVDu1Z9wVhAQH85nweNVGiehdAWT+MvJg4NDZ6DZYGsT690DITKpyreghKSxtONWDnwmwx6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4068.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(33430700001)(33440700001)(316002)(83290400001)(478600001)(2906002)(26005)(83280400001)(83310400001)(83300400001)(83320400001)(16526019)(7696005)(186003)(52116002)(6916009)(6486002)(86362001)(36756003)(66556008)(6666004)(4326008)(8676002)(1076003)(8936002)(66946007)(66476007)(30864003)(956004)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PK0Cz6fUcZd3VVqbvKzFu0wwYIUsELkx20OyCHix3+xlsSN2wslRp1W3SgoYdOuuewG1o2lpjXmJP2f52O3U6sZ5t+wtTokLIuY2wDjs+j4GpvpIEC8tfgZr8yyEVj9HYasKPyg9NNY0pvhIlbsS7JiR0JBEOePL75u92kfucoNK7EG27E6KV3KR7fv1K7rLWdgSOEY0LsJEw4fha4n/nqWEQIPCN1iW3yxH5kPeVtSbCMbofK6BQfxvHrQfmjK6O/gzahSrETSFIQU4bVktuTRi9EysSkoLb76PlKDGtE3EX1Nmx0I6jfwf72t3J1w/wpuKCds4s43ks4aiIh2+JmGKbORjeQJK9rEp4EqC7a34k8jHDDQnBSJE72TIyIwrkGqZK7dAsYu44+wJ2yaT20CYpg5MMDscoRmkEUiNVvhdYe0g4JtcRC7budiq+iTkI5tWTIj823FTDduR+YT6odTLRoIn5cSD6IG6oU6CB4OSElfHdws1GAQsaUH/Byxl7aUf5WTF+Qazet3qk5z1W56LuJT6AEuBpmSK7CiWOtarhbLrZX+g39lxUIVx9h0RhFSGF64MbAXX8zkJ1dzao8qjn+swNMpI3Ea35z9hHzN/ejv6Al9ewEyqRxPgJ3agIvdLsN7W6TXQNFM+HboyiysaEI5vCzu7hkC0z3EpyMZUXvLbCQUIMJRYtkieXjoXjZFvjNHlGQpTZuXUB1ISkZw/TFZRZfYUQENMT4LMG4gZvckihc9fKLgLhEKotFXeVhTBlU6RTnMyKoWxYFtz8wXaSjMxWfTlYMQQLsoUil4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56bab0a-666e-446e-538a-08d7f26d4b21
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 09:59:12.7174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcuO3P4Y0bv4IN7iZ534p9YE2bHBLPg2+CW3QbFVucfqfommP8meo+N+/o6R9KL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3666
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
Cc: alexander.deucher@amd.com, Kevin Wang <kevin1.wang@amd.com>,
 kenneth.feng@amd.com, monk.liu@amd.com, hawking.zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

unified amdgpu device attribute node functions:
1. add some helper functions to create amdgpu device attribute node.
2. create device node according to device attr flags on different VF mode.
3. rename some functions name to adapt a new interface.

v2:
1. remove ATTR_STATE_DEAD, ATTR_STATE_ALIVE enum.
2. rename callback function perform to attr_update.
3. modify some variable names

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 494 +++++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h |  46 +++
 2 files changed, 262 insertions(+), 278 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index c762deb5abc7..b75362bf0742 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -154,9 +154,9 @@ int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum amd_pp_sensors senso
  *
  */
 
-static ssize_t amdgpu_get_dpm_state(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -189,10 +189,10 @@ static ssize_t amdgpu_get_dpm_state(struct device *dev,
 			(pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
 }
 
-static ssize_t amdgpu_set_dpm_state(struct device *dev,
-				    struct device_attribute *attr,
-				    const char *buf,
-				    size_t count)
+static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf,
+					  size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -294,9 +294,9 @@ static ssize_t amdgpu_set_dpm_state(struct device *dev,
  *
  */
 
-static ssize_t amdgpu_get_dpm_forced_performance_level(struct device *dev,
-						struct device_attribute *attr,
-								char *buf)
+static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
+							    struct device_attribute *attr,
+							    char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -332,10 +332,10 @@ static ssize_t amdgpu_get_dpm_forced_performance_level(struct device *dev,
 			"unknown");
 }
 
-static ssize_t amdgpu_set_dpm_forced_performance_level(struct device *dev,
-						       struct device_attribute *attr,
-						       const char *buf,
-						       size_t count)
+static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
+							    struct device_attribute *attr,
+							    const char *buf,
+							    size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -873,10 +873,10 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
  * the corresponding bit from original ppfeature masks and input the
  * new ppfeature masks.
  */
-static ssize_t amdgpu_set_pp_feature_status(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf,
-		size_t count)
+static ssize_t amdgpu_set_pp_features(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t count)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -917,9 +917,9 @@ static ssize_t amdgpu_set_pp_feature_status(struct device *dev,
 	return count;
 }
 
-static ssize_t amdgpu_get_pp_feature_status(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
+static ssize_t amdgpu_get_pp_features(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -1663,9 +1663,9 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
  * The SMU firmware computes a percentage of load based on the
  * aggregate activity level in the IP cores.
  */
-static ssize_t amdgpu_get_busy_percent(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
+static ssize_t amdgpu_get_gpu_busy_percent(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -1699,9 +1699,9 @@ static ssize_t amdgpu_get_busy_percent(struct device *dev,
  * The SMU firmware computes a percentage of load based on the
  * aggregate activity level in the IP cores.
  */
-static ssize_t amdgpu_get_memory_busy_percent(struct device *dev,
-		struct device_attribute *attr,
-		char *buf)
+static ssize_t amdgpu_get_mem_busy_percent(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
@@ -1790,57 +1790,174 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 	return 0;
 }
 
-static DEVICE_ATTR(power_dpm_state, S_IRUGO | S_IWUSR, amdgpu_get_dpm_state, amdgpu_set_dpm_state);
-static DEVICE_ATTR(power_dpm_force_performance_level, S_IRUGO | S_IWUSR,
-		   amdgpu_get_dpm_forced_performance_level,
-		   amdgpu_set_dpm_forced_performance_level);
-static DEVICE_ATTR(pp_num_states, S_IRUGO, amdgpu_get_pp_num_states, NULL);
-static DEVICE_ATTR(pp_cur_state, S_IRUGO, amdgpu_get_pp_cur_state, NULL);
-static DEVICE_ATTR(pp_force_state, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_force_state,
-		amdgpu_set_pp_force_state);
-static DEVICE_ATTR(pp_table, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_table,
-		amdgpu_set_pp_table);
-static DEVICE_ATTR(pp_dpm_sclk, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_sclk,
-		amdgpu_set_pp_dpm_sclk);
-static DEVICE_ATTR(pp_dpm_mclk, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_mclk,
-		amdgpu_set_pp_dpm_mclk);
-static DEVICE_ATTR(pp_dpm_socclk, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_socclk,
-		amdgpu_set_pp_dpm_socclk);
-static DEVICE_ATTR(pp_dpm_fclk, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_fclk,
-		amdgpu_set_pp_dpm_fclk);
-static DEVICE_ATTR(pp_dpm_dcefclk, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_dcefclk,
-		amdgpu_set_pp_dpm_dcefclk);
-static DEVICE_ATTR(pp_dpm_pcie, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_dpm_pcie,
-		amdgpu_set_pp_dpm_pcie);
-static DEVICE_ATTR(pp_sclk_od, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_sclk_od,
-		amdgpu_set_pp_sclk_od);
-static DEVICE_ATTR(pp_mclk_od, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_mclk_od,
-		amdgpu_set_pp_mclk_od);
-static DEVICE_ATTR(pp_power_profile_mode, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_power_profile_mode,
-		amdgpu_set_pp_power_profile_mode);
-static DEVICE_ATTR(pp_od_clk_voltage, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_od_clk_voltage,
-		amdgpu_set_pp_od_clk_voltage);
-static DEVICE_ATTR(gpu_busy_percent, S_IRUGO,
-		amdgpu_get_busy_percent, NULL);
-static DEVICE_ATTR(mem_busy_percent, S_IRUGO,
-		amdgpu_get_memory_busy_percent, NULL);
-static DEVICE_ATTR(pcie_bw, S_IRUGO, amdgpu_get_pcie_bw, NULL);
-static DEVICE_ATTR(pp_features, S_IRUGO | S_IWUSR,
-		amdgpu_get_pp_feature_status,
-		amdgpu_set_pp_feature_status);
-static DEVICE_ATTR(unique_id, S_IRUGO, amdgpu_get_unique_id, NULL);
+static struct amdgpu_device_attr amdgpu_device_attrs[] = {
+	AMDGPU_DEVICE_ATTR_RW(power_dpm_state,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RW(power_dpm_force_performance_level,	ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RO(pp_num_states,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RO(pp_cur_state,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_force_state,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_table,					ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_sclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_mclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_socclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_fclk,				ATTR_FLAG_BASIC|ATTR_FLAG_ONEVF),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_dcefclk,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_dpm_pcie,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_sclk_od,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_mclk_od,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_power_profile_mode,			ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_od_clk_voltage,			ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RO(gpu_busy_percent,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RO(mem_busy_percent,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RO(pcie_bw,					ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RW(pp_features,				ATTR_FLAG_BASIC),
+	AMDGPU_DEVICE_ATTR_RO(unique_id,				ATTR_FLAG_BASIC),
+};
+
+static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_attr *attr,
+			       uint32_t mask)
+{
+	struct device_attribute *dev_attr = &attr->dev_attr;
+	const char *attr_name = dev_attr->attr.name;
+	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
+	enum amd_asic_type asic_type = adev->asic_type;
+
+	if (!(attr->flags & mask)) {
+		attr->states = ATTR_STATE_UNSUPPORTED;
+		return 0;
+	}
+
+#define DEVICE_ATTR_IS(_name)	(!strcmp(attr_name, #_name))
+
+	if (DEVICE_ATTR_IS(pp_dpm_socclk)) {
+		if (asic_type <= CHIP_VEGA10)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pp_dpm_dcefclk)) {
+		if (asic_type <= CHIP_VEGA10 || asic_type == CHIP_ARCTURUS)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pp_dpm_fclk)) {
+		if (asic_type < CHIP_VEGA20)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pp_dpm_pcie)) {
+		if (asic_type == CHIP_ARCTURUS)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pp_od_clk_voltage)) {
+		attr->states = ATTR_STATE_UNSUPPORTED;
+		if ((is_support_sw_smu(adev) && adev->smu.od_enabled) ||
+		    (!is_support_sw_smu(adev) && hwmgr->od_enabled))
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(mem_busy_percent)) {
+		if (adev->flags & AMD_IS_APU || asic_type == CHIP_VEGA10)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pcie_bw)) {
+		/* PCIe Perf counters won't work on APU nodes */
+		if (adev->flags & AMD_IS_APU)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(unique_id)) {
+		if (!adev->unique_id)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	} else if (DEVICE_ATTR_IS(pp_features)) {
+		if (adev->flags & AMD_IS_APU || asic_type <= CHIP_VEGA10)
+			attr->states = ATTR_STATE_UNSUPPORTED;
+	}
+
+	if (asic_type == CHIP_ARCTURUS) {
+		/* Arcturus does not support standalone mclk/socclk/fclk level setting */
+		if (DEVICE_ATTR_IS(pp_dpm_mclk) ||
+		    DEVICE_ATTR_IS(pp_dpm_socclk) ||
+		    DEVICE_ATTR_IS(pp_dpm_fclk)) {
+			dev_attr->attr.mode &= ~S_IWUGO;
+			dev_attr->store = NULL;
+		}
+	}
+
+#undef DEVICE_ATTR_IS
+
+	return 0;
+}
+
+
+static int amdgpu_device_attr_create(struct amdgpu_device *adev,
+				     struct amdgpu_device_attr *attr,
+				     uint32_t mask)
+{
+	int ret = 0;
+	struct device_attribute *dev_attr = &attr->dev_attr;
+	const char *name = dev_attr->attr.name;
+	int (*attr_update)(struct amdgpu_device *adev, struct amdgpu_device_attr *attr,
+			   uint32_t mask) = default_attr_update;
+
+	BUG_ON(!attr);
+
+	attr_update = attr->attr_update ? attr_update : default_attr_update;
+
+	ret = attr_update(adev, attr, mask);
+	if (ret) {
+		dev_err(adev->dev, "failed to update device file %s, ret = %d\n",
+			name, ret);
+		return ret;
+	}
+
+	/* the attr->states maybe changed after call attr->attr_update function */
+	if (attr->states == ATTR_STATE_UNSUPPORTED)
+		return 0;
+
+	ret = device_create_file(adev->dev, dev_attr);
+	if (ret) {
+		dev_err(adev->dev, "failed to create device file %s, ret = %d\n",
+			name, ret);
+	}
+
+	attr->states = ATTR_STATE_SUPPORTED;
+
+	return ret;
+}
+
+static void amdgpu_device_attr_remove(struct amdgpu_device *adev, struct amdgpu_device_attr *attr)
+{
+	struct device_attribute *dev_attr = &attr->dev_attr;
+
+	if (attr->states == ATTR_STATE_UNSUPPORTED)
+		return;
+
+	device_remove_file(adev->dev, dev_attr);
+
+	attr->states = ATTR_STATE_UNSUPPORTED;
+}
+
+static int amdgpu_device_attr_create_groups(struct amdgpu_device *adev,
+					    struct amdgpu_device_attr *attrs,
+					    uint32_t counts,
+					    uint32_t mask)
+{
+	int ret = 0;
+	uint32_t i = 0;
+
+	for (i = 0; i < counts; i++) {
+		ret = amdgpu_device_attr_create(adev, &attrs[i], mask);
+		if (ret)
+			goto failed;
+	}
+
+	return 0;
+
+failed:
+	for (; i > 0; i--) {
+		amdgpu_device_attr_remove(adev, &attrs[i]);
+	}
+
+	return ret;
+}
+
+static void amdgpu_device_attr_remove_groups(struct amdgpu_device *adev,
+					     struct amdgpu_device_attr *attrs,
+					     uint32_t counts)
+{
+	uint32_t i = 0;
+
+	for (i = 0; i < counts; i++)
+		amdgpu_device_attr_remove(adev, &attrs[i]);
+}
 
 static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
 				      struct device_attribute *attr,
@@ -3241,8 +3358,8 @@ int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev, uint32_t *smu_versio
 
 int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)
 {
-	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
 	int ret;
+	uint32_t mask = 0;
 
 	if (adev->pm.sysfs_initialized)
 		return 0;
@@ -3260,168 +3377,25 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)
 		return ret;
 	}
 
-	ret = device_create_file(adev->dev, &dev_attr_power_dpm_state);
-	if (ret) {
-		DRM_ERROR("failed to create device file for dpm state\n");
-		return ret;
-	}
-	ret = device_create_file(adev->dev, &dev_attr_power_dpm_force_performance_level);
-	if (ret) {
-		DRM_ERROR("failed to create device file for dpm state\n");
-		return ret;
-	}
-
-	if (!amdgpu_sriov_vf(adev)) {
-		ret = device_create_file(adev->dev, &dev_attr_pp_num_states);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_num_states\n");
-			return ret;
-		}
-		ret = device_create_file(adev->dev, &dev_attr_pp_cur_state);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_cur_state\n");
-			return ret;
-		}
-		ret = device_create_file(adev->dev, &dev_attr_pp_force_state);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_force_state\n");
-			return ret;
-		}
-		ret = device_create_file(adev->dev, &dev_attr_pp_table);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_table\n");
-			return ret;
-		}
-	}
-
-	ret = device_create_file(adev->dev, &dev_attr_pp_dpm_sclk);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_dpm_sclk\n");
-		return ret;
-	}
-
-	/* Arcturus does not support standalone mclk/socclk/fclk level setting */
-	if (adev->asic_type == CHIP_ARCTURUS) {
-		dev_attr_pp_dpm_mclk.attr.mode &= ~S_IWUGO;
-		dev_attr_pp_dpm_mclk.store = NULL;
-
-		dev_attr_pp_dpm_socclk.attr.mode &= ~S_IWUGO;
-		dev_attr_pp_dpm_socclk.store = NULL;
-
-		dev_attr_pp_dpm_fclk.attr.mode &= ~S_IWUGO;
-		dev_attr_pp_dpm_fclk.store = NULL;
-	}
-
-	ret = device_create_file(adev->dev, &dev_attr_pp_dpm_mclk);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_dpm_mclk\n");
-		return ret;
-	}
-	if (adev->asic_type >= CHIP_VEGA10) {
-		ret = device_create_file(adev->dev, &dev_attr_pp_dpm_socclk);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_dpm_socclk\n");
-			return ret;
-		}
-		if (adev->asic_type != CHIP_ARCTURUS) {
-			ret = device_create_file(adev->dev, &dev_attr_pp_dpm_dcefclk);
-			if (ret) {
-				DRM_ERROR("failed to create device file pp_dpm_dcefclk\n");
-				return ret;
-			}
-		}
-	}
-	if (adev->asic_type >= CHIP_VEGA20) {
-		ret = device_create_file(adev->dev, &dev_attr_pp_dpm_fclk);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_dpm_fclk\n");
-			return ret;
-		}
-	}
-
-	/* the reset are not needed for SRIOV one vf mode */
-	if (amdgpu_sriov_vf(adev)) {
-		adev->pm.sysfs_initialized = true;
-		return ret;
+	switch (amdgpu_virt_get_sriov_vf_mode(adev)) {
+	case SRIOV_VF_MODE_ONE_VF:
+		mask = ATTR_FLAG_ONEVF;
+		break;
+	case SRIOV_VF_MODE_MULTI_VF:
+		mask = 0;
+		break;
+	case SRIOV_VF_MODE_BARE_METAL:
+	default:
+		mask = ATTR_FLAG_MASK_ALL;
+		break;
 	}
 
-	if (adev->asic_type != CHIP_ARCTURUS) {
-		ret = device_create_file(adev->dev, &dev_attr_pp_dpm_pcie);
-		if (ret) {
-			DRM_ERROR("failed to create device file pp_dpm_pcie\n");
-			return ret;
-		}
-	}
-	ret = device_create_file(adev->dev, &dev_attr_pp_sclk_od);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_sclk_od\n");
-		return ret;
-	}
-	ret = device_create_file(adev->dev, &dev_attr_pp_mclk_od);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_mclk_od\n");
-		return ret;
-	}
-	ret = device_create_file(adev->dev,
-			&dev_attr_pp_power_profile_mode);
-	if (ret) {
-		DRM_ERROR("failed to create device file	"
-				"pp_power_profile_mode\n");
-		return ret;
-	}
-	if ((is_support_sw_smu(adev) && adev->smu.od_enabled) ||
-	    (!is_support_sw_smu(adev) && hwmgr->od_enabled)) {
-		ret = device_create_file(adev->dev,
-				&dev_attr_pp_od_clk_voltage);
-		if (ret) {
-			DRM_ERROR("failed to create device file	"
-					"pp_od_clk_voltage\n");
-			return ret;
-		}
-	}
-	ret = device_create_file(adev->dev,
-			&dev_attr_gpu_busy_percent);
-	if (ret) {
-		DRM_ERROR("failed to create device file	"
-				"gpu_busy_level\n");
-		return ret;
-	}
-	/* APU does not have its own dedicated memory */
-	if (!(adev->flags & AMD_IS_APU) &&
-	     (adev->asic_type != CHIP_VEGA10)) {
-		ret = device_create_file(adev->dev,
-				&dev_attr_mem_busy_percent);
-		if (ret) {
-			DRM_ERROR("failed to create device file	"
-					"mem_busy_percent\n");
-			return ret;
-		}
-	}
-	/* PCIe Perf counters won't work on APU nodes */
-	if (!(adev->flags & AMD_IS_APU)) {
-		ret = device_create_file(adev->dev, &dev_attr_pcie_bw);
-		if (ret) {
-			DRM_ERROR("failed to create device file pcie_bw\n");
-			return ret;
-		}
-	}
-	if (adev->unique_id)
-		ret = device_create_file(adev->dev, &dev_attr_unique_id);
-	if (ret) {
-		DRM_ERROR("failed to create device file unique_id\n");
+	ret = amdgpu_device_attr_create_groups(adev,
+					       amdgpu_device_attrs,
+					       ARRAY_SIZE(amdgpu_device_attrs),
+					       mask);
+	if (ret)
 		return ret;
-	}
-
-	if ((adev->asic_type >= CHIP_VEGA10) &&
-	    !(adev->flags & AMD_IS_APU)) {
-		ret = device_create_file(adev->dev,
-				&dev_attr_pp_features);
-		if (ret) {
-			DRM_ERROR("failed to create device file	"
-					"pp_features\n");
-			return ret;
-		}
-	}
 
 	adev->pm.sysfs_initialized = true;
 
@@ -3430,51 +3404,15 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)
 
 void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev)
 {
-	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
-
 	if (adev->pm.dpm_enabled == 0)
 		return;
 
 	if (adev->pm.int_hwmon_dev)
 		hwmon_device_unregister(adev->pm.int_hwmon_dev);
-	device_remove_file(adev->dev, &dev_attr_power_dpm_state);
-	device_remove_file(adev->dev, &dev_attr_power_dpm_force_performance_level);
-
-	device_remove_file(adev->dev, &dev_attr_pp_num_states);
-	device_remove_file(adev->dev, &dev_attr_pp_cur_state);
-	device_remove_file(adev->dev, &dev_attr_pp_force_state);
-	device_remove_file(adev->dev, &dev_attr_pp_table);
-
-	device_remove_file(adev->dev, &dev_attr_pp_dpm_sclk);
-	device_remove_file(adev->dev, &dev_attr_pp_dpm_mclk);
-	if (adev->asic_type >= CHIP_VEGA10) {
-		device_remove_file(adev->dev, &dev_attr_pp_dpm_socclk);
-		if (adev->asic_type != CHIP_ARCTURUS)
-			device_remove_file(adev->dev, &dev_attr_pp_dpm_dcefclk);
-	}
-	if (adev->asic_type != CHIP_ARCTURUS)
-		device_remove_file(adev->dev, &dev_attr_pp_dpm_pcie);
-	if (adev->asic_type >= CHIP_VEGA20)
-		device_remove_file(adev->dev, &dev_attr_pp_dpm_fclk);
-	device_remove_file(adev->dev, &dev_attr_pp_sclk_od);
-	device_remove_file(adev->dev, &dev_attr_pp_mclk_od);
-	device_remove_file(adev->dev,
-			&dev_attr_pp_power_profile_mode);
-	if ((is_support_sw_smu(adev) && adev->smu.od_enabled) ||
-	    (!is_support_sw_smu(adev) && hwmgr->od_enabled))
-		device_remove_file(adev->dev,
-				&dev_attr_pp_od_clk_voltage);
-	device_remove_file(adev->dev, &dev_attr_gpu_busy_percent);
-	if (!(adev->flags & AMD_IS_APU) &&
-	     (adev->asic_type != CHIP_VEGA10))
-		device_remove_file(adev->dev, &dev_attr_mem_busy_percent);
-	if (!(adev->flags & AMD_IS_APU))
-		device_remove_file(adev->dev, &dev_attr_pcie_bw);
-	if (adev->unique_id)
-		device_remove_file(adev->dev, &dev_attr_unique_id);
-	if ((adev->asic_type >= CHIP_VEGA10) &&
-	    !(adev->flags & AMD_IS_APU))
-		device_remove_file(adev->dev, &dev_attr_pp_features);
+
+	amdgpu_device_attr_remove_groups(adev,
+					 amdgpu_device_attrs,
+					 ARRAY_SIZE(amdgpu_device_attrs));
 }
 
 void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h
index 5db0ef86e84c..48e8086baf33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.h
@@ -30,6 +30,52 @@ struct cg_flag_name
 	const char *name;
 };
 
+enum amdgpu_device_attr_flags {
+	ATTR_FLAG_BASIC = (1 << 0),
+	ATTR_FLAG_ONEVF = (1 << 16),
+};
+
+#define ATTR_FLAG_TYPE_MASK	(0x0000ffff)
+#define ATTR_FLAG_MODE_MASK	(0xffff0000)
+#define ATTR_FLAG_MASK_ALL	(0xffffffff)
+
+enum amdgpu_device_attr_states {
+	ATTR_STATE_UNSUPPORTED = 0,
+	ATTR_STATE_SUPPORTED,
+};
+
+struct amdgpu_device_attr {
+	struct device_attribute dev_attr;
+	enum amdgpu_device_attr_flags flags;
+	enum amdgpu_device_attr_states states;
+	int (*attr_update)(struct amdgpu_device *adev,
+			   struct amdgpu_device_attr* attr,
+			   uint32_t mask);
+};
+
+#define to_amdgpu_device_attr(_dev_attr) \
+	container_of(_dev_attr, struct amdgpu_device_attr, dev_attr)
+
+#define __AMDGPU_DEVICE_ATTR(_name, _mode, _show, _store, _flags, ...)	\
+	{ .dev_attr = __ATTR(_name, _mode, _show, _store),		\
+	  .flags = _flags,						\
+	  .states = ATTR_STATE_SUPPORTED,					\
+	  ##__VA_ARGS__, }
+
+#define AMDGPU_DEVICE_ATTR(_name, _mode, _flags, ...)			\
+	__AMDGPU_DEVICE_ATTR(_name, _mode,				\
+			     amdgpu_get_##_name, amdgpu_set_##_name,	\
+			     _flags, ##__VA_ARGS__)
+
+#define AMDGPU_DEVICE_ATTR_RW(_name, _flags, ...)			\
+	AMDGPU_DEVICE_ATTR(_name, S_IRUGO | S_IWUSR,			\
+			   _flags, ##__VA_ARGS__)
+
+#define AMDGPU_DEVICE_ATTR_RO(_name, _flags, ...)			\
+	__AMDGPU_DEVICE_ATTR(_name, S_IRUGO,				\
+			     amdgpu_get_##_name, NULL,			\
+			     _flags, ##__VA_ARGS__)
+
 void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev);
 int amdgpu_pm_sysfs_init(struct amdgpu_device *adev);
 int amdgpu_pm_virt_sysfs_init(struct amdgpu_device *adev);
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
