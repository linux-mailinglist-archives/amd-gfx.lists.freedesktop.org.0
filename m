Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E65A6D965
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Mar 2025 12:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A3110E2F4;
	Mon, 24 Mar 2025 11:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dh3m7V/F";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBD910E2FA
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PRPD015726
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FU1mXf0DVANe/L0lrcejH4nrOKNUOeVpUsibn0+P3j8=; b=dh3m7V/FPzEIAXNu
 rT9XW+mnOImXhv0Oj5JthYWRESWyaSiSj3cYlhQobL0jrdSXk5ZzjwYgna510JNO
 GWfp5AmClpsSo1LMYI1ybLBG5mD1PVq0pujNJk0uIK/ba9aV8DsjpJNo1M7qb0hY
 bv/nHVOn7WHypDrNsvIEMtDMQrmm9wKEd4pjy8C0RL7fLbzMTieuphoTcPZbX9yk
 WuMOV8CORjMhcqv31fUGlGt5pDLRzPbgsLDMAt60UuLP7kByrExdbmV5+gC0Cagd
 h3dA7DUzOMALeeKDP4mr3ZCaJ3XXTBhzS2c+rqtHzEletEXXy9buwbkigAXlex7f
 YqRAVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wc7mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e91b1ddb51so64519606d6.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 04:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742817093; x=1743421893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FU1mXf0DVANe/L0lrcejH4nrOKNUOeVpUsibn0+P3j8=;
 b=gm5Oy6/lKtmdbRP+/g5odnioLdfUoOSOXv3KJ8dHf+NivuMx6/SQElvCrQXJcJloz2
 wOxs/D1CKodgkm6zSJ5zntsBhMIBS3hrViFjIB+zrQHEFtKB+5SfZaukf04li99PhIdL
 RD93Qg5CoOJHkZruLhqvsjqZSBSzUk8eV5hAmrHTHiwkIQhQEPbjVktwJIl3ym+ihR8c
 rnLB6orPea0YH56cOJL1UE2SFpYgFIxz+TL3V6zlwP3NmDrlD5i4uLuAaO3vtV6SGh69
 JZZPNc3tt5K228r/7TSmbgzXu3BJXJNTZlq0cuncUyT02lOuWn6h14HxeFfFZOAzZU1S
 wUAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVynp9oBnKAHFB4bfzSkCNPZgtBteCU6pxOhHIadvHLzz1P2O/eeT0XvA8ULOg4vcfcc85WNYl0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynfK2ZW6BeJDVhtg/OFtfZ508WCdxLaDJgPb03o5Bud9BrHO6+
 g5nh3CGqYYUfaWnZWE4iCjbvdVbYWOiVH624yggqRL6m1kT8fo41zB2lmQcZ6IKbN4mYWmWaRYZ
 kHiCajDkNnCDY0k4mZbogsTRoV0POwrG59Wl9yzFIBHZz1BfcUBfYUjFO3T+kLjSi
X-Gm-Gg: ASbGncv3fthjIfpm8ILu6Nqd/EDy3119NiNzJWQx9ksjtoeUTt0ordV6hFKGpi+pphO
 XvZIFglHgj79Q3W7mNIZG9VRi14UtpxBu3CNIxXDJqm8W99H2YUnIPEnz/w5VZENm/UQSS/1zyY
 eBPt1ihGzy/KRnOxovvTOotFHxAjg+c2hLQeu1/ktD4B5OcvBjpadWiChB8NJvigfRB8sNemion
 +NFHtQ5odxMGgHSu5Xh6d9Ud0fT33ZFzjV+NPCsh7qLSoZHh3wcJrgIqCQuRKcRl7lheCqsS7eK
 O7oxUQseaAgS9KRGsSg1MipEHg5RMYThZlHBWpw6SMPYLOF9BAguywzXxeH5PmptPNCWYuTS89V
 2q8IdVTqTpkoQq/QOtiXG0bYbV9m5
