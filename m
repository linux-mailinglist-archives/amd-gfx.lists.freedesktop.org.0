Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NWSLEhlR0mnnWAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 05 Apr 2026 14:10:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52D39E3B8
	for <lists+amd-gfx@lfdr.de>; Sun, 05 Apr 2026 14:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35FD10E130;
	Sun,  5 Apr 2026 12:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DCmQcBFa";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA28510E483
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 Apr 2026 13:10:49 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-56d9c4f7f0bso1893817e0c.2
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 Apr 2026 06:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775308249; cv=none;
 d=google.com; s=arc-20240605;
 b=NYVF90tFXGYkbbMYHLxOd+IzJ51Ko7hrWSY4IRC3PJENjPTZ+Q051l7fbEmojHYo4f
 FOmPSx8YHGt4U/XB7AEucVYI/PG6yCwaK0QRIJP4eHe3V6bE8jcwvrj7zA17cqMH8BvD
 etlxfziX86YZFbNb5Jd479mqQ9cDmm0vW09keMbhYGQHFSVpBEUIdZjCq2Lsc1UQmfI+
 4bOWdo9LNF2YpY/dpvDOLu8B/lTz16cR1+DWc9+qD/aRvvZ3btQEVIU5fHgf2wjGmQ86
 8OclzNs870k13VZgrQUtKlEyal5/+eWLv4LwQSgYbxu27Likm9nrulvPsYoY6sAWjC0K
 zc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8HyqRbvBObQZXtQPHYrpXqo29d4/ZY4OJj9xIWAPpRo=;
 fh=Eo7g14YphFwQDLTfEofxpskiApUgAKGyDWQEQwifwAc=;
 b=VueAMuzmHy6spXCwvAYm1pDnoiYTXzCNKz6jymqBIv3DyYH1Re/cjYQ9OMsbgt0KoI
 IUnuoFUNuS4U3bblpWVO+t1OKCELJmpfWwP3rbd8HStkrVUMxww9nJxH0U1TTo+vckoj
 aJPZ0wKC5gwhEHzssqRBl5Nvs1did4VSk2uMW2ZeEmWOK2vJLVWN8fO14Ihn5NEGJrgW
 0RXqHEUManf8HPIgKS6SaVUAtR9fe19D0nW0QTucGC3UO2TnYvsmq7iJ1+VhybKI3QEK
 8GoHRoLb+f2kfYDDkRHAf1Eg5skV337J9jgwzItFKy1TNhpbe5spI9Hp/7hkx3fYKAZ1
 8AeA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775308249; x=1775913049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HyqRbvBObQZXtQPHYrpXqo29d4/ZY4OJj9xIWAPpRo=;
 b=DCmQcBFavWP9iDUJG1o0NetQwtS6f0VkfABXLfifzRt6dSnQaPZgBEtfRZY+ONfrfs
 HRX9bWxYroiTMncFrKlmPTKyDn6JlTBo9tHTmJOzWhZVgsOhelYnnVtDn77X6HsFlZOD
 Fsd90iLXHl3V+kmcX6El/g+Pzt6mw2FxMSqifxD06ysvcFQT7lxX4uXWTRFqTdvutYIx
 83pSKTy+IiMID54+YSvnrD+bwvuRPRy3hJX9G15dRcfQDYF1biWJ9/jWQCAKrVkDNTFm
 qnBN7xoAPBTHL3F5QlOcXzNu9ou0keIpU5yYdDw9pfE3x65cKO8NcoKoqNRQ4KmSE+Uh
 j/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775308249; x=1775913049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8HyqRbvBObQZXtQPHYrpXqo29d4/ZY4OJj9xIWAPpRo=;
 b=OYiImWAv63EDdxMD45fNIo92F5jFaYjLLjT+HSkXTErwUvldJxgs593oUXnqpbUlsv
 b3qDlO1sHSGijBzSMR6zaNtw+at9jAlw/jzT5duZzZzR58vxBBvJ/GImAEqy51Pvn14G
 z/hZgV0SFh+MiV6bhd0JDnvfF5CGMuMqfL24blVAq+Z6YPQDy2KwEY89zuM652kXkbke
 hMY35WiIlvvWIwLrgQ5E+rAMAEgUtyNpA9AGoMKXKWnrayiTgQyAf33asQjz/yYs5SRD
 7qixzdzcVB20vvHJiIeK6g+zXVilN2FffNvbfuzvse5n3PsPoPTJAO92EzAjGpEOzmAz
 I/NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaXUxInaFTe7pcUpuJklaTQYMzbMivOBQ7dWo4fb+t2lqSSGlNAS6HiPdheDVBH3acBYrrSEgM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrBeklmB/DoT+PC8983u6s0yu4vwpWIeRiCpckdchJKQF0Wr/D
 CY3dAYtF7y2GVmMh7VOwy19vLSiwJRdUrLaUPhDk6WxFGu648E7AD9arM21X/9E+VguD/JHd3UR
 8GpDd1qhg4/+G3/8PoF9ycOcx5pJ1HnA=
