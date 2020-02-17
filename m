Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6516123E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Feb 2020 13:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1BC6E93E;
	Mon, 17 Feb 2020 12:41:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD996E93E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Feb 2020 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581943286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75TR+iBaLxtjMNeogrC4FFWxtt3pHJHscJNAByI2QHA=;
 b=V6+QJ8oOgIjmlFeOZ/jAgog9AU6Vuo4v1ElOMoUnVSLdA6MxhVyxmD5vpmfua3ZrzfvE0F
 xaBXQ6PtAKzXD//jrPi7CJEM6lXd/BtVBIng22GcS/AoDC64N75dz2oumI35FzJQYy5tfT
 0N6j2AaDbkUS5e/VbcU16kvmDZ/9p6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-jlxQwHwJMey3VnWzkt_Urw-1; Mon, 17 Feb 2020 07:41:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DAAF107ACC4;
 Mon, 17 Feb 2020 12:41:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2255D9CA;
 Mon, 17 Feb 2020 12:41:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7495616E16; Mon, 17 Feb 2020 13:41:19 +0100 (CET)
Date: Mon, 17 Feb 2020 13:41:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [PATCH 6/7] drm/bochs: don't use ttm bo->offset
Message-ID: <20200217124119.et35zk6ndp73nlfy@sirius.home.kraxel.org>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
 <20200217101841.7437-7-nirmoy.das@amd.com>
MIME-Version: 1.0
In-Reply-To: <20200217101841.7437-7-nirmoy.das@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: jlxQwHwJMey3VnWzkt_Urw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: David1.Zhou@amd.com, thellstrom@vmware.com, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, kenny.ho@amd.com, brian.welty@intel.com,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 11:18:40AM +0100, Nirmoy Das wrote:
> Calculate GPU offset within bochs driver itself without depending on
> bo->offset
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/bochs/bochs_kms.c     | 3 ++-
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 8066d7d370d5..852ec7910d84 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -38,7 +38,8 @@ static void bochs_plane_update(struct bochs_device *bochs,
>  			 state->crtc_x,
>  			 state->crtc_y,
>  			 state->fb->pitches[0],
> -			 state->fb->offsets[0] + gbo->bo.offset);
> +			 state->fb->offsets[0] +
> +			 (gbo->bo.mem.start << PAGE_SHIFT));

I'd suggest to use drm_gem_vram_offset() here ...

> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 92a11bb42365..e7ef4cd8116d 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -214,7 +214,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>  {
>  	if (WARN_ON_ONCE(!gbo->pin_count))
>  		return (s64)-ENODEV;
> -	return gbo->bo.offset;
> +	return gbo->bo.mem.start << PAGE_SHIFT;

... and move this to a separate patch.  The vram helpers are used by
more drivers than just bochs.

cheers,
  Gerd

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
