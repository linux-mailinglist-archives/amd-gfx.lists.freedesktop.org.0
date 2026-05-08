Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JrI0EZ9R/mntpAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 23:11:59 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6164FBCA8
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 23:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FEF10E5B8;
	Fri,  8 May 2026 21:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nh43N0dz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767EE10E086;
 Fri,  8 May 2026 21:11:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BCA6419D3;
 Fri,  8 May 2026 21:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CAFC2BCB0;
 Fri,  8 May 2026 21:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778274712;
 bh=CgBnBDmdkqvx8nTgl5Mp3KpqinE1WaOcJGs2i3jhD10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nh43N0dz8PHuBTkQmma420H1eyihOXkbglB+IaF81WJIm74qn2gZyQNK189fCbfOW
 o7xIk+VEKHp1fpKlc6PIvwSuSRKB6qNVpLZvSEfbzfJtK/iOBQCYZM5foZiIMOVKKB
 SZ246dr9gmguxkCi21S/7hXzN62IIQRKkGgdgT/v19zcx+HPSw5cJxE9ZyTl4QS3Ul
 zgiN+3IutVhy2LfM3MMYv4KX34T5XABIzXYtSgr4xQ4PEUMCetIoRkzk5dhok2W+E4
 3zqPxeR8JypLjxYmGodzNUtP8emJ0bpnrZO9fBWKt4DBv0JWibkhqoCzcheFXVZmsw
 hfeUJDrife11g==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	dev@pp3345.net
Cc: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, ray.wu@amd.com, Wayne.Lin@amd.com,
 mario.limonciello@amd.com, aurabindo.pillai@amd.com,
 timur.kristof@gmail.com, jdhillon@amd.com, hersenwu@amd.com,
 Roman.Li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Fang Wang <32840572@qq.com>
Subject: Re: [PATCH 6.6.y] drm/amd/display: Do not skip unrelated mode changes
 in DSC validation
Date: Fri,  8 May 2026 17:11:39 -0400
Message-ID: <1e7ec2f7bb732f43-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_CCDB1B23FED831830856396BB4DF59D1B106@qq.com>
References: <tencent_CCDB1B23FED831830856396BB4DF59D1B106@qq.com>
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 0E6164FBCA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,qq.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

> Subject: [PATCH 6.6.y] drm/amd/display: Do not skip unrelated mode changes in DSC validation
>
> commit aed3d041ab061ec8a64f50a3edda0f4db7280025 upstream.

Now queued for 6.6 and 6.1, thanks.

--
Thanks,
Sasha
