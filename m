Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMx9EeQNvWkO5gIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 10:05:40 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8652D7B7A
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 10:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247110EA84;
	Fri, 20 Mar 2026 09:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lcvRcE/1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFE110E541;
 Fri, 20 Mar 2026 09:05:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDC0560127;
 Fri, 20 Mar 2026 09:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22591C4CEF7;
 Fri, 20 Mar 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773997535;
 bh=1+/V3M72eicHKatX91jOMQbyAysvN6oRz5SSDh43k3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcvRcE/1AlZ1LeZ6wPkfYP5/RYZNjCMZxUocYBkwsIiIaMUKjzOT51HHNMB5Zkd85
 fFRt2lS1uOx0lF4ZOkruQg8cr5awaWrPR+zVIuXbBrR5p/+HNhCuciG4owx+mcVOMA
 0OC9y/yYCAboum5FvrQnYMljnyjJ9Mz7fIDvyuMq6wvSes8wQ7rk1csUqDNhgHowAk
 V85kOj+gxW/isVA7z6TAiwIuklrtv9iVM58oY+eMF3anFrWiWUF02se2qdIjk72b8U
 0mMr7ZHck8q+Xzkl5+YARVfoEE1rB8OKKSRI7qin5EH8xDuIAzulM0qp6ZwtPFX/E9
 CLSJTesLIwlww==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v5 0/4] drm/atomic: Allocate drm_private_state through a
 callback
Date: Fri, 20 Mar 2026 10:05:30 +0100
Message-ID: <177399752799.2530289.3477869792206272729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
References: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,ideasonboard.com,gmail.com,nvidia.com,vger.kernel.org,oss.qualcomm.com,arm.com,intel.com,linaro.org,kernel.org,crapouillou.net,raspberrypi.com,kwiboo.se,linux.dev,poorly.run,somainline.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CC8652D7B7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Feb 2026 17:10:25 +0100, Maxime Ripard wrote:
> This series started from my work on the hardware state readout[1], and
> was suggested by Dmitry[2].
> 
> This series deal with the fact that drm_private_obj (and thus bridges)
> are not initialized using the same pattern than any other object. This
> series solves that inconsistency by aligning it to what we're doing for
> all the other objects.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
