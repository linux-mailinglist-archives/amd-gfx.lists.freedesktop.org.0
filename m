Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9811B1EABA4
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F108C6E314;
	Mon,  1 Jun 2020 18:21:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179F76E31A
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:42 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c14so8976997qka.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FUh0RwOBXFRMnQdBtnfkfx4Sc6oO73fJT1lQYkzJ8Co=;
 b=FOS+qIg/cdw9ZGbAXdzo6sr869uFh1VxeNc8RUvW3Gq3N5zcmxUn2qNsToiBANgUeO
 tuKEaiIhuaE+kjKWO0/kxg7mR2FqLpQ+1KFpy4SasP7FSVFEEo8Ro3YwTp11lOKa1FaD
 YseYPSqAVUj6bX4XSKpejR2bMuSuZeGU7KZjNfVIA2twjcL0rmyq8EhR3X+5wp9aeO0g
 xIM0+ke6YvBuXPD0YUXrOVXI+QzSpIxggUzqFg8rSGlMIwS5jwEWKO8BbMe7hWsoy7Sz
 h0kuWIqTyC3HY1Jx2W48mR5rtz3aJcopNsSQfWMXqw+gTC+7Cy7yOekTmCJ/e7JUmXh2
 RVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FUh0RwOBXFRMnQdBtnfkfx4Sc6oO73fJT1lQYkzJ8Co=;
 b=TyXhWCY6GssOVDcd6y2mYivofhMVaYSKKE7bJkwLOuJFXTgojeWY1TadSKIUUQ6U77
 CFJTbgB98v0Zgk3Nxutiu0edbGMq+dmVcl6xxYDEMRIDaOE9wwv0KgvXbmK7S7/GkYwL
 FT6i4amoFV54kzgcplgs6z6nb8vzzjIizOjKSkuax4/qNqUmuMCnSOJHWmLuLch0GI5l
 K60jv4nXXhlUUvI1lAST/c/TrSlPZm2k3TuWkutvFEY3D73dlJGpb571l4wq6O2BnQNJ
 3lzxwNpYxOMZT7bu+4jbVXQqBRjpbxeQAfQDkE5/ekNfKSbrdQBh5ALiqPXoIrLVK9xO
 PXeA==
X-Gm-Message-State: AOAM531fgzIbwPXzzsVZIubTplKUeUvm7/CZUj7QiI9J0Ecwa8CuTenH
 fBJ+UzNxPInZdOKpmi3F4osDxbWD
X-Google-Smtp-Source: ABdhPJzrYEGdnvBKQYQq3bZhWNqJ5MfNktfd3Oknt7DIUXELsdwhEcjx5aQC22R2ypvWtl+9TnTQrg==
X-Received: by 2002:a37:9a87:: with SMTP id
 c129mr20877803qke.374.1591035700114; 
 Mon, 01 Jun 2020 11:21:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 117/207] drm/amdkfd: Add Sienna_Cichlid trap handler support
Date: Mon,  1 Jun 2020 14:19:24 -0400
Message-Id: <20200601182054.1267858-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <jay.cornwall@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jay Cornwall <jay.cornwall@amd.com>

- Replace SQC stores with TCP stores
- Synchronize with MSG_SAVEWAVE via lgkmcnt
- HW_REG_IB_STS is now read-only

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler.h    | 844 +++++++++++++-----
 .../amd/amdkfd/cwsr_trap_handler_gfx10.asm    | 154 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   4 +
 3 files changed, 731 insertions(+), 271 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
index d3400da6ab64..0aeff2cc3efe 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h
@@ -679,8 +679,8 @@ static const uint32_t cwsr_trap_gfx9_hex[] = {
 	0xbf810000, 0x00000000,
 };
 
