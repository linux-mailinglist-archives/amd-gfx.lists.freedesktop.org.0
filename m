Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74336CDD9
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Apr 2021 23:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB296E9CB;
	Tue, 27 Apr 2021 21:29:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10166E9CB;
 Tue, 27 Apr 2021 21:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPKelPRx2Eh71dLwMx1SoKKbhuKB3O9cJXbf1lbTOvRrU54FtvYaazZ1Gbz5DrD6ux5xFbSnohp3llJl+SAb+3pNbIMt8ya3OLDYIkB1tObCL1yXbml6vzxS3UKAw1PYroS3DYxAtp4TrO80KFUp6znqbLnMr7kQzNsW+uPIWEKV/eOA4+PuDCMT7RSDzH80kq4beT1Vw1rgojqylMtOqCxlJdS4G4UWLGgrfrbNrAfYLLWhToJnoGxvckxc3VGAb8MPbYGb4R3u29DgbBUvY+lnZj86Jf14wJYFMn28WRlBBgTqFqR1V1BiktAe7G7PZn2OOuWH4UOGH/VkQCUvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrq8rapwjE0PaLKgynLPtlkhW6ngNBvYFEYmX00DPW0=;
 b=csI36/DzvqrcV0leEBj3HI+aGvSxFTCc5jsqgSs9maPuVR5U9NEJLAE31M2h6RbRXoHKpyBdPlgayLGEa/lrogyLHXF73SZtUflz8dM6heJenjlA/CJ8Rs9NLhXmqRJkijmtWdM/nPhswsG+QY8btLE6dkL0hKn9q7TYSVfRSnEzcasffWjrA6zMrQssG7B1E3upT3kXShxfYWE3yKWiN//ZNj0NEQPFBPfx4U1FO653Y19k8KqRzP9XYsn0r0ziLEBN23u6KqB2rVmP9BLYlIi5xF6u3BlLROrur7rm6UG+4Q8bpDL+Y6zpwS1hj396QQa+gXSmX+9HiztOr9jJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrq8rapwjE0PaLKgynLPtlkhW6ngNBvYFEYmX00DPW0=;
 b=OK0g9oVh8NetjNoS2s5fsH8DsejYIQG1/HW+CSLcI40QRRJePHCTMjul3hd5+ZsbwHPkXVdGvdsLAcV4R8vj2MOT1p/95SPtUfotCW4hJFgO223LSJPrrPEs6fvq9kXzoFffUD3+Tw5g2ru9Vf/9dM78GDq6iKJ6KolMcNZfiUo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB2794.namprd12.prod.outlook.com (2603:10b6:5:48::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Tue, 27 Apr 2021 21:29:13 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Tue, 27 Apr 2021
 21:29:13 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/drm_mst: Use Extended Base Receiver Capability DPCD space
Date: Tue, 27 Apr 2021 17:28:50 -0400
Message-Id: <20210427212850.35267-1-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Tue, 27 Apr 2021 21:29:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07a6b554-cd79-4e03-d5b2-08d909c38090
X-MS-TrafficTypeDiagnostic: DM6PR12MB2794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB27947EA20CF21C09CED52386EE419@DM6PR12MB2794.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TqTPoppLjcb/zVqYJ8yuzCFH1qgw1tfSCy0MhUW5AzHdNyYonkQR4J8CS0vc0h6NNn+1HeqdkjDPwLncY2LCj96NShqsXhq1r0Z6GbuLrBPYAKjnci0q1n/3ZwOgbv9AVZHSvY6lHMkpMGzgIyXBU86Z45BgoWfk1CTMJ12CfYR5AMrGQd0tInHfc+MOX63aRCDAVty6umflX/XzsAFY8FpMaxRZ1tnzZlqKYT6K35SW2qElofeFnpNenRLBi+1IvvVmV9YEbnQWQwifJcQ0ya70YAbmiofv3oJ1onGVaErg+cdr/pp1s+97x3QZ1grzGDXcD+1wkPmQ4nwrVBnsdKt3VOprXNtCGQ/qLDmkR60389NOfEIt6iF8xlrTTr/DXQsr7NiwJuDu0rHOVjd2S4UIhLx3UPcLTGGlQLfOlvyOZgX1aOLrgpb+6NT/A/DmBtP9IHkeDFsUhIgRXIRvD+XvqAoYq7iAiPsgNZQ43FatnB5J/19yzgJkYckdsDn3e86lcG/iAeN4JXhWeTiOvRH+EGe8f3LvmClx5d7N4I/ohYgoMxWH1geRvy2G450d+GhdL1N+BTS3hc0Xui7vGgr5V+G1yn4OH++1yBfI/XY3s9DmY8NyPK99S6cMmyNYnYYDnyM1YQhz6SSAcB4mCpm7QXhMrppXFo6Joe+GOiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(52116002)(44832011)(8936002)(83380400001)(6666004)(38350700002)(26005)(38100700002)(66476007)(66556008)(6486002)(4326008)(66946007)(86362001)(16526019)(6512007)(316002)(956004)(36756003)(2616005)(6916009)(30864003)(1076003)(6506007)(186003)(8676002)(478600001)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ybOErA0jklDfjsb90tL7xht7Ye4zXx/sIWBr29DDYn3a/nlAHTUUNYhsDI7o?=
 =?us-ascii?Q?/M1iTULerjg+mLMQhdsObggspulDCkmcLq9m0Ku+TBW0xJbnnmJY4ja9DdKo?=
 =?us-ascii?Q?iAPEYIE1vCIbW1BneybEaDL26sRrTcGGJe62bh8zpwERC7KYzNhx4h+SxXCZ?=
 =?us-ascii?Q?CnDuiF49q+ciyLCf2AkqZ4GKmjoYouysaAP6SxaPK45/3explslfQ1V4mbKa?=
 =?us-ascii?Q?O/MKyNBay2DzJeId1zoYHy5nSqD7omHboS4bjydrNJpJZas6ZwltaS9LeMMI?=
 =?us-ascii?Q?+5wWWh/G9j8tTmFSGDWU+vXQFT1ARX0jIvb6ZFEmB/TO3egJPv3LjuC7kxuL?=
 =?us-ascii?Q?hR04z9p1Gwkrex6RMeZkgGw5+/5q+hMCt60chv9nu5Xtyi3x96iU388Wjxfb?=
 =?us-ascii?Q?AWYxgIjmErPkrmJaRyG1XDRnCex3boVlgVomhYbN+8DlR25px0vMSXO69NkB?=
 =?us-ascii?Q?2WVc1b0sDfPBtD7go48Yk3rPe9pYH7jPiVcYZaRCMWJEUWeprAx8VPl4quna?=
 =?us-ascii?Q?12Op8ytH6adQFcn4MfZV6BJabg9lztLKvbK5nPwwfCo6H6gsTmBPP5+LNOUM?=
 =?us-ascii?Q?hXHQJhVoqhZ+FRm6whv4dhV8mINHgPFhqpCtDFCjXt4xJKzBrNww5Iy7osp+?=
 =?us-ascii?Q?48Ibm5Wzgkhis4mZ3upn3qwAyOVCMns/jtcUk5UkG3ZXHJ8GQ2HGrdBCis1O?=
 =?us-ascii?Q?godlhkFLZKXszvU0AQi69W3/Dbl2Jv1Z3FpSoBtUIBtkReXbaLph4YEaoQ1O?=
 =?us-ascii?Q?gJN3HSOCZaMdU/Jx+zzXlH4RGMSaU+fXNGDOnLhxgWtlM1Qz8Jxwq/Ul0oI+?=
 =?us-ascii?Q?/ujbl5fk5y/cj35GCnc5PlahUzt99XInU7KQOPEES0eAoFyWW+CDz8HSLGnd?=
 =?us-ascii?Q?7PIMputsZQffsuQBNwwLIJDd7AXva3wrWx30Pu87+oP2UWD1T9cGc6PC3Zgx?=
 =?us-ascii?Q?97Eun1ITLXVOlkVoQeYzZcUx6NO5zNT0Q8HYUa/6EIdGx5ohLFC/Sk3BFEBB?=
 =?us-ascii?Q?4vHbFJEvEfC55im0ea5OAyvC6Tjf2qr8X98YFUAvU6/GxP8z+C52V11pGufT?=
 =?us-ascii?Q?cYayv7oIJSPxFf18U+D8EBRVjmrXY3f3hh/xbTMzcCr7k/i15L/VPboNpzWI?=
 =?us-ascii?Q?U76Y3HDzSdQYUcqA9VuS5itwT1moO53gPe8fzmtjvIxS/OiuCQoKPQJkxN+I?=
 =?us-ascii?Q?8MVfwUl1uDi5JHR1vxGhW/lL5ujmLruGnC8z2pPJ6EEPwswdIzmVz2nypES7?=
 =?us-ascii?Q?sUFoDGZfqQKsRwEs1o4MQWkB/C/thkcCqSlM1CtlFP0bFCakgzhJXxdn9Owe?=
 =?us-ascii?Q?VkQgb9G35247Y1Q/uc3d1hGS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a6b554-cd79-4e03-d5b2-08d909c38090
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 21:29:13.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uVBWVapL3LG+h6QRxzVTlCAOS95mtMnvUWQxCABXEEZP7SvAPikydj7N4IW/TaK39vfy4zs+xP0ItdvzWDq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2794
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
Cc: intel-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 koba.ko@canonical.com, aurabindo.pillai@amd.com, mikita.lipski@amd.com,
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[why]
DP 1.4a spec madates that if DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is
set, Extended Base Receiver Capability DPCD space must be used. Without
doing that, the three DPCD values that differ will be wrong, leading to
incorrect or limited functionality. MST link rate, for example, could
have a lower value or Synaptics quirk wouldn't work out well when
Extended DPCD was not read, resulting in no DSC for such hubs.

[how]
Modify MST topology manager to use the values from Extended DPCD where
applicable.

To prevent regression on the sources that have lower maximum link rate
capability than MAX_LINK_RATE from Extended DPCD, have the drivers
supply maximum lane count and rate at initialization time.

This also reverts the 2dcab875e763 (Revert "drm/dp_mst: Retrieve
extended DPCD caps for topology manager), brining the change back to the
original commit ad44c03208e4 (drm/dp_mst: Retrieve extended DPCD caps
for topology manager).

Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 17 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 33 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  3 ++
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 8 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index d62460b69d95..d038e3185afb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -437,6 +437,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector,
 				       int link_index)
 {
+	struct dc_link_settings max_link_enc_cap = {0};
+
 	aconnector->dm_dp_aux.aux.name =
 		kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
 			  link_index);
