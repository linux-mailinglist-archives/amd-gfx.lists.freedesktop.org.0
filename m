Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Bk7ITXCQWqLuAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 02:54:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9866D55F6
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 02:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BxhvvnVq;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048038825E;
	Mon, 29 Jun 2026 00:54:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA8D10E38B;
 Mon, 29 Jun 2026 00:54:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7233E6001D;
 Mon, 29 Jun 2026 00:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA591F000E9;
 Mon, 29 Jun 2026 00:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782694447;
 bh=gVEBQQ3Ih68cKsVxljEnf7h6tlE5psA3qhQaUm1QrxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BxhvvnVqnme4Rx9S7hySq+PuqWGIAZ52kArdjcKcUAlIsAkhoSNZnCep8tlw0WVMk
 3linyT7Xsazmi0MpVRsd/tHyDM07OMKsMm5yCmDAEyZkdnHUYMe58V/aYtIt+Q50Ar
 MzFQc3eHFoKB116rqHu4G1KAIqMgix569qBqkrmJu50nQDSLTqkKHp35y7kMD0aDSD
 scZGiZ82GPKi0JZmsIBryK3vRys8CqzrJjyZXcAr9reD4bzr8ua4unHHJ1Fq3L59re
 Zardu8b5XCnZKOV/RbS9vO1kQEyakOvvFZDOaeEcrwOALDhjhvlmEksyOMF7y3weVM
 fFwIFuKmx5dGQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, ray.wu@amd.com,
 superm1@kernel.org, "Sun peng (Leo) Li" <sunpeng.li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Peter Jung <admin@ptr1337.dev>
Subject: Re: [PATCH 7.1.y] drm/amd/display: Fix ISM dc_lock deadlock during
 suspend
Date: Sun, 28 Jun 2026 20:54:03 -0400
Message-ID: <stable-reply-item001-amd-ism-71-20260628203053@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260628140148.59923-1-admin@ptr1337.dev>
References: <20260628140148.59923-1-admin@ptr1337.dev>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D9866D55F6

> From: Ray Wu <ray.wu@amd.com>
>
> [ Upstream commit 3714fe242592e3699ac5e2c19d68b275a210be7d ]
>
> CachyOS users reported a regression in shutdown/reboot behavior on 7.1
> kernels: the display turns off, but the machine does not power down.
> Reverting ISM fixes the regression, and this upstream fix addresses the
> same ISM dc_lock/workqueue deadlock in the suspend/shutdown paths.

Queued for 7.1, thanks.

-- 
Thanks,
Sasha