-static const uint32_t cwsr_trap_gfx10_hex[] = {
-	0xbf820001, 0xbf8201c1,
+static const uint32_t cwsr_trap_nv1x_hex[] = {
+	0xbf820001, 0xbf8201bc,
 	0xb0804004, 0xb978f802,
 	0x8a788678, 0xb971f803,
 	0x876eff71, 0x00000400,
@@ -736,7 +736,22 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0x90768176, 0x88777677,
 	0xbefb037c, 0xbefa0380,
 	0xb97302dc, 0x8f739973,
-	0x8873737f, 0xb97a2a05,
+	0x8873737f, 0xbefe03c1,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0xbeff0380, 0xbf820002,
+	0xbeff03c1, 0xbf82000b,
+	0xbef603ff, 0x01000000,
+	0xe0704000, 0x7a5d0000,
+	0xe0704080, 0x7a5d0100,
+	0xe0704100, 0x7a5d0200,
+	0xe0704180, 0x7a5d0300,
+	0xbf82000a, 0xbef603ff,
+	0x01000000, 0xe0704000,
+	0x7a5d0000, 0xe0704100,
+	0x7a5d0100, 0xe0704200,
+	0x7a5d0200, 0xe0704300,
+	0x7a5d0300, 0xb97a2a05,
 	0x807a817a, 0x907c9973,
 	0x877c817c, 0xbf06817c,
 	0xbf850002, 0x8f7a897a,
@@ -779,9 +794,7 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xb97bf815, 0xbefe037c,
 	0xbefc037a, 0xf4611efa,
 	0xf8000000, 0x807a847a,
-	0xbefc037e, 0x8776ff7f,
-	0x04000000, 0xbeef0380,
-	0x886f6f76, 0xb97a2a05,
+	0xbefc037e, 0xb97a2a05,
 	0x807a817a, 0x907c9973,
 	0x877c817c, 0xbf06817c,
 	0xbf850002, 0x8f7a897a,
@@ -809,190 +822,105 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0xf469013a, 0xfa000010,
 	0xf469023a, 0xfa000020,
 	0x8074b074, 0x82758075,
-	0xbef40372, 0xbefa0380,
-	0xbefe03c1, 0x907c9973,
-	0x877c817c, 0xbf06817c,
-	0xbf850002, 0xbeff0380,
-	0xbf820002, 0xbeff03c1,
-	0xbf82000b, 0xbef603ff,
-	0x01000000, 0xe0704000,
-	0x7a5d0000, 0xe0704080,
-	0x7a5d0100, 0xe0704100,
-	0x7a5d0200, 0xe0704180,
-	0x7a5d0300, 0xbf82000a,
-	0xbef603ff, 0x01000000,
-	0xe0704000, 0x7a5d0000,
-	0xe0704100, 0x7a5d0100,
-	0xe0704200, 0x7a5d0200,
-	0xe0704300, 0x7a5d0300,
-	0xbefe03c1, 0x907c9973,
-	0x877c817c, 0xbf06817c,
-	0xbf850002, 0xbeff0380,
-	0xbf820001, 0xbeff03c1,
-	0xb9714306, 0x8771c171,
-	0xbf840046, 0xbf8a0000,
-	0x8776ff6f, 0x04000000,
-	0xbf840042, 0x8f718671,
-	0x8f718271, 0xbef60371,
-	0xb97a2a05, 0x807a817a,
+	0xbef40372, 0xbefe03c1,
 	0x907c9973, 0x877c817c,
 	0xbf06817c, 0xbf850002,
-	0x8f7a897a, 0xbf820001,
-	0x8f7a8a7a, 0xb9761e06,
-	0x8f768a76, 0x807a767a,
-	0x807aff7a, 0x00000200,
-	0x807aff7a, 0x00000080,
-	0xbef603ff, 0x01000000,
-	0xd7650000, 0x000100c1,
-	0xd7660000, 0x000200c1,
-	0x16000084, 0x907c9973,
+	0xbeff0380, 0xbf820001,
+	0xbeff03c1, 0xb9714306,
+	0x8771c171, 0xbf840046,
+	0xbf8a0000, 0x8776ff73,
+	0x04000000, 0xbf840042,
+	0x8f718671, 0x8f718271,
+	0xbef60371, 0xb97a2a05,
+	0x807a817a, 0x907c9973,
 	0x877c817c, 0xbf06817c,
-	0xbefc0380, 0xbf850012,
-	0xbe8303ff, 0x00000080,
+	0xbf850002, 0x8f7a897a,
+	0xbf820001, 0x8f7a8a7a,
+	0xb9761e06, 0x8f768a76,
+	0x807a767a, 0x807aff7a,
+	0x00000200, 0x807aff7a,
+	0x00000080, 0xbef603ff,
+	0x01000000, 0xd7650000,
+	0x000100c1, 0xd7660000,
+	0x000200c1, 0x16000084,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbefc0380,
+	0xbf850012, 0xbe8303ff,
+	0x00000080, 0xbf800000,
 	0xbf800000, 0xbf800000,
-	0xbf800000, 0xd8d80000,
-	0x01000000, 0xbf8c0000,
-	0xe0704000, 0x7a5d0100,
-	0x807c037c, 0x807a037a,
-	0xd5250000, 0x0001ff00,
-	0x00000080, 0xbf0a717c,
-	0xbf85fff4, 0xbf820011,
-	0xbe8303ff, 0x00000100,
+	0xd8d80000, 0x01000000,
+	0xbf8c0000, 0xe0704000,
+	0x7a5d0100, 0x807c037c,
+	0x807a037a, 0xd5250000,
+	0x0001ff00, 0x00000080,
+	0xbf0a717c, 0xbf85fff4,
+	0xbf820011, 0xbe8303ff,
+	0x00000100, 0xbf800000,
 	0xbf800000, 0xbf800000,
-	0xbf800000, 0xd8d80000,
-	0x01000000, 0xbf8c0000,
-	0xe0704000, 0x7a5d0100,
-	0x807c037c, 0x807a037a,
-	0xd5250000, 0x0001ff00,
-	0x00000100, 0xbf0a717c,
-	0xbf85fff4, 0xbefe03c1,
-	0x907c9973, 0x877c817c,
-	0xbf06817c, 0xbf850004,
-	0xbefa03ff, 0x00000200,
-	0xbeff0380, 0xbf820003,
-	0xbefa03ff, 0x00000400,
-	0xbeff03c1, 0xb9712a05,
-	0x80718171, 0x8f718271,
-	0x907c9973, 0x877c817c,
-	0xbf06817c, 0xbf850017,
+	0xd8d80000, 0x01000000,
+	0xbf8c0000, 0xe0704000,
+	0x7a5d0100, 0x807c037c,
+	0x807a037a, 0xd5250000,
+	0x0001ff00, 0x00000100,
+	0xbf0a717c, 0xbf85fff4,
+	0xbefe03c1, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850004, 0xbefa03ff,
+	0x00000200, 0xbeff0380,
+	0xbf820003, 0xbefa03ff,
+	0x00000400, 0xbeff03c1,
+	0xb9712a05, 0x80718171,
+	0x8f718271, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850017, 0xbef603ff,
+	0x01000000, 0xbefc0384,
+	0xbf0a717c, 0xbf840037,
+	0x7e008700, 0x7e028701,
+	0x7e048702, 0x7e068703,
+	0xe0704000, 0x7a5d0000,
+	0xe0704080, 0x7a5d0100,
+	0xe0704100, 0x7a5d0200,
+	0xe0704180, 0x7a5d0300,
+	0x807c847c, 0x807aff7a,
+	0x00000200, 0xbf0a717c,
+	0xbf85ffef, 0xbf820025,
 	0xbef603ff, 0x01000000,
 	0xbefc0384, 0xbf0a717c,
-	0xbf840037, 0x7e008700,
+	0xbf840020, 0x7e008700,
 	0x7e028701, 0x7e048702,
 	0x7e068703, 0xe0704000,
-	0x7a5d0000, 0xe0704080,
-	0x7a5d0100, 0xe0704100,
-	0x7a5d0200, 0xe0704180,
+	0x7a5d0000, 0xe0704100,
+	0x7a5d0100, 0xe0704200,
+	0x7a5d0200, 0xe0704300,
 	0x7a5d0300, 0x807c847c,
-	0x807aff7a, 0x00000200,
+	0x807aff7a, 0x00000400,
 	0xbf0a717c, 0xbf85ffef,
-	0xbf820025, 0xbef603ff,
-	0x01000000, 0xbefc0384,
-	0xbf0a717c, 0xbf840020,
-	0x7e008700, 0x7e028701,
-	0x7e048702, 0x7e068703,
+	0xb9711e06, 0x8771c171,
+	0xbf84000c, 0x8f718371,
+	0x80717c71, 0xbefe03c1,
+	0xbeff0380, 0x7e008700,
 	0xe0704000, 0x7a5d0000,
-	0xe0704100, 0x7a5d0100,
-	0xe0704200, 0x7a5d0200,
-	0xe0704300, 0x7a5d0300,
-	0x807c847c, 0x807aff7a,
-	0x00000400, 0xbf0a717c,
-	0xbf85ffef, 0xb9711e06,
-	0x8771c171, 0xbf84000c,
-	0x8f718371, 0x80717c71,
-	0xbefe03c1, 0xbeff0380,
-	0x7e008700, 0xe0704000,
-	0x7a5d0000, 0x807c817c,
-	0x807aff7a, 0x00000080,
-	0xbf0a717c, 0xbf85fff8,
-	0xbf820142, 0xbef4037e,
-	0x8775ff7f, 0x0000ffff,
-	0x8875ff75, 0x00040000,
-	0xbef60380, 0xbef703ff,
-	0x10807fac, 0x8772ff7f,
-	0x08000000, 0x90728372,
-	0x88777277, 0x8772ff7f,
-	0x70000000, 0x90728172,
-	0x88777277, 0xb97302dc,
-	0x8f739973, 0x8873737f,
-	0x8772ff7f, 0x04000000,
-	0xbf840036, 0xbefe03c1,
-	0x907c9973, 0x877c817c,
-	0xbf06817c, 0xbf850002,
-	0xbeff0380, 0xbf820001,
-	0xbeff03c1, 0xb96f4306,
-	0x876fc16f, 0xbf84002b,
-	0x8f6f866f, 0x8f6f826f,
-	0xbef6036f, 0xb9782a05,
-	0x80788178, 0x907c9973,
-	0x877c817c, 0xbf06817c,
-	0xbf850002, 0x8f788978,
-	0xbf820001, 0x8f788a78,
-	0xb9721e06, 0x8f728a72,
-	0x80787278, 0x8078ff78,
-	0x00000200, 0x8078ff78,
-	0x00000080, 0xbef603ff,
-	0x01000000, 0x907c9973,
-	0x877c817c, 0xbf06817c,
-	0xbefc0380, 0xbf850009,
-	0xe0310000, 0x781d0000,
-	0x807cff7c, 0x00000080,
-	0x8078ff78, 0x00000080,
-	0xbf0a6f7c, 0xbf85fff8,
-	0xbf820008, 0xe0310000,
-	0x781d0000, 0x807cff7c,
-	0x00000100, 0x8078ff78,
-	0x00000100, 0xbf0a6f7c,
-	0xbf85fff8, 0xbef80380,
+	0x807c817c, 0x807aff7a,
+	0x00000080, 0xbf0a717c,
+	0xbf85fff8, 0xbf820142,
+	0xbef4037e, 0x8775ff7f,
+	0x0000ffff, 0x8875ff75,
+	0x00040000, 0xbef60380,
+	0xbef703ff, 0x10807fac,
+	0x8772ff7f, 0x08000000,
+	0x90728372, 0x88777277,
+	0x8772ff7f, 0x70000000,
+	0x90728172, 0x88777277,
+	0xb97302dc, 0x8f739973,
+	0x8873737f, 0x8772ff7f,
+	0x04000000, 0xbf840036,
 	0xbefe03c1, 0x907c9973,
 	0x877c817c, 0xbf06817c,
 	0xbf850002, 0xbeff0380,
 	0xbf820001, 0xbeff03c1,
-	0xb96f2a05, 0x806f816f,
-	0x8f6f826f, 0x907c9973,
-	0x877c817c, 0xbf06817c,
-	0xbf850021, 0xbef603ff,
-	0x01000000, 0xbef20378,
-	0x8078ff78, 0x00000200,
-	0xbefc0384, 0xe0304000,
-	0x785d0000, 0xe0304080,
-	0x785d0100, 0xe0304100,
-	0x785d0200, 0xe0304180,
-	0x785d0300, 0xbf8c3f70,
-	0x7e008500, 0x7e028501,
-	0x7e048502, 0x7e068503,
-	0x807c847c, 0x8078ff78,
-	0x00000200, 0xbf0a6f7c,
-	0xbf85ffee, 0xe0304000,
-	0x725d0000, 0xe0304080,
-	0x725d0100, 0xe0304100,
-	0x725d0200, 0xe0304180,
-	0x725d0300, 0xbf820032,
-	0xbef603ff, 0x01000000,
-	0xbef20378, 0x8078ff78,
-	0x00000400, 0xbefc0384,
-	0xe0304000, 0x785d0000,
-	0xe0304100, 0x785d0100,
-	0xe0304200, 0x785d0200,
-	0xe0304300, 0x785d0300,
-	0xbf8c3f70, 0x7e008500,
-	0x7e028501, 0x7e048502,
-	0x7e068503, 0x807c847c,
-	0x8078ff78, 0x00000400,
-	0xbf0a6f7c, 0xbf85ffee,
-	0xb96f1e06, 0x876fc16f,
-	0xbf84000e, 0x8f6f836f,
-	0x806f7c6f, 0xbefe03c1,
-	0xbeff0380, 0xe0304000,
-	0x785d0000, 0xbf8c3f70,
-	0x7e008500, 0x807c817c,
-	0x8078ff78, 0x00000080,
-	0xbf0a6f7c, 0xbf85fff7,
-	0xbeff03c1, 0xe0304000,
-	0x725d0000, 0xe0304100,
-	0x725d0100, 0xe0304200,
-	0x725d0200, 0xe0304300,
-	0x725d0300, 0xbf8c3f70,
+	0xb96f4306, 0x876fc16f,
+	0xbf84002b, 0x8f6f866f,
+	0x8f6f826f, 0xbef6036f,
 	0xb9782a05, 0x80788178,
 	0x907c9973, 0x877c817c,
 	0xbf06817c, 0xbf850002,
@@ -1000,77 +928,147 @@ static const uint32_t cwsr_trap_gfx10_hex[] = {
 	0x8f788a78, 0xb9721e06,
 	0x8f728a72, 0x80787278,
 	0x8078ff78, 0x00000200,
-	0x80f8ff78, 0x00000050,
+	0x8078ff78, 0x00000080,
 	0xbef603ff, 0x01000000,
-	0xbefc03ff, 0x0000006c,
-	0x80f89078, 0xf429003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc847c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0x80f8a078, 0xf42d003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc887c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0xbe843104, 0xbe863106,
-	0x80f8c078, 0xf431003a,
-	0xf0000000, 0xbf8cc07f,
-	0x80fc907c, 0xbf800000,
-	0xbe803100, 0xbe823102,
-	0xbe843104, 0xbe863106,
-	0xbe883108, 0xbe8a310a,
-	0xbe8c310c, 0xbe8e310e,
-	0xbf06807c, 0xbf84fff0,
-	0xb9782a05, 0x80788178,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbefc0380,
+	0xbf850009, 0xe0310000,
+	0x781d0000, 0x807cff7c,
+	0x00000080, 0x8078ff78,
+	0x00000080, 0xbf0a6f7c,
+	0xbf85fff8, 0xbf820008,
+	0xe0310000, 0x781d0000,
+	0x807cff7c, 0x00000100,
+	0x8078ff78, 0x00000100,
+	0xbf0a6f7c, 0xbf85fff8,
+	0xbef80380, 0xbefe03c1,
 	0x907c9973, 0x877c817c,
 	0xbf06817c, 0xbf850002,
-	0x8f788978, 0xbf820001,
-	0x8f788a78, 0xb9721e06,
-	0x8f728a72, 0x80787278,
-	0x8078ff78, 0x00000200,
+	0xbeff0380, 0xbf820001,
+	0xbeff03c1, 0xb96f2a05,
+	0x806f816f, 0x8f6f826f,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850021,
 	0xbef603ff, 0x01000000,
-	0xf4211bfa, 0xf0000000,
-	0x80788478, 0xf4211b3a,
+	0xbef20378, 0x8078ff78,
+	0x00000200, 0xbefc0384,
+	0xe0304000, 0x785d0000,
+	0xe0304080, 0x785d0100,
+	0xe0304100, 0x785d0200,
+	0xe0304180, 0x785d0300,
+	0xbf8c3f70, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807c847c,
+	0x8078ff78, 0x00000200,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xe0304000, 0x725d0000,
+	0xe0304080, 0x725d0100,
+	0xe0304100, 0x725d0200,
+	0xe0304180, 0x725d0300,
+	0xbf820032, 0xbef603ff,
+	0x01000000, 0xbef20378,
+	0x8078ff78, 0x00000400,
+	0xbefc0384, 0xe0304000,
+	0x785d0000, 0xe0304100,
+	0x785d0100, 0xe0304200,
+	0x785d0200, 0xe0304300,
+	0x785d0300, 0xbf8c3f70,
+	0x7e008500, 0x7e028501,
+	0x7e048502, 0x7e068503,
+	0x807c847c, 0x8078ff78,
+	0x00000400, 0xbf0a6f7c,
+	0xbf85ffee, 0xb96f1e06,
+	0x876fc16f, 0xbf84000e,
+	0x8f6f836f, 0x806f7c6f,
+	0xbefe03c1, 0xbeff0380,
+	0xe0304000, 0x785d0000,
+	0xbf8c3f70, 0x7e008500,
+	0x807c817c, 0x8078ff78,
+	0x00000080, 0xbf0a6f7c,
+	0xbf85fff7, 0xbeff03c1,
+	0xe0304000, 0x725d0000,
+	0xe0304100, 0x725d0100,
+	0xe0304200, 0x725d0200,
+	0xe0304300, 0x725d0300,
+	0xbf8c3f70, 0xb9782a05,
+	0x80788178, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0x8f788978,
+	0xbf820001, 0x8f788a78,
+	0xb9721e06, 0x8f728a72,
+	0x80787278, 0x8078ff78,
+	0x00000200, 0x80f8ff78,
+	0x00000050, 0xbef603ff,
+	0x01000000, 0xbefc03ff,
+	0x0000006c, 0x80f89078,
+	0xf429003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc847c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0x80f8a078,
+	0xf42d003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc887c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0xbe843104,
+	0xbe863106, 0x80f8c078,
+	0xf431003a, 0xf0000000,
+	0xbf8cc07f, 0x80fc907c,
+	0xbf800000, 0xbe803100,
+	0xbe823102, 0xbe843104,
+	0xbe863106, 0xbe883108,
+	0xbe8a310a, 0xbe8c310c,
+	0xbe8e310e, 0xbf06807c,
+	0xbf84fff0, 0xb9782a05,
+	0x80788178, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0x8f788978,
+	0xbf820001, 0x8f788a78,
+	0xb9721e06, 0x8f728a72,
+	0x80787278, 0x8078ff78,
+	0x00000200, 0xbef603ff,
+	0x01000000, 0xf4211bfa,
 	0xf0000000, 0x80788478,
-	0xf4211b7a, 0xf0000000,
-	0x80788478, 0xf4211eba,
+	0xf4211b3a, 0xf0000000,
+	0x80788478, 0xf4211b7a,
 	0xf0000000, 0x80788478,
-	0xf4211efa, 0xf0000000,
-	0x80788478, 0xf4211c3a,
+	0xf4211eba, 0xf0000000,
+	0x80788478, 0xf4211efa,
 	0xf0000000, 0x80788478,
-	0xf4211c7a, 0xf0000000,
-	0x80788478, 0xf4211e7a,
+	0xf4211c3a, 0xf0000000,
+	0x80788478, 0xf4211c7a,
 	0xf0000000, 0x80788478,
-	0xf4211cfa, 0xf0000000,
-	0x80788478, 0xf4211bba,
+	0xf4211e7a, 0xf0000000,
+	0x80788478, 0xf4211cfa,
 	0xf0000000, 0x80788478,
-	0xbf8cc07f, 0xb9eef814,
 	0xf4211bba, 0xf0000000,
 	0x80788478, 0xbf8cc07f,
-	0xb9eef815, 0xbef2036d,
-	0x876dff72, 0x0000ffff,
-	0xbefc036f, 0xbefe037a,
-	0xbeff037b, 0x876f71ff,
-	0x000003ff, 0xb9ef4803,
-	0xb9f9f816, 0x876f71ff,
-	0xfffff800, 0x906f8b6f,
-	0xb9efa2c3, 0xb9f3f801,
-	0x876fff72, 0xfc000000,
-	0x906f9a6f, 0x8f6f906f,
-	0xbef30380, 0x88736f73,
-	0x876fff72, 0x02000000,
-	0x906f996f, 0x8f6f8f6f,
+	0xb9eef814, 0xf4211bba,
+	0xf0000000, 0x80788478,
+	0xbf8cc07f, 0xb9eef815,
+	0xbef2036d, 0x876dff72,
+	0x0000ffff, 0xbefc036f,
+	0xbefe037a, 0xbeff037b,
+	0x876f71ff, 0x000003ff,
+	0xb9ef4803, 0xb9f9f816,
+	0x876f71ff, 0xfffff800,
+	0x906f8b6f, 0xb9efa2c3,
+	0xb9f3f801, 0x876fff72,
+	0xfc000000, 0x906f9a6f,
+	0x8f6f906f, 0xbef30380,
 	0x88736f73, 0x876fff72,
-	0x01000000, 0x906f986f,
-	0x8f6f996f, 0x88736f73,
-	0x876fff70, 0x00800000,
-	0x906f976f, 0xb9f3f807,
-	0x87fe7e7e, 0x87ea6a6a,
-	0xb9f0f802, 0xbf8a0000,
-	0xbe80226c, 0xbf810000,
+	0x02000000, 0x906f996f,
+	0x8f6f8f6f, 0x88736f73,
+	0x876fff72, 0x01000000,
+	0x906f986f, 0x8f6f996f,
+	0x88736f73, 0x876fff70,
+	0x00800000, 0x906f976f,
+	0xb9f3f807, 0x87fe7e7e,
+	0x87ea6a6a, 0xb9f0f802,
+	0xbf8a0000, 0xbe80226c,
+	0xbf810000, 0xbf9f0000,
 	0xbf9f0000, 0xbf9f0000,
 	0xbf9f0000, 0xbf9f0000,
-	0xbf9f0000, 0x00000000,
 };
+
 static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0xbf820001, 0xbf8202c4,
 	0xb8f8f802, 0x89788678,
@@ -1560,3 +1558,389 @@ static const uint32_t cwsr_trap_arcturus_hex[] = {
 	0xbf8a0000, 0x95806f6c,
 	0xbf810000, 0x00000000,
 };
+
+static const uint32_t cwsr_trap_gfx10_hex[] = {
+	0xbf820001, 0xbf8201c7,
+	0xb0804004, 0xb978f802,
+	0x8a788678, 0xb971f803,
+	0x876eff71, 0x00000400,
+	0xbf85001d, 0x876eff71,
+	0x00000100, 0xbf840002,
+	0x8878ff78, 0x00002000,
+	0xb970f812, 0xb971f813,
+	0x8ff08870, 0xf4051bb8,
+	0xfa000000, 0xbf8cc07f,
+	0xf4051c38, 0xfa000008,
+	0xbf8cc07f, 0x87ee6e6e,
+	0xbf840001, 0xbe80206e,
+	0xb971f803, 0x8771ff71,
+	0x000001ff, 0xbf850002,
+	0x806c846c, 0x826d806d,
+	0x876dff6d, 0x0000ffff,
+	0x87fe7e7e, 0x87ea6a6a,
+	0xb9f8f802, 0xbe80226c,
+	0xb971f803, 0x8771ff71,
+	0x00000100, 0xbf840006,
+	0xbef60380, 0xb9f60203,
+	0x876dff6d, 0x0000ffff,
+	0x80ec886c, 0x82ed806d,
+	0xbef60380, 0xb9f60283,
+	0xb972f816, 0xbeee037e,
+	0xbeef037f, 0xbefe0480,
+	0xbf900004, 0xbf8cc07f,
+	0xbef4037e, 0x8775ff7f,
+	0x0000ffff, 0x8875ff75,
+	0x00040000, 0xbef60380,
+	0xbef703ff, 0x10807fac,
+	0x8776ff7f, 0x08000000,
+	0x90768376, 0x88777677,
+	0x8776ff7f, 0x70000000,
+	0x90768176, 0x88777677,
+	0xbefb037c, 0xbefa0380,
+	0xb97302dc, 0x8f739973,
+	0x8873737f, 0xbefe03c1,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0xbeff0380, 0xbf820002,
+	0xbeff03c1, 0xbf82000b,
+	0xbef603ff, 0x01000000,
+	0xe0704000, 0x7a5d0000,
+	0xe0704080, 0x7a5d0100,
+	0xe0704100, 0x7a5d0200,
+	0xe0704180, 0x7a5d0300,
+	0xbf82000a, 0xbef603ff,
+	0x01000000, 0xe0704000,
+	0x7a5d0000, 0xe0704100,
+	0x7a5d0100, 0xe0704200,
+	0x7a5d0200, 0xe0704300,
+	0x7a5d0300, 0xb97a2a05,
+	0x807a817a, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0x8f7a897a,
+	0xbf820001, 0x8f7a8a7a,
+	0xb9761e06, 0x8f768a76,
+	0x807a767a, 0x807aff7a,
+	0x00000200, 0xbef603ff,
+	0x01000000, 0x7e000280,
+	0x7e020280, 0x7e040280,
+	0xbefc0380, 0xd7610002,
+	0x0000f87b, 0x807c817c,
+	0xd7610002, 0x0000f86c,
+	0x807c817c, 0xd7610002,
+	0x0000f86d, 0x807c817c,
+	0xd7610002, 0x0000f86e,
+	0x807c817c, 0xd7610002,
+	0x0000f86f, 0x807c817c,
+	0xd7610002, 0x0000f878,
+	0x807c817c, 0xb971f803,
+	0xd7610002, 0x0000f871,
+	0x807c817c, 0xd7610002,
+	0x0000f872, 0x807c817c,
+	0xb97bf801, 0xd7610002,
+	0x0000f87b, 0x807c817c,
+	0xb97bf814, 0xd7610002,
+	0x0000f87b, 0x807c817c,
+	0xb97bf815, 0xd7610002,
+	0x0000f87b, 0x807c817c,
+	0xbeff0380, 0xe0704000,
+	0x7a5d0200, 0xb97a2a05,
+	0x807a817a, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0x8f7a897a,
+	0xbf820001, 0x8f7a8a7a,
+	0xb9761e06, 0x8f768a76,
+	0x807a767a, 0xbef603ff,
+	0x01000000, 0xbef90380,
+	0xbefc0380, 0xbf800000,
+	0xbe802f00, 0xbe822f02,
+	0xbe842f04, 0xbe862f06,
+	0xbe882f08, 0xbe8a2f0a,
+	0xbe8c2f0c, 0xbe8e2f0e,
+	0xd7610002, 0x0000f200,
+	0x80798179, 0xd7610002,
+	0x0000f201, 0x80798179,
+	0xd7610002, 0x0000f202,
+	0x80798179, 0xd7610002,
+	0x0000f203, 0x80798179,
+	0xd7610002, 0x0000f204,
+	0x80798179, 0xd7610002,
+	0x0000f205, 0x80798179,
+	0xd7610002, 0x0000f206,
+	0x80798179, 0xd7610002,
+	0x0000f207, 0x80798179,
+	0xd7610002, 0x0000f208,
+	0x80798179, 0xd7610002,
+	0x0000f209, 0x80798179,
+	0xd7610002, 0x0000f20a,
+	0x80798179, 0xd7610002,
+	0x0000f20b, 0x80798179,
+	0xd7610002, 0x0000f20c,
+	0x80798179, 0xd7610002,
+	0x0000f20d, 0x80798179,
+	0xd7610002, 0x0000f20e,
+	0x80798179, 0xd7610002,
+	0x0000f20f, 0x80798179,
+	0xbf06a079, 0xbf840006,
+	0xe0704000, 0x7a5d0200,
+	0x807aff7a, 0x00000080,
+	0xbef90380, 0x7e040280,
+	0x807c907c, 0xbf0aff7c,
+	0x00000060, 0xbf85ffbc,
+	0xbe802f00, 0xbe822f02,
+	0xbe842f04, 0xbe862f06,
+	0xbe882f08, 0xbe8a2f0a,
+	0xd7610002, 0x0000f200,
+	0x80798179, 0xd7610002,
+	0x0000f201, 0x80798179,
+	0xd7610002, 0x0000f202,
+	0x80798179, 0xd7610002,
+	0x0000f203, 0x80798179,
+	0xd7610002, 0x0000f204,
+	0x80798179, 0xd7610002,
+	0x0000f205, 0x80798179,
+	0xd7610002, 0x0000f206,
+	0x80798179, 0xd7610002,
+	0x0000f207, 0x80798179,
+	0xd7610002, 0x0000f208,
+	0x80798179, 0xd7610002,
+	0x0000f209, 0x80798179,
+	0xd7610002, 0x0000f20a,
+	0x80798179, 0xd7610002,
+	0x0000f20b, 0x80798179,
+	0xe0704000, 0x7a5d0200,
+	0xbefe03c1, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0xbeff0380,
+	0xbf820001, 0xbeff03c1,
+	0xb9714306, 0x8771c171,
+	0xbf840046, 0xbf8a0000,
+	0x8776ff73, 0x04000000,
+	0xbf840042, 0x8f718671,
+	0x8f718271, 0xbef60371,
+	0xb97a2a05, 0x807a817a,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0x8f7a897a, 0xbf820001,
+	0x8f7a8a7a, 0xb9761e06,
+	0x8f768a76, 0x807a767a,
+	0x807aff7a, 0x00000200,
+	0x807aff7a, 0x00000080,
+	0xbef603ff, 0x01000000,
+	0xd7650000, 0x000100c1,
+	0xd7660000, 0x000200c1,
+	0x16000084, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbefc0380, 0xbf850012,
+	0xbe8303ff, 0x00000080,
+	0xbf800000, 0xbf800000,
+	0xbf800000, 0xd8d80000,
+	0x01000000, 0xbf8c0000,
+	0xe0704000, 0x7a5d0100,
+	0x807c037c, 0x807a037a,
+	0xd5250000, 0x0001ff00,
+	0x00000080, 0xbf0a717c,
+	0xbf85fff4, 0xbf820011,
+	0xbe8303ff, 0x00000100,
+	0xbf800000, 0xbf800000,
+	0xbf800000, 0xd8d80000,
+	0x01000000, 0xbf8c0000,
+	0xe0704000, 0x7a5d0100,
+	0x807c037c, 0x807a037a,
+	0xd5250000, 0x0001ff00,
+	0x00000100, 0xbf0a717c,
+	0xbf85fff4, 0xbefe03c1,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850004,
+	0xbefa03ff, 0x00000200,
+	0xbeff0380, 0xbf820003,
+	0xbefa03ff, 0x00000400,
+	0xbeff03c1, 0xb9712a05,
+	0x80718171, 0x8f718271,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850017,
+	0xbef603ff, 0x01000000,
+	0xbefc0384, 0xbf0a717c,
+	0xbf840037, 0x7e008700,
+	0x7e028701, 0x7e048702,
+	0x7e068703, 0xe0704000,
+	0x7a5d0000, 0xe0704080,
+	0x7a5d0100, 0xe0704100,
+	0x7a5d0200, 0xe0704180,
+	0x7a5d0300, 0x807c847c,
+	0x807aff7a, 0x00000200,
+	0xbf0a717c, 0xbf85ffef,
+	0xbf820025, 0xbef603ff,
+	0x01000000, 0xbefc0384,
+	0xbf0a717c, 0xbf840020,
+	0x7e008700, 0x7e028701,
+	0x7e048702, 0x7e068703,
+	0xe0704000, 0x7a5d0000,
+	0xe0704100, 0x7a5d0100,
+	0xe0704200, 0x7a5d0200,
+	0xe0704300, 0x7a5d0300,
+	0x807c847c, 0x807aff7a,
+	0x00000400, 0xbf0a717c,
+	0xbf85ffef, 0xb9711e06,
+	0x8771c171, 0xbf84000c,
+	0x8f718371, 0x80717c71,
+	0xbefe03c1, 0xbeff0380,
+	0x7e008700, 0xe0704000,
+	0x7a5d0000, 0x807c817c,
+	0x807aff7a, 0x00000080,
+	0xbf0a717c, 0xbf85fff8,
+	0xbf82012e, 0xbef4037e,
+	0x8775ff7f, 0x0000ffff,
+	0x8875ff75, 0x00040000,
+	0xbef60380, 0xbef703ff,
+	0x10807fac, 0x8772ff7f,
+	0x08000000, 0x90728372,
+	0x88777277, 0x8772ff7f,
+	0x70000000, 0x90728172,
+	0x88777277, 0xb97302dc,
+	0x8f739973, 0x8873737f,
+	0x8772ff7f, 0x04000000,
+	0xbf840036, 0xbefe03c1,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0xbeff0380, 0xbf820001,
+	0xbeff03c1, 0xb96f4306,
+	0x876fc16f, 0xbf84002b,
+	0x8f6f866f, 0x8f6f826f,
+	0xbef6036f, 0xb9782a05,
+	0x80788178, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0x8f788978,
+	0xbf820001, 0x8f788a78,
+	0xb9721e06, 0x8f728a72,
+	0x80787278, 0x8078ff78,
+	0x00000200, 0x8078ff78,
+	0x00000080, 0xbef603ff,
+	0x01000000, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbefc0380, 0xbf850009,
+	0xe0310000, 0x781d0000,
+	0x807cff7c, 0x00000080,
+	0x8078ff78, 0x00000080,
+	0xbf0a6f7c, 0xbf85fff8,
+	0xbf820008, 0xe0310000,
+	0x781d0000, 0x807cff7c,
+	0x00000100, 0x8078ff78,
+	0x00000100, 0xbf0a6f7c,
+	0xbf85fff8, 0xbef80380,
+	0xbefe03c1, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850002, 0xbeff0380,
+	0xbf820001, 0xbeff03c1,
+	0xb96f2a05, 0x806f816f,
+	0x8f6f826f, 0x907c9973,
+	0x877c817c, 0xbf06817c,
+	0xbf850021, 0xbef603ff,
+	0x01000000, 0xbef20378,
+	0x8078ff78, 0x00000200,
+	0xbefc0384, 0xe0304000,
+	0x785d0000, 0xe0304080,
+	0x785d0100, 0xe0304100,
+	0x785d0200, 0xe0304180,
+	0x785d0300, 0xbf8c3f70,
+	0x7e008500, 0x7e028501,
+	0x7e048502, 0x7e068503,
+	0x807c847c, 0x8078ff78,
+	0x00000200, 0xbf0a6f7c,
+	0xbf85ffee, 0xe0304000,
+	0x725d0000, 0xe0304080,
+	0x725d0100, 0xe0304100,
+	0x725d0200, 0xe0304180,
+	0x725d0300, 0xbf820032,
+	0xbef603ff, 0x01000000,
+	0xbef20378, 0x8078ff78,
+	0x00000400, 0xbefc0384,
+	0xe0304000, 0x785d0000,
+	0xe0304100, 0x785d0100,
+	0xe0304200, 0x785d0200,
+	0xe0304300, 0x785d0300,
+	0xbf8c3f70, 0x7e008500,
+	0x7e028501, 0x7e048502,
+	0x7e068503, 0x807c847c,
+	0x8078ff78, 0x00000400,
+	0xbf0a6f7c, 0xbf85ffee,
+	0xb96f1e06, 0x876fc16f,
+	0xbf84000e, 0x8f6f836f,
+	0x806f7c6f, 0xbefe03c1,
+	0xbeff0380, 0xe0304000,
+	0x785d0000, 0xbf8c3f70,
+	0x7e008500, 0x807c817c,
+	0x8078ff78, 0x00000080,
+	0xbf0a6f7c, 0xbf85fff7,
+	0xbeff03c1, 0xe0304000,
+	0x725d0000, 0xe0304100,
+	0x725d0100, 0xe0304200,
+	0x725d0200, 0xe0304300,
+	0x725d0300, 0xbf8c3f70,
+	0xb9782a05, 0x80788178,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0x8f788978, 0xbf820001,
+	0x8f788a78, 0xb9721e06,
+	0x8f728a72, 0x80787278,
+	0x8078ff78, 0x00000200,
+	0x80f8ff78, 0x00000050,
+	0xbef603ff, 0x01000000,
+	0xbefc03ff, 0x0000006c,
+	0x80f89078, 0xf429003a,
+	0xf0000000, 0xbf8cc07f,
+	0x80fc847c, 0xbf800000,
+	0xbe803100, 0xbe823102,
+	0x80f8a078, 0xf42d003a,
+	0xf0000000, 0xbf8cc07f,
+	0x80fc887c, 0xbf800000,
+	0xbe803100, 0xbe823102,
+	0xbe843104, 0xbe863106,
+	0x80f8c078, 0xf431003a,
+	0xf0000000, 0xbf8cc07f,
+	0x80fc907c, 0xbf800000,
+	0xbe803100, 0xbe823102,
+	0xbe843104, 0xbe863106,
+	0xbe883108, 0xbe8a310a,
+	0xbe8c310c, 0xbe8e310e,
+	0xbf06807c, 0xbf84fff0,
+	0xb9782a05, 0x80788178,
+	0x907c9973, 0x877c817c,
+	0xbf06817c, 0xbf850002,
+	0x8f788978, 0xbf820001,
+	0x8f788a78, 0xb9721e06,
+	0x8f728a72, 0x80787278,
+	0x8078ff78, 0x00000200,
+	0xbef603ff, 0x01000000,
+	0xf4211bfa, 0xf0000000,
+	0x80788478, 0xf4211b3a,
+	0xf0000000, 0x80788478,
+	0xf4211b7a, 0xf0000000,
+	0x80788478, 0xf4211eba,
+	0xf0000000, 0x80788478,
+	0xf4211efa, 0xf0000000,
+	0x80788478, 0xf4211c3a,
+	0xf0000000, 0x80788478,
+	0xf4211c7a, 0xf0000000,
+	0x80788478, 0xf4211e7a,
+	0xf0000000, 0x80788478,
+	0xf4211cfa, 0xf0000000,
+	0x80788478, 0xf4211bba,
+	0xf0000000, 0x80788478,
+	0xbf8cc07f, 0xb9eef814,
+	0xf4211bba, 0xf0000000,
+	0x80788478, 0xbf8cc07f,
+	0xb9eef815, 0xbef2036d,
+	0x876dff72, 0x0000ffff,
+	0xbefc036f, 0xbefe037a,
+	0xbeff037b, 0x876f71ff,
+	0x000003ff, 0xb9ef4803,
+	0xb9f9f816, 0x876f71ff,
+	0xfffff800, 0x906f8b6f,
+	0xb9efa2c3, 0xb9f3f801,
+	0x87fe7e7e, 0x87ea6a6a,
+	0xb9f0f802, 0xbf8a0000,
+	0xbe80226c, 0xbf810000,
+	0xbf9f0000, 0xbf9f0000,
+	0xbf9f0000, 0xbf9f0000,
+	0xbf9f0000, 0x00000000,
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
index 4433bda2ce25..ce70bba8ac06 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm
@@ -20,6 +20,17 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+/* To compile this assembly code:
+ *
+ * Navi1x:
+ *   PROJECT=gfx10 ./sp3 ASIC_TARGET_NAVI1X=1 cwsr_trap_handler_gfx10.asm -hex tmp.hex
+ *
+ * Others:
+ *   PROJECT=gfx10 ./sp3 ASIC_TARGET_NAVI1X=0 cwsr_trap_handler_gfx10.asm -hex tmp.hex
+ */
+
+var NO_SQC_STORE				= !ASIC_TARGET_NAVI1X
+
 var SQ_WAVE_STATUS_INST_ATC_SHIFT		= 23
 var SQ_WAVE_STATUS_INST_ATC_MASK		= 0x00800000
 var SQ_WAVE_STATUS_SPI_PRIO_MASK		= 0x00000006
@@ -170,6 +181,8 @@ L_SKIP_RESTORE:
 	s_or_b32	s_save_status, s_save_status, SQ_WAVE_STATUS_HALT_MASK
 
 L_FETCH_2ND_TRAP:
+
+if ASIC_TARGET_NAVI1X
 	// Preserve and clear scalar XNACK state before issuing scalar loads.
 	// Save IB_STS.REPLAY_W64H[25], RCNT[21:16], FIRST_REPLAY[15] into
 	// unused space ttmp11[31:24].
@@ -183,6 +196,7 @@ L_FETCH_2ND_TRAP:
 	s_or_b32	ttmp11, ttmp11, ttmp3
 	s_andn2_b32	ttmp2, ttmp2, (SQ_WAVE_IB_STS_REPLAY_W64H_MASK | SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK)
 	s_setreg_b32	hwreg(HW_REG_IB_STS), ttmp2
+end
 
 	// Read second-level TBA/TMA from first-level TMA and jump if available.
 	// ttmp[2:5] and ttmp12 can be used (others hold SPI-initialized debug data)
@@ -207,6 +221,7 @@ L_NO_NEXT_TRAP:
 L_EXCP_CASE:
 	s_and_b32	ttmp1, ttmp1, 0xFFFF
 
+if ASIC_TARGET_NAVI1X
 	// Restore SQ_WAVE_IB_STS.
 	s_lshr_b32	ttmp2, ttmp11, (TTMP11_SAVE_RCNT_FIRST_REPLAY_SHIFT - SQ_WAVE_IB_STS_FIRST_REPLAY_SHIFT)
 	s_and_b32	ttmp3, ttmp2, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK
@@ -214,6 +229,7 @@ L_EXCP_CASE:
 	s_and_b32	ttmp2, ttmp2, SQ_WAVE_IB_STS_REPLAY_W64H_MASK
 	s_or_b32	ttmp2, ttmp2, ttmp3
 	s_setreg_b32	hwreg(HW_REG_IB_STS), ttmp2
+end
 
 	// Restore SQ_WAVE_STATUS.
 	s_and_b64	exec, exec, exec					// Restore STATUS.EXECZ, not writable by s_setreg_b32
@@ -240,6 +256,8 @@ L_NO_PC_REWIND:
 	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_SAVECTX_SHIFT, 1), s_save_tmp	//clear saveCtx bit
 
 	s_getreg_b32	s_save_xnack_mask, hwreg(HW_REG_SHADER_XNACK_MASK)
+
+if ASIC_TARGET_NAVI1X
 	s_getreg_b32	s_save_tmp, hwreg(HW_REG_IB_STS, SQ_WAVE_IB_STS_RCNT_SHIFT, SQ_WAVE_IB_STS_RCNT_SIZE)
 	s_lshl_b32	s_save_tmp, s_save_tmp, S_SAVE_PC_HI_RCNT_SHIFT
 	s_or_b32	s_save_pc_hi, s_save_pc_hi, s_save_tmp
@@ -253,6 +271,7 @@ L_NO_PC_REWIND:
 	s_and_b32	s_save_tmp, s_save_tmp, SQ_WAVE_IB_STS_RCNT_FIRST_REPLAY_MASK_NEG
 
 	s_setreg_b32	hwreg(HW_REG_IB_STS), s_save_tmp
+end
 
 	/* inform SPI the readiness and wait for SPI's go signal */
 	s_mov_b32	s_save_exec_lo, exec_lo					//save EXEC and use EXEC for the go signal from SPI
@@ -261,12 +280,16 @@ L_NO_PC_REWIND:
 
 	s_sendmsg	sendmsg(MSG_SAVEWAVE)					//send SPI a message and wait for SPI's write to EXEC
 
+if ASIC_TARGET_NAVI1X
 L_SLEEP:
 	// sleep 1 (64clk) is not enough for 8 waves per SIMD, which will cause
 	// SQ hang, since the 7,8th wave could not get arbit to exec inst, while
 	// other waves are stuck into the sleep-loop and waiting for wrexec!=0
 	s_sleep		0x2
 	s_cbranch_execz	L_SLEEP
+else
+	s_waitcnt	lgkmcnt(0)
+end
 
 	/* setup Resource Contants */
 	s_mov_b32	s_save_buf_rsrc0, s_save_spi_init_lo			//base_addr_lo
@@ -289,6 +312,38 @@ L_SLEEP:
 	s_lshl_b32	s_wave_size, s_wave_size, S_WAVE_SIZE
 	s_or_b32	s_wave_size, s_save_spi_init_hi, s_wave_size		//share s_wave_size with exec_hi, it's at bit25
 
+	/* save first 4 VGPRs, needed for SGPR save */
+	s_mov_b32	exec_lo, 0xFFFFFFFF					//need every thread from now on
+	s_lshr_b32	m0, s_wave_size, S_WAVE_SIZE
+	s_and_b32	m0, m0, 1
+	s_cmp_eq_u32	m0, 1
+	s_cbranch_scc1	L_ENABLE_SAVE_4VGPR_EXEC_HI
+	s_mov_b32	exec_hi, 0x00000000
+	s_branch	L_SAVE_4VGPR_WAVE32
+L_ENABLE_SAVE_4VGPR_EXEC_HI:
+	s_mov_b32	exec_hi, 0xFFFFFFFF
+	s_branch	L_SAVE_4VGPR_WAVE64
+L_SAVE_4VGPR_WAVE32:
+	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
+
+	// VGPR Allocated in 4-GPR granularity
+
+	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128
+	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*2
+	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*3
+	s_branch	L_SAVE_HWREG
+
+L_SAVE_4VGPR_WAVE64:
+	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
+
+	// VGPR Allocated in 4-GPR granularity
+
+	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256
+	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*2
+	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*3
+
 	/* save HW registers */
 
 L_SAVE_HWREG:
@@ -300,6 +355,13 @@ L_SAVE_HWREG:
 
 	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
 
+if NO_SQC_STORE
+	v_mov_b32	v0, 0x0							//Offset[31:0] from buffer resource
+	v_mov_b32	v1, 0x0							//Offset[63:32] from buffer resource
+	v_mov_b32	v2, 0x0							//Set of SGPRs for TCP store
+	s_mov_b32	m0, 0x0							//Next lane of v2 to write to
+end
+
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_pc_lo, s_save_buf_rsrc0, s_save_mem_offset)
 	write_hwreg_to_mem(s_save_pc_hi, s_save_buf_rsrc0, s_save_mem_offset)
@@ -320,10 +382,11 @@ L_SAVE_HWREG:
 	s_getreg_b32	s_save_m0, hwreg(HW_REG_SHADER_FLAT_SCRATCH_HI)
 	write_hwreg_to_mem(s_save_m0, s_save_buf_rsrc0, s_save_mem_offset)
 
-	/* the first wave in the threadgroup */
-	s_and_b32	s_save_tmp, s_save_spi_init_hi, S_SAVE_SPI_INIT_FIRST_WAVE_MASK
-	s_mov_b32	s_save_exec_hi, 0x0
-	s_or_b32	s_save_exec_hi, s_save_tmp, s_save_exec_hi		// save first wave bit to s_save_exec_hi.bits[26]
+if NO_SQC_STORE
+	// Write HWREG/SGPRs with 32 VGPR lanes, wave32 is common case.
+	s_mov_b32	exec_hi, 0x0
+	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+end
 
 	/* save SGPRs */
 	// Save SGPR before LDS save, then the s0 to s4 can be used during LDS save...
@@ -334,10 +397,14 @@ L_SAVE_HWREG:
 	s_add_u32	s_save_mem_offset, s_save_mem_offset, s_save_tmp
 	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
 
+if NO_SQC_STORE
+	s_mov_b32	ttmp13, 0x0						//next VGPR lane to copy SGPR into
+else
 	// backup s_save_buf_rsrc0,1 to s_save_pc_lo/hi, since write_16sgpr_to_mem function will change the rsrc0
 	s_mov_b32	s_save_xnack_mask, s_save_buf_rsrc0
 	s_add_u32	s_save_buf_rsrc0, s_save_buf_rsrc0, s_save_mem_offset
 	s_addc_u32	s_save_buf_rsrc1, s_save_buf_rsrc1, 0
+end
 
 	s_mov_b32	m0, 0x0							//SGPR initial index value =0
 	s_nop		0x0							//Manually inserted wait states
@@ -353,6 +420,18 @@ L_SAVE_SGPR_LOOP:
 	s_movrels_b64	s14, s14						//s14 = s[14+m0], s15 = s[15+m0]
 
 	write_16sgpr_to_mem(s0, s_save_buf_rsrc0, s_save_mem_offset)
+
+if NO_SQC_STORE
+	s_cmp_eq_u32	ttmp13, 0x20						//have 32 VGPR lanes filled?
+	s_cbranch_scc0	L_SAVE_SGPR_SKIP_TCP_STORE
+
+	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+	s_add_u32	s_save_mem_offset, s_save_mem_offset, 0x80
+	s_mov_b32	ttmp13, 0x0
+	v_mov_b32	v2, 0x0
+L_SAVE_SGPR_SKIP_TCP_STORE:
+end
+
 	s_add_u32	m0, m0, 16						//next sgpr index
 	s_cmp_lt_u32	m0, 96							//scc = (m0 < first 96 SGPR) ? 1 : 0
 	s_cbranch_scc1	L_SAVE_SGPR_LOOP					//first 96 SGPR save is complete?
@@ -366,43 +445,12 @@ L_SAVE_SGPR_LOOP:
 	s_movrels_b64	s10, s10						//s10 = s[10+m0], s11 = s[11+m0]
 	write_12sgpr_to_mem(s0, s_save_buf_rsrc0, s_save_mem_offset)
 
+if NO_SQC_STORE
+	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
+else
 	// restore s_save_buf_rsrc0,1
 	s_mov_b32	s_save_buf_rsrc0, s_save_xnack_mask
-
-	/* save first 4 VGPR, then LDS save could use   */
-	// each wave will alloc 4 vgprs at least...
-
-	s_mov_b32	s_save_mem_offset, 0
- 	s_mov_b32	exec_lo, 0xFFFFFFFF					//need every thread from now on
-	s_lshr_b32	m0, s_wave_size, S_WAVE_SIZE
-	s_and_b32	m0, m0, 1
-	s_cmp_eq_u32	m0, 1
-	s_cbranch_scc1	L_ENABLE_SAVE_4VGPR_EXEC_HI
-	s_mov_b32	exec_hi, 0x00000000
-	s_branch	L_SAVE_4VGPR_WAVE32
-L_ENABLE_SAVE_4VGPR_EXEC_HI:
-	s_mov_b32	exec_hi, 0xFFFFFFFF
-	s_branch	L_SAVE_4VGPR_WAVE64
-L_SAVE_4VGPR_WAVE32:
-	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
-
-	// VGPR Allocated in 4-GPR granularity
-
-	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
-	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128
-	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*2
-	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:128*3
-	s_branch	L_SAVE_LDS
-
-L_SAVE_4VGPR_WAVE64:
-	s_mov_b32	s_save_buf_rsrc2, 0x1000000				//NUM_RECORDS in bytes
-
-	// VGPR Allocated in 4-GPR granularity
-
-	buffer_store_dword	v0, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1
-	buffer_store_dword	v1, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256
-	buffer_store_dword	v2, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*2
-	buffer_store_dword	v3, v0, s_save_buf_rsrc0, s_save_mem_offset slc:1 glc:1 offset:256*3
+end
 
 	/* save LDS */
 
@@ -423,7 +471,7 @@ L_SAVE_LDS_NORMAL:
 	s_cbranch_scc0	L_SAVE_LDS_DONE						//no lds used? jump to L_SAVE_DONE
 
 	s_barrier								//LDS is used? wait for other waves in the same TG
-	s_and_b32	s_save_tmp, s_save_exec_hi, S_SAVE_SPI_INIT_FIRST_WAVE_MASK
+	s_and_b32	s_save_tmp, s_wave_size, S_SAVE_SPI_INIT_FIRST_WAVE_MASK
 	s_cbranch_scc0	L_SAVE_LDS_DONE
 
 	// first wave do LDS save;
@@ -856,6 +904,8 @@ L_RESTORE_HWREG:
 	s_lshr_b32	s_restore_m0, s_restore_m0, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT
 	s_setreg_b32	hwreg(HW_REG_TRAPSTS, SQ_WAVE_TRAPSTS_POST_SAVECTX_SHIFT, SQ_WAVE_TRAPSTS_POST_SAVECTX_SIZE), s_restore_m0
 	s_setreg_b32	hwreg(HW_REG_MODE), s_restore_mode
+
+if ASIC_TARGET_NAVI1X
 	s_and_b32	s_restore_m0, s_restore_tmp, S_SAVE_PC_HI_RCNT_MASK
 	s_lshr_b32	s_restore_m0, s_restore_m0, S_SAVE_PC_HI_RCNT_SHIFT
 	s_lshl_b32	s_restore_m0, s_restore_m0, SQ_WAVE_IB_STS_RCNT_SHIFT
@@ -873,6 +923,7 @@ L_RESTORE_HWREG:
 	s_and_b32	s_restore_m0, s_restore_status, SQ_WAVE_STATUS_INST_ATC_MASK
 	s_lshr_b32	s_restore_m0, s_restore_m0, SQ_WAVE_STATUS_INST_ATC_SHIFT
 	s_setreg_b32 	hwreg(HW_REG_IB_STS), s_restore_mode
+end
 
 	s_and_b64	exec, exec, exec					// Restore STATUS.EXECZ, not writable by s_setreg_b32
 	s_and_b64	vcc, vcc, vcc						// Restore STATUS.VCCZ, not writable by s_setreg_b32
@@ -887,15 +938,28 @@ L_END_PGM:
 end
 
 function write_hwreg_to_mem(s, s_rsrc, s_mem_offset)
+if NO_SQC_STORE
+	// Copy into VGPR for later TCP store.
+	v_writelane_b32	v2, s, m0
+	s_add_u32	m0, m0, 0x1
+else
 	s_mov_b32	exec_lo, m0
 	s_mov_b32	m0, s_mem_offset
 	s_buffer_store_dword	s, s_rsrc, m0 glc:1
 	s_add_u32	s_mem_offset, s_mem_offset, 4
 	s_mov_b32	m0, exec_lo
 end
+end
 
 
 function write_16sgpr_to_mem(s, s_rsrc, s_mem_offset)
+if NO_SQC_STORE
+	// Copy into VGPR for later TCP store.
+	for var sgpr_idx = 0; sgpr_idx < 16; sgpr_idx ++
+		v_writelane_b32	v2, s[sgpr_idx], ttmp13
+		s_add_u32	ttmp13, ttmp13, 0x1
+	end
+else
 	s_buffer_store_dwordx4	s[0], s_rsrc, 0 glc:1
 	s_buffer_store_dwordx4	s[4], s_rsrc, 16 glc:1
 	s_buffer_store_dwordx4	s[8], s_rsrc, 32 glc:1
@@ -903,15 +967,23 @@ function write_16sgpr_to_mem(s, s_rsrc, s_mem_offset)
 	s_add_u32	s_rsrc[0], s_rsrc[0], 4*16
 	s_addc_u32	s_rsrc[1], s_rsrc[1], 0x0
 end
+end
 
 function write_12sgpr_to_mem(s, s_rsrc, s_mem_offset)
+if NO_SQC_STORE
+	// Copy into VGPR for later TCP store.
+	for var sgpr_idx = 0; sgpr_idx < 12; sgpr_idx ++
+		v_writelane_b32	v2, s[sgpr_idx], ttmp13
+		s_add_u32	ttmp13, ttmp13, 0x1
+	end
+else
 	s_buffer_store_dwordx4	s[0], s_rsrc, 0 glc:1
 	s_buffer_store_dwordx4	s[4], s_rsrc, 16 glc:1
 	s_buffer_store_dwordx4	s[8], s_rsrc, 32 glc:1
 	s_add_u32	s_rsrc[0], s_rsrc[0], 4*12
 	s_addc_u32	s_rsrc[1], s_rsrc[1], 0x0
 end
-
+end
 
 function read_hwreg_from_mem(s, s_rsrc, s_mem_offset)
 	s_buffer_load_dword	s, s_rsrc, s_mem_offset glc:1
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 25a2703621a7..c36a352776a7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -580,6 +580,10 @@ static void kfd_cwsr_init(struct kfd_dev *kfd)
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx9_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx9_hex;
 			kfd->cwsr_isa_size = sizeof(cwsr_trap_gfx9_hex);
+		} else if (kfd->device_info->asic_family < CHIP_SIENNA_CICHLID) {
+			BUILD_BUG_ON(sizeof(cwsr_trap_nv1x_hex) > PAGE_SIZE);
+			kfd->cwsr_isa = cwsr_trap_nv1x_hex;
+			kfd->cwsr_isa_size = sizeof(cwsr_trap_nv1x_hex);
 		} else {
 			BUILD_BUG_ON(sizeof(cwsr_trap_gfx10_hex) > PAGE_SIZE);
 			kfd->cwsr_isa = cwsr_trap_gfx10_hex;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
