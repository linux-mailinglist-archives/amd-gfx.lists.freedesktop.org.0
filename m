Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCE15DE79
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 17:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C016FA47;
	Fri, 14 Feb 2020 16:04:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046256FA30;
 Fri, 14 Feb 2020 16:04:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D9132468C;
 Fri, 14 Feb 2020 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696292;
 bh=Zyh3gxQCNHNRIhs5e1XYrjc0NPYFdY4P2QPnyJn75c0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=obRXSfaaziaYVc7PfksjbvWTP9gXgyp8XTifqI+LcC2qa/A1R+Cw2cE9tw8TfCz3P
 ZINAO9RlU8BcN6ifZz+/30G6ZxCGMV9or3PHlyXIvBbMOHg7UJisZIO7kVK9vT9SiC
 p+w9p88pQ91dbkJW/S1sivrDNJQrZX1xvwinGIAc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 139/459] drm/radeon: remove set but not used
 variable 'size', 'relocs_chunk'
Date: Fri, 14 Feb 2020 10:56:29 -0500
Message-Id: <20200214160149.11681-139-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit e9f782dd22c0e17874b8b8e12aafcd3a06810dd0 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/r600_cs.c: In function r600_cs_track_validate_cb:
drivers/gpu/drm/radeon/r600_cs.c:353:22: warning: variable size set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/radeon/r600_cs.c: In function r600_cs_track_validate_db:
drivers/gpu/drm/radeon/r600_cs.c:520:27: warning: variable size set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/radeon/r600_cs.c: In function r600_dma_cs_next_reloc:
drivers/gpu/drm/radeon/r600_cs.c:2345:26: warning: variable relocs_chunk set but not used [-Wunused-but-set-variable]

The first 'size' is not used since commit f30df2fad0c9 ("drm/radeon/r600:
fix tiling issues in CS checker.")

The second 'size' is introduced by commit 88f50c80748b ("drm/radeon/kms:
add htile support to the cs checker v3"), but never used, so remove it.

'relocs_chunk' is not used since commit 9305ede6afe2 ("radeon/kms:
fix dma relocation checking")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/r600_cs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index d6c28a5d77abb..49e8266461f85 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -350,7 +350,7 @@ static void r600_cs_track_init(struct r600_cs_track *track)
 static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 {
 	struct r600_cs_track *track = p->track;
-	u32 slice_tile_max, size, tmp;
+	u32 slice_tile_max, tmp;
 	u32 height, height_align, pitch, pitch_align, depth_align;
 	u64 base_offset, base_align;
 	struct array_mode_checker array_check;
@@ -360,7 +360,6 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 	/* When resolve is used, the second colorbuffer has always 1 sample. */
 	unsigned nsamples = track->is_resolve && i == 1 ? 1 : track->nsamples;
 
-	size = radeon_bo_size(track->cb_color_bo[i]) - track->cb_color_bo_offset[i];
 	format = G_0280A0_FORMAT(track->cb_color_info[i]);
 	if (!r600_fmt_is_valid_color(format)) {
 		dev_warn(p->dev, "%s:%d cb invalid format %d for %d (0x%08X)\n",
@@ -517,7 +516,7 @@ static int r600_cs_track_validate_cb(struct radeon_cs_parser *p, int i)
 static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 {
 	struct r600_cs_track *track = p->track;
-	u32 nviews, bpe, ntiles, size, slice_tile_max, tmp;
+	u32 nviews, bpe, ntiles, slice_tile_max, tmp;
 	u32 height_align, pitch_align, depth_align;
 	u32 pitch = 8192;
 	u32 height = 8192;
@@ -564,7 +563,6 @@ static int r600_cs_track_validate_db(struct radeon_cs_parser *p)
 		}
 		ib[track->db_depth_size_idx] = S_028000_SLICE_TILE_MAX(tmp - 1) | (track->db_depth_size & 0x3FF);
 	} else {
-		size = radeon_bo_size(track->db_bo);
 		/* pitch in pixels */
 		pitch = (G_028000_PITCH_TILE_MAX(track->db_depth_size) + 1) * 8;
 		slice_tile_max = G_028000_SLICE_TILE_MAX(track->db_depth_size) + 1;
@@ -2342,7 +2340,6 @@ int r600_cs_parse(struct radeon_cs_parser *p)
 int r600_dma_cs_next_reloc(struct radeon_cs_parser *p,
 			   struct radeon_bo_list **cs_reloc)
 {
-	struct radeon_cs_chunk *relocs_chunk;
 	unsigned idx;
 
 	*cs_reloc = NULL;
@@ -2350,7 +2347,6 @@ int r600_dma_cs_next_reloc(struct radeon_cs_parser *p,
 		DRM_ERROR("No relocation chunk !\n");
 		return -EINVAL;
 	}
-	relocs_chunk = p->chunk_relocs;
 	idx = p->dma_reloc_idx;
 	if (idx >= p->nrelocs) {
 		DRM_ERROR("Relocs at %d after relocations chunk end %d !\n",
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
