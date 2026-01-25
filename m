Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJRXIi0hd2ntcQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 09:09:17 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C271854D5
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Jan 2026 09:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230110E3D1;
	Mon, 26 Jan 2026 08:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSCVCMZk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C3710E37B
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:34 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b8845a47e39so63020266b.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366373; x=1769971173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4XqZpkGSkEnuKP0+cVaiZq40DDr/xmS7/WCMvlfxBE=;
 b=QSCVCMZkeGcNDrIpcmU5qkXvbb16gQahT1i3LfZIib3psfC5Xyxvjt0CaLUlPuMhRe
 +Efd0O0rdHIfsz8sWWODeBqzh8+HEPBj+rQz80FjZ0pbPAqOupRR9if1hm5rZLBjLyFs
 Bkuzm8WPjsaPh6ulasFDClW+KFr+F9G8Un4m5ueHSwGexKvSCHgjJKIyh7UzLLaYMHkj
 BCm9QG1EyH8a63hobAoT8d0Y4redGCot1carsMBtSViRP1T4eheIGPya/hsl+GU8i5ll
 qnQreRjfETJC1i5/oaQsRJWtscukwh5MpOo52dBnpQfNHVRrkUAeHp86rEeG+94m2vul
 Ttww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366373; x=1769971173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B4XqZpkGSkEnuKP0+cVaiZq40DDr/xmS7/WCMvlfxBE=;
 b=YgVIBA5jbFRL2gt7jB18aSOxDw0rgdNSHdc9OWFSeFBQ2u3lHHWbZWt7rZGbU7zkL3
 4Tze7le+91TazXqq8KDJvRa2fwR2rctFoWxSE/Tcpwrdcn9pWaIh+GK/nBFyfsRZsjuI
 HjuJxyy/N8K8guJa4D1TyI4DC0DkIYD8ynOcZLc8GDm7SoQf2X4XV3cB2dJyvE4WSBlI
 peZzWEdzZYTjMheX4LQqOy27ZjAIyj7C1wklqwKoFqL5gxauMl5yiEzaJkK4oln+ZD+M
 uLBI4hXPy0JqTJiwWgD3r5PtVN6B/4U4Y2p02Skk6O0oog0xmtRMfAvnvYpDKPrsD2vn
 7qAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyf9OjJsL/pmgFqgNzq/z51D/6D+K3IXUmR26smP8aiUaEZdGxzVksjlKGHN4bJIpd90iGupYO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziWih9s+2boT9Oaf8Of7UazAenzPuWQMzbkuFvwcoYSR+2hqkW
 zpkLssKWNJf70Ns5yGwr9rfz+r/OdMb292nRkhawekyGvBlBP0bKITJ6
X-Gm-Gg: AZuq6aLoUezuF+P00fsgScS2OKcvnIgHvfwz7XyM9V7Zx/j/VKjHVknqTQVhvENqEJe
 4nlW06P0MNhx75IdSnzL1QebGFLzMH8CYqSoPZXdX6frEo3tYoztFL2DAedLkVaZ6FA/fRn5fzf
 PAmdYTCPzUmfvhazrx5V0tOMN3REAYwg/Gy9ZSLg6aqDWOo4K/+E/mE66jt9YMEcW//oLs6e/3Z
 mPURYKKvDSZXjFqOpDCxzJsBo3rqg97SULk/Iz1rLmr52EeAMjiMQLLmNTGiOkBQOK1BifENUuh
 l2HDpp5yy/jdYbFRkiiufI0KFiF6WCwTTvGkG3/Fft0xpyhe8CfYU0cKOcVVlD5xqfBDE8/HNED
 XL9C/1abL6Hg6aqsmc5Ls/c6JV/LCuF7CFFgd3q+VXFt31iYl6oU8KW1hBkDn5KdYPwcExobt9A
 xVCGtA/NpzqCkqCgy20NPt1emK+mQyjr+19s0lkyYp5UJWBDSKJW/wqPpxmTP9lDVa
X-Received: by 2002:a17:906:d54e:b0:b87:1c20:7c5a with SMTP id
 a640c23a62f3a-b8d4f85435amr104144566b.8.1769366372975; 
 Sun, 25 Jan 2026 10:39:32 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 12/19] drm/amd/display: Build HDMI vsif in correct slot
Date: Sun, 25 Jan 2026 19:39:07 +0100
Message-ID: <20260125183914.459228-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jan 2026 08:09:08 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3C271854D5
X-Rspamd-Action: no action

[Why]
HDMI vsif was assigned to vsp_infopacket (FreeSync) field

[How]
Build HDMI vsif in the correct hfvsif_infopacket field

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b93ba14d87d1..f95e8a739303 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7362,7 +7362,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.52.0

