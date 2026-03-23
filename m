Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fv5AMD1wGkwPAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 09:11:44 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FF2EE19A
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 09:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C08A10E411;
	Mon, 23 Mar 2026 08:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=139.com header.i=@139.com header.b="Qjb0yY6B";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 559 seconds by postgrey-1.36 at gabe;
 Mon, 23 Mar 2026 07:20:26 UTC
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E71A10E079;
 Mon, 23 Mar 2026 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=139.com; s=dkim; l=0;
 h=from:subject:message-id:to:cc:mime-version;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Qjb0yY6B7X0bw5KlbHxtQX35mPUQPswgg5F+lvaIzO7V5Hqc2YhkiDQ1+zUZRgVIoXE1VQkogm1vm
 dMnHnoLdXl5UQWh0t+0Bu94Y4+Z2shJ0ShjnTYU4Nno+uPa/9DOcxWjuDqZ/IR6+WDIAP30PbRfq5u
 l+R3pVyfFLlVby9k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
 by rmsmtp-lg-appmail-24-12027 (RichMail) with SMTP id 2efb69c0e77a297-0029b;
 Mon, 23 Mar 2026 15:10:53 +0800 (CST)
X-RM-TRANSID: 2efb69c0e77a297-0029b
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 srinivasan.shanmugam@amd.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sashal@kernel.org, guchun.chen@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.1.y] drm/amdgpu: Fix potential out-of-bounds access in
 'amdgpu_discovery_reg_base_init()'
Date: Mon, 23 Mar 2026 15:10:52 +0800
Message-Id: <20260323071052.4068410-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 08:11:39 +0000
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
X-Spamd-Result: default: False [1.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[139.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[139.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[139.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,amd.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[139.com:-];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1468888505@139.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.142];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,139.com:email,139.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 944FF2EE19A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit cdb637d339572398821204a1142d8d615668f1e9 ]

The issue arises when the array 'adev->vcn.vcn_config' is accessed
before checking if the index 'adev->vcn.num_vcn_inst' is within the
bounds of the array.

The fix involves moving the bounds check before the array access. This
ensures that 'adev->vcn.num_vcn_inst' is within the bounds of the array
before it is used as an index.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1289 amdgpu_discovery_reg_base_init() error: testing array offset 'adev->vcn.num_vcn_inst' after use.

Fixes: a0ccc717c4ab ("drm/amdgpu/discovery: validate VCN and SDMA instances")
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Minor conflict resolved. ]
Signed-off-by: Li hongliang <1468888505@139.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 9b1c4d5be61f..a1e006d238cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1128,15 +1128,15 @@ static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
 				 *     0b10 : encode is disabled
 				 *     0b01 : decode is disabled
 				 */
-				adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
-					ip->revision & 0xc0;
-				ip->revision &= ~0xc0;
-				if (adev->vcn.num_vcn_inst < AMDGPU_MAX_VCN_INSTANCES)
+				if (adev->vcn.num_vcn_inst < AMDGPU_MAX_VCN_INSTANCES) {
+					adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
+						ip->revision & 0xc0;
 					adev->vcn.num_vcn_inst++;
-				else
+				} else
 					dev_err(adev->dev, "Too many VCN instances: %d vs %d\n",
 						adev->vcn.num_vcn_inst + 1,
 						AMDGPU_MAX_VCN_INSTANCES);
+				ip->revision &= ~0xc0;
 			}
 			if (le16_to_cpu(ip->hw_id) == SDMA0_HWID ||
 			    le16_to_cpu(ip->hw_id) == SDMA1_HWID ||
-- 
2.34.1


