Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97898F785
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2024 22:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B75E10E916;
	Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ByCDOMws";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65BB10E90A;
 Thu,  3 Oct 2024 20:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycoGgKCqJKcEkgJ79ZyTa0T2dffkunmt0Nsa63mTQsdE27SeeuebKiXXc6IRhXjeaRNe5LIkHgaYJ4JoqC2m+Zl/okkemA/cPwCNrymKy/ai4wLuN977fy+njKqA7B1NJz5pjlR+9Y+Lkou/vPoIIx+pKgPrx1UZmKyEkuAyn5a0JOcMD4a0wUaYFh7KCtqM5nw/WqGYbSYTyWE1ujoLkY1INm46dMuocHfxKQIqp1KfyXyqJJCytrt32cprVfOwTQrhE0UaMkHir8t4GZShoj6mQ6ghtsM8j4SXM9KIWsAP9Nnoj3jHSjquK4ZMA2aZZSiZ1uLNMHF52VSawHrDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkgJvEuoQPSLN1VMGTdRHsb0qj/Wj91aA47NDzrVBs0=;
 b=cETgMqc4Gymr9akNLRSd/Bax6MLStCGiqMnFXhNR0XUMK9hTmt4WBoDA/jMz39Qhoaq9wxOrYpLJCF4f/patGMjJCI2jgb6A7OUI6TBXwgcya1mfSeeY/e7VORkK01SONVO76Ai2VDLHVMse/VcwTkgCuNhJOQyn0uZ4JaUkbcNIrn+0UJiSH6NwkhVhIJP1D5iQwQ9lnzPeRrBSD8f9JQYAkBDRM1u/I2io+DvKDb3jG/4J2krNKo/1ViUSvrAN/2pUy47Tja543ceNLUBgefv57HOfgpitokZl3AYN9nCvOS2RZLsiA1LHbnD9ew16V/YnEVVhuIV2Cd54ADDyBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkgJvEuoQPSLN1VMGTdRHsb0qj/Wj91aA47NDzrVBs0=;
 b=ByCDOMwskbJ1d8hwJmoMS9v7yS7hC1cr18eAdQsBZXn3hO5AClMF4Gmscvruv9aJ6VXiw4Aqlwv7l3bPz/5xzA0cpIJqZKJ8W1jIZ1KmhemWunCvD8v5C4eUlu+ZGMb5Gmka5g4h4pSAei9GwAeGgbDciJZSmg3Ie9rjnNEFGSE=
Received: from CH0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:610:cc::23)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 20:01:37 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::68) by CH0PR03CA0078.outlook.office365.com
 (2603:10b6:610:cc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 07/44] drm/colorop: Add 1D Curve subtype
