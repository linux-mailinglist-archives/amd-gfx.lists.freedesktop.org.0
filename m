Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMnTNbET6mmytQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 14:42:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3C452218
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 14:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E96110F0F5;
	Thu, 23 Apr 2026 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dyVdK1ub";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01A310E404;
 Thu, 23 Apr 2026 11:22:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BB056001A;
 Thu, 23 Apr 2026 11:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC05EC2BCAF;
 Thu, 23 Apr 2026 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1776943345;
 bh=v5vX1VJ6hD3zefByaEKuGLyZr08vT7W1KOhrYxlfQpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dyVdK1ubOcAXp+YKP2Nghh5b/q+AZL8CUbkno1W4J6qFNzaRqb5Q/cGxj/9xWlcd8
 7AxDYHjbbuAeZ602YL4l7KQtxwNJV5hiOAXeP+xksDwbqUadzxLW1nwN09P+rAPuXm
 mH4xhcZbwkWaUlxpVc7/06VwsgosoKeUjjkzTOoo=
Date: Thu, 23 Apr 2026 13:22:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 stable@vger.kernel.org, Robert Garcia <rob_garcia@163.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yifan Zha <Yifan.Zha@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] drm/amdgpu: remove two invalid BUG_ON()s
Message-ID: <2026042335-probation-heftiness-7399@gregkh>
References: <20260417074010.1607496-1-rob_garcia@163.com>
 <7260936.9J7NaK4W3v@timur-hyperion>
 <6064b45a-b8de-4848-856f-383d2d06680d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6064b45a-b8de-4848-856f-383d2d06680d@amd.com>
X-Mailman-Approved-At: Thu, 23 Apr 2026 12:42:22 +0000
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
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,163.com,amd.com,ffwll.ch,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 06E3C452218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:11:15PM +0200, Christian König wrote:
> Those points are certainly valid.
> 
> I've also up-streamed a patch which completely rejects userspace submissions who try to use the CE.
> 
> The problem is that those BUG_ON() can lead to a deny of service because they crash the whole kernel.
> 
> A BUG_ON() is only justified if it prevents even worse things to happen, e.g. data corruption or it would crash later on anyway just not so obvious on what is wrong.
> 
> Otherwise we should use WARN_ON().

WARN_ON() crashes the kernel as well when panic-on-warn is enabled, as
it is in a few billion Linux systems :(

As this commit is upstream, and in other stable trees, I'll apply this
as it's not nice to have a simple way for userspace to crash the system.

thanks,

greg k-h
