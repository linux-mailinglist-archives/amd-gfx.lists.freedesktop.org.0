Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF674F9D4
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jul 2023 23:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD45B10E43A;
	Tue, 11 Jul 2023 21:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD810E438;
 Tue, 11 Jul 2023 21:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WH7Cm3VveDbv6D+GxRpXLNfTbvl+zR6aYn4to7mM5e0=; b=o6ZCvMVtkCfTreopWJ0LzaVhuw
 BpyVOSfP1bMdVfWrbafOBb2fOdFbsHfTlv+klJvaVKoNt6j3iQ/0q/U8Og+M9LC5pEtMURUGNXGS5
 fci8b6lrQ20/F99S8foYZPyG7KGKd97Vm2vwFlvIS9P3x7TmIqXSz5qApGZSfoSxF/ybGn1g27XgN
 /GgLePM+/Pov1YFOnw5OzewKz2tl6pvAUqSs2SslC5GucnwcfaPCBXtBqXd+PSDBYKQH/tNr2AbsH
 ACHoxrtQT1Ejq5c4nTQIJ5w2Jx86RrCBUSKlWkC90wYL/0RBPnxrGi5l0G9RqT32rEBh1acgWAyQi
 SIpq0c1g==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJL1U-00Cl0M-Ph; Tue, 11 Jul 2023 23:35:53 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/amdgpu: Limit info in coredump for kernel threads
Date: Tue, 11 Jul 2023 18:34:59 -0300
Message-ID: <20230711213501.526237-5-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711213501.526237-1-andrealmeid@igalia.com>
References: <20230711213501.526237-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

If a kernel thread caused the reset, the information available to be
logged will be limited, so return early in the dump function.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 23b9784e9787..7449aead1e13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4988,10 +4988,14 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
 	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
-	if (coredump->reset_task_info.pid)
+	if (coredump->reset_task_info.pid) {
 		drm_printf(&p, "process_name: %s PID: %d\n",
 			   coredump->reset_task_info.process_name,
 			   coredump->reset_task_info.pid);
+	} else {
+		drm_printf(&p, "GPU reset caused by a kernel thread\n");
+		return count - iter.remain;
+	}
 
 	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
-- 
2.41.0

