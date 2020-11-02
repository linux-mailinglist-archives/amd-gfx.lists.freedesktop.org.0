Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCA2A2C8D
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Nov 2020 15:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970E26E50D;
	Mon,  2 Nov 2020 14:20:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189116E506
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Nov 2020 12:57:55 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [58.213.83.156])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id B6B0A482A3E;
 Mon,  2 Nov 2020 20:57:52 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Ian King <colin.king@canonical.com>,
 zhengbin <zhengbin13@huawei.com>, Bernard Zhao <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: fix typoes
Date: Mon,  2 Nov 2020 04:57:44 -0800
Message-Id: <20201102125747.6420-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTksfTElMGh0ZHkIeVkpNS09ISUpDTEhLTE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAg6Mzo5Lz8iERoKLSEzKRkq
 FRpPChhVSlVKTUtPSElKQ0xIT09CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlOQ1VJ
 SkhVQ0hVSk5NWVdZCAFZQUlPQ0s3Bg++
X-HM-Tid: 0a7589090c5593bakuwsb6b0a482a3e
X-Mailman-Approved-At: Mon, 02 Nov 2020 14:20:05 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix typoes.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index 2c6db379afae..e994d233aa21 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -1980,7 +1980,7 @@ static void calculate_bandwidth(
 	else {
 		data->latency_for_non_mcifwr_clients = bw_int_to_fixed(0);
 	}
-	/*dmif mc urgent latency suppported in high sclk and yclk*/
+	/*dmif mc urgent latency supported in high sclk and yclk*/
 	data->dmifmc_urgent_latency_supported_in_high_sclk_and_yclk = bw_div((bw_sub(data->min_read_buffer_size_in_time, data->dmif_burst_time[high][s_high])), data->total_dmifmc_urgent_trips);
 	/*dram speed/p-state change margin*/
 	/*in the multi-display case the nb p-state change watermark cannot exceed the average lb size plus the dmif size or the cursor dcp buffer size*/
-- 
2.29.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