X-Received: by 2002:a05:6214:cc2:b0:6e8:9dfa:d932 with SMTP id
 6a1803df08f44-6eb3f287f51mr180382746d6.15.1742817093196; 
 Mon, 24 Mar 2025 04:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1wmKXp6BrtPnLk1P3+RjiXIoRXioSbpJdajrGxUy704Y8MAtKBtoUwbK/WdMvlmEHLS5vGQ==
X-Received: by 2002:a05:6214:cc2:b0:6e8:9dfa:d932 with SMTP id
 6a1803df08f44-6eb3f287f51mr180382276d6.15.1742817092530; 
 Mon, 24 Mar 2025 04:51:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbb51sm1142907e87.135.2025.03.24.04.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 04:51:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 13:51:21 +0200
Subject: [PATCH RESEND RFC v4 3/6] drm/display: dp: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-drm-rework-dpcd-access-v4-3-e80ff89593df@oss.qualcomm.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27759;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kupghql56DHqM4wDv/45qSyGLZpGi6n/Mw9iPxFwqBk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn4Uc3r3yznpq+JY8p7nzLJWSdPB+LKv6Wu6FmM
 SpJwC6H2jyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+FHNwAKCRCLPIo+Aiko
 1YneB/9DpSpwMLpnkVyvH/yJU51tjH26sU01r6RKMsxbU0O8ALtFE5lfu5OOrWlBJqcG+YCmBDc
 jnIGgPrpibfOvkcE/YXf4WTiZ12bxZ4Ovbp59+gy3/xMo4EvPGI6JXXcaRBMEsjvvYoHnkWwRqb
 845N4wv9XmLW16H0Q2mpIEBrl91SY32O2pc8Z91GnHrUkmp8x2Ll87Z+NSMAJOmRZO51Tg08jDQ
 ABYBL64mhB6XXbt6sbbUDvhlCD+KN9Jto1Q5RgORO27ONnRa5TAJ/ok7wb7MzNyAJXzHtXG0H4/
 V7HAs5O+H7ouQKMfLslda5hUSXr+SZrdCtwSRPDdYu1hry+M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TY1ysqhr8_dho9FcoGZwWSN76oMvhbi-
X-Proofpoint-ORIG-GUID: TY1ysqhr8_dho9FcoGZwWSN76oMvhbi-
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e14746 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=FYq9FAz7wtZL43-cE34A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240086
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Switch drm_dp_helper.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 296 +++++++++++++-------------------
 1 file changed, 116 insertions(+), 180 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 410be0be233ad94702af423262a7d98e21afbfeb..e2439c8a7fefe116b04aaa689b557e2387b05540 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -327,7 +327,7 @@ static int __read_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SI
 	if (offset < DP_RECEIVER_CAP_SIZE) {
 		rd_interval = dpcd[offset];
 	} else {
-		if (drm_dp_dpcd_readb(aux, offset, &rd_interval) != 1) {
+		if (drm_dp_dpcd_read_byte(aux, offset, &rd_interval) < 0) {
 			drm_dbg_kms(aux->drm_dev, "%s: failed rd interval read\n",
 				    aux->name);
 			/* arbitrary default delay */
@@ -358,7 +358,7 @@ int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux)
 	int unit;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_128B132B_TRAINING_AUX_RD_INTERVAL, &val) < 0) {
 		drm_err(aux->drm_dev, "%s: failed rd interval read\n",
 			aux->name);
 		/* default to max */
@@ -807,30 +807,20 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 {
 	int ret;
 
-	if (dp_phy == DP_PHY_DPRX) {
-		ret = drm_dp_dpcd_read(aux,
-				       DP_LANE0_1_STATUS,
-				       link_status,
-				       DP_LINK_STATUS_SIZE);
-
-		if (ret < 0)
-			return ret;
+	if (dp_phy == DP_PHY_DPRX)
+		return drm_dp_dpcd_read_data(aux,
+					     DP_LANE0_1_STATUS,
+					     link_status,
+					     DP_LINK_STATUS_SIZE);
 
-		WARN_ON(ret != DP_LINK_STATUS_SIZE);
-
-		return 0;
-	}
-
-	ret = drm_dp_dpcd_read(aux,
-			       DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy),
-			       link_status,
-			       DP_LINK_STATUS_SIZE - 1);
+	ret = drm_dp_dpcd_read_data(aux,
+				    DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy),
+				    link_status,
+				    DP_LINK_STATUS_SIZE - 1);
 
 	if (ret < 0)
 		return ret;
 
