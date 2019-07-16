Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D06A03E
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FF16E04A;
	Tue, 16 Jul 2019 01:27:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E1789EAC
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 44so17719833qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=knHsC4jipkm88tSd9QZDm43M15v4DyJxGqfC7jlh6Is=;
 b=mBWrq1xGO0wfcO5cahXp8rLbKEFPBzB/OKNAQRjeVNPKvyMg7lBRizScTF3l/4Dv3W
 Z7Wyvq+8W33pbP3ll4lE9DaKONSizK+6rSZIy0sCDO+JPDbI8vRoc2Vtj3sbK9vOSUxJ
 BV/bTKTjdP4Zpu2rB6AUYUyLOTdo787MXe4ThrRXiLCSVd7jbyPECbb2i//25lB8Nz7h
 xk2LFWnzV64k1l1itLpK7Tly4ec6b4UnsACJ972lPEwM1x/6x/vaq1cQnpNzTCE+r8Z3
 ZEFpzBL4F9PNzJzQdeKcKcVhUsUqCDutBRxdhAyXLU7UmQt4JJRvMbPCOMDgtlXjtN1R
 4mdg==
X-Gm-Message-State: APjAAAWo3W54lm0Sc658pzbcy2i4VYu9HuBZJmLUO+wIrpxYPuoV8gHq
 BJUs/FyuVyWZjpJTkSlKlIcT6+C1
X-Google-Smtp-Source: APXvYqyEoKWQ9cUnIOBDXof7SPkJR2+DpxYrsptjWARJB5t5vB1NP2X6ytKjRPmw7Fy4bdTzfjhfVA==
X-Received: by 2002:ac8:1a36:: with SMTP id v51mr20150779qtj.201.1563240470803; 
 Mon, 15 Jul 2019 18:27:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 092/102] drm/amdkfd: Add arcturus CWSR trap handler
Date: Mon, 15 Jul 2019 20:27:31 -0500
Message-Id: <20190716012741.32036-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=knHsC4jipkm88tSd9QZDm43M15v4DyJxGqfC7jlh6Is=;
 b=XKj2mwLTOfiNOHMY8s8UT6+GNraOYe8/ttVUCldz2LTOGd5vKIwsQHmNe4jTMmXOcq
 b4jw4CkFTHci9fKePn6gsKjTaGu16R7EFnkz2mK2gqnagzhm29/IGIBEK3mMjKyKkC9b
 umfUu0SDtl9Pf9vN/B3Ig2JhLL28v6UP9ck/fZSE32nWozG8vFLrWT46w1cEco+gfXD+
 BP9Udpwo3es19MX7KeRDwBkBbDnHUOpUqtmarGhD/vBqpxc4K9P9Bv3iTDzDqfSTCAcf
 MpRFtj1Ub/a5qvZ8BXwB1wLi3dFcpOGFr7zesWBsgZlwXLkHvN1a+cTu99DwfvQ+clUu
 /deA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <Oak.Zeng@amd.com>
Content-Type: multipart/mixed; boundary="===============0355519817=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0355519817==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oak Zeng <Oak.Zeng@amd.com>

CWSR (compute wave save/restore) is used for
preempting compute queues.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 198 +++++
 .../amd/amdkfd/cwsr_trap_handler_arcturus.asm | 746 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   4 +
 3 files changed, 948 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_arcturus.asm

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index 826913c70766..ee700a69c68e 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -860,3 +860,201 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xbf9f0000, 0xbf9f0000,
 	0xbf9f0000, 0x00000000,
 };
