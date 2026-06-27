Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aXK2LtAZQmrO0AkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:08:00 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29556D6BE2
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 09:07:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yeah.net header.s=s110527 header.b=UjTLx4oI;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yeah.net
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640F10E6F8;
	Mon, 29 Jun 2026 07:07:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1757 seconds by postgrey-1.36 at gabe;
 Sat, 27 Jun 2026 09:57:25 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F110E48F;
 Sat, 27 Jun 2026 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=cditTTZR98qCuukx7N1JBr9bmy5QU/HMtRkQnIKtEBw=;
 b=UjTLx4oIOzozLBA3ssScOuWhIDyB81Iy5o3Y0U4UPTvky5Eh0i4X3Qm2+8kMSY
 U1S8jtBwPfxxPDlhVQF/QiV6dXms7Tr+IDtO2Gi/Ca3KiysZSjQJF5Zpu6T3rMeI
 UngzsSUFbMImW5+SzqQbLgAFyxQ7efQJr7sZsWmJ8o7mE=
Received: from zhang.. (unknown [])
 by gzsmtp3 (Coremail) with UTF8SMTPSA id M88vCgDnfzRnnj9qUg0MAw--.13884S4;
 Sat, 27 Jun 2026 17:57:01 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: markus.elfring@web.de
Cc: airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 linux-kernel@vger.kernel.org, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, zhangcoder@yeah.net
Subject: Re: [PATCH] drm/amd/display: Remove redundant NULL check before
 kfree() in mod_power_create()
Date: Sat, 27 Jun 2026 17:54:54 +0800
Message-ID: <20260627095616.4479-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dcc01255-8c9a-41db-80b8-e4482ec12789@web.de>
References: <dcc01255-8c9a-41db-80b8-e4482ec12789@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDnfzRnnj9qUg0MAw--.13884S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWDWFy7KFyfuryDtFWUArb_yoW3XFcEkw
 4ktFn7uw40yrW8Awnayr43Wrs0kw47Cas5Gw1FyF9aqry3Jws7Zrs7GFn5Aw1rZF18CF4D
 Cr15Ar10vFyxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-Originating-IP: [116.149.202.60]
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIA4t7Wo-nm7sqwAA3M
X-Mailman-Approved-At: Mon, 29 Jun 2026 07:07:55 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[45];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[yeah.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[web.de];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangcoder@yeah.net,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,lists.freedesktop.org,vger.kernel.org,ffwll.ch,igalia.com,yeah.net];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DKIM_TRACE(0.00)[yeah.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B29556D6BE2

On Sat, 27 Jun 2026 11:43:25 +0200, Markus Elfring wrote:
> …
> > +++ b/drivers/gpu/drm/amd/display/modules/power/power.c
> > @@ -270,12 +270,10 @@ struct mod_power *mod_power_create(struct dc *dc,
> >  fail_bad_brightness_range:
> …
> >  fail_construct:
> >  	for (i = 0; i < MOD_POWER_MAX_CONCURRENT_STREAMS; i++) {
> > -		if (core_power->map[i].psr_context)
> > -			kfree(core_power->map[i].psr_context);
> > +		kfree(core_power->map[i].psr_context);
> >  	}

> May curly brackets be omitted here?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.1#n197
> 
> Regards,
> Markus

Yes, you're right. I will send a v2 with this fixed.

Regards,
Ziran Zhang