-	WARN_ON(ret != DP_LINK_STATUS_SIZE - 1);
-
 	/* Convert the LTTPR to the sink PHY link status layout */
 	memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
 		&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS],
@@ -846,7 +836,7 @@ static int read_payload_update_status(struct drm_dp_aux *aux)
 	int ret;
 	u8 status;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0)
 		return ret;
 
@@ -873,21 +863,21 @@ int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 	int ret;
 	int retries = 0;
 
-	drm_dp_dpcd_writeb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
-			   DP_PAYLOAD_TABLE_UPDATED);
+	drm_dp_dpcd_write_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
+			       DP_PAYLOAD_TABLE_UPDATED);
 
 	payload_alloc[0] = vcpid;
 	payload_alloc[1] = start_time_slot;
 	payload_alloc[2] = time_slot_count;
 
-	ret = drm_dp_dpcd_write(aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
-	if (ret != 3) {
+	ret = drm_dp_dpcd_write_data(aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "failed to write payload allocation %d\n", ret);
 		goto fail;
 	}
 
 retry:
-	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "failed to read payload table status %d\n", ret);
 		goto fail;
@@ -1043,15 +1033,15 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 {
 	u8 link_edid_read = 0, auto_test_req = 0, test_resp = 0;
 
-	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
-			     &auto_test_req, 1) < 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				  &auto_test_req) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
 			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 	auto_test_req &= DP_AUTOMATED_TEST_REQUEST;
 
-	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_TEST_REQUEST, &link_edid_read) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed read at register 0x%x\n",
 			aux->name, DP_TEST_REQUEST);
 		return false;
@@ -1064,23 +1054,23 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
 		return false;
 	}
 
-	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
-			      &auto_test_req, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
+				   auto_test_req) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
 		return false;
 	}
 
 	/* send back checksum for the last edid extension block data */
-	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
-			      &real_edid_checksum, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_TEST_EDID_CHECKSUM,
+				   real_edid_checksum) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_TEST_EDID_CHECKSUM);
 		return false;
 	}
 
 	test_resp |= DP_TEST_EDID_CHECKSUM_WRITE;
