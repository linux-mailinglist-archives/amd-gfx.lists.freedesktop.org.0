Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBm2LkTenWmuSQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 18:22:12 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15E18A7C0
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Feb 2026 18:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002C410E1BA;
	Tue, 24 Feb 2026 17:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UzFeM0ps";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323D310E1BA
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Feb 2026 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771953727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8SD2VoRr+tc5wYI9TVLRWC6aPDSxE2BzY5GPr4tLxmE=;
 b=UzFeM0psOx2Ig+VSpBD99VcyZwXqQmrvUjRUjzruVV21q74rMIfnmNw6g/zpFmLXvD+VZh
 Ir/AjY0B5Dwjvcru0VApc6YfmIjX+kB4zwkRprxRzHvIoDk7Jnv0T4IOv3WlRpeMXOTdi5
 h+qFyDH4SY0BaWY3AaTPlJQ8FguxBgo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-vW28RLunPOSq6EFbrPfPgA-1; Tue, 24 Feb 2026 12:22:05 -0500
X-MC-Unique: vW28RLunPOSq6EFbrPfPgA-1
X-Mimecast-MFC-AGG-ID: vW28RLunPOSq6EFbrPfPgA_1771953725
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-896f50f008eso636119046d6.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Feb 2026 09:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771953725; x=1772558525;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8SD2VoRr+tc5wYI9TVLRWC6aPDSxE2BzY5GPr4tLxmE=;
 b=VJtKjJ6xWN3tt1e3xhrZJOD0Dx2WoBGXBSOKeswvrp1/UFPNMWJjBkMp8mEjHm+rR+
 MRDhJqJFWDPZOeFJQl4V5l2p0H/wM06LqEn61Tj0r83J1dQBQKD6iW1F+69ETWV8/7MX
 39erwHF5uBUT1TpSOzLpdq/F2PHUl/fQDP2GnQxbDxmB8ggLv1GlFzwQxp/r0OB5mCVd
 FMpPX76mcAnJtNL62zvY2frQl6feiI16daBitv8rl7ppTLdpc4V7HO1bgO+l2ln0dpcS
 Z3Zoi5qS7wru/2GqujaES11uxvSFJQEJpP/lNjPcaRbl6p4uV4bqfBPFFMX32kKmf5G7
 ZCPw==
X-Gm-Message-State: AOJu0YxDvdt5UO9yTWQYU7OhArYmHNRa/aWBEKtNHDUvK0kNgoKhgGhp
 RERfHhGtUgkp+Xo3I/VzySWdIwhkm9zf6Bx5K0OkTolzfgxQO/8/qgsrSdRVs0n0HbY5grL00/N
 llgtxuDkHC+/I4gHhLT1mnTdQMLJmesfJZ8XwzNwPwY8kcvx3nJhRI1F98omwoPUJRc4=
X-Gm-Gg: ATEYQzz3NZKgtKG21MRFa1bGoM02T2kqUuIugNFp3GpUvPv8jfq0v6j145/iWE9+pp+
 dg9ie4uVqCxmSxs45729qw9z6E3D4Qfqbrd9tiKw/mu9kvWTcp5vZj+JkIIztS/FAUziwd9DsL3
 p9ZdBrXTDVdYn6xayej9qyf3e6hZlOQZ8yPy41IOqAAIr6NROXF1mFKmz4US3zE14wTmj+kHFS4
 0Ym/6bVT7K2JsN+djV3dLCW59SHP04JoMVPm+OfioJRlLD0WiAQafJbpBCCmvNK7yux6kH8ZcwW
 hFWeQrirvvJRgtwr1b2jefP7GxCY4s8hH9WaQID8xXRdEqiKGO31SmdDcNx6ajO8Ke/aPcB0n1f
 WULQUnsLdKKmnxvNfSJehkKzG
