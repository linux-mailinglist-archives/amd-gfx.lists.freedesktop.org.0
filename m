Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF+LDj4hlGmKAAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Feb 2026 09:05:18 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED61498D9
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Feb 2026 09:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DC310E469;
	Tue, 17 Feb 2026 08:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="juya/zF7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0350D10E3C8
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:42 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8fb8f14538so61298566b.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260340; x=1771865140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ejmSd8nb43tZXdHKG5XI+JEcgisrugoqcCJvx2EkNE=;
 b=juya/zF79o4YcOv0zi4UfdD2FyfDOY/DxRaDmTdho2PugtxITgaD0NMzCMRWKO08c/
 bNYWYXP2mA77bkoQxKq0pD8vt+ZGlIlsURftFchJQ6rkH6P4hG3A2ar5g3dP5RHHkcch
 OPrIexaeCpWicOnliyDGlSHHG6OzfzCZ8WzwJ9OBfWTVWIHS1Xeicdnt4Mm50cTyW8Zh
 MN7PQOOMGW34rolayhaG04QQxuM/rxiFP01imBuyJydW3TKCgy+hcOWjzinQvwklBY+S
 RDlasQMEHCGNyA+MUT6W0F3gDMhvaT0JlZt0tlYqyp8w6oVWV/aDwuEw9ODxKUOSkfYq
 LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260340; x=1771865140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4ejmSd8nb43tZXdHKG5XI+JEcgisrugoqcCJvx2EkNE=;
 b=k61DXKFn0hUvT7AFMje8y5hRulLQ60DdGgDtOLjqiDnEzpBCwBwG1MoAoEjZE56T2J
 05iFyrK/z+v/zOAgd6jMeHBbtMzkdV/USbI0jEhYSBRFGxJRFWfA0v8K2d2d0ymPxZIq
 J+A0OlYuAhFWRjZQ6N3ciHAEmjr0l+G64CR4QklRQuc8GbtICXvSV/0FfzT1mQ1pKiI5
 CGJPW68+gTJlSLdLh6mt4fahRAJnX7C2idRWpLHgOSGgDGDEnPpHeutZ3rCYZd4do/OR
 xCw3YkQ0j6GQVd3ccDukaEQRt3r6hkPsh78E5A20+KLqC4fkBMa8kVUDkj09CX0vQzbT
 1dbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsDeCj6pf/MGitqnuOue66t3Cj7OgiiMSMCdj9wtMbCSZI+dIVLqyuAkWsKAJps1nWROVsuibo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIdrxLCAWAt4zXnDesOF3PmFCMsANHBVgOLnNflKYFSoghBTne
 1jJlipfy/iRXup1majZvcXPvDbfBpX3X4ufjowIdoYLgBnyQLzekKyBc
X-Gm-Gg: AZuq6aJPwaYAmVCNhNweKqTRX/deWibeAlcfymRQ3q/HYkQnovZxJ+FcdDbn4/e2lkE
 F4Jzl/tt+Z6dW3GckbmfujI2qlaO/TxcdP02vuXNrPcLDSsS/6sj1Z8Xtby4/M2Pzw5F9TKwRRZ
 9e9rEOY56V3tGNKCWRsMM/54K8nCMFx9Z/e+aPTom2+Dlwhm00TXzh1mNzC9VJea6so9i2GB1/Y
 oGOTw2EzDyuxfLmx5ec9rEvnebop9q3bK3W9GCB6yvkBxXyLHu/3M81qNzgiZTVEiYfOgWHfnMA
 imJU8uszmYZYRCHhge/+5krGSQAgimDBk3PWq5Lj7SigoMSvlwmyxFG2f/gu/7k1VgklSswHmea
 ALf6phVDaSdvzXMpftznrSBnvRdt+W4h+CjneGXUCqg6G67baT6tui5Sc51my6HaIDJ0xcIcD8r
 Yo5zkEOGAWEbaPhoA22oFjmwr4a3v/ETJRWogB29sJGJBZkxf5eQ0iLe567eIXi2kyyB6kgplOC
 qnHm1DcgvaAF/A=
X-Received: by 2002:a17:907:2da6:b0:b8d:fc50:c2f0 with SMTP id
 a640c23a62f3a-b8facc5a3aamr377443266b.2.1771260340409; 
 Mon, 16 Feb 2026 08:45:40 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:40 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 16/27] drm/amd/display: Build HDMI vsif in correct slot
Date: Mon, 16 Feb 2026 17:45:05 +0100
Message-ID: <20260216164516.36803-17-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Feb 2026 08:05:08 +0000
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: CDED61498D9
X-Rspamd-Action: no action

[Why]
HDMI vsif was assigned to vsp_infopacket (FreeSync) field

[How]
Build HDMI vsif in the correct hfvsif_infopacket field

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 991e2262ecbc..288437ada2a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7391,7 +7391,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.53.0

