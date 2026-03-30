Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJRhDn8KymmL4gUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 07:30:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DC53558D3
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 07:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8310E42B;
	Mon, 30 Mar 2026 05:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FH+K+Md+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576510E42B
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2026 05:30:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b982b0889d8so476747966b.2
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Mar 2026 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774848634; x=1775453434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rzyOkW6psCI+1rNPxWyjW/PJoO9NXtwwLlsKbLLkl+8=;
 b=FH+K+Md+QQnL4XlTnQ7HLl4ryVH7zKR71FvJl4XqrngL6j+DYRRwOkbRYNaVOx7lGZ
 eEHBNCQvhfTCsAP0Dw5aMTee/y3Lx3tNOLqLTAXei6Rd7qX18LVzlgTqPyc8d/Cym0xy
 aJDNs7qU3rX7F1Wp+8DkPQTIc9GLor7lkTcG8vzGL38pBJayQlKbcfsRO1t+KCoicDMp
 xWOi6zcD/yGDrCMldCBWtugKUC8x8a0gNIgUE2qG9hkZZ7Aai0ffah8+EZXw6G8tuFyQ
 hxn2+TsEwbSkT7yeQFDQKvS+NHAYAVUUwmwL1Fa5q2Fa8niXTQ+JhbpglB6sXNeTdS/s
 vszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774848634; x=1775453434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzyOkW6psCI+1rNPxWyjW/PJoO9NXtwwLlsKbLLkl+8=;
 b=AdFLADVCbvVE26nozbWG6Qhjg36sON/XyU1joOgan0ZBn5U9ieQkdlVKynEdflDxAS
 sIEvIM7qJrh2c90Hiaouy9R42BfO/8/dSng7x2c/YPlH0ph7YXZN1Ze2jthHZWmHmEFI
 aqTGza4pCuGam9z85cNPWJxKxNsF9KM5MH9Ju4iV/wll5xXpiJ02llV9r/IJPk1pTxaf
 DgRdDJtnf2DfTjkzS/HwFOWzCjBHfGC+KqFuBksPdFHbCNdcG9zt+CjUoHReRlOIe8Q/
 8on6bNnFXaQ4SDdI+uUfqLMP68qH+v7V4E66cX/b5sogH0521YwkGJApK4kqa+g1sXg6
 TuBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeIDLtIKoAw3qNHRnSaOC546yy/E5MgZiLTDZL5PuerxLdDEinq7YYgN/WoKnzdbtODHS9Np7p@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzek32o/NoA7lldbnroVcTyZhnroKPQPBLXb8tOHV0/glMzc3e9
 WyydHFopVYhtQk0DDgIymz9YmFSjetsKXaXC73wh02Tf+7DAokVHnJLF
X-Gm-Gg: ATEYQzxUtLjWd5ug5v+6CLI2gV4zXjJJ4D8jXH2JLFJgcTj6fI932POlC14VyjUt1NJ
 ZgYJS+4t19O+oVsP+RueMonGNYBYgr1X/WIVP621i/nETXbSkovYSO2+xc+hqbUn7lKIZ+GKsXt
 HIlB2P0jyAWtzJgqefB05S34Bt8lyUq9vXP+atgioUUZxauHHvJYjOX3HooKVxFAElJQNWzJqgP
 /9MVhkfrORPopYy1luTg07APQoeq78ZxVHTtk/YaRpn8wDgubw5pA+xCYEsjpUvBbH4LFwQpJVH
 uP5thnyCv3r7d4+TYbmh2MLBPHLq+6UDcWPBMuYtr0FZdERZf7oy93cxDr+BiVHxTOOrJfe1+LP
 M91sTAhdjjYfEELdveeGgaW2eBELf4NLWLxB459T/J0pdND7e2oxsPBs8X95jj9paNEGLoBaTlZ
 UcCadGgbvF/81HG2o4Ky5Mtayipcu1vgRTBCpv33k35DY=
X-Received: by 2002:a17:906:b39e:b0:b98:3e7a:22c2 with SMTP id
 a640c23a62f3a-b9b5090a9admr504129566b.31.1774848633956; 
 Sun, 29 Mar 2026 22:30:33 -0700 (PDT)
Received: from localhost ([178.214.243.78]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b1a5fc9sm240417066b.36.2026.03.29.22.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 22:30:32 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Eric Huang <jinhuieric.huang@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2 0/2] drm/amdgpu: fix locking issues in PASID IDR management
Date: Mon, 30 Mar 2026 10:30:23 +0500
Message-ID: <20260330053025.19203-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mikhailvgavrilov@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jinhuieric.huang@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:stable@vger.kernel.org,m:mikhail.v.gavrilov@gmail.com,m:mikhailvgavrilov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.933];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 95DC53558D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 8f1de51f49be ("drm/amdgpu: prevent immediate PASID reuse case")
converted the global PASID allocator from IDA to IDR with a spinlock
for cyclic allocation.  This introduced two locking bugs:
 
1) idr_alloc_cyclic() is called with GFP_KERNEL under spin_lock(),
   which can sleep.
 
2) amdgpu_pasid_free() can be called from hardirq context via the
   fence signal path (amdgpu_pasid_free_cb), but the lock is taken
   with plain spin_lock() in process context, creating a potential
   deadlock:
 
     CPU0
     ----
     spin_lock(&amdgpu_pasid_idr_lock)   // process context, IRQs on
     <Interrupt>
       spin_lock(&amdgpu_pasid_idr_lock) // deadlock
 
   The hardirq call chain is:
 
     sdma_v6_0_process_trap_irq
      -> amdgpu_fence_process
       -> dma_fence_signal
        -> drm_sched_job_done
         -> dma_fence_signal
          -> amdgpu_pasid_free_cb
           -> amdgpu_pasid_free
 
   This was observed on an RX 7900 XTX when exiting a Vulkan game
   running under Proton/Wine, which triggers the fence callback path
   during VM teardown.
 
Patch 1 fixes the sleeping-under-spinlock by using idr_preload() with
GFP_KERNEL before taking the lock, then GFP_NOWAIT for the actual
allocation.
 
Patch 2 converts all three spin_lock/spin_unlock call sites to
spin_lock_irqsave/spin_unlock_irqrestore.
 
Tested on ASUS ROG STRIX B650E-I / Ryzen 9 7950X / RX 7900 XTX with
CONFIG_PROVE_LOCKING=y.  The lockdep warning is no longer triggered
after applying both patches.

Mikhail Gavrilov (2):
  drm/amdgpu: fix sleeping allocation under spinlock in PASID IDR
  drm/amdgpu: use spin_lock_irqsave for PASID IDR lock

 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.53.0

