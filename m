Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N2WDSCbj2mORwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Feb 2026 22:44:00 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD0139A81
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Feb 2026 22:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369E910E31F;
	Fri, 13 Feb 2026 21:43:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D25D10E0C9;
 Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4fCMqM1DX3z3hhX1;
 Fri, 13 Feb 2026 14:36:31 -0500 (EST)
Received: from hal-station (unknown [23.129.64.148])
 by mta-13.privateemail.com (Postfix) with ESMTPA;
 Fri, 13 Feb 2026 14:35:59 -0500 (EST)
Date: Fri, 13 Feb 2026 14:35:43 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm: introduce KMS recovery mechanism
Message-ID: <aY99D-yXVydpMdwy@hal-station>
References: <20260212230905.688006-1-someguy@effective-light.com>
 <2e359cd9-0192-44d0-886f-7f93a8b0a4fa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e359cd9-0192-44d0-886f-7f93a8b0a4fa@amd.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 13 Feb 2026 21:43:57 +0000
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
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[effective-light.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B8BD0139A81
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 06:18:17PM -0600, Mario Limonciello wrote:
> Since you were able to (relatively) reliably reproduce a problem in amdgpu,
> how far in your iterative flow did you get?  Did you manage to need the
> vendor specific handling?  And presumably that helped?
> 

Every time I've tested it (with my repro) the full modeset has failed
and it was able to recover with the vendor specific handling. Though
it's worth noting that I strongly suspect a firmware hang in my case[1].

[1] https://lore.kernel.org/r/aYplYyf6Pp20lOAD@hal-station/

> > @@ -1881,13 +1886,43 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> >   			continue;
> >   		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> > -		if (ret == 0)
> > -			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> > -				crtc->base.id, crtc->name);
> > +		if (!ret) {
> > +			switch (dev->reset_phase) {
> > +			case DRM_KMS_RESET_NONE:
> > +				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> > +					crtc->base.id, crtc->name);
> > +				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
> > +				drm_kms_helper_hotplug_event(dev);
> > +				break;
> 
> Since you're iterating multiple CRTCs if you manage to recover from one
> with this call shouldn't you keep iterating the rest?
> 

Most measures that the can be implemented at the kernel level (including
forcing a full modeset), can't save the the current commit. So, in all
likelihood we will just end up waiting an extra 10 seconds per CRTC
(assuming they haven't completed already, unrelated to the forced
modeset).
