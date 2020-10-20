Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AF292773
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Oct 2020 14:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DC26E94F;
	Mon, 19 Oct 2020 12:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 699 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2020 09:51:31 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957316E8FE;
 Mon, 19 Oct 2020 09:51:31 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CFBYX4NWwz9tyZN;
 Mon, 19 Oct 2020 11:39:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
X-Amavis-Alert: BAD HEADER SECTION, Non-encoded 8-bit data (char C3 hex): To:
 ...er@amd.com>, "Christian K\303\203\302\266nig" <christia[...]
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id a-YTapLndcIH; Mon, 19 Oct 2020 11:39:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CFBYX3XMHz9tyZK;
 Mon, 19 Oct 2020 11:39:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 807278B79C;
 Mon, 19 Oct 2020 11:39:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
X-Amavis-Alert: BAD HEADER SECTION, Non-encoded 8-bit data (char C3 hex): To:
 ...er@amd.com>, "Christian K\303\203\302\266nig" <christia[...]
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MPAOOITwO4ip; Mon, 19 Oct 2020 11:39:49 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [10.25.210.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA7EC8B79A;
 Mon, 19 Oct 2020 11:39:48 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BBD4266467; Mon, 19 Oct 2020 09:39:48 +0000 (UTC)
Message-Id: <1a5d454cf080a00c04ae488ef6e98d5fcc933550.1603100151.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] drm/amd/display: Fix missing declaration of
 enable_kernel_vsx()
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian König" <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 19 Oct 2020 09:39:48 +0000 (UTC)
X-Mailman-Approved-At: Mon, 19 Oct 2020 12:38:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Include <asm/switch-to.h> in order to avoid following build failure
because of missing declaration of enable_kernel_vsx()

  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:37,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:27:
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c: In function 'dcn_bw_apply_registry_override':
./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:64:3: error: implicit declaration of function 'enable_kernel_vsx'; did you mean 'enable_kernel_fp'? [-Werror=implicit-function-declaration]
   64 |   enable_kernel_vsx(); \
      |   ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:640:2: note: in expansion of macro 'DC_FP_START'
  640 |  DC_FP_START();
      |  ^~~~~~~~~~~
./drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:75:3: error: implicit declaration of function 'disable_kernel_vsx'; did you mean 'disable_kernel_fp'? [-Werror=implicit-function-declaration]
   75 |   disable_kernel_vsx(); \
      |   ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:676:2: note: in expansion of macro 'DC_FP_END'
  676 |  DC_FP_END();
      |  ^~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.o] Error 1

Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index c3bbfe397e8d..9000cf188544 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -33,6 +33,7 @@
 #include <linux/slab.h>
 
 #include <asm/byteorder.h>
+#include <asm/switch-to.h>
 
 #include <drm/drm_print.h>
 
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
