Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0755A8B206
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Apr 2025 09:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0899C10E865;
	Wed, 16 Apr 2025 07:25:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E129610E817;
 Wed, 16 Apr 2025 01:18:20 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G00VhQ012373;
 Tue, 15 Apr 2025 18:18:15 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com
 [147.11.82.254])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkkw4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Apr 2025 18:18:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 18:18:14 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 15 Apr 2025 18:18:09 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <jianqi.ren.cn@windriver.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <sashal@kernel.org>, <chiahsuan.chung@amd.com>, <alex.hung@amd.com>,
 <mario.limonciello@amd.com>, <hersenxs.wu@amd.com>,
 <Wayne.Lin@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <daniel.wheeler@amd.com>
Subject: [PATCH 5.10.y] drm/amd/display: Stop amdgpu_dm initialize when link
 nums greater than max_links
Date: Wed, 16 Apr 2025 09:18:08 +0800
Message-ID: <20250416011808.388698-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lGjMQycpew1QElTfJ0BFCJ1-sXLc6BR-
X-Proofpoint-GUID: lGjMQycpew1QElTfJ0BFCJ1-sXLc6BR-
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67ff0557 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=t7CeM3EgAAAA:8 a=V2FjD2v6pYOrjI9wGFEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504160008
X-Mailman-Approved-At: Wed, 16 Apr 2025 07:25:00 +0000
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit cf8b16857db702ceb8d52f9219a4613363e2b1cf ]

[Why]
Coverity report OVERRUN warning. There are
only max_links elements within dc->links. link
count could up to AMDGPU_DM_MAX_DISPLAY_INDEX 31.

[How]
Make sure link count less than max_links.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[Minor conflict resolved due to code context change. And the macro MAX_LINKS
 is introduced by Commit 60df5628144b ("drm/amd/display: handle invalid
 connector indices") after 6.10. So here we still use the original array
 length MAX_PIPES * 2]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 50921b340b88..69b3f1dc43e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3397,17 +3397,17 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 			goto fail;
 		}
 
+	if (link_cnt > (MAX_PIPES * 2)) {
+		DRM_ERROR(
+			"KMS: Cannot support more than %d display indexes\n",
+				MAX_PIPES * 2);
+		goto fail;
+	}
+
 	/* loops over all connectors on the board */
 	for (i = 0; i < link_cnt; i++) {
 		struct dc_link *link = NULL;
 
-		if (i > AMDGPU_DM_MAX_DISPLAY_INDEX) {
-			DRM_ERROR(
-				"KMS: Cannot support more than %d display indexes\n",
-					AMDGPU_DM_MAX_DISPLAY_INDEX);
-			continue;
-		}
-
 		aconnector = kzalloc(sizeof(*aconnector), GFP_KERNEL);
 		if (!aconnector)
 			goto fail;
-- 
2.34.1

