Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC8585A8C
	for <lists+amd-gfx@lfdr.de>; Sat, 30 Jul 2022 15:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348410E7ED;
	Sat, 30 Jul 2022 13:13:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9FD10E06C;
 Sat, 30 Jul 2022 03:49:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so8298311pjh.0; 
 Fri, 29 Jul 2022 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=r+qywY7kA8NvmShf93wAGS9Ca1t7b/va4t24ai1ehT8=;
 b=UDfKysp5lzZLUsS6TLfawDoxrvAJHSrRbbd+WNAV1yd1P5Qz0LIH1Yky4tygHDXfCL
 ehuKX/ILB2P33EgRpn6G3rmDRZ7CR2nn7PXWm1XHK+CheH8ezNZ4Be7+cCsepJhNy4kE
 TPk1C40Wfl5ZRlerYdsxPlaT4NbHrmaXlK19UyZBqjvJjwjB8JkiMzo7Nj1swKj2Pl9y
 AKi6LM4cHuD9b/HtvpD3MAEu3wwmnKomq3EPnaEI6h4XNTVY4xTmrG9HSpZePE+U9rTE
 n325lXzL+z5wlT8qJLspovrsZ0jOtB/m/Vtq1KO5+YmZS/nwSAVgfWPpMGaNRJrcbk1d
 T04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=r+qywY7kA8NvmShf93wAGS9Ca1t7b/va4t24ai1ehT8=;
 b=RsIJqx3o1UYl74WHG1PK+oHdlTvMkS65JECzXu/lN19BKQZvnaSWQS7oHYfLFTBLOD
 1DvmMfZIpCl+D6jTvKSUlKkal9U5HK7cRCCsb4+yM+rJUaFzHQFPtUrGxw+blsTGfVv9
 mhnla5coxmcM3rHV+1ky1/VE/msV7en+XyZRBYkAdbX4OE9HLHdjM0LRBNUr59Xzbl67
 gwCXY50Pu4rlXc27syo/1wABq+Q+tiSsv7kv15+8c3FgUBCwaPCbjoFvp45h8A+aKbmz
 YrPVhMT57JckAUc8X5yS0N2mHHE3XMRG0XFV04y1lKBpwOhPzm8yke9mBoxnXDzOAmUX
 cL2A==
X-Gm-Message-State: ACgBeo1ltBx3VADFPto1GsEIZDSYwI6ujWzi9UmyKGm3TybZ7Fr3FGfF
 7NMO6rnx5UtpD/ozBUY1tLWrjVTaAOqWFz9H
X-Google-Smtp-Source: AA6agR5uP0KjleeQ3OK0KIGRTTGFjlItDsxKI5u+6bkvdhYY/TyovEbYNU2MNFjSDEaQNVCll+T2Ow==
X-Received: by 2002:a17:90b:4a0d:b0:1f0:3400:52df with SMTP id
 kk13-20020a17090b4a0d00b001f0340052dfmr7554091pjb.154.1659152970292; 
 Fri, 29 Jul 2022 20:49:30 -0700 (PDT)
Received: from sebin-inspiron.bbrouter ([103.183.83.122])
 by smtp.gmail.com with ESMTPSA id
 21-20020a621715000000b0052d194a65fesm192613pfx.63.2022.07.29.20.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 20:49:29 -0700 (PDT)
From: Sebin Sebastian <mailmesebin00@gmail.com>
To: 
Subject: [PATCHv2 -next] drm/amdgpu: double free error and freeing
 uninitialized null pointer
Date: Sat, 30 Jul 2022 09:16:58 +0530
Message-Id: <20220730034923.25500-1-mailmesebin00@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 30 Jul 2022 13:13:53 +0000
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 David Airlie <airlied@linux.ie>, mailmesebin00@gmail.com, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix a double free and an uninitialized pointer read error. Both tmp and
new are pointing at same address and both are freed which leads to
double free. Adding a check to verify if new and tmp are free in the
error_free label fixes the double free issue. new is not initialized to
null which also leads to a free on an uninitialized pointer.

Suggested by: S. Amaranath <Amaranath.Somalapuram@amd.com>
Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
---
Changes in v2:
Updated patch body as suggested by André Almeida <andrealmeid@igalia.com>
Reworked to implement a check in error_free for fixing double free error
as suggested by S. Amaranath <Amaranath.Somalapuram@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index e2eec985adb3..cb00c7d6f50b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1705,7 +1705,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
 	char reg_offset[11];
-	uint32_t *new, *tmp = NULL;
+	uint32_t *new = NULL, *tmp = NULL;
 	int ret, i = 0, len = 0;
 
 	do {
@@ -1747,7 +1747,8 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 	ret = size;
 
 error_free:
-	kfree(tmp);
+	if (tmp != new)
+		kfree(tmp);
 	kfree(new);
 	return ret;
 }
-- 
2.34.1