@@ -450,6 +452,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
 		return;
 
+	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
 	drm_dp_mst_topology_mgr_init(
 		&aconnector->mst_mgr,
@@ -457,6 +460,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 		&aconnector->dm_dp_aux.aux,
 		16,
 		4,
+		max_link_enc_cap.lane_count,
+		max_link_enc_cap.link_rate,
 		aconnector->connector_id);
 
 	drm_connector_attach_dp_subconnector_property(&aconnector->base);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 3ff3d9e90983..18a0b84e9869 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1893,6 +1893,23 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
 	return true;
 }
 
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
+{
+	if (max_link_enc_cap == NULL) {
+		DC_LOG_ERROR("%s: Could not return max link encoder caps", __func__);
+	}
+
+	if (link->link_enc->funcs->get_max_link_cap) {
+		link->link_enc->funcs->get_max_link_cap(link->link_enc, max_link_enc_cap);
+		return true;
+	}
+
+	DC_LOG_ERROR("%s: Max link encoder caps unknown", __func__);
+	max_link_enc_cap->lane_count = 1;
+	max_link_enc_cap->link_rate = 6;
+	return false;
+}
+
 static struct dc_link_settings get_max_link_cap(struct dc_link *link)
 {
 	struct dc_link_settings max_link_cap = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 054bab45ee17..fc5622ffec3d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -345,6 +345,8 @@ bool dc_link_dp_set_test_pattern(
 	const unsigned char *p_custom_pattern,
 	unsigned int cust_pattern_size);
 
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap);
+
 void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
 
 bool dc_link_is_dp_sink_present(struct dc_link *link);
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index de5124ce42cb..36e4155f048c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3693,18 +3693,23 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 	/* set the device into MST mode */
 	if (mst_state) {
 		struct drm_dp_payload reset_pay;
+		int lane_count;
+		int link_rate;
 
 		WARN_ON(mgr->mst_primary);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
-			DRM_DEBUG_KMS("failed to read DPCD\n");
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
+				    mgr->aux->name, ret);
 			goto out_unlock;
 		}
 