X-Received: by 2002:a05:6214:485:b0:895:4b79:83a3 with SMTP id
 6a1803df08f44-89979c3d88emr159055436d6.8.1771953725008; 
 Tue, 24 Feb 2026 09:22:05 -0800 (PST)
X-Received: by 2002:a05:6214:485:b0:895:4b79:83a3 with SMTP id
 6a1803df08f44-89979c3d88emr159054966d6.8.1771953724466; 
 Tue, 24 Feb 2026 09:22:04 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8997e62fd3dsm102044536d6.39.2026.02.24.09.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 09:22:04 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 24 Feb 2026 12:21:45 -0500
Subject: [PATCH] drm/amdkfd: remove duplicate ttmp11 scheduling mode
 definitions
MIME-Version: 1.0
Message-Id: <20260224-drm-amdkfd-ttmp11-sched-mode-v1-1-4254ff8952c4@redhat.com>
X-B4-Tracking: v=1; b=H4sIACjenWkC/x3MMQqAMAwAwK9IZgNtEEW/Ig7FpDZIVVoRQfy7x
 fGWeyBLUskwVA8kuTTrvhXYuoI5uG0RVC4GMtQaogY5RXSRV894nvGwFvMchDHuLOg61xFx37K
 3UIojidf778fpfT//tTBobgAAAA==
X-Change-ID: 20260224-drm-amdkfd-ttmp11-sched-mode-a7a722d96df1
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jay Cornwall <jay.cornwall@amd.com>, Lancelot Six <lancelot.six@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Peter Colberg <pcolberg@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6YLceBVMvIOOT7Ew8svGQ02kIff0OfjL89KTAGN8SnQ_1771953725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jay.cornwall@amd.com,m:lancelot.six@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:pcolberg@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DE15E18A7C0
X-Rspamd-Action: no action

TTMP11_SCHED_MODE_* are only used if RELAXED_SCHEDULING_IN_TRAP is defined.

Fixes: bbcad5a8896b ("drm/amdkfd: gfx12.1 trap handler support for expert scheduling mode")
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
index 456db81998993803a25b32653ad75d529e35931c..3c976a4aac739669a39aebeb97bb35dfaa1af2f2 100644
--- a/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
+++ b/drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
@@ -112,12 +112,6 @@ var BARRIER_STATE_MEMBER_OFFSET			= 4
 var BARRIER_STATE_MEMBER_SIZE			= 7
 var BARRIER_STATE_VALID_OFFSET			= 0
 
-#if RELAXED_SCHEDULING_IN_TRAP
-var TTMP11_SCHED_MODE_SHIFT			= 26
-var TTMP11_SCHED_MODE_SIZE			= 2
-var TTMP11_SCHED_MODE_MASK			= 0xC000000
-#endif
-
 var NAMED_BARRIERS_SR_OFFSET_FROM_HWREG		= 0x80
 var S_BARRIER_INIT_MEMBERCNT_MASK		= 0x7F0000
 var S_BARRIER_INIT_MEMBERCNT_SHIFT		= 0x10
@@ -134,9 +128,11 @@ var SQ_WAVE_MODE_DST_SRC0_SRC1_VGPR_MSB_SHIFT	= 12
 var SQ_WAVE_MODE_DST_SRC0_SRC1_VGPR_MSB_SIZE	= 6
 #endif
 
+#if RELAXED_SCHEDULING_IN_TRAP
 var TTMP11_SCHED_MODE_SHIFT			= 26
 var TTMP11_SCHED_MODE_SIZE			= 2
 var TTMP11_SCHED_MODE_MASK			= 0xC000000
+#endif
 var TTMP11_DEBUG_TRAP_ENABLED_SHIFT		= 23
 var TTMP11_DEBUG_TRAP_ENABLED_MASK		= 0x800000
 var TTMP11_FIRST_REPLAY_SHIFT			= 22

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-drm-amdkfd-ttmp11-sched-mode-a7a722d96df1

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