+static const uint32_t cwsr_trap_arcturus_hex[] = {
+	0xbf820001, 0xbf8200ca,
+	0xb8f0f802, 0x89708670,
+	0xb8f1f803, 0x8671ff71,
+	0x00000400, 0xbf850008,
+	0xb8f1f803, 0x8671ff71,
+	0x000001ff, 0xbf850001,
+	0x806c846c, 0x866dff6d,
+	0x0000ffff, 0xbe801f6c,
+	0xb8f1f803, 0x8671ff71,
+	0x00000100, 0xbf840006,
+	0xbef60080, 0xb9760203,
+	0x866dff6d, 0x0000ffff,
+	0x80ec886c, 0x82ed806d,
+	0xbef60080, 0xb9760283,
+	0xbef20068, 0xbef30069,
+	0xb8f62407, 0x8e769b76,
+	0x876d766d, 0xb8f603c7,
+	0x8e769a76, 0x876d766d,
+	0xb8f6f807, 0x8676ff76,
+	0x00007fff, 0xb976f807,
+	0xbeee007e, 0xbeef007f,
+	0xbefe0180, 0xbf900004,
+	0xbf8e0002, 0xbf88fffe,
+	0xbef4007e, 0x8675ff7f,
+	0x0000ffff, 0x8775ff75,
+	0x00040000, 0xbef60080,
+	0xbef700ff, 0x00807fac,
+	0x8676ff7f, 0x08000000,
+	0x8f768376, 0x87777677,
+	0x8676ff7f, 0x70000000,
+	0x8f768176, 0x87777677,
+	0xbefb007c, 0xbefa0080,
+	0xbf8a0000, 0x8676ff7f,
+	0x04000000, 0xbf840012,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8f14306, 0x8671c171,
+	0xbf84000d, 0x8e718671,
+	0x8e718271, 0xbef60071,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0xbf800000,
+	0x807cff7c, 0x00000100,
+	0x807aff7a, 0x00000100,
+	0xbf0a717c, 0xbf85fffa,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8f12a05, 0x80718171,
+	0x8e718271, 0x8e768871,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0xbf11017c,
+	0x8071ff71, 0x00001000,
+	0x7e000300, 0xe0724000,
+	0x7a1d0000, 0x807c817c,
+	0x807aff7a, 0x00000100,
+	0xbf0a717c, 0xbf85fff8,
+	0xbf9c0000, 0xbefe00c1,
+	0xbeff00c1, 0xb8f12a05,
+	0x80718171, 0x8e718271,
+	0x8e768871, 0xbef600ff,
+	0x01000000, 0xbefc0080,
+	0xbf11017c, 0x8071ff71,
+	0x00001000, 0xd3d84000,
+	0x18000100, 0x7e000000,
+	0x7e000000, 0xe0724000,
+	0x7a1d0000, 0x807c817c,
+	0x807aff7a, 0x00000100,
+	0xbf0a717c, 0xbf85fff5,
+	0xbf9c0000, 0xb8f11605,
+	0x80718171, 0x8e718471,
+	0x8e768871, 0xbef600ff,
+	0x01000000, 0xbefc0080,
+	0xbf800000, 0xbe802a00,
+	0x7e000200, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0x807c817c,
+	0xbf0a717c, 0xbf85fff7,
+	0xbef60084, 0xbef600ff,
+	0x01000000, 0x7e00027b,
+	0xe0724000, 0x7a1d0000,
+	0x807aff7a, 0x00000100,
+	0x7e00026c, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0x7e00026d,
+	0xe0724000, 0x7a1d0000,
+	0x807aff7a, 0x00000100,
+	0x7e00026e, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0x7e00026f,
+	0xe0724000, 0x7a1d0000,
+	0x807aff7a, 0x00000100,
+	0x7e000270, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0xb8f1f803,
+	0x7e000271, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0x7e000272,
+	0xe0724000, 0x7a1d0000,
+	0x807aff7a, 0x00000100,
+	0x7e000273, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0xb8fbf801,
+	0x7e00027b, 0xe0724000,
+	0x7a1d0000, 0x807aff7a,
+	0x00000100, 0xbf8200bb,
+	0xbef4007e, 0x8675ff7f,
+	0x0000ffff, 0x8775ff75,
+	0x00040000, 0xbef60080,
+	0xbef700ff, 0x00807fac,
+	0x8672ff7f, 0x08000000,
+	0x8f728372, 0x87777277,
+	0x8672ff7f, 0x70000000,
+	0x8f728172, 0x87777277,
+	0xbef80080, 0x8672ff7f,
+	0x04000000, 0xbf840011,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8ef4306, 0x866fc16f,
+	0xbf84000c, 0x8e6f866f,
+	0x8e6f826f, 0xbef6006f,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0x807cff7c,
+	0x00000100, 0x8078ff78,
+	0x00000100, 0xbf0a6f7c,
+	0xbf85fffa, 0xbefe00c1,
+	0xbeff00c1, 0xb8ef2a05,
+	0x806f816f, 0x8e6f826f,
+	0x8e76886f, 0xbef600ff,
+	0x01000000, 0xbef20078,
+	0x8078ff78, 0x00000100,
+	0xbefc0081, 0xbf11087c,
+	0x806fff6f, 0x00008000,
+	0xe0524000, 0x781d0000,
+	0xbf8c0f70, 0x7e000300,
+	0x807c817c, 0x8078ff78,
+	0x00000100, 0xbf0a6f7c,
+	0xbf85fff7, 0xbf9c0000,
+	0xbefe00c1, 0xbeff00c1,
+	0xb8ef2a05, 0x806f816f,
+	0x8e6f826f, 0x8e76886f,
+	0xbef600ff, 0x01000000,
+	0xbefc0080, 0xbf11087c,
+	0x806fff6f, 0x00008000,
+	0xe0524000, 0x781d0000,
+	0xbf8c0f70, 0xd3d94000,
+	0x18000100, 0x807c817c,
+	0x8078ff78, 0x00000100,
+	0xbf0a6f7c, 0xbf85fff6,
+	0xbf9c0000, 0xe0524000,
+	0x721d0000, 0xb8ef1605,
+	0x806f816f, 0x8e6f846f,
+	0x8e76886f, 0xbef600ff,
+	0x01000000, 0xc0211cba,
+	0x00000078, 0x8078ff78,
+	0x00000100, 0xbefc0081,
+	0xc021003a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xbf8cc07f, 0xbe802c00,
+	0xbf800000, 0x807c817c,
+	0xbf0a6f7c, 0xbf85fff6,
+	0xbe800072, 0xbef60084,
+	0xbef600ff, 0x01000000,
+	0xc0211bfa, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211b3a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211b7a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211eba, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211efa, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211c3a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211c7a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211a3a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211a7a, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xc0211cfa, 0x00000078,
+	0x8078ff78, 0x00000100,
+	0xbf8cc07f, 0xbef2006d,
+	0x866dff72, 0x0000ffff,
+	0xbefc006f, 0xbefe007a,
+	0xbeff007b, 0x866f71ff,
+	0x000003ff, 0xb96f4803,
+	0x866f71ff, 0xfffff800,
+	0x8f6f8b6f, 0xb96fa2c3,
+	0xb973f801, 0x866fff72,
+	0xf8000000, 0x8f6f9b6f,
+	0x8e6f906f, 0xbef30080,
+	0x87736f73, 0x866fff72,
+	0x04000000, 0x8f6f9a6f,
+	0x8e6f8f6f, 0x87736f73,
+	0x866fff70, 0x00800000,
+	0x8f6f976f, 0xb973f807,
+	0x86fe7e7e, 0x86ea6a6a,
+	0xb970f802, 0xbf8a0000,
+	0x95806f6c, 0xbf810000,
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_arcturus.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_arcturus.asm
new file mode 100644
index 000000000000..b83e2a643ddb
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_arcturus.asm
@@ -0,0 +1,746 @@
+shader main
+
+asic(DEFAULT)
+
+type(CS)
+
+/*************************************************************************/
+/*					control on how to run the shader					 */
+/*************************************************************************/
+//any hack that needs to be made to run this code in EMU (either becasue various EMU code are not ready or no compute save & restore in EMU run)
+var EMU_RUN_HACK					=	0
+var EMU_RUN_HACK_RESTORE_NORMAL		=	0
+var EMU_RUN_HACK_SAVE_NORMAL_EXIT	=	0
+var	EMU_RUN_HACK_SAVE_SINGLE_WAVE	=	0
+var EMU_RUN_HACK_SAVE_FIRST_TIME	= 	0					//for interrupted restore in which the first save is through EMU_RUN_HACK
+var SAVE_LDS						= 	0
+var WG_BASE_ADDR_LO					=   0x9000a000
+var WG_BASE_ADDR_HI					=	0x0
+var WAVE_SPACE						=	0x6000				//memory size that each wave occupies in workgroup state mem
+var CTX_SAVE_CONTROL				=	0x0
+var CTX_RESTORE_CONTROL				=	CTX_SAVE_CONTROL
+var SIM_RUN_HACK					=	0					//any hack that needs to be made to run this code in SIM (either becasue various RTL code are not ready or no compute save & restore in RTL run)
+var	SGPR_SAVE_USE_SQC				=	0					//use SQC D$ to do the write
+var USE_MTBUF_INSTEAD_OF_MUBUF		=	0					//need to change BUF_DATA_FORMAT in S_SAVE_BUF_RSRC_WORD3_MISC from 0 to BUF_DATA_FORMAT_32 if set to 1 (i.e. 0x00827FAC)
+var SWIZZLE_EN						=	0					//whether we use swizzled buffer addressing
+
+/**************************************************************************/
+/*                     	variables							              */
+/**************************************************************************/
+var SQ_WAVE_STATUS_INST_ATC_SHIFT  = 23
+var SQ_WAVE_STATUS_INST_ATC_MASK   = 0x00800000
+var SQ_WAVE_STATUS_SPI_PRIO_MASK   = 0x00000006
+
+var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT	= 12
+var SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE		= 9
+var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT	= 8
+var SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE	= 6
+var SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SHIFT	= 24
+var SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SIZE	= 3						//FIXME	 sq.blk still has 4 bits at this time while SQ programming guide has 3 bits
+
+var	SQ_WAVE_TRAPSTS_SAVECTX_MASK	=	0x400
+var SQ_WAVE_TRAPSTS_EXCE_MASK       =   0x1FF          			// Exception mask
+var	SQ_WAVE_TRAPSTS_SAVECTX_SHIFT	=	10
+var	SQ_WAVE_TRAPSTS_MEM_VIOL_MASK	=	0x100
+var	SQ_WAVE_TRAPSTS_MEM_VIOL_SHIFT	=	8
+var	SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK 	=	0x3FF
+var	SQ_WAVE_TRAPSTS_PRE_SAVECTX_SHIFT 	=	0x0
+var	SQ_WAVE_TRAPSTS_PRE_SAVECTX_SIZE 	=	10
+var	SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK 	=	0xFFFFF800
+var	SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT 	=	11
+var	SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE 	=	21
+
+var SQ_WAVE_IB_STS_RCNT_SHIFT			=	16					//FIXME
+var SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT	=	15					//FIXME
+var SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG	= 0x00007FFF	//FIXME
+
+var	SQ_BUF_RSRC_WORD1_ATC_SHIFT		=	24
+var	SQ_BUF_RSRC_WORD3_MTYPE_SHIFT	=	27
+
+
+/*      Save        */
+var	S_SAVE_BUF_RSRC_WORD1_STRIDE		=	0x00040000  		//stride is 4 bytes
+var	S_SAVE_BUF_RSRC_WORD3_MISC			= 	0x00807FAC			//SQ_SEL_X/Y/Z/W, BUF_NUM_FORMAT_FLOAT, (0 for MUBUF stride[17:14] when ADD_TID_ENABLE and BUF_DATA_FORMAT_32 for MTBUF), ADD_TID_ENABLE
+
+var	S_SAVE_SPI_INIT_ATC_MASK			=	0x08000000			//bit[27]: ATC bit
+var	S_SAVE_SPI_INIT_ATC_SHIFT			=	27
+var	S_SAVE_SPI_INIT_MTYPE_MASK			=	0x70000000			//bit[30:28]: Mtype
+var	S_SAVE_SPI_INIT_MTYPE_SHIFT			=	28
+var	S_SAVE_SPI_INIT_FIRST_WAVE_MASK		=	0x04000000			//bit[26]: FirstWaveInTG
+var	S_SAVE_SPI_INIT_FIRST_WAVE_SHIFT	=	26
+
+var S_SAVE_PC_HI_RCNT_SHIFT				=	27					//FIXME	 check with Brian to ensure all fields other than PC[47:0] can be used
+var S_SAVE_PC_HI_RCNT_MASK				=   0xF8000000			//FIXME
+var S_SAVE_PC_HI_FIRST_REPLAY_SHIFT		=	26					//FIXME
+var S_SAVE_PC_HI_FIRST_REPLAY_MASK		=	0x04000000			//FIXME
+
+var	s_save_spi_init_lo				=	exec_lo
+var s_save_spi_init_hi				=	exec_hi
+
+var	s_save_pc_lo			=	ttmp0			//{TTMP1, TTMP0} = {3��h0,pc_rewind[3:0], HT[0],trapID[7:0], PC[47:0]}
+var	s_save_pc_hi			=	ttmp1
+var s_save_exec_lo			=	ttmp2
+var s_save_exec_hi			= 	ttmp3
+var	s_save_status			=	ttmp4
+var	s_save_trapsts			=	ttmp5			//not really used until the end of the SAVE routine
+var s_save_xnack_mask_lo	=	ttmp6
+var s_save_xnack_mask_hi	=	ttmp7
+var	s_save_buf_rsrc0		=	ttmp8
+var	s_save_buf_rsrc1		=	ttmp9
+var	s_save_buf_rsrc2		=	ttmp10
+var	s_save_buf_rsrc3		=	ttmp11
+
+var s_save_mem_offset		= 	ttmp14
+var s_save_alloc_size		=	s_save_trapsts			//conflict
+var s_save_tmp              =   s_save_buf_rsrc2       	//shared with s_save_buf_rsrc2  (conflict: should not use mem access with s_save_tmp at the same time)
+var s_save_m0				=	ttmp15
+
+/*      Restore     */
+var	S_RESTORE_BUF_RSRC_WORD1_STRIDE			=	S_SAVE_BUF_RSRC_WORD1_STRIDE
+var	S_RESTORE_BUF_RSRC_WORD3_MISC			= 	S_SAVE_BUF_RSRC_WORD3_MISC
+
+var	S_RESTORE_SPI_INIT_ATC_MASK			    =	0x08000000			//bit[27]: ATC bit
+var	S_RESTORE_SPI_INIT_ATC_SHIFT			=	27
+var	S_RESTORE_SPI_INIT_MTYPE_MASK			=	0x70000000			//bit[30:28]: Mtype
+var	S_RESTORE_SPI_INIT_MTYPE_SHIFT			=	28
+var	S_RESTORE_SPI_INIT_FIRST_WAVE_MASK		=	0x04000000			//bit[26]: FirstWaveInTG
+var	S_RESTORE_SPI_INIT_FIRST_WAVE_SHIFT	    =	26
+
+var S_RESTORE_PC_HI_RCNT_SHIFT				=	S_SAVE_PC_HI_RCNT_SHIFT
+var S_RESTORE_PC_HI_RCNT_MASK				=   S_SAVE_PC_HI_RCNT_MASK
+var S_RESTORE_PC_HI_FIRST_REPLAY_SHIFT		=	S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
+var S_RESTORE_PC_HI_FIRST_REPLAY_MASK		=	S_SAVE_PC_HI_FIRST_REPLAY_MASK
+
+var s_restore_spi_init_lo                   =   exec_lo
+var s_restore_spi_init_hi                   =   exec_hi
+
+var s_restore_mem_offset		= 	ttmp12
+var s_restore_alloc_size		=	ttmp3
+var s_restore_tmp           	=   ttmp6
+var s_restore_mem_offset_save	= 	s_restore_tmp 		//no conflict
+
+var s_restore_m0			=	s_restore_alloc_size	//no conflict
+
+var s_restore_mode			=  	ttmp7
+
+var	s_restore_pc_lo		    =	ttmp0
+var	s_restore_pc_hi		    =	ttmp1
+var s_restore_exec_lo		=	ttmp14
+var s_restore_exec_hi		= 	ttmp15
+var	s_restore_status	    =	ttmp4
+var	s_restore_trapsts	    =	ttmp5
+var s_restore_xnack_mask_lo	=	xnack_mask_lo
+var s_restore_xnack_mask_hi	=	xnack_mask_hi
+var	s_restore_buf_rsrc0		=	ttmp8
+var	s_restore_buf_rsrc1		=	ttmp9
+var	s_restore_buf_rsrc2		=	ttmp10
+var	s_restore_buf_rsrc3		=	ttmp11
+
+/**************************************************************************/
+/*                     	trap handler entry points			              */
+/**************************************************************************/
+    if ((EMU_RUN_HACK) && (!EMU_RUN_HACK_RESTORE_NORMAL)) 					//hack to use trap_id for determining save/restore
+		//FIXME VCCZ un-init assertion s_getreg_b32  	s_save_status, hwreg(HW_REG_STATUS)			//save STATUS since we will change SCC
+		s_and_b32 s_save_tmp, s_save_pc_hi, 0xffff0000 				//change SCC
+    	s_cmp_eq_u32 s_save_tmp, 0x007e0000  						//Save: trap_id = 0x7e. Restore: trap_id = 0x7f.
+    	s_cbranch_scc0 L_JUMP_TO_RESTORE							//do not need to recover STATUS here  since we are going to RESTORE
+		//FIXME  s_setreg_b32 	hwreg(HW_REG_STATUS), 	s_save_status		//need to recover STATUS since we are going to SAVE
+		s_branch L_SKIP_RESTORE 									//NOT restore, SAVE actually
+	else
+		s_branch L_SKIP_RESTORE 									//NOT restore. might be a regular trap or save
+    end
+
+L_JUMP_TO_RESTORE:
+    s_branch L_RESTORE												//restore
+
+L_SKIP_RESTORE:
+
+	s_getreg_b32  	s_save_status, hwreg(HW_REG_STATUS)								//save STATUS since we will change SCC
+	s_andn2_b32		s_save_status, s_save_status, SQ_WAVE_STATUS_SPI_PRIO_MASK      //check whether this is for save
+	s_getreg_b32  	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	s_and_b32		s_save_trapsts, s_save_trapsts, SQ_WAVE_TRAPSTS_SAVECTX_MASK	//check whether this is for save
+	s_cbranch_scc1	L_SAVE															//this is the operation for save
+
+	// *********    Handle non-CWSR traps       *******************
+    if (!EMU_RUN_HACK)
+		s_getreg_b32     s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+		s_and_b32        s_save_trapsts, s_save_trapsts, SQ_WAVE_TRAPSTS_EXCE_MASK // Check whether it is an exception
+		s_cbranch_scc1  L_EXCP_CASE   // Exception, jump back to the shader program directly.
+		s_add_u32    ttmp0, ttmp0, 4   // S_TRAP case, add 4 to ttmp0
+
+		L_EXCP_CASE:
+		s_and_b32    ttmp1, ttmp1, 0xFFFF
+		s_rfe_b64    [ttmp0, ttmp1]
+	end
+    // *********        End handling of non-CWSR traps   *******************
+
+/**************************************************************************/
+/*                     	save routine						              */
+/**************************************************************************/
+
+L_SAVE:
+
+	//check whether there is mem_viol
+	s_getreg_b32  	s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	s_and_b32		s_save_trapsts, s_save_trapsts, SQ_WAVE_TRAPSTS_MEM_VIOL_MASK
+	s_cbranch_scc0	L_NO_PC_REWIND
+
+	//if so, need rewind PC assuming GDS operation gets NACKed
+	s_mov_b32       s_save_tmp, 0															//clear mem_viol bit
+	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_MEM_VIOL_SHIFT, 1), s_save_tmp	//clear mem_viol bit
+	s_and_b32 		s_save_pc_hi, s_save_pc_hi, 0x0000ffff    //pc[47:32]
+	s_sub_u32 		s_save_pc_lo, s_save_pc_lo, 8             //pc[31:0]-8
+	s_subb_u32 		s_save_pc_hi, s_save_pc_hi, 0x0			  // -scc
+
+L_NO_PC_REWIND:
+    s_mov_b32       s_save_tmp, 0															//clear saveCtx bit
+	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_SAVECTX_SHIFT, 1), s_save_tmp		//clear saveCtx bit
+
+	s_mov_b32		s_save_xnack_mask_lo,	xnack_mask_lo									//save XNACK_MASK
+	s_mov_b32		s_save_xnack_mask_hi,	xnack_mask_hi
+	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_RCNT_SHIFT, SQ_WAVE_IB_STS_RCNT_SIZE)					//save RCNT
+	s_lshl_b32		s_save_tmp, s_save_tmp, S_SAVE_PC_HI_RCNT_SHIFT
+	s_or_b32		s_save_pc_hi, s_save_pc_hi, s_save_tmp
+	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT, SQ_WAVE_IB_STS_FIRST_REPLAY_SIZE)	//save FIRST_REPLAY
+	s_lshl_b32		s_save_tmp, s_save_tmp, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
+	s_or_b32		s_save_pc_hi, s_save_pc_hi, s_save_tmp
+	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS)										//clear RCNT and FIRST_REPLAY in IB_STS
+	s_and_b32		s_save_tmp, s_save_tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG
+
+	s_setreg_b32	hwreg(HW_REG_IB_STS), s_save_tmp
+
+	/*		inform SPI the readiness and wait for SPI's go signal */
+	s_mov_b32		s_save_exec_lo,	exec_lo													//save EXEC and use EXEC for the go signal from SPI
+	s_mov_b32		s_save_exec_hi,	exec_hi
+	s_mov_b64		exec, 	0x0																//clear EXEC to get ready to receive
+	if (EMU_RUN_HACK)
+
+	else
+		s_sendmsg	sendmsg(MSG_SAVEWAVE)													//send SPI a message and wait for SPI's write to EXEC
+	end
+
+  L_SLEEP:
+	s_sleep 0x2
+
+	if (EMU_RUN_HACK)
+
+	else
+		s_cbranch_execz	L_SLEEP
+	end
+
+
+	/*      setup Resource Contants    */
+	if ((EMU_RUN_HACK) && (!EMU_RUN_HACK_SAVE_SINGLE_WAVE))
+		//calculate wd_addr using absolute thread id
+		v_readlane_b32 s_save_tmp, v9, 0
+		s_lshr_b32 s_save_tmp, s_save_tmp, 6
+		s_mul_i32 s_save_tmp, s_save_tmp, WAVE_SPACE
+		s_add_i32 s_save_spi_init_lo, s_save_tmp, WG_BASE_ADDR_LO
+		s_mov_b32 s_save_spi_init_hi, WG_BASE_ADDR_HI
+		s_and_b32 s_save_spi_init_hi, s_save_spi_init_hi, CTX_SAVE_CONTROL
+	else
+	end
+	if ((EMU_RUN_HACK) && (EMU_RUN_HACK_SAVE_SINGLE_WAVE))
+		s_add_i32 s_save_spi_init_lo, s_save_tmp, WG_BASE_ADDR_LO
+		s_mov_b32 s_save_spi_init_hi, WG_BASE_ADDR_HI
+		s_and_b32 s_save_spi_init_hi, s_save_spi_init_hi, CTX_SAVE_CONTROL
+	else
+	end
+
+
+	s_mov_b32		s_save_buf_rsrc0, 	s_save_spi_init_lo														//base_addr_lo
+	s_and_b32		s_save_buf_rsrc1, 	s_save_spi_init_hi, 0x0000FFFF											//base_addr_hi
+	s_or_b32		s_save_buf_rsrc1, 	s_save_buf_rsrc1,  S_SAVE_BUF_RSRC_WORD1_STRIDE
+    s_mov_b32       s_save_buf_rsrc2,   0                                               						//NUM_RECORDS initial value = 0 (in bytes) although not neccessarily inited
+	s_mov_b32		s_save_buf_rsrc3, 	S_SAVE_BUF_RSRC_WORD3_MISC
+	s_and_b32		s_save_tmp,         s_save_spi_init_hi, S_SAVE_SPI_INIT_ATC_MASK
+	s_lshr_b32		s_save_tmp,  		s_save_tmp, (S_SAVE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)			//get ATC bit into position
+	s_or_b32		s_save_buf_rsrc3, 	s_save_buf_rsrc3,  s_save_tmp											//or ATC TODO: ATC deprecated, no need anymore.
+	s_and_b32		s_save_tmp,         s_save_spi_init_hi, S_SAVE_SPI_INIT_MTYPE_MASK
+	s_lshr_b32		s_save_tmp,  		s_save_tmp, (S_SAVE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)		//get MTYPE bits into position
+	s_or_b32		s_save_buf_rsrc3, 	s_save_buf_rsrc3,  s_save_tmp											//or MTYPE
+
+	s_mov_b32		s_save_m0,			m0																	//save M0
+
+	/* 		global mem offset			*/
+	s_mov_b32		s_save_mem_offset, 	0x0																		//mem offset initial value = 0
+
+
+	/*      the first wave in the threadgroup    */
+	s_barrier																		//FIXME  not performance-optimal "LDS is used? wait for other waves in the same TG"
+	s_and_b32		s_save_tmp, s_save_spi_init_hi, S_SAVE_SPI_INIT_FIRST_WAVE_MASK								//exec is still used here
+	s_cbranch_scc0	L_SAVE_VGPR
+
+	/*      	save LDS	    */
+	//////////////////////////////
+  L_SAVE_LDS:
+
+	s_mov_b32		exec_lo, 0xFFFFFFFF 											//need every thread from now on
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_save_alloc_size, hwreg(HW_REG_LDS_ALLOC,SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT,SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE) 			//lds_size
+	s_and_b32		s_save_alloc_size, s_save_alloc_size, 0xFFFFFFFF				//lds_size is zero?
+	s_cbranch_scc0	L_SAVE_VGPR														//no lds used? jump to L_SAVE_VGPR
+	s_lshl_b32 		s_save_alloc_size, s_save_alloc_size, 6 						//LDS size in dwords = lds_size * 64dw
+	s_lshl_b32 		s_save_alloc_size, s_save_alloc_size, 2 						//LDS size in bytes
+	s_mov_b32		s_save_buf_rsrc2,  s_save_alloc_size  							//NUM_RECORDS in bytes
+	if (SWIZZLE_EN)
+		s_add_u32		s_save_buf_rsrc2, s_save_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_save_buf_rsrc2,  0x1000000								//NUM_RECORDS in bytes
+	end
+	s_mov_b32 		m0, 0x0 														//lds_offset initial value = 0
+	s_nop           0x0                                                             //Manually inserted wait states
+
+  L_SAVE_LDS_LOOP:
+	if (SAVE_LDS)
+	buffer_store_lds_dword	s_save_buf_rsrc0, s_save_mem_offset lds:1
+	end
+	s_add_u32		m0, m0, 256															//every buffer_store_lds does 256 bytes
+	s_add_u32		s_save_mem_offset, s_save_mem_offset, 256							//mem offset increased by 256 bytes
+	s_cmp_lt_u32	m0, s_save_alloc_size												//scc=(m0 < s_save_alloc_size) ? 1 : 0
+	s_cbranch_scc1  L_SAVE_LDS_LOOP														//LDS save is complete?
+
+
+	/*      	save VGPRs	    */
+	//////////////////////////////
+  L_SAVE_VGPR:
+
+ 	s_mov_b32		exec_lo, 0xFFFFFFFF 											//need every thread from now on
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_save_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE) 					//vpgr_size
+	s_add_u32 		s_save_alloc_size, s_save_alloc_size, 1
+	s_lshl_b32 		s_save_alloc_size, s_save_alloc_size, 2 						//Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)   //FIXME for GFX, zero is possible
+	s_lshl_b32		s_save_buf_rsrc2,  s_save_alloc_size, 8							//NUM_RECORDS in bytes (64 threads*4)
+	if (SWIZZLE_EN)
+		s_add_u32		s_save_buf_rsrc2, s_save_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_save_buf_rsrc2,  0x1000000								//NUM_RECORDS in bytes
+	end
+
+    s_mov_b32 		m0, 0x0 														//VGPR initial index value =0
+	s_set_gpr_idx_on  m0, 0x1														//M0[7:0] = M0[7:0] and M0[15:12] = 0x1
+    s_add_u32		s_save_alloc_size, s_save_alloc_size, 0x1000					//add 0x1000 since we compare m0 against it later
+
+  L_SAVE_VGPR_LOOP:
+	v_mov_b32 		v0, v0															//v0 = v[0+m0]
+
+    if(USE_MTBUF_INSTEAD_OF_MUBUF)
+		tbuffer_store_format_x v0, v0, s_save_buf_rsrc0, s_save_mem_offset format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+    else
+		buffer_store_dword v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+	end
+
+    s_add_u32		m0, m0, 1														//next vgpr index
+	s_add_u32		s_save_mem_offset, s_save_mem_offset, 256						//every buffer_store_dword does 256 bytes
+	s_cmp_lt_u32 	m0,	s_save_alloc_size 											//scc = (m0 < s_save_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_SAVE_VGPR_LOOP												//VGPR save is complete?
+	s_set_gpr_idx_off
+
+
+    /*      	save ACC_VGPRs	    */
+	//////////////////////////////
+  L_SAVE_ACC_VGPR:
+
+ 	s_mov_b32		exec_lo, 0xFFFFFFFF 											//need every thread from now on
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_save_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE) 					//vpgr_size
+	s_add_u32 		s_save_alloc_size, s_save_alloc_size, 1
+	s_lshl_b32 		s_save_alloc_size, s_save_alloc_size, 2 						//Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)   //FIXME for GFX, zero is possible
+	s_lshl_b32		s_save_buf_rsrc2,  s_save_alloc_size, 8							//NUM_RECORDS in bytes (64 threads*4)
+	if (SWIZZLE_EN)
+		s_add_u32		s_save_buf_rsrc2, s_save_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_save_buf_rsrc2,  0x1000000								//NUM_RECORDS in bytes
+	end
+
+    s_mov_b32 		m0, 0x0 														//VGPR initial index value =0
+	s_set_gpr_idx_on  m0, 0x1														//M0[7:0] = M0[7:0] and M0[15:12] = 0x1
+    s_add_u32		s_save_alloc_size, s_save_alloc_size, 0x1000					//add 0x1000 since we compare m0 against it later
+
+  L_SAVE_ACC_VGPR_LOOP:
+    v_accvgpr_read  v0, v0
+	v_nop
+    v_nop
+    if(USE_MTBUF_INSTEAD_OF_MUBUF)
+		tbuffer_store_format_x v0, v0, s_save_buf_rsrc0, s_save_mem_offset format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+    else
+		buffer_store_dword v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+	end
+
+    s_add_u32		m0, m0, 1														//next vgpr index
+	s_add_u32		s_save_mem_offset, s_save_mem_offset, 256						//every buffer_store_dword does 256 bytes
+	s_cmp_lt_u32 	m0,	s_save_alloc_size 											//scc = (m0 < s_save_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_SAVE_ACC_VGPR_LOOP												//VGPR save is complete?
+	s_set_gpr_idx_off
+
+
+	/*      	save SGPRs	    */
+	//////////////////////////////
+	s_getreg_b32 	s_save_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SIZE) 				//spgr_size
+	s_add_u32 		s_save_alloc_size, s_save_alloc_size, 1
+	s_lshl_b32 		s_save_alloc_size, s_save_alloc_size, 4 						//Number of SGPRs = (sgpr_size + 1) * 16   (non-zero value)
+
+	if (SGPR_SAVE_USE_SQC)
+		s_lshl_b32		s_save_buf_rsrc2,	s_save_alloc_size, 2					//NUM_RECORDS in bytes
+	else
+		s_lshl_b32		s_save_buf_rsrc2,	s_save_alloc_size, 8					//NUM_RECORDS in bytes (64 threads)
+	end
+
+	if (SWIZZLE_EN)
+		s_add_u32		s_save_buf_rsrc2, s_save_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_save_buf_rsrc2,  0x1000000								//NUM_RECORDS in bytes
+	end
+
+	s_mov_b32 		m0, 0x0 														//SGPR initial index value =0
+    s_nop           0x0                                                             //Manually inserted wait states
+
+  L_SAVE_SGPR_LOOP:
+	s_movrels_b32 	s0, s0 															//s0 = s[0+m0]
+	write_sgpr_to_mem(s0, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)							//PV: the best performance should be using s_buffer_store_dwordx4
+	s_add_u32		m0, m0, 1														//next sgpr index
+	s_cmp_lt_u32 	m0, s_save_alloc_size 											//scc = (m0 < s_save_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_SAVE_SGPR_LOOP												//SGPR save is complete?
+
+	/* 		save HW registers	*/
+	//////////////////////////////
+  L_SAVE_HWREG:
+    s_mov_b32		s_save_buf_rsrc2, 0x4								//NUM_RECORDS	in bytes
+	if (SWIZZLE_EN)
+		s_add_u32		s_save_buf_rsrc2, s_save_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_save_buf_rsrc2,  0x1000000								//NUM_RECORDS in bytes
+	end
+
+
+	write_sgpr_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)					//M0
+
+	if ((EMU_RUN_HACK) && (EMU_RUN_HACK_SAVE_FIRST_TIME))
+		s_add_u32 s_save_pc_lo, s_save_pc_lo, 4             //pc[31:0]+4
+		s_addc_u32 s_save_pc_hi, s_save_pc_hi, 0x0			//carry bit over
+	end
+
+	write_sgpr_to_mem(s_save_pc_lo, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)					//PC
+	write_sgpr_to_mem(s_save_pc_hi, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)
+	write_sgpr_to_mem(s_save_exec_lo, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)				//EXEC
+	write_sgpr_to_mem(s_save_exec_hi, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)
+	write_sgpr_to_mem(s_save_status, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)				//STATUS
+
+	//s_save_trapsts conflicts with s_save_alloc_size
+	s_getreg_b32    s_save_trapsts, hwreg(HW_REG_TRAPSTS)
+	write_sgpr_to_mem(s_save_trapsts, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)				//TRAPSTS
+
+	write_sgpr_to_mem(s_save_xnack_mask_lo, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)			//XNACK_MASK_LO
+	write_sgpr_to_mem(s_save_xnack_mask_hi, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)			//XNACK_MASK_HI
+
+	//use s_save_tmp would introduce conflict here between s_save_tmp and s_save_buf_rsrc2
+	s_getreg_b32 	s_save_m0, hwreg(HW_REG_MODE)																						//MODE
+	write_sgpr_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset, SGPR_SAVE_USE_SQC, USE_MTBUF_INSTEAD_OF_MUBUF)
+
+	/*     S_PGM_END_SAVED  */    							//FIXME  graphics ONLY
+	if ((EMU_RUN_HACK) && (!EMU_RUN_HACK_SAVE_NORMAL_EXIT))
+		s_and_b32 s_save_pc_hi, s_save_pc_hi, 0x0000ffff    //pc[47:32]
+		s_add_u32 s_save_pc_lo, s_save_pc_lo, 4             //pc[31:0]+4
+		s_addc_u32 s_save_pc_hi, s_save_pc_hi, 0x0			//carry bit over
+		s_rfe_b64 s_save_pc_lo                              //Return to the main shader program
+	else
+	end
+
+
+    s_branch	L_END_PGM
+
+
+
+/**************************************************************************/
+/*                     	restore routine						              */
+/**************************************************************************/
+
+L_RESTORE:
+    /*      Setup Resource Contants    */
+    if ((EMU_RUN_HACK) && (!EMU_RUN_HACK_RESTORE_NORMAL))
+		//calculate wd_addr using absolute thread id
+		v_readlane_b32 s_restore_tmp, v9, 0
+		s_lshr_b32 s_restore_tmp, s_restore_tmp, 6
+		s_mul_i32 s_restore_tmp, s_restore_tmp, WAVE_SPACE
+		s_add_i32 s_restore_spi_init_lo, s_restore_tmp, WG_BASE_ADDR_LO
+		s_mov_b32 s_restore_spi_init_hi, WG_BASE_ADDR_HI
+		s_and_b32 s_restore_spi_init_hi, s_restore_spi_init_hi, CTX_RESTORE_CONTROL
+	else
+	end
+
+    s_mov_b32		s_restore_buf_rsrc0, 	s_restore_spi_init_lo															//base_addr_lo
+	s_and_b32		s_restore_buf_rsrc1, 	s_restore_spi_init_hi, 0x0000FFFF												//base_addr_hi
+	s_or_b32		s_restore_buf_rsrc1, 	s_restore_buf_rsrc1,  S_RESTORE_BUF_RSRC_WORD1_STRIDE
+    s_mov_b32       s_restore_buf_rsrc2,   	0                                               								//NUM_RECORDS initial value = 0 (in bytes)
+	s_mov_b32		s_restore_buf_rsrc3, 	S_RESTORE_BUF_RSRC_WORD3_MISC
+	s_and_b32		s_restore_tmp,         	s_restore_spi_init_hi, S_RESTORE_SPI_INIT_ATC_MASK
+	s_lshr_b32		s_restore_tmp,  		s_restore_tmp, (S_RESTORE_SPI_INIT_ATC_SHIFT-SQ_BUF_RSRC_WORD1_ATC_SHIFT)		//get ATC bit into position
+	s_or_b32		s_restore_buf_rsrc3, 	s_restore_buf_rsrc3,  s_restore_tmp												//or ATC TODO: ATC deprecated, no need anymore.
+	s_and_b32		s_restore_tmp,         	s_restore_spi_init_hi, S_RESTORE_SPI_INIT_MTYPE_MASK
+	s_lshr_b32		s_restore_tmp,  		s_restore_tmp, (S_RESTORE_SPI_INIT_MTYPE_SHIFT-SQ_BUF_RSRC_WORD3_MTYPE_SHIFT)	//get MTYPE bits into position
+	s_or_b32		s_restore_buf_rsrc3, 	s_restore_buf_rsrc3,  s_restore_tmp												//or MTYPE
+
+	/* 		global mem offset			*/
+	s_mov_b32		s_restore_mem_offset, 0x0								//mem offset initial value = 0
+
+	/*      the first wave in the threadgroup    */
+	s_and_b32		s_restore_tmp, s_restore_spi_init_hi, S_RESTORE_SPI_INIT_FIRST_WAVE_MASK
+	s_cbranch_scc0	L_RESTORE_VGPR
+
+    /*      	restore LDS	    */
+	//////////////////////////////
+  L_RESTORE_LDS:
+
+	s_mov_b32		exec_lo, 0xFFFFFFFF 													//need every thread from now on   //be consistent with SAVE although can be moved ahead
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_restore_alloc_size, hwreg(HW_REG_LDS_ALLOC,SQ_WAVE_LDS_ALLOC_LDS_SIZE_SHIFT,SQ_WAVE_LDS_ALLOC_LDS_SIZE_SIZE) 				//lds_size
+	s_and_b32		s_restore_alloc_size, s_restore_alloc_size, 0xFFFFFFFF					//lds_size is zero?
+	s_cbranch_scc0	L_RESTORE_VGPR															//no lds used? jump to L_RESTORE_VGPR
+	s_lshl_b32 		s_restore_alloc_size, s_restore_alloc_size, 6 							//LDS size in dwords = lds_size * 64dw
+	s_lshl_b32 		s_restore_alloc_size, s_restore_alloc_size, 2 							//LDS size in bytes
+	s_mov_b32		s_restore_buf_rsrc2,	s_restore_alloc_size							//NUM_RECORDS in bytes
+	if (SWIZZLE_EN)
+		s_add_u32		s_restore_buf_rsrc2, s_restore_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_restore_buf_rsrc2,  0x1000000										//NUM_RECORDS in bytes
+	end
+	s_mov_b32 		m0, 0x0 																//lds_offset initial value = 0
+
+  L_RESTORE_LDS_LOOP:
+	if (SAVE_LDS)
+	buffer_load_dword	v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset lds:1
+	end
+    s_add_u32		m0, m0, 256																//every buffer_load_dword does 256 bytes
+	s_add_u32		s_restore_mem_offset, s_restore_mem_offset, 256							//mem offset increased by 256 bytes
+	s_cmp_lt_u32	m0, s_restore_alloc_size												//scc=(m0 < s_restore_alloc_size) ? 1 : 0
+	s_cbranch_scc1  L_RESTORE_LDS_LOOP														//LDS restore is complete?
+
+
+    /*      	restore VGPRs	    */
+	//////////////////////////////
+  L_RESTORE_VGPR:
+
+ 	s_mov_b32		exec_lo, 0xFFFFFFFF 													//need every thread from now on   //be consistent with SAVE although can be moved ahead
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_restore_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE) 	//vpgr_size
+	s_add_u32 		s_restore_alloc_size, s_restore_alloc_size, 1
+	s_lshl_b32 		s_restore_alloc_size, s_restore_alloc_size, 2 							//Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)
+    s_lshl_b32		s_restore_buf_rsrc2,  s_restore_alloc_size, 8						    //NUM_RECORDS in bytes (64 threads*4)
+	if (SWIZZLE_EN)
+		s_add_u32		s_restore_buf_rsrc2, s_restore_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_restore_buf_rsrc2,  0x1000000										//NUM_RECORDS in bytes
+	end
+	s_mov_b32		s_restore_mem_offset_save, s_restore_mem_offset							// restore start with v1, v0 will be the last
+	s_add_u32		s_restore_mem_offset, s_restore_mem_offset, 256
+    s_mov_b32 		m0, 1 																	//VGPR initial index value = 1
+	s_set_gpr_idx_on  m0, 0x8																//M0[7:0] = M0[7:0] and M0[15:12] = 0x8
+    s_add_u32		s_restore_alloc_size, s_restore_alloc_size, 0x8000						//add 0x8000 since we compare m0 against it later
+
+  L_RESTORE_VGPR_LOOP:
+    if(USE_MTBUF_INSTEAD_OF_MUBUF)
+		tbuffer_load_format_x v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+    else
+		buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset	slc:1 glc:1
+	end
+	s_waitcnt		vmcnt(0)																//ensure data ready
+	v_mov_b32		v0, v0																	//v[0+m0] = v0
+    s_add_u32		m0, m0, 1																//next vgpr index
+	s_add_u32		s_restore_mem_offset, s_restore_mem_offset, 256							//every buffer_load_dword does 256 bytes
+	s_cmp_lt_u32 	m0,	s_restore_alloc_size 												//scc = (m0 < s_restore_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_RESTORE_VGPR_LOOP														//VGPR restore (except v0) is complete?
+	s_set_gpr_idx_off
+
+
+    /*      	restore ACC_VGPRs	    */
+	//////////////////////////////
+  L_RESTORE_ACC_VGPR:
+
+ 	s_mov_b32		exec_lo, 0xFFFFFFFF 													//need every thread from now on   //be consistent with SAVE although can be moved ahead
+	s_mov_b32		exec_hi, 0xFFFFFFFF
+
+	s_getreg_b32 	s_restore_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_VGPR_SIZE_SIZE) 	//vpgr_size
+	s_add_u32 		s_restore_alloc_size, s_restore_alloc_size, 1
+	s_lshl_b32 		s_restore_alloc_size, s_restore_alloc_size, 2 							//Number of VGPRs = (vgpr_size + 1) * 4    (non-zero value)
+    s_lshl_b32		s_restore_buf_rsrc2,  s_restore_alloc_size, 8						    //NUM_RECORDS in bytes (64 threads*4)
+	if (SWIZZLE_EN)
+		s_add_u32		s_restore_buf_rsrc2, s_restore_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_restore_buf_rsrc2,  0x1000000										//NUM_RECORDS in bytes
+	end
+    s_mov_b32 		m0, 0 																	//VGPR initial index value = 0
+	s_set_gpr_idx_on  m0, 0x8																//M0[7:0] = M0[7:0] and M0[15:12] = 0x8
+    s_add_u32		s_restore_alloc_size, s_restore_alloc_size, 0x8000						//add 0x8000 since we compare m0 against it later
+
+  L_RESTORE_ACC_VGPR_LOOP:
+    if(USE_MTBUF_INSTEAD_OF_MUBUF)
+		tbuffer_load_format_x v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+    else
+		buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset	slc:1 glc:1
+	end
+	s_waitcnt		vmcnt(0)																//ensure data ready
+	v_accvgpr_write		v0, v0															//v[0+m0] = v0
+    s_add_u32		m0, m0, 1																//next vgpr index
+	s_add_u32		s_restore_mem_offset, s_restore_mem_offset, 256							//every buffer_load_dword does 256 bytes
+	s_cmp_lt_u32 	m0,	s_restore_alloc_size 												//scc = (m0 < s_restore_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_RESTORE_ACC_VGPR_LOOP														//VGPR restore (except v0) is complete?
+	s_set_gpr_idx_off
+																							/* VGPR restore on v0 */
+    if(USE_MTBUF_INSTEAD_OF_MUBUF)
+		tbuffer_load_format_x v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+    else
+		buffer_load_dword v0, v0, s_restore_buf_rsrc0, s_restore_mem_offset_save	slc:1 glc:1
+	end
+
+    /*      	restore SGPRs	    */
+	//////////////////////////////
+	s_getreg_b32 	s_restore_alloc_size, hwreg(HW_REG_GPR_ALLOC,SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SHIFT,SQ_WAVE_GPR_ALLOC_SGPR_SIZE_SIZE) 				//spgr_size
+	s_add_u32 		s_restore_alloc_size, s_restore_alloc_size, 1
+	s_lshl_b32 		s_restore_alloc_size, s_restore_alloc_size, 4 							//Number of SGPRs = (sgpr_size + 1) * 16   (non-zero value)
+
+	if (SGPR_SAVE_USE_SQC)
+		s_lshl_b32		s_restore_buf_rsrc2,	s_restore_alloc_size, 2						//NUM_RECORDS in bytes
+	else
+		s_lshl_b32		s_restore_buf_rsrc2,	s_restore_alloc_size, 8						//NUM_RECORDS in bytes (64 threads)
+	end
+	if (SWIZZLE_EN)
+		s_add_u32		s_restore_buf_rsrc2, s_restore_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_restore_buf_rsrc2,  0x1000000										//NUM_RECORDS in bytes
+	end
+	read_sgpr_from_mem(s_restore_tmp, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)		//save s0 to s_restore_tmp
+	s_mov_b32 		m0, 0x1																				//SGPR initial index value =1	//go on with with s1
+
+  L_RESTORE_SGPR_LOOP:
+	read_sgpr_from_mem(s0, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)															//PV: further performance improvement can be made
+	s_waitcnt		lgkmcnt(0)																//ensure data ready
+	s_movreld_b32 	s0, s0 																	//s[0+m0] = s0
+	s_nop 0 // hazard SALU M0=> S_MOVREL
+    s_add_u32		m0, m0, 1																//next sgpr index
+	s_cmp_lt_u32 	m0, s_restore_alloc_size 												//scc = (m0 < s_restore_alloc_size) ? 1 : 0
+	s_cbranch_scc1 	L_RESTORE_SGPR_LOOP														//SGPR restore (except s0) is complete?
+	s_mov_b32		s0, s_restore_tmp															/* SGPR restore on s0 */
+
+    /* 		restore HW registers	*/
+	//////////////////////////////
+  L_RESTORE_HWREG:
+    s_mov_b32		s_restore_buf_rsrc2, 0x4												//NUM_RECORDS	in bytes
+	if (SWIZZLE_EN)
+		s_add_u32		s_restore_buf_rsrc2, s_restore_buf_rsrc2, 0x0						//FIXME need to use swizzle to enable bounds checking?
+	else
+		s_mov_b32		s_restore_buf_rsrc2,  0x1000000										//NUM_RECORDS in bytes
+	end
+
+	read_sgpr_from_mem(s_restore_m0, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)					//M0
+	read_sgpr_from_mem(s_restore_pc_lo, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)				//PC
+	read_sgpr_from_mem(s_restore_pc_hi, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)
+	read_sgpr_from_mem(s_restore_exec_lo, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)				//EXEC
+	read_sgpr_from_mem(s_restore_exec_hi, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)
+	read_sgpr_from_mem(s_restore_status, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)				//STATUS
+	read_sgpr_from_mem(s_restore_trapsts, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)				//TRAPSTS
+    read_sgpr_from_mem(xnack_mask_lo, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)					//XNACK_MASK_LO
+	read_sgpr_from_mem(xnack_mask_hi, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)					//XNACK_MASK_HI
+	read_sgpr_from_mem(s_restore_mode, s_restore_buf_rsrc0, s_restore_mem_offset, SGPR_SAVE_USE_SQC)				//MODE
+
+	s_waitcnt		lgkmcnt(0)																						//from now on, it is safe to restore STATUS and IB_STS
+
+	s_mov_b32 s_restore_tmp, s_restore_pc_hi
+	s_and_b32 s_restore_pc_hi, s_restore_tmp, 0x0000ffff    	//pc[47:32]        //Do it here in order not to affect STATUS
+
+	//for normal save & restore, the saved PC points to the next inst to execute, no adjustment needs to be made, otherwise:
+	if ((EMU_RUN_HACK) && (!EMU_RUN_HACK_RESTORE_NORMAL))
+		s_add_u32 s_restore_pc_lo, s_restore_pc_lo, 8            //pc[31:0]+8	  //two back-to-back s_trap are used (first for save and second for restore)
+		s_addc_u32	s_restore_pc_hi, s_restore_pc_hi, 0x0		 //carry bit over
+	end
+	if ((EMU_RUN_HACK) && (EMU_RUN_HACK_RESTORE_NORMAL))
+		s_add_u32 s_restore_pc_lo, s_restore_pc_lo, 4            //pc[31:0]+4     // save is hack through s_trap but restore is normal
+		s_addc_u32	s_restore_pc_hi, s_restore_pc_hi, 0x0		 //carry bit over
+	end
+
+	s_mov_b32 		m0, 		s_restore_m0
+	s_mov_b32 		exec_lo, 	s_restore_exec_lo
+	s_mov_b32 		exec_hi, 	s_restore_exec_hi
+
+	s_and_b32		s_restore_m0, SQ_WAVE_TRAPSTS_PRE_SAVECTX_MASK, s_restore_trapsts
+	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_PRE_SAVECTX_SHIFT, SQ_WAVE_TRAPSTS_PRE_SAVECTX_SIZE), s_restore_m0
+	s_and_b32		s_restore_m0, SQ_WAVE_TRAPSTS_POST_SAVECTX_MASK, s_restore_trapsts
+	s_lshr_b32		s_restore_m0, s_restore_m0, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT
+	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT, SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE), s_restore_m0
+	//s_setreg_b32 	hwreg(HW_REG_TRAPSTS), 	s_restore_trapsts      //don't overwrite SAVECTX bit as it may be set through external SAVECTX during restore
+	s_setreg_b32 	hwreg(HW_REG_MODE), 	s_restore_mode
+	//reuse s_restore_m0 as a temp register
+	s_and_b32		s_restore_m0, s_restore_tmp, S_SAVE_PC_HI_RCNT_MASK
+	s_lshr_b32		s_restore_m0, s_restore_m0, S_SAVE_PC_HI_RCNT_SHIFT
+	s_lshl_b32		s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_RCNT_SHIFT
+	s_mov_b32		s_restore_mode, 0x0																				//IB_STS is zero
+	s_or_b32		s_restore_mode, s_restore_mode, s_restore_m0
+	s_and_b32		s_restore_m0, s_restore_tmp, S_SAVE_PC_HI_FIRST_REPLAY_MASK
+	s_lshr_b32		s_restore_m0, s_restore_m0, S_SAVE_PC_HI_FIRST_REPLAY_SHIFT
+	s_lshl_b32		s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT
+	s_or_b32		s_restore_mode, s_restore_mode, s_restore_m0
+    s_and_b32       s_restore_m0, s_restore_status, SQ_WAVE_STATUS_INST_ATC_MASK
+    s_lshr_b32		s_restore_m0, s_restore_m0, SQ_WAVE_STATUS_INST_ATC_SHIFT
+	s_setreg_b32 	hwreg(HW_REG_IB_STS), 	s_restore_mode
+
+	s_and_b64    exec, exec, exec  // Restore STATUS.EXECZ, not writable by s_setreg_b32
+	s_and_b64    vcc, vcc, vcc  // Restore STATUS.VCCZ, not writable by s_setreg_b32
+	s_setreg_b32 	hwreg(HW_REG_STATUS), 	s_restore_status
+
+	s_barrier													//barrier to ensure the readiness of LDS before access attemps from any other wave in the same TG //FIXME not performance-optimal at this time
+
+
+//	s_rfe_b64 s_restore_pc_lo                              		//Return to the main shader program and resume execution
+    s_rfe_restore_b64  s_restore_pc_lo, s_restore_m0            // s_restore_m0[0] is used to set STATUS.inst_atc
+
+
+/**************************************************************************/
+/*                     	the END								              */
+/**************************************************************************/
+L_END_PGM:
+	s_endpgm
+
+end
+
+
+/**************************************************************************/
+/*                     	the helper functions							  */
+/**************************************************************************/
+
+function write_sgpr_to_mem(s, s_rsrc, s_mem_offset, use_sqc, use_mtbuf)
+	if (use_sqc)
+		s_mov_b32 exec_lo, m0					//assuming exec_lo is not needed anymore from this point on
+		s_mov_b32 m0, s_mem_offset
+		s_buffer_store_dword s, s_rsrc, m0		glc:1
+		s_add_u32		s_mem_offset, s_mem_offset, 4
+		s_mov_b32	m0, exec_lo
+	elsif (use_mtbuf)
+		v_mov_b32	v0,	s
+        tbuffer_store_format_x v0, v0, s_rsrc, s_mem_offset format:BUF_NUM_FORMAT_FLOAT format: BUF_DATA_FORMAT_32 slc:1 glc:1
+		s_add_u32		s_mem_offset, s_mem_offset, 256
+	else
+		v_mov_b32	v0,	s
+		buffer_store_dword	v0, v0, s_rsrc, s_mem_offset	slc:1 glc:1
+		s_add_u32		s_mem_offset, s_mem_offset, 256
+	end
+end
+
+
+
+function read_sgpr_from_mem(s, s_rsrc, s_mem_offset, use_sqc)
+	s_buffer_load_dword s, s_rsrc, s_mem_offset		glc:1
+	if (use_sqc)
+		s_add_u32		s_mem_offset, s_mem_offset, 4
+	else
+		s_add_u32		s_mem_offset, s_mem_offset, 256
+	end
+end
+
+
+
+
+
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index cc22289c92d1..c3cd683e1e97 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -553,6 +553,10 @@ static void kfd_cwsr_init(struct kfd_dev *kfd)
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx8_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx8_hex;
 			kfd->cwsr_isa_size = sizeof(cwsr_trap_gfx8_hex);
+		} else if (kfd->device_info->asic_family == CHIP_ARCTURUS) {
+			BUILD_BUG_ON(sizeof(cwsr_trap_arcturus_hex) > PAGE_SIZE);
+			kfd->cwsr_isa = cwsr_trap_arcturus_hex;
+			kfd->cwsr_isa_size = sizeof(cwsr_trap_arcturus_hex);
 		} else if (kfd->device_info->asic_family < CHIP_NAVI10) {
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx9_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx9_hex;
-- 
2.20.1


--===============0355519817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0355519817==--