-		mgr->pbn_div = drm_dp_get_vc_payload_bw(drm_dp_bw_code_to_link_rate(mgr->dpcd[1]),
-							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
+		lane_count = min((int)(mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK), mgr->max_lane_count);
+		link_rate = min((int)mgr->dpcd[1], mgr->max_link_rate);
+		mgr->pbn_div = drm_dp_get_vc_payload_bw(drm_dp_bw_code_to_link_rate(link_rate),
+							lane_count);
 		if (mgr->pbn_div == 0) {
 			ret = -EINVAL;
 			goto out_unlock;
@@ -5432,14 +5437,17 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
  * @aux: DP helper aux channel to talk to this device
  * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
  * @max_payloads: maximum number of payloads this GPU can source
+ * @max_lane_count: maximum number of lanes this GPU supports
+ * @max_link_rate: maximum link rate this GPU supports, units as in DPCD
  * @conn_base_id: the connector object ID the MST device is connected to.
  *
  * Return 0 for success, or negative error code on failure
  */
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
-				 int max_dpcd_transaction_bytes,
-				 int max_payloads, int conn_base_id)
+				 int max_dpcd_transaction_bytes, int max_payloads,
+				 int max_lane_count, int max_link_rate,
+				 int conn_base_id)
 {
 	struct drm_dp_mst_topology_state *mst_state;
 
@@ -5474,6 +5482,8 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->aux = aux;
 	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
 	mgr->max_payloads = max_payloads;
+	mgr->max_lane_count = max_lane_count;
+	mgr->max_link_rate = max_link_rate;
 	mgr->conn_base_id = conn_base_id;
 	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
 	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
@@ -5880,14 +5890,13 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
 	    port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
 	    port->parent == port->mgr->mst_primary) {
-		u8 downstreamport;
+		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_dpcd_read(&port->aux, DP_DOWNSTREAMPORT_PRESENT,
-				     &downstreamport, 1) < 0)
+		if (drm_dp_read_dpcd_caps(port->mgr->aux, dpcd_ext) < 0)
 			return NULL;
 
