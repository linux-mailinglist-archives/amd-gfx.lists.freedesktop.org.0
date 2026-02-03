Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SISGOfr+gmmagQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:34 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44854E2F6C
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53A10E540;
	Wed,  4 Feb 2026 08:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q6SDYOXy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41C910E75A
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64b6f896689so583576a12.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145007; x=1770749807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0zIdsXy6yEQ4Kw4OgKCvel61dY5GUoe4J4Zasteni0=;
 b=Q6SDYOXyfsxJrk3RAlldetpM0Rqz1hDrtt/v+PeQsplEey71ZKLusMQO2mglrxrxvi
 6sjFusvR9tE6qCAP9nRG8omhK8EcBdLIxhRjikfb6tqWwQAp1rVZxIBWY7rDzDDLR4CM
 +NXlkT0qkvnVlrq8uDJNoasMyd3Cpkm2nzIZOIey5wb20PbQXajxNguCkFAcqoaErB/1
 eEJTlQ+jfM7Jg003lg+y1bfCUWfqYXegmO3ehcTmBrU9YuODYM/AKk4jV7Yxg5BtJX01
 EWGpVbBW9fo+zc7rMKA9A39Ppn6Om7SvYFJAJZJ5i6Evf4fXTt82eoeoZ6Fl4l4ZVuSp
 wTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145007; x=1770749807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g0zIdsXy6yEQ4Kw4OgKCvel61dY5GUoe4J4Zasteni0=;
 b=SFfzo8Pt2S8G3cMUuBmV+OEmciGgCnCmUj3DAGLHqA8izxjQi8ZiYAD7uGbSXY+yCw
 ZaAZBdfwYojb/mHhstuZ96tNf6LdNLrFoyQWQrNOUvHX5bqar/7mCjWJ09SWlY5fHm3a
 L3h5W9d8h7/v/9WzIL2KHRh7PF2b9xlBtzHD+zfGQSlzQ0C+N+BOaHGNBpE4jhrWcj73
 uOvGKpwkG/EN+/PYeD+9cdbPL68yvJpGqzR6pDoQ/znFQGysN2rBOJUmtbOuwR0TvWCm
 W+xmjhR1VdqIQ/aaeJ82PnNUoueZuQHW8m+Vq9moPjhBPtVz5A7CvShzZdZryjx03Eeo
 QWzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrULENFdJ/kRVLi53gTtFxeCC6a5SWAGLzUqJE4apOpUNEcJaFar1y81agzjjS4PzfPg+amGZ9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwajjDzTGTthzV1aCiSVlha1u7pp1g0z8Nvlpojv+bYBIf5UuBS
 YPXsqw8IA0rHpf7LmF1ZI9fz/hejmuU/O46FkNOJjWx81ZpZvBddiW8X
X-Gm-Gg: AZuq6aIWINH8LT56pExTs15l/ttxMUvY1Gt9IZJ0scE0LbVk8NlwKeCJ+Gv3B04w9vT
 /W/vcMDR1GN5l3NjsWhsgt0HQ0WjBY3gdWdvGFjh5tFXbdB5NdowBUjv5turzD8Ft2yVvB8D6ZR
 FyvrS+SGK1QiTS+8zF14Z6nkCsQD7i41QHDf/0yVhrOHHn0vqnXEs702VCMW44aJDmK5uvZ26LG
 dXzDlwXWTzpYn5V7y3Q9yfQCcv2Cc2ltT1lAvjXymX9bWF+7SLX7UH+xHTye1weh1A6nRRkMHtk
 brkUX/rR5oF7qH5rY07Nh1Fep54GocpKITBap1l/uzEVmvFLE1edzHC5R5RGTGnTO3hwRAvAhgC
 rEuSI94NIi8XROmEfEhUdLhLw2EwPi7J538gHCju+6UZlcA4NKVIS53dgASWWhaCyfGq3wvCvzB
 P/CG/Pp9/UXzg1EeqkfIO6xhV+NBBJaI1dlDBnhxOErEaBZvwBrVfE0+9N7X7JZPYa
X-Received: by 2002:a05:6402:6da:b0:64d:23ac:6cae with SMTP id
 4fb4d7f45d1cf-6594a1e4230mr155645a12.6.1770145007089; 
 Tue, 03 Feb 2026 10:56:47 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 12/19] drm/amd/display: Build HDMI vsif in correct slot
Date: Tue,  3 Feb 2026 19:56:19 +0100
Message-ID: <20260203185626.55428-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Feb 2026 08:10:21 +0000
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
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 44854E2F6C
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
index 2200161da71b..ab01a45aef1c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7383,7 +7383,7 @@ create_stream_for_sink(struct drm_connector *connector,
 	update_stream_signal(stream, sink);
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		mod_build_hf_vsif_infopacket(stream, &stream->vsp_infopacket);
+		mod_build_hf_vsif_infopacket(stream, &stream->hfvsif_infopacket);
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
-- 
2.52.0

