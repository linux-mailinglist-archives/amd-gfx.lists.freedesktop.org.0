Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E106B3EB649
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Aug 2021 15:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D536E7DC;
	Fri, 13 Aug 2021 13:53:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Fri, 13 Aug 2021 09:03:19 UTC
Received: from qq.com (smtpbg566.qq.com [183.3.255.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD19A6E5A2
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Aug 2021 09:03:19 +0000 (UTC)
X-QQ-mid: bizesmtp33t1628844876tafoo5ml
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 16:54:35 +0800 (CST)
X-QQ-SSF: 0140000000200030C000B00A0000000
X-QQ-FEAT: nNpKvUcGwyjmNbUJ032IhxCMQOvkHqQz0wNxgj0c/GfvsTd0Rb4+LyrYZFTkR
 QF/YhqG0dTQDXAo1sOK8GbpZU+H+qmNvhm2yl7oP12+1QMs/MRojc6XVm/E6BpIOHDnNICq
 L5++Sk2yRLHHfBYHm7Ahp747iHft4EMr80DNv6tmnfbx3QAkAQzcnes40Vq3AAxs1MNq2Cn
 3lD405IMyFUmJ1PpbTBVplyllX1DKefHaVJZr2ctR3M7s3nxNjEsLUUOyg6CqzEY3jJhs5Q
 d2AEK/sDL8EN8aUJcxAxucnIcZkGsFQFOneltgGSccCNcnspuYPorJdbVU0Kypnho09oOAX
 LF5I5aYW/DzvW+NLg/zEQIQv3qScA==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] drm: radeon: r600_dma: Replace cpu_to_le32() by
 lower_32_bits()
Date: Fri, 13 Aug 2021 16:54:34 +0800
Message-Id: <20210813085434.3890-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Fri, 13 Aug 2021 13:53:44 +0000
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

This patch fixes the following sparse errors:
drivers/gpu/drm/radeon/r600_dma.c:247:30: warning: incorrect type in assignment (different base types)
drivers/gpu/drm/radeon/r600_dma.c:247:30:    expected unsigned int volatile [usertype]
drivers/gpu/drm/radeon/r600_dma.c:247:30:    got restricted __le32 [usertype]

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/radeon/r600_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r600_dma.c b/drivers/gpu/drm/radeon/r600_dma.c
index fb65e6fb5c4f..a2d0b1edcd22 100644
--- a/drivers/gpu/drm/radeon/r600_dma.c
+++ b/drivers/gpu/drm/radeon/r600_dma.c
@@ -244,7 +244,7 @@ int r600_dma_ring_test(struct radeon_device *rdev,
 	gpu_addr = rdev->wb.gpu_addr + index;
 
 	tmp = 0xCAFEDEAD;
-	rdev->wb.wb[index/4] = cpu_to_le32(tmp);
+	rdev->wb.wb[index/4] = lower_32_bits(tmp);
 
 	r = radeon_ring_lock(rdev, ring, 4);
 	if (r) {
-- 
2.20.1


F