-	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
+	if (drm_dp_dpcd_write_byte(aux, DP_TEST_RESPONSE, test_resp) < 0) {
 		drm_err(aux->drm_dev, "%s: DPCD failed write at register 0x%x\n",
 			aux->name, DP_TEST_RESPONSE);
 		return false;
@@ -1117,12 +1107,10 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
 		return 0;
 
-	ret = drm_dp_dpcd_read(aux, DP_DP13_DPCD_REV, &dpcd_ext,
-			       sizeof(dpcd_ext));
+	ret = drm_dp_dpcd_read_data(aux, DP_DP13_DPCD_REV, &dpcd_ext,
+				    sizeof(dpcd_ext));
 	if (ret < 0)
 		return ret;
-	if (ret != sizeof(dpcd_ext))
-		return -EIO;
 
 	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
 		drm_dbg_kms(aux->drm_dev,
@@ -1159,10 +1147,10 @@ int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 {
 	int ret;
 
-	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
+	ret = drm_dp_dpcd_read_data(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
 	if (ret < 0)
 		return ret;
-	if (ret != DP_RECEIVER_CAP_SIZE || dpcd[DP_DPCD_REV] == 0)
+	if (dpcd[DP_DPCD_REV] == 0)
 		return -EIO;
 
 	ret = drm_dp_read_extended_dpcd_caps(aux, dpcd);
@@ -1212,11 +1200,9 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
 	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE)
 		len *= 4;
 
-	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
+	ret = drm_dp_dpcd_read_data(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
 	if (ret < 0)
 		return ret;
-	if (ret != len)
-		return -EIO;
 
 	drm_dbg_kms(aux->drm_dev, "%s: DPCD DFP: %*ph\n", aux->name, len, downstream_ports);
 
@@ -1573,7 +1559,7 @@ EXPORT_SYMBOL(drm_dp_downstream_mode);
  */
 int drm_dp_downstream_id(struct drm_dp_aux *aux, char id[6])
 {
-	return drm_dp_dpcd_read(aux, DP_BRANCH_ID, id, 6);
+	return drm_dp_dpcd_read_data(aux, DP_BRANCH_ID, id, 6);
 }
 EXPORT_SYMBOL(drm_dp_downstream_id);
 
@@ -1638,13 +1624,13 @@ void drm_dp_downstream_debug(struct seq_file *m,
 	drm_dp_downstream_id(aux, id);
 	seq_printf(m, "\t\tID: %s\n", id);
 
-	len = drm_dp_dpcd_read(aux, DP_BRANCH_HW_REV, &rev[0], 1);
-	if (len > 0)
+	len = drm_dp_dpcd_read_data(aux, DP_BRANCH_HW_REV, &rev[0], 1);
+	if (!len)
 		seq_printf(m, "\t\tHW: %d.%d\n",
 			   (rev[0] & 0xf0) >> 4, rev[0] & 0xf);
 
-	len = drm_dp_dpcd_read(aux, DP_BRANCH_SW_REV, rev, 2);
-	if (len > 0)
+	len = drm_dp_dpcd_read_data(aux, DP_BRANCH_SW_REV, rev, 2);
+	if (!len)
 		seq_printf(m, "\t\tSW: %d.%d\n", rev[0], rev[1]);
 
 	if (detailed_cap_info) {
@@ -1782,11 +1768,9 @@ int drm_dp_read_sink_count(struct drm_dp_aux *aux)
 	u8 count;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
+	ret = drm_dp_dpcd_read_byte(aux, DP_SINK_COUNT, &count);
 	if (ret < 0)
 		return ret;
-	if (ret != 1)
-		return -EIO;
 
 	return DP_GET_SINK_COUNT(count);
 }
@@ -2175,13 +2159,13 @@ static int drm_dp_aux_get_crc(struct drm_dp_aux *aux, u8 *crc)
 	u8 buf, count;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
 	WARN_ON(!(buf & DP_TEST_SINK_START));
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK_MISC, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK_MISC, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -2195,11 +2179,7 @@ static int drm_dp_aux_get_crc(struct drm_dp_aux *aux, u8 *crc)
 	 * At DP_TEST_CRC_R_CR, there's 6 bytes containing CRC data, 2 bytes
 	 * per component (RGB or CrYCb).
 	 */
-	ret = drm_dp_dpcd_read(aux, DP_TEST_CRC_R_CR, crc, 6);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_read_data(aux, DP_TEST_CRC_R_CR, crc, 6);
 }
 
 static void drm_dp_aux_crc_work(struct work_struct *work)
@@ -2398,11 +2378,11 @@ int drm_dp_start_crc(struct drm_dp_aux *aux, struct drm_crtc *crtc)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_TEST_SINK, buf | DP_TEST_SINK_START);
+	ret = drm_dp_dpcd_write_byte(aux, DP_TEST_SINK, buf | DP_TEST_SINK_START);
 	if (ret < 0)
 		return ret;
 
@@ -2425,11 +2405,11 @@ int drm_dp_stop_crc(struct drm_dp_aux *aux)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_TEST_SINK, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_TEST_SINK, &buf);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_TEST_SINK, buf & ~DP_TEST_SINK_START);
+	ret = drm_dp_dpcd_write_byte(aux, DP_TEST_SINK, buf & ~DP_TEST_SINK_START);
 	if (ret < 0)
 		return ret;
 
@@ -2515,11 +2495,7 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
 static int drm_dp_read_ident(struct drm_dp_aux *aux, unsigned int offset,
 			     struct drm_dp_dpcd_ident *ident)
 {
-	int ret;
-
-	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
-
-	return ret < 0 ? ret : 0;
+	return drm_dp_dpcd_read_data(aux, offset, ident, sizeof(*ident));
 }
 
 static void drm_dp_dump_desc(struct drm_dp_aux *aux,
@@ -2777,13 +2753,11 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 	int ret;
 
 	for (offset = 0; offset < buf_size; offset += block_size) {
-		ret = drm_dp_dpcd_read(aux,
-				       address + offset,
-				       &buf[offset], block_size);
+		ret = drm_dp_dpcd_read_data(aux,
+					    address + offset,
+					    &buf[offset], block_size);
 		if (ret < 0)
 			return ret;
-
-		WARN_ON(ret != block_size);
 	}
 
 	return 0;
@@ -2998,12 +2972,12 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 	int err;
 	u8 rate, lanes;
 
-	err = drm_dp_dpcd_readb(aux, DP_TEST_LINK_RATE, &rate);
+	err = drm_dp_dpcd_read_byte(aux, DP_TEST_LINK_RATE, &rate);
 	if (err < 0)
 		return err;
 	data->link_rate = drm_dp_bw_code_to_link_rate(rate);
 
-	err = drm_dp_dpcd_readb(aux, DP_TEST_LANE_COUNT, &lanes);
+	err = drm_dp_dpcd_read_byte(aux, DP_TEST_LANE_COUNT, &lanes);
 	if (err < 0)
 		return err;
 	data->num_lanes = lanes & DP_MAX_LANE_COUNT_MASK;
@@ -3011,22 +2985,22 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 	if (lanes & DP_ENHANCED_FRAME_CAP)
 		data->enhanced_frame_cap = true;
 
-	err = drm_dp_dpcd_readb(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
+	err = drm_dp_dpcd_read_byte(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
 	if (err < 0)
 		return err;
 
 	switch (data->phy_pattern) {
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		err = drm_dp_dpcd_read(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
-				       &data->custom80, sizeof(data->custom80));
+		err = drm_dp_dpcd_read_data(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
+					    &data->custom80, sizeof(data->custom80));
 		if (err < 0)
 			return err;
 
 		break;
 	case DP_PHY_TEST_PATTERN_CP2520:
-		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
-				       &data->hbr2_reset,
-				       sizeof(data->hbr2_reset));
+		err = drm_dp_dpcd_read_data(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
+					    &data->hbr2_reset,
+					    sizeof(data->hbr2_reset));
 		if (err < 0)
 			return err;
 	}
@@ -3053,15 +3027,15 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
 	if (dp_rev < 0x12) {
 		test_pattern = (test_pattern << 2) &
 			       DP_LINK_QUAL_PATTERN_11_MASK;
-		err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET,
-					 test_pattern);
+		err = drm_dp_dpcd_write_byte(aux, DP_TRAINING_PATTERN_SET,
+					     test_pattern);
 		if (err < 0)
 			return err;
 	} else {
 		for (i = 0; i < data->num_lanes; i++) {
-			err = drm_dp_dpcd_writeb(aux,
-						 DP_LINK_QUAL_LANE0_SET + i,
-						 test_pattern);
+			err = drm_dp_dpcd_write_byte(aux,
+						     DP_LINK_QUAL_LANE0_SET + i,
+						     test_pattern);
 			if (err < 0)
 				return err;
 		}
@@ -3268,8 +3242,8 @@ bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_C
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
 		return false;
 
-	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
-			      &rx_feature) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+				  &rx_feature) < 0) {
 		drm_dbg_dp(aux->drm_dev,
 			   "Failed to read DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1\n");
 		return false;
@@ -3293,7 +3267,7 @@ bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
 		return false;
 
-	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
+	if (drm_dp_dpcd_read_byte(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) < 0) {
 		drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
 		return false;
 	}
@@ -3424,16 +3398,13 @@ EXPORT_SYMBOL(drm_dp_get_pcon_max_frl_bw);
  */
 int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_ready_hpd)
 {
-	int ret;
 	u8 buf = DP_PCON_ENABLE_SOURCE_CTL_MODE |
 		 DP_PCON_ENABLE_LINK_FRL_MODE;
 
 	if (enable_frl_ready_hpd)
 		buf |= DP_PCON_ENABLE_HPD_READY;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-
-	return ret;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_prepare);
 