Date: Thu, 3 Oct 2024 16:00:49 -0400
Message-ID: <20241003200129.1732122-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f56ec6-4aa2-4f24-cdc2-08dce3e630a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Leu/rNz/s+3mg+xxIQBLXR0A5JMHIiHydZ31AVrg7HPBn9PS4IyhMPfydaW6?=
 =?us-ascii?Q?yPcaK+i9IMhwyn4Y0p3EfUMCG6uw497L24MFVO+u8Qp3eFRZgZrZH5oNxsWS?=
 =?us-ascii?Q?YVcjXpRkEE0lMv1Hr8ICZkGAygqbcnVyOAyjq7CVIdpFd3KVrk8YkywdbP73?=
 =?us-ascii?Q?RENm6zNaAgcgjIUPXLqbBB2+hs7HqVeBgKoLPdFBELTlPT+smhJN29GttveI?=
 =?us-ascii?Q?d9JSPq9P+gGULUV5DxafNHD7H4Yt01d1Xhlg5id/HxW6RjMJPqiG+V3LMbU/?=
 =?us-ascii?Q?qlvQCJfzDBs/AA2gFAuv40/mam6kQg3DvNT6R04WaC1fNZK/VTHIAB30lINS?=
 =?us-ascii?Q?/HTtgZTOjW6Khh+F7fVu/cwFlfDpY1JrAByOYUviaSTUHrUigxTFhpaQ8Lw6?=
 =?us-ascii?Q?4MdGSkjhJxTetr4f1Dr2ZoQCDS2LnCtEsUmDriwcWVZaWJE5r+z/22Yl6qRg?=
 =?us-ascii?Q?FAVQnaLCJe1X6yJnBr0ucik8nvkiOTVT/cOPUkmskp8PJpSj2ZTN13kFhQtl?=
 =?us-ascii?Q?Ky7gWXOMHEq1egeshHqqCwPRIQuMxqVQLPSTwjKnbebb+BbXAytHJFOqWn6L?=
 =?us-ascii?Q?EzSPTpEyPgTFfaFLRNQRLTljDpQAlg7yvVPOyP6QS2bt1g/WjsGJPyFWKo+D?=
 =?us-ascii?Q?XDkFi0zKeohrMyRCXnSnQmgD20QY1PbgcvRwTZj0B5X2YM5aNMjU0StDuyOP?=
 =?us-ascii?Q?jwBVNL9YFhSUQ9NKp6Kd581GN7kMm0KWf0zXIbOMG3L3Ih0VXlg5QkeexnNZ?=
 =?us-ascii?Q?fM6R4MuETxicRr4x6a7KbdtigM1mnoVBS/lwKi53LkL/hTfg2F25iLDJuxL+?=
 =?us-ascii?Q?Sc6Gd0pQNJ7KCeqBXMMIrTmfkYSXbTBsh1+RZxnRclvWEkPGsQk2Q1HNO8YM?=
 =?us-ascii?Q?HR9lZEBBq4Hyp3BZangx57F5OXTEu1yVvo0nDtxwNZ0QsUeomDsMErY1pE97?=
 =?us-ascii?Q?ddPREZNzwtPDk9HACdOTmhejxDmsQtZ9tDDthflqo5pe2cG988lmB8PsS8Pd?=
 =?us-ascii?Q?72ZdCXa3V0HOus5oxhjSU1BHTHHX+r3KO5xn1FWVgN0RhAn8OMykbOG5nZtR?=
 =?us-ascii?Q?ntnii3CwlAzfD4Jfhq3UX8p9XiB//8FKmv+TJ6ynQKXHBVTYAI4TDGDolHeQ?=
 =?us-ascii?Q?M/OrgmvJ9dm1t5o2z2A6GcuWu8yomCjpO+MtqHDfOaBnlyMKXlhWLXVMSh4/?=
 =?us-ascii?Q?sT2LxE3cl3lPjuVz7rNeuBfk4I8FbAXFnp1/9F8Nkmot0srY1vwh377pX+za?=
 =?us-ascii?Q?cp9tXgo4J9Qaa2XugLXoTWvB6x65W1ggJW0vN+LcICdAH1jswOgYJJoBEUUS?=
 =?us-ascii?Q?j9Xo/rcgqzOan4f3d4PCL/b/Ijx0/yJk7WZDShf3AJJlgTnE6pxRJxRSZwgh?=
 =?us-ascii?Q?BgIi5Ta7LquHkSwG2iVrQANm6IYb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:37.6633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f56ec6-4aa2-4f24-cdc2-08dce3e630a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
---

v5:
 - Add drm_get_colorop_curve_1d_type_name in header
 - Add drm_colorop_init
 - Set default curve
 - Add kernel docs

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

 drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
 drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  60 +++++++++++++
 3 files changed, 207 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 59fc25b59100..9a5dbf0a1306 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,11 +648,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }

 static int
@@ -662,6 +668,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 79af42b349a0..98d22ac163e8 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -30,6 +30,123 @@

 #include "drm_crtc_internal.h"

+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+};
+
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+
+/* Init Helpers */
+
+static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	return ret;
+}
+
+/**
+ * drm_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -69,7 +186,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
+	u64 val;
+
 	colorop_state->colorop = colorop;
+
+	if (colorop->curve_1d_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,
+						&val);
+		colorop_state->curve_1d_type = val;
+	}
 }

 /**
@@ -113,3 +239,11 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)

 	return colorop_type_name[type];
 }
+
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 877e3054e46e..6b8722ea22c7 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -30,6 +30,39 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>

+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ *
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	 *
+	 * sRGB piece-wise electro-optical transfer function. Transfer
+	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
+	 * to H.273 TransferCharacteristics code point 13 with
+	 * MatrixCoefficients set to 0.
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -45,6 +78,13 @@ struct drm_colorop_state {
 	 * information.
 	 */

+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -121,6 +161,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };

 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -144,6 +192,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }

+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);

@@ -184,4 +235,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
  */
 const char *drm_get_colorop_type_name(enum drm_colorop_type type);

+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @type: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 #endif /* __DRM_COLOROP_H__ */
--
2.46.2

