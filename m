Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3xkoN8OTdGmk7QAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Jan 2026 10:41:23 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F97D1F3
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Jan 2026 10:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB8110E102;
	Sat, 24 Jan 2026 09:41:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 52713 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jan 2026 14:44:56 UTC
Received: from MTA-06-4.privateemail.com (mta-06-4.privateemail.com
 [198.54.122.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949E410EB0A;
 Fri, 23 Jan 2026 14:44:56 +0000 (UTC)
Received: from hal-station.localdomain
 (bras-base-toroon4332w-grc-44-142-112-152-160.dsl.bell.ca [142.112.152.160])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 4dyLL26hDsz3hhTD;
 Fri, 23 Jan 2026 09:44:26 -0500 (EST)
Date: Fri, 23 Jan 2026 09:44:21 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Message-ID: <aXOJRWALUJLcGWqh@hal-station.localdomain>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
X-Mailman-Approved-At: Sat, 24 Jan 2026 09:41:19 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[effective-light.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.857];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 204F97D1F3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:52:44PM +0100, Christian König wrote:
> I can only see two reasons why you could run into a timeout:
> 
> 1. A dma_fence never signals.
> 	How that should be handled is already well documented and doesn't require any of this.
> 
> 2. A coding error in the vblank or page flip handler leading to waiting forever.
> 	In that case calling back into the driver doesn't help either.
> 
> So as far as I can see the whole approach doesn't make any sense at all.

It appears that resetting display firmware is able to put at least a
subset of these systems back into a consistent (usable) state. Though, I
don't have a reliable way to reproduce the issue that I'm seeing so I
can't say for sure what it boils down to.