@@ -3448,7 +3419,7 @@ bool drm_dp_pcon_is_frl_ready(struct drm_dp_aux *aux)
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
 	if (ret < 0)
 		return false;
 
@@ -3477,7 +3448,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3512,11 +3483,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
 		return -EINVAL;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
 
@@ -3542,7 +3509,7 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 	else
 		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
 	if (ret < 0)
 		return ret;
 
@@ -3558,13 +3525,7 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
  */
 int drm_dp_pcon_reset_frl_config(struct drm_dp_aux *aux)
 {
-	int ret;
-
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, 0x0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, 0x0);
 }
 EXPORT_SYMBOL(drm_dp_pcon_reset_frl_config);
 
@@ -3579,7 +3540,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 	int ret;
 	u8 buf = 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, &buf);
 	if (ret < 0)
 		return ret;
 	if (!(buf & DP_PCON_ENABLE_SOURCE_CTL_MODE)) {
@@ -3588,11 +3549,7 @@ int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux)
 		return -EINVAL;
 	}
 	buf |= DP_PCON_ENABLE_HDMI_LINK;
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_enable);
 
@@ -3607,7 +3564,7 @@ bool drm_dp_pcon_hdmi_link_active(struct drm_dp_aux *aux)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_TX_LINK_STATUS, &buf);
 	if (ret < 0)
 		return false;
 
