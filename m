Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEduFsmdiWmJ/wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 09:41:45 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5810D1CB
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 09:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B669210E35E;
	Mon,  9 Feb 2026 08:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="I8guTTB/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697510E038
 for <amd-gfx@lists.freedesktop.org>; Sun,  8 Feb 2026 00:02:58 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8c7146b0854so353873485a.2
 for <amd-gfx@lists.freedesktop.org>; Sat, 07 Feb 2026 16:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770508977;
 x=1771113777; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ixKYwI8fU81gZ+QKkq1WjH9E+1EyNt8hakHtj7h1q4=;
 b=I8guTTB/pfz2/bUtNifKS+rcaVywzGRtYzYN5Mk4YqIAeGZjbg4ZYfcIB4Fl8iZmwN
 5Kr8tAAiul/pEzIp9mVTDLVJqWDmnBk6V39aelx8V5rRSYSj/5VjgMYpBuCbyPUK4BIB
 UfcOnKzPjr+83FyzytXn0I1bfF2JmuqbrtfdTP6P6b8sg4OHac+/JXr8gyYP1GTTvOwe
 T3VCxm+46zN3XC1ZGufekA28zx5jQnX3XefCCwfhcjfMdRhdv6AXRvdOG2QTgLTTScVz
 5WVfDsVPbuditIY6l55/s0s7PPmpoqIPUig2+t0EtU434EaMVhtSsw++Zgd9P1+z0/Zs
 O3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770508977; x=1771113777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ixKYwI8fU81gZ+QKkq1WjH9E+1EyNt8hakHtj7h1q4=;
 b=sPbDP6Du6n9AvPRl4l0PvFGNhYiPW+8F/93tfEccqYgtTvptCZk+IbMH3WDfjPcwYW
 BjvAorANCKK2DZTNJIAbS1IzJk1qZ/PNvVUl+QjNWMhrgRZ9v3S0r+eNZGi0rPc+8Lx8
 ZdAI6TX8Wrt8KBNzQYnRNVJB3FOJQpsrFrVFe9++D071ZOEDqNDXHS0k7GgI3InlrR0w
 rQxc7Ey+DbrR/m5/YCrXMy0AAna8FjgywSol4UcQCHoYlJMO97DA/l/dLe1rdrH/IfTd
 uQL3MjeYZqDiP5/HRL4d99zvxU2XAKCz50UsB8cPtBPRhOghBk5ejo6EQ4GrfE/CX1SC
 mCHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPUCK2wbgQ6nLp/sL2d9Vv+IlI+coJ6u4OM3YEmepaOAXnlUxsODmF/funUrdkgL8QX5LUK7BW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAQ47+5nG5FASbuKUzUfxNNOeV+eelcI/Vb+5xIAz4g9eVmcds
 IPmwuvW7sMPDcy3pBlhZxXMH97gcqzxB7t5TCwJExgmRAlVgLpx6QLq3Oxiklo1q+Hs=
X-Gm-Gg: AZuq6aIppIPRIEwLqz2+0o9CTgQR+DFisLsHDxBLy/RWMOZ2Z1IpuTUZ+XwhFR48twN
 sZIXULdAMfaQ/WGc/Pd4UxVhPH4tXGjZWwcPNs3VYBVZjaGal/yKs780jKTf2hdcSuVUhOqCZxk
 zTR+RRUBhgAf+dBeOQIrRFO/T0IP+nBtBuLHl2sUjcJEx3Yfg6XmVM0Rz7mf8YHJmp2/L+HthdS
 9jxhQGwdN9wtkAXxreH9jZT6jPNCtaEOPPxczltxo3S6xDcQ4xWvnVfzcwkbsoSBuUKEkk6YcfU
 MwvnpIjBDc+oLXApUSND0eNwyLMefRoW/fD8GoBLnvEyAam/bmVoW37LO7+N67zKtho2Zf3UCXY
 WzZfIliGSVqQWeRhktEjBSUAeRytHOVatkqU7R3a9zPv3eMexmpQDOedeSsl2oOrz6lxyruWACh
 OPZQvh61pvRbH8Z0cZjDdd0urYlEOKIUj3jMS4xfnHSj4HnPEzuzJz7K14O750jXQvNDaeyxSJy
 1Y6fxkfBWSPudjO4NEakpEWLZyrafk=
X-Received: by 2002:a05:620a:4485:b0:8c6:a5bb:f464 with SMTP id
 af79cd13be357-8caf17e3e69mr972256985a.66.1770508977586; 
 Sat, 07 Feb 2026 16:02:57 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89546b09f77sm30968746d6.31.2026.02.07.16.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 16:02:57 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/amdgpu: check num_entries in GEM_OP GET_MAPPING_INFO
Date: Sun,  8 Feb 2026 00:02:55 +0000
Message-Id: <20260208000255.4073363-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 08:41:30 +0000
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
X-Spamd-Result: default: False [1.79 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[32];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,u.northwestern.edu];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 91B5810D1CB
X-Rspamd-Action: no action

kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL) at
amdgpu_gem.c:1050 uses the user-supplied num_entries directly without
any upper bounds check. Since num_entries is a __u32 and
sizeof(drm_amdgpu_gem_vm_entry) is 32 bytes, a large num_entries
produces an allocation exceeding INT_MAX, triggering
WARNING in __kvmalloc_node_noprof(), causing a kernel WARNING,
TAINT_WARN, and panic on CONFIG_PANIC_ON_WARN=y systems.

Add a size bounds check before we invoke the kvzalloc() to
reject oversized num_entries early with -EINVAL.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 3e38c5db2987..ef5d8bd216b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1047,6 +1047,11 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		 * If that number is larger than the size of the array, the ioctl must
 		 * be retried.
 		 */
+		if (args->num_entries > INT_MAX / sizeof(*vm_entries)) {
+			r = -EINVAL;
+			goto out_exec;
+		}
+
 		vm_entries = kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL);
 		if (!vm_entries)
 			return -ENOMEM;
-- 
2.34.1

