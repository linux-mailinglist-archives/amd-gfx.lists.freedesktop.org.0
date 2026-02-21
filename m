Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG3RCdYPnGml/QMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 09:29:10 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9C61730B1
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 09:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F8E10E27F;
	Mon, 23 Feb 2026 08:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YpZey613";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A68110E03B
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Feb 2026 03:44:21 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-81df6a302b1so2737767b3a.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 19:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771645461; x=1772250261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2lZPUnhsjUnXBJgHs4dvnaHovSRN+TSfVBm8NcKAvE=;
 b=YpZey613+tKGknWMfwboGBkYD3gQ/HBsBd5aaJYDH+KkCak6jEvUUNBuOM87nSodqW
 VR7nEUBkfytF8oisFoSsacEPQYMKrJUYtrrIkE8WcpTXXRGzo1Iy9DKlzHQPoWV1w5n1
 mnatEfyThK31VKXy4HApRVCfhYVV23nN+ZLbMh8DDHoiU1JvhoPIWKc/nWSdQ0CuhyZu
 GqcpOVaS4b+C2EKzKhn30Zt80+230S0BVzyM9NflzC0N2c91bDUecu14j/++h9NUdgjX
 yHeMb52T2jR1SoJnHFcYvavd05ls2k/AF3FsnlSsz6H0eXVSxW07qObgCddYRaTHxQIl
 3jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771645461; x=1772250261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2lZPUnhsjUnXBJgHs4dvnaHovSRN+TSfVBm8NcKAvE=;
 b=tqyTQX/1kdAX0mBqJZ31cXHWZMsScebclsd4Z+mCO+Ij3nPEuHOHpknrWDQJaCQmmi
 g61052YeAw1yMq3d3uomEIYCgaNWHI1fdeh36tM0m/Bci0YtDRfxKuVOrbcUWNKOJLI2
 zEy4HTFWUf4OAWbo2tHgu0wLNimA+wiVZsG++Hs3/QRBy3khqM26r0wBUZ5OdBnCjDAz
 Wi9/Zb4eqb3uloNYxHwRACLCLkPkHsV67IGFlSt8ivCH5EUwODihkPkRVwsK4QTFHJjx
 w0AF8/Ga2lZe44oD+BX4rbKLfVhkKnakfUhV6QzTil4e3f8MCQttbJWgkNk3wNcXJa8o
 dXTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTN54gEHUK+1G5thgBOwddcWNi4T0L1a5BwAYKu9WGm/jEaCD7uq7iFg/XSr6WreiA2uUI8uB3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9Z1ZNI7nB7Jd0u2s307gnsXS/J5pRKlU4NcBwR35FRZ3/QLdB
 6HM8Qn0oVPG+iNLiUrbaLPYP84+h9tAWYYe0Z0wuZHMD7q6cRclCWgIi
X-Gm-Gg: AZuq6aI9Pe22bNl6Nm8LWUx/3WDkmW7RqxbRmMCkQ4smZN0nvdbN3PcRju2mp35IJjE
 YOZdA1KBFslhCFRUS5zQsY+jFfKC8xI1jRApukbtHBw53hLDna0bkboW2nvpgTjYa3dXHDtItCU
 CopB7CnXdaTi+rgogHFhmurrXR138PnFunZfXJAr067+M9v/iUSAMLEdZ1bWvaocJnfpmh+J1RE
 E3VxtDdPU2HVVeBR7WwzYdfmOLxeYvtTzqxSSKf9XVovtXwZTP3FrOFBzyfcI004UK0Yqj8fWIC
 y/xfXmFh5+hUBBfJZLvvdKA3n7VrMayJvYHXI2/P53rqhjGrxIT2XK0W3UlkcIDMivbSdE21nZ2
 ohTkplhRwx+aM2eCNr5oVu1HJY5XbT+gN1l7YM+etQ2c4Dh26FjOqKJwu3lhvglqCQ/Gi
X-Received: by 2002:a05:6a00:4c19:b0:824:374a:13f6 with SMTP id
 d2e1a72fcca58-826daa0424amr1768522b3a.31.1771645460652; 
 Fri, 20 Feb 2026 19:44:20 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8ba11bsm714951b3a.50.2026.02.20.19.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 19:44:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] 6.12 and below: amdgpu: fix panic with SI and DC
Date: Fri, 20 Feb 2026 19:44:00 -0800
Message-ID: <20260221034402.69537-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Feb 2026 08:29:05 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[52];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF9C61730B1
X-Rspamd-Action: no action

The first commit is needed for the second one to be reverted cleanly.

The second breaks DC support on my AMD 7750. Kernel panics and I get a
black screen on boot. With these two reverted, 6.12 is usable again.

Tried to git cherry-pick the fixes but that proved to be difficult to
do cleanly.

I see 6.6 also has these two commits.

Not sure what the proper procedure is to request reverts on stable
kernels.

Rosen Penev (2):
  Revert "drm/amd/pm: Disable MCLK switching on SI at high pixel clocks"
  Revert "drm/amd/pm: Disable SCLK switching on Oland with high pixel
    clocks (v3)"

 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 36 ----------------------
 1 file changed, 36 deletions(-)

--
2.53.0