@@ -3632,7 +3589,7 @@ int drm_dp_pcon_hdmi_link_mode(struct drm_dp_aux *aux, u8 *frl_trained_mask)
 	int mode;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PCON_HDMI_POST_FRL_STATUS, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_POST_FRL_STATUS, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3661,7 +3618,7 @@ void drm_dp_pcon_hdmi_frl_link_error_count(struct drm_dp_aux *aux,
 	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
 
 	for (i = 0; i < hdmi->max_lanes; i++) {
-		if (drm_dp_dpcd_readb(aux, DP_PCON_HDMI_ERROR_STATUS_LN0 + i, &buf) < 0)
+		if (drm_dp_dpcd_read_byte(aux, DP_PCON_HDMI_ERROR_STATUS_LN0 + i, &buf) < 0)
 			return;
 
 		error_count = buf & DP_PCON_HDMI_ERROR_COUNT_MASK;
@@ -3796,7 +3753,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
 	u8 buf;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3807,11 +3764,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
 		buf |= pps_buf_config << 2;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
 }
 
 /**
@@ -3823,13 +3776,7 @@ int drm_dp_pcon_configure_dsc_enc(struct drm_dp_aux *aux, u8 pps_buf_config)
  */
 int drm_dp_pcon_pps_default(struct drm_dp_aux *aux)
 {
-	int ret;
-
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_DISABLED);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_DISABLED);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_default);
 
@@ -3845,15 +3792,11 @@ int drm_dp_pcon_pps_override_buf(struct drm_dp_aux *aux, u8 pps_buf[128])
 {
 	int ret;
 
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVERRIDE_BASE, &pps_buf, 128);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVERRIDE_BASE, &pps_buf, 128);
 	if (ret < 0)
 		return ret;
 
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_buf);
 
@@ -3870,21 +3813,17 @@ int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6])
 {
 	int ret;
 
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT, &pps_param[0], 2);
-	if (ret < 0)
-		return ret;
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH, &pps_param[2], 2);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT, &pps_param[0], 2);
 	if (ret < 0)
 		return ret;
-	ret = drm_dp_dpcd_write(aux, DP_PCON_HDMI_PPS_OVRD_BPP, &pps_param[4], 2);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH, &pps_param[2], 2);
 	if (ret < 0)
 		return ret;
