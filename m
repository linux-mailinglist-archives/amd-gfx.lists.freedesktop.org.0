Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LFwJyppvmnxOwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:22 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86D2E47DB
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7CE10E37D;
	Sat, 21 Mar 2026 09:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYGykoMx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EE710E2D5
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Mar 2026 05:45:14 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c74244dc0b3so1827252a12.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 22:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774071914; x=1774676714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+adMGPlhVk0bbFqFiUYYCeP0eNPb1PCXZHc4YqFFXSQ=;
 b=EYGykoMx/+fMjOtrExMmEXIpYeGaKsHPE9DE9LeS/a652h1sxe4dlfHL1hOEGWerck
 P1Nzo8e/gcs4L5eAkGJxh8HsfXGs0UbZxNtSj5xj0FYhe6VotpyP1oOyqXOKRW7a/nFk
 u6bRVvU3B9pP3YXRSRaA3unI4BJ2FxMUPUug2RGZ2qibaafb5oqln/OvFvXCioX2ye6W
 xhhjCLYcNTiWiiHTydsfD9z3p+jy9P0XzobgS8nHb/3b0WUjxMXWSNmKLYMebh1PPnz/
 QzCmZQ+1uptDyIa2exgZ0quVtvoF0gsGy0koCJiEuxLZ/NbWfhv0wMR1AGtb2WjIS6gi
 WK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774071914; x=1774676714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+adMGPlhVk0bbFqFiUYYCeP0eNPb1PCXZHc4YqFFXSQ=;
 b=HgjPOIAwgyxy2uFL+Oini83kUCfqpPTlU5w7YIA2RxXmKWMRRK8tRjyh63J61h0Ixx
 zJ2UFX4Rg0lIsNXPVWYPP3KbDZareRC35IpC5BN5nYC7scFgreoItmjveYtEJNA0AQv4
 Qbz6rZxcZzlqnoNdbgldK+OY6zv0+6/qdRfg8meONMMrWUBUxPDJolHIxY1QoZOt7+zq
 wr4ULT48nzyHQhYKKSAk+EAb8/jNHnQ+FvzfWlqnPp2TQyWQZNRY3WKto2llrww/YMOU
 VP3k6hdBklfPMER/oY7xEycWYvBUI5sdLEzIGFVZYcBrT4BHA1CCyjDzHvMg4Hw/6EF/
 Rs3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8qLMzoS7rEh7Qz/qMiqw4o5va2O6a7cZ2RGl1g2g0m0xFETLeylYkEML0u9yuOB8CPLldBotm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxSiQp/giAmwXdVHPDdgFYqA6Np5r+VVlAKqmjisZI2KlRSY6Z
 /n/EFdZB9tIXrxvBXpL1Xf/x7qFGfUbOga3/QfdKk+cquzcD9Bkpyu7x
X-Gm-Gg: ATEYQzw5NXqtpshTlREM9yTrFAxO/wRoGl9CcljJ44Jb1KgFuxQjsfCKh6iAzWIlPfF
 ThvitX6oRvwHTtKOswkfF2vBNp4j0azS1cHLdQO98zv8/y3QIkyq8FdfFT9b27uOexTvAvCA/zZ
 PzZxWYI0x1bvjXd67gdmjwgqrzDI4S+kkVVTeSrXIchnwa6fTiigRhy7hmBnAJr+EQXRGERwyXW
 b4UpqxY0if32SaUfXvNcS5u6Z83ENv5IjVxhYCQj37b7924ecMnmJYh9H9CZMwZgZdPRNA6pfDb
 YbsB1X7MNADdtlWpr25WdLCFbt+UqeEHWk3bfrxWeUt5lhc0Cdfjc/W0cF/NuWgB71K0Z7YEcet
 6qMhaqbgv1eosdCV2DGx120jZa5PnGVGskJPmp+bIhZTCwXh+2LDsHVljrlcAk8K6FtT6y8rO1x
 84jt6PRCqAxKCLysA+BMYunX3DD2+zxVSxQ+75pQnRgO2lAdZPbVp0XCw=
X-Received: by 2002:a05:6a20:9146:b0:398:8bd7:4f80 with SMTP id
 adf61e73a8af0-39bcec0692amr4985522637.46.1774071914235; 
 Fri, 20 Mar 2026 22:45:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b0409c681sm4338783b3a.37.2026.03.20.22.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 22:45:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sasha Levin <sashal@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Zhigang Luo <Zhigang.Luo@amd.com>, Bert Karwatzki <spasswolf@web.de>,
 Ray Wu <ray.wu@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Roman Li <Roman.Li@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Hung <alex.hung@amd.com>, decce6 <decce6@proton.me>,
 Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 for 6.1 1/4] drm/amdgpu: use proper DC check in
 amdgpu_display_supported_domains()
Date: Fri, 20 Mar 2026 22:44:50 -0700
Message-ID: <20260321054453.19683-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321054453.19683-1-rosenp@gmail.com>
References: <20260321054453.19683-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Mar 2026 09:47:17 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:evan.quan@amd.com,m:mario.limonciello@amd.com,m:sashal@kernel.org,m:rosenp@gmail.com,m:lijo.lazar@amd.com,m:Jun.Ma2@amd.com,m:gregkh@linuxfoundation.org,m:srinivasan.shanmugam@amd.com,m:superm1@kernel.org,m:Zhigang.Luo@amd.com,m:spasswolf@web.de,m:ray.wu@amd.com,m:Wayne.Lin@amd.com,m:Roman.Li@amd.com,m:hersenxs.wu@amd.com,m:timur.kristof@gmail.com,m:alex.hung@amd.com,m:decce6@proton.me,m:vulab@iscas.ac.cn,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org,linuxfoundation.org,web.de,proton.me,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 4F86D2E47DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 96ce96f8773da4814622fd97e5226915a2c30706 ]

amdgpu_device_asic_has_dc_support() just checks the asic itself.
amdgpu_device_has_dc_support() is a runtime check which not
only checks the asic, but also other things in the driver
like whether virtual display is enabled.  We want the latter
here.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index cd0bccc95205..98cce09684f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -534,7 +534,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
-	    amdgpu_device_asic_has_dc_support(adev->asic_type) &&
+	    amdgpu_device_has_dc_support(adev) &&
 	    adev->mode_info.gpu_vm_support)
 		domain |= AMDGPU_GEM_DOMAIN_GTT;
 #endif
--
2.53.0

