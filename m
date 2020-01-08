Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DC134F71
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2020 23:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3237C88007;
	Wed,  8 Jan 2020 22:35:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6CE6E343
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2020 22:35:02 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id l22so1933748ywc.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jan 2020 14:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rZtAvG7qgjeC+ylOjqcMVH5dyqhKfqY95/PGM5Nsqok=;
 b=Cl/7S/UGbfpoShQKqYVA6GHmqzaBBkA/Zg/luW0lrmRWhYnhMicGn69xUd8b0ENo7D
 2U2XgyK2EtMnE47AVW5bLVYZroKqkGdxZSeC7rIPwKMOY0brxS5F4W9RFg/TjaYN+4Eh
 xcQjRQJkWV2fYBeegbufwta2b2tXUmCNfAjlxB1A9Wpu75jIwSEn0EvqQglTy/a8MLjh
 5YR9xBJqKinr7okgkTMsGdk+RX2C5r+QiXbevL31IA6PXsFXePaFXATo5+2+YnFCE5tp
 noJ3pe4VmjYVuyOGVZ1JUGF9MxDsnukDgGBq1Hyf2LcCgjwDo64HgM7OQISU+xLLei+A
 XGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rZtAvG7qgjeC+ylOjqcMVH5dyqhKfqY95/PGM5Nsqok=;
 b=AeNi9bfWSw3SWSSKDOtKc+QM+byvQLDG/UfO4tk6zoWtxW8vduF7gPlnjM7PHFlDXW
 0aoBLKCGo1A9pPwWXxZsyL12vIFXKZGnZeB6pK4yqfTdrvKBFA428FdzVkCl8+oSHliR
 H4ufLkxkxOUq4NDMkn+AhFXjbIr/dfVnvNPdzwulBxqrswDXkTfx8DpF5GibNaudOLTU
 3SbqXUCUY+rC6K9pEnk6r9gdbCPyA7m2iihsIEgA83oxOX3p6Yng0wlpv3bcScYksHrL
 Ivu5UsXLSoY+/NNQdW+8q/gd29AuvCPbUDzPbuwrGC1Zj/a9opU5km0TQzds2v64w3jx
 l2gQ==
X-Gm-Message-State: APjAAAWyAoxP1MdhOKEARwTaYt3MRKoWfD8rswVHZJL8Y3pyy9fR62wc
 X7l8LxCw2uqcwk19L+HlW/DxRejm
X-Google-Smtp-Source: APXvYqyDoHumzfLK7d7ByUGIKwg3n+6mNTO76cE853inbKmopRbEuLh10oeZlrqb4UfB99kt6Y+W5w==
X-Received: by 2002:a0d:dd13:: with SMTP id g19mr5301884ywe.129.1578522901981; 
 Wed, 08 Jan 2020 14:35:01 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z2sm2007786ywb.13.2020.01.08.14.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 14:35:01 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/gfx9: remove unused sdma headers
Date: Wed,  8 Jan 2020 17:34:53 -0500
Message-Id: <20200108223453.268720-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

All of the sdma stuff these were used for moves to
the sdma code, so remove them.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 951eba7522ef..ce2b02dc7b64 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -48,15 +48,6 @@
 
 #include "amdgpu_ras.h"
 
-#include "sdma0/sdma0_4_2_offset.h"
-#include "sdma1/sdma1_4_2_offset.h"
-#include "sdma2/sdma2_4_2_2_offset.h"
-#include "sdma3/sdma3_4_2_2_offset.h"
-#include "sdma4/sdma4_4_2_2_offset.h"
-#include "sdma5/sdma5_4_2_2_offset.h"
-#include "sdma6/sdma6_4_2_2_offset.h"
-#include "sdma7/sdma7_4_2_2_offset.h"
-
 #define GFX9_NUM_GFX_RINGS     1
 #define GFX9_MEC_HPD_SIZE 4096
 #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