-
-	ret = drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
+	ret = drm_dp_dpcd_write_data(aux, DP_PCON_HDMI_PPS_OVRD_BPP, &pps_param[4], 2);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	return drm_dp_pcon_configure_dsc_enc(aux, DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER);
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
 
@@ -3900,7 +3839,7 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 	int ret;
 	u8 buf;
 
-	ret = drm_dp_dpcd_readb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
+	ret = drm_dp_dpcd_read_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, &buf);
 	if (ret < 0)
 		return ret;
 
@@ -3909,11 +3848,7 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 	else
 		buf &= ~DP_CONVERSION_RGB_YCBCR_MASK;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return drm_dp_dpcd_write_byte(aux, DP_PROTOCOL_CONVERTER_CONTROL_2, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
 
@@ -3945,12 +3880,12 @@ int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_bac
 		buf[0] = level;
 	}
 
-	ret = drm_dp_dpcd_write(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
+	ret = drm_dp_dpcd_write_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, sizeof(buf));
+	if (ret < 0) {
 		drm_err(aux->drm_dev,
 			"%s: Failed to write aux backlight level: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
@@ -3968,22 +3903,22 @@ drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (!bl->aux_enable)
 		return 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf);
+	if (ret < 0) {
 		drm_err(aux->drm_dev, "%s: Failed to read eDP display control register: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 	if (enable)
 		buf |= DP_EDP_BACKLIGHT_ENABLE;
 	else
 		buf &= ~DP_EDP_BACKLIGHT_ENABLE;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf);
+	if (ret < 0) {
 		drm_err(aux->drm_dev, "%s: Failed to write eDP display control register: %d\n",
 			aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
@@ -4019,15 +3954,16 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
 	if (bl->pwmgen_bit_count) {
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
-		if (ret != 1)
+		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
+		if (ret < 0)
 			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 				    aux->name, ret);
 	}
 
 	if (bl->pwm_freq_pre_divider) {
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_FREQ_SET, bl->pwm_freq_pre_divider);
-		if (ret != 1)
+		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_BACKLIGHT_FREQ_SET,
+					     bl->pwm_freq_pre_divider);
+		if (ret < 0)
 			drm_dbg_kms(aux->drm_dev,
 				    "%s: Failed to write aux backlight frequency: %d\n",
 				    aux->name, ret);
@@ -4035,8 +3971,8 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 			dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, dpcd_buf);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, dpcd_buf);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
 		return ret < 0 ? ret : -EIO;
@@ -4091,8 +4027,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	if (!bl->aux_set)
 		return 0;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
 			    aux->name, ret);
 		return -ENODEV;
@@ -4125,14 +4061,14 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
 			    aux->name, ret);
 		return 0;
 	}
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
 			    aux->name, ret);
 		return 0;
@@ -4157,8 +4093,8 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			break;
 	}
 
-	ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 			    aux->name, ret);
 		return 0;
@@ -4183,8 +4119,8 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	u8 buf[2];
 	u8 mode_reg;
 
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg);
+	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
 		return ret < 0 ? ret : -EIO;
@@ -4197,11 +4133,11 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (*current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		int size = 1 + bl->lsb_reg_used;
 
-		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
-		if (ret != size) {
+		ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
+		if (ret < 0) {
 			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
 				    aux->name, ret);
-			return ret < 0 ? ret : -EIO;
+			return ret;
 		}
 
 		if (bl->lsb_reg_used)
@@ -4346,8 +4282,8 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 	if (!panel || !panel->dev || !aux)
 		return -EINVAL;
 
-	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
-			       EDP_DISPLAY_CTL_CAP_SIZE);
+	ret = drm_dp_dpcd_read_data(aux, DP_EDP_DPCD_REV, edp_dpcd,
+				    EDP_DISPLAY_CTL_CAP_SIZE);
 	if (ret < 0)
 		return ret;
 

-- 
2.39.5