X-Gm-Gg: AeBDietkQr2d/b4QEnmv/fIjWbToyd/XtOYXhCjloTQZDHS1rQb7wWDxi4Q6LfEw57m
 tA86MOew2mol+h5oW73pv9W8Yq33cMN8ifu/1K/mP+KWyli5dody2Bneu0eiiO14RMN57JVW1fT
 O2cbrMVTY/Him/cpj95GqDd9GFWAbzYMpyjEdsBOkcIY8qMV4vPp4zJCNgji+rFpmsO4TPYeZup
 eWUAdxvlVKhEwQI3iR815EnCUAc2mvztsdvNd5EpBtxmZeuqBg0XnV7Fbyxi32dWIlLJ4KBxqd3
 8Yt0
X-Received: by 2002:a05:6122:3117:b0:56c:d862:37dd with SMTP id
 71dfb90a1353d-56daba00310mr2416475e0c.14.1775308248826; Sat, 04 Apr 2026
 06:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
 <20260326185413.1205870-69-jim.cromie@gmail.com>
 <20260402201450.GA966967-robh@kernel.org>
In-Reply-To: <20260402201450.GA966967-robh@kernel.org>
From: jim.cromie@gmail.com
Date: Sat, 4 Apr 2026 07:10:22 -0600
X-Gm-Features: AQROBzDRTOzUzM599gp-nqIHu_gVlpR5oj_SwsKJNy6Z4X8KHhBApGeW-pcrUKU
Message-ID: <CAJfuBxwRst2GGZmFW6Lx1jb4CMNEsutvQoRfVg2RBSJCtVikoA@mail.gmail.com>
Subject: Re: [PATCH v12 68/69] accel/ethosu: call DRM_CLASSMAP_USE
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, mripard@kernel.org, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, christian.koenig@amd.com, 
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com, 
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com, 
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Apr 2026 12:09:57 +0000
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,suse.com,chromium.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8A52D39E3B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 2:14=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 26, 2026 at 12:54:12PM -0600, Jim Cromie wrote:
> > ethosu.ko has several drm*dbg() calls, it must call DRM_CLASSMAP_USE
> > to tell dynamic-debug what classmap enables them.
> > Also include drm/drm_print.h explicitly.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
>
> Didn't I ack this already? It is up to you to add tags when you send a
> new version.
>
> Or did it change? I can't tell as there is no changelog here.
>

Sorry, I missed that one.  (no changes)
and thanks.


> >  drivers/accel/ethosu/ethosu_drv.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/e=
thosu_drv.c
> > index 9992193d7338..a0b8cb81a359 100644
> > --- a/drivers/accel/ethosu/ethosu_drv.c
> > +++ b/drivers/accel/ethosu/ethosu_drv.c
> > @@ -17,12 +17,15 @@
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_accel.h>
> >  #include <drm/ethosu_accel.h>
> > +#include <drm/drm_print.h>
> >
> >  #include "ethosu_drv.h"
> >  #include "ethosu_device.h"
> >  #include "ethosu_gem.h"
> >  #include "ethosu_job.h"
> >
> > +DRM_CLASSMAP_USE(drm_debug_classes);
> > +
> >  static int ethosu_ioctl_dev_query(struct drm_device *ddev, void *data,
> >                                 struct drm_file *file)
> >  {
> > --
> > 2.53.0
> >
