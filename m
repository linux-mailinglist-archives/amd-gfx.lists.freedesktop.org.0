Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yck1A9lEIGp2zgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 17:14:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15763901F
	for <lists+amd-gfx@lfdr.de>; Wed, 03 Jun 2026 17:14:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LPTkBfu9;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB510E113;
	Wed,  3 Jun 2026 15:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3AC10FFB5
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jun 2026 15:14:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B6D316021A;
 Wed,  3 Jun 2026 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B6F1F00899;
 Wed,  3 Jun 2026 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780499668;
 bh=Aq028AynYYctYnzfZbArV/GKcGfBvb5dUmYBpDOGCSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LPTkBfu9XhTQZh4UVyuDOm1BBIW9y2slYIXZ8q05Z8QCMNc7TTinn0cPSyjjwexbJ
 az2fCIWYK5lOE/gr6+Aw9kE180vyo+nf4Pn/UZb7BZTPUAbKM7w8l72Uju6AYSXAme
 KYsxgmiw7qH9tO56ZLg6Yzkg5XCegLiAZhP7KaHFeZ88V39HlZhWKnw8zPd9ZZGbuC
 XYlkqe6hOGikd+eCfE+jH88TplH+/lmTSVqRbS6JFchBtKy+kSI69F8cbF6IGuZsMY
 N3rBqN+bsuq9Vin/ZN5WOwaC51KyDT3ZMP5U/inkZ2o+OuO7piq8wIZiaTj6VW/VvV
 Wfxj3ptOQbB8A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v7.0.y 0/8] drm/amd: Backport FPU Guard Move from DML to DC
Date: Wed,  3 Jun 2026 11:13:54 -0400
Message-ID: <20260603105137.drm-amd-fpu-guard@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527144428.1095001-1-xry111@xry111.site>
References: <20260527144428.1095001-1-xry111@xry111.site>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sashal@kernel.org,m:xry111@xry111.site,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A15763901F

> [PATCH v7.0.y 0/8] drm/amd: Backport FPU Guard Move from DML to DC
>
> As the mainline already contains the move of FPU guard which should
> ultimately resolve the issue, it seems better to just backport the
> final fix instead of adding the temporary ad-hoc change back.

Thanks for the series. Unfortunately it doesn't apply cleanly to 7.0.y.

-- 
Thanks,
Sasha