-		if ((downstreamport & DP_DWN_STRM_PORT_PRESENT) &&
-		   ((downstreamport & DP_DWN_STRM_PORT_TYPE_MASK)
+		if ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
+		   ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
 		     != DP_DWN_STRM_PORT_TYPE_ANALOG))
 			return port->mgr->aux;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 8e316146b6d1..5edd06a4441a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -941,6 +941,7 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum port port = dig_port->base.port;
 	int ret;
+	int bios_max_link_rate;
 
 	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
 		return 0;
@@ -955,8 +956,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 
 	/* create encoders */
 	intel_dp_create_fake_mst_encoders(dig_port);
+	bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
-					   &intel_dp->aux, 16, 3, conn_base_id);
+					   &intel_dp->aux, 16, 3,
+					   dig_port->max_lanes,
+					   bios_max_link_rate/27000, conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 196612addfd6..54177d5fb352 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1617,7 +1617,8 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	mstm->mgr.cbs = &nv50_mstm;
 
 	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
-					   max_payloads, conn_base_id);
+					   max_payloads, outp->dcb->dpconf.link_nr,
+					   outp->dcb->dpconf.link_bw, conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 59cf1d288465..04a290db54fc 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -629,6 +629,7 @@ int
 radeon_dp_mst_init(struct radeon_connector *radeon_connector)
 {
 	struct drm_device *dev = radeon_connector->base.dev;
+	struct radeon_connector_atom_dig *dig_connector = radeon_connector->con_priv;
 
 	if (!radeon_connector->ddc_bus->has_aux)
 		return 0;
@@ -636,6 +637,8 @@ radeon_dp_mst_init(struct radeon_connector *radeon_connector)
 	radeon_connector->mst_mgr.cbs = &mst_cbs;
 	return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
 					    &radeon_connector->ddc_bus->aux, 16, 6,
+					    drm_dp_max_lane_count(dig_connector->dpcd),
+					    drm_dp_max_link_rate(dig_connector->dpcd),
 					    radeon_connector->base.base.id);
 }
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index bd1c39907b92..3cc70b77af12 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -593,6 +593,14 @@ struct drm_dp_mst_topology_mgr {
 	 * @max_payloads: maximum number of payloads the GPU can generate.
 	 */
 	int max_payloads;
+	/**
+	 * @max_lane_count: maximum number of lanes the GPU can drive.
+	 */
+	int max_lane_count;
+	/**
+	 * @max_link_rate: maximum link rate per lane GPU can output.
+	 */
+	int max_link_rate;
 	/**
 	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
 	 * to build the MST connector path value.
@@ -765,7 +773,9 @@ struct drm_dp_mst_topology_mgr {
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes,
-				 int max_payloads, int conn_base_id);
+				 int max_payloads,
+				 int max_lane_count, int max_link_rate,
+				 int conn_base_id);
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
