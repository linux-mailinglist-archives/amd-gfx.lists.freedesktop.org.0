Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B533F3CF
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Mar 2021 16:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA916E5BF;
	Wed, 17 Mar 2021 15:06:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52286E5C0
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 14:48:35 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 4ED7E1CAB;
 Wed, 17 Mar 2021 22:48:29 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from manjaro.uniontech.com (unknown [101.87.44.10])
 by smtp.263.net (postfix) whith ESMTP id
 P13102T140547828213504S1615992509987616_; 
 Wed, 17 Mar 2021 22:48:30 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <dd9e9157c503549cfa7dce4cd558fe0a>
X-RL-SENDER: chenli@uniontech.com
X-SENDER: chenli@uniontech.com
X-LOGIN-NAME: chenli@uniontech.com
X-FST-TO: amd-gfx@lists.freedesktop.org
X-SENDER-IP: 101.87.44.10
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Date: Wed, 17 Mar 2021 22:48:29 +0800
Message-ID: <87wnu5eszm.wl-chenli@uniontech.com>
From: Chen Li <chenli@uniontech.com>
To: amd-gfx@lists.freedesktop.org,
 =?ISO-8859-1?Q?=22Christian_K=F6nig=22?= <christian.koenig@amd.com>
Subject: [PATCH V2] radeon: use kvcalloc for relocs and chunks
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.0.50 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-Mailman-Approved-At: Wed, 17 Mar 2021 15:06:26 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



kvmalloc_array + __GFP_ZERO is the same with kvcalloc.

As for p->chunks, it will be used in:
```
if (ib_chunk->kdata)
		memcpy(parser->ib.ptr, ib_chunk->kdata, ib_chunk->length_dw * 4);
```

If chunks doesn't zero out with __GFP_ZERO, it may point to somewhere else, e.g.,
```
Unable to handle kernel paging request at virtual address 0000000000010000
...
pc is at memcpy+0x84/0x250
ra is at radeon_cs_ioctl+0x368/0xb90 [radeon]
```

after allocating chunks with __GFP_KERNEL/kvcalloc, this bug is fixed.
Fixes: 3fcb4f01deed ("drm/radeon: Use kvmalloc for CS chunks")
Signed-off-by: Chen Li <chenli@uniontech.com>
---

changelog:
  v1->v2: add Fixes: tag

 drivers/gpu/drm/radeon/radeon_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index fb736ef9f9aa..059431689c2d 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -93,8 +93,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 	p->dma_reloc_idx = 0;
 	/* FIXME: we assume that each relocs use 4 dwords */
 	p->nrelocs = chunk->length_dw / 4;
-	p->relocs = kvmalloc_array(p->nrelocs, sizeof(struct radeon_bo_list),
-			GFP_KERNEL | __GFP_ZERO);
+	p->relocs = kvcalloc(p->nrelocs, sizeof(struct radeon_bo_list),
+			GFP_KERNEL);
 	if (p->relocs == NULL) {
 		return -ENOMEM;
 	}
@@ -299,7 +299,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 	}
 	p->cs_flags = 0;
 	p->nchunks = cs->num_chunks;
-	p->chunks = kvmalloc_array(p->nchunks, sizeof(struct radeon_cs_chunk), GFP_KERNEL);
+	p->chunks = kvcalloc(p->nchunks, sizeof(struct radeon_cs_chunk), GFP_KERNEL);
 	if (p->chunks == NULL) {
 		return -ENOMEM;
 	}
-- 
2.30.1





_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
