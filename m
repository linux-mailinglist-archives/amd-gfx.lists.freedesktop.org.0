Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CYuMBB7xmmjKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:52 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E434473A
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9D10EE3E;
	Fri, 27 Mar 2026 12:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W6VZuTEp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6F10EB00
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 23:47:35 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c74f0c3fc16so572052a12.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 16:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774568855; x=1775173655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5DHuKVgXN+dD1YajVE7A08pLyTvO/MeTPUKN+QQ6x/Q=;
 b=W6VZuTEpSrxhdt7KwZqwD/oVRCZ75R/LXlvUDk4MDZv/jcxTo5xyL3Z++eT16kNOJ7
 it+UzOUUFqy2WIrfwTg0aNQkdjvZdLsJuuv+VQLg/WJO/kV7ZNk+piLUL3UOn/rfYNx4
 xtKANC5n7uZIabTUEIxmyXurjT4iKJKiZbA3ip80ze/pO1R/Yt6dpH8hrism8RmyDMwe
 Q+Lw1XdA6CfkMO0NYrtj4nqMiTBskfflXAERC2+GH8spnBVJWU6NTVYPyVBZMY/dihbX
 P5tmxAdDOMydwI8shmbW3P7XvXHeDR5VfRB5vacDK4npzVe8AkvlSAS2ZerI5Ovsczou
 g71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774568855; x=1775173655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DHuKVgXN+dD1YajVE7A08pLyTvO/MeTPUKN+QQ6x/Q=;
 b=HE/ftllvxEQeOmf2FvDY2xMhhNxTJ+HpbUanvXTo1XezymP11P76YLZvQu+tUsxWLh
 lY4PLLHUJVhMa6B+tUAs9x1vNKDqIWiYq6It62nyCEp3MLVHwGvqCQzJJ1QZc//707vU
 zl5tnsIBrs4L2JPaZ1PEuQgVg9keu8/e+AgMDYgT6HuXsyvzkU7bxcPNB8CJrOvHAl/A
 3t96E7joUFkri/cceDtqYNcjHqxFm8bI+U0kZ1XypZvPfyI1sbY+wg9H/kQQ1Uy4yxBd
 ufFyTrZ5ATgo8c0vcszoeSlpYNJmxqf8PjImxTbQhtp2i0xGHo/DtCJ+h2e3sv1ZNvVS
 3w4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqf6ztErna3EkiJcvnACBZqrO+dX5gDl+rAfL/48FS0FOy/xxC0tOrWClpDZtDhujopWnTCMSt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7N5ZRejmiEUk/MgnGzI0vhJGICDrL/R0qWpqxuAPgDIequkln
 PrGIDueBIm+OF+3vG8IWVPQFol3l3S2R2cDZJ00CsM8dW/g49ZbTLoPw
X-Gm-Gg: ATEYQzwCofhglApxTX/Bzyi5u8yboP404OsXmaBpNq9t67dgp9V1bjKlBJjOrPFJScy
 oUJ1XoaHs7oktN9ZAyZEDti6kZoFl3M8Eq0DM/SAiud50F+YGbnfSTxHRBSM9SPgNEnuJBgTrca
 ZvyZxgWrjPmtyXM+d1gf5sGOv1RSQQR1AvhVngiPT66ZksItHEGeMUxiZZsfE5EEgrQjG85V0an
 pfiXT5OA5+so7XUPqsq+deMMo799zS22K/l/M/qmwoqLl91q7HAvithv/OXOzT5oRv/BB/dD1hr
 C+mETz3Vlh22Vkul5jzr63ePSCvwqLeo8YBD+QrtrKEGfZCtFQr8W6CsWOgP+eT3ZCyDGgSjooO
 ghgZ5ioChhrO7BpkVc/+xww9OXg+aP+hdGo50ArDdUdVnhFD+EABj9vHNy+a90iR4vc8kvk0hAa
 sTidehoxihwpyGofXs/G724/cFQ8lEUWUQ6gcM44WWYjtCd5mhX1nLIBaPt1u6on7zTg==
X-Received: by 2002:a05:6a20:60d3:b0:39c:14c1:43f6 with SMTP id
 adf61e73a8af0-39c87c0b0b5mr394562637.61.1774568855408; 
 Thu, 26 Mar 2026 16:47:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7673933816sm3201162a12.21.2026.03.26.16.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 16:47:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bin Lan <bin.lan.cn@windriver.com>, He Zhe <zhe.he@windriver.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Roman Li <Roman.Li@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.12 0/9] drm: amdgpu: backport suspend fixes for
Date: Thu, 26 Mar 2026 16:47:07 -0700
Message-ID: <20260326234716.16723-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 12:40:00 +0000
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@linux.ie,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:gregkh@linuxfoundation.org,m:bin.lan.cn@windriver.com,m:zhe.he@windriver.com,m:vitaly.prosyak@amd.com,m:alex.hung@amd.com,m:siqueira@igalia.com,m:timur.kristof@gmail.com,m:Mario.Limonciello@amd.com,m:ray.wu@amd.com,m:wayne.lin@amd.com,m:Roman.Li@amd.com,m:Eric.Yang2@amd.com,m:Tony.Cheng@amd.com,m:issor.oruam@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,m:issororuam@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,linux.ie,ffwll.ch,linuxfoundation.org,windriver.com,igalia.com,gmail.com,lists.freedesktop.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 744E434473A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Work that completed in kernel 6.18 resulted in working suspend with DC
on old hardware. This series aims to backport it to 6.12 to have working
suspend there as well.

All commits were applied with git cherry-pick, the only changes being
adding upstream commit, and signing off.

Tested on AMD HD7750 with:
radeon.si_support=0 amdgpu.si_support=1 amdgpu.dc=1
on Arch Linux.

Kenneth Feng (2):
  drm/amd/amdgpu: decouple ASPM with pcie dpm
  drm/amd/amdgpu: disable ASPM in some situations

Timur Kristóf (7):
  drm/amd/display: Disable fastboot on DCE 6 too
  drm/amd/display: Reject modes with too high pixel clock on DCE6-10
  drm/amd/display: Keep PLL0 running on DCE 6.0 and 6.4
  drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
  drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
  drm/amd/display: Disable scaling on DCE6 for now
  drm/amd: Disable ASPM on SI

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 39 +++++++++++-
 .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   | 20 ++++---
 .../display/dc/clk_mgr/dce60/dce60_clk_mgr.c  |  5 ++
 .../drm/amd/display/dc/dce60/dce60_resource.c | 59 +++++++++++++------
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c |  6 +-
 .../dc/resource/dce100/dce100_resource.c      | 10 +++-
 .../dc/resource/dce80/dce80_resource.c        | 10 +++-
 7 files changed, 117 insertions(+), 32 deletions(-)

--
2.53.0

