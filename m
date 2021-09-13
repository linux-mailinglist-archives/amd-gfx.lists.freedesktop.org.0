Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B0409347
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Sep 2021 16:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B66E101;
	Mon, 13 Sep 2021 14:19:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E5166E101
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 14:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 47F4220201C;
 Mon, 13 Sep 2021 16:19:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id s3E15aBkAvaE; Mon, 13 Sep 2021 16:19:46 +0200 (CEST)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 93C9420201A;
 Mon, 13 Sep 2021 16:19:46 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mPmoE-007uA4-85;
 Mon, 13 Sep 2021 16:19:46 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: Cast atomic64_read return value
Date: Mon, 13 Sep 2021 16:19:46 +0200
Message-Id: <20210913141946.1884173-1-michel@daenzer.net>
X-Mailer: git-send-email 2.33.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

Avoids warning with -Wformat:

  CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.o
../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.c: In function ‘kfd_smi_event_update_thermal_throttling’:
../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_smi_events.c:224:60: warning: format ‘%llx’ expects argument of type
 ‘long long unsigned int’, but argument 6 has type ‘long int’ [-Wformat=]
  224 |         len = snprintf(fifo_in, sizeof(fifo_in), "%x %x:%llx\n",
      |                                                         ~~~^
      |                                                            |
      |                                                            long long unsigned int
      |                                                         %lx
  225 |                        KFD_SMI_EVENT_THERMAL_THROTTLE, throttle_bitmask,
  226 |                        atomic64_read(&adev->smu.throttle_int_counter));
      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        |
      |                        long int

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index ed4bc5f844ce..46e1c0cda94c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -223,7 +223,7 @@ void kfd_smi_event_update_thermal_throttling(struct kfd_dev *dev,
 
 	len = snprintf(fifo_in, sizeof(fifo_in), "%x %llx:%llx\n",
 		       KFD_SMI_EVENT_THERMAL_THROTTLE, throttle_bitmask,
-		       atomic64_read(&adev->smu.throttle_int_counter));
+		       (u64)atomic64_read(&adev->smu.throttle_int_counter));
 
 	add_event_to_kfifo(dev, KFD_SMI_EVENT_THERMAL_THROTTLE,	fifo_in, len);
 }
-- 
2.33.0

