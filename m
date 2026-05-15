Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH8lIwY4B2ottwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 15 May 2026 17:13:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC8551F44
	for <lists+amd-gfx@lfdr.de>; Fri, 15 May 2026 17:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7210E1C2;
	Fri, 15 May 2026 15:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="l1qrZ4QV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2610E1C2;
 Fri, 15 May 2026 15:13:05 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gH9gL2S7Qz9v5V;
 Fri, 15 May 2026 17:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1778857982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9Ve8iSK64OPJloQ1KyEsnuVQdZfv3OGb7barbdsQz8=;
 b=l1qrZ4QVtCpTlJqwSaf2Rea5oWIKIin+cJbMCGt0cLQUa9GshgY3K0t/HxIP3MWzld8V5D
 hVNoMR42wtugGTbofF1VWKY+8Zig99yBhFRGfkawkGX1XX5TFG7p69X4CWqWL5400icF7l
 SobZ2BKX1aamsnyvwtHVSE+lKiyqLoPsckUftL5K/Z+4u5h4oRVGEke0LdWVFNzfepXZ+y
 yu8oGwrzLcASmYXyPLBexKYfz/pL0G25Zwnh+FaYBwAFtbeTgOSd4qs0PRiiaBPXwJyE9S
 Amutf9pX4xHyG2y4lgd3i9PgKHU5VV/lGzhrUbusX1x7dvJFdphWq7LkUfszaA==
Message-ID: <b5d03921-1e6f-4c4f-900e-fc9e28222176@mailbox.org>
Date: Fri, 15 May 2026 17:12:58 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] drm: Limit DRM_IOCTL_WAIT_VBLANK to vblank interrupts
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, pekka.paalanen@collabora.com, jadahl@gmail.com,
 contact@emersion.fr, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org
References: <20260515120916.333614-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260515120916.333614-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 854feowx6yjx48qwaa5bzzie7tsk7ya4
X-MBO-RS-ID: 8806f4ef33ee5bb5fe8
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
X-Rspamd-Queue-Id: 0CEC8551F44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,ffwll.ch,gmail.com,collabora.com,emersion.fr,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

On 5/15/26 13:55, Thomas Zimmermann wrote:
> DRM's WAIT_VBLANK ioctl synchronizes user-space clients to display
> refresh. This is meaningless with vblank timers, which run unrelated
> to the hardware's vblank.
> 
> Disable the ioctl for simulated vblanks. Set DRM_VBLANK_FLAG_SIMULATED
> for CRTCs with simulated vblank events in all such drivers. The vblank
> timers of these devices still rate-limit the number of page-flip events
> to match the display refresh.
> 
> According to maintainers, user-space compositors do not require the ioctl
> for rate-limitting display output. Weston and Kwin rely on page-flip
> events. Mutter uses and internal timer to limit the number of display
> updates per second.

Actually mutter fundamentally relies on atomic commit completion events for that, same as Weston & KWin. Mutter uses the WAIT_VBLANK ioctl only for minimizing input → output latency (which can hide issues when completion of atomic commits isn't properly throttled).


(Just a side not on the cover letter, no objections to the patches themselves)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
