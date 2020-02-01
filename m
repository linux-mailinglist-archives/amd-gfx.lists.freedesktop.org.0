Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3614F91E
	for <lists+amd-gfx@lfdr.de>; Sat,  1 Feb 2020 18:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72296E0F0;
	Sat,  1 Feb 2020 17:11:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166])
 by gabe.freedesktop.org (Postfix) with SMTP id 2C9446E4DD
 for <amd-gfx@lists.freedesktop.org>; Sat,  1 Feb 2020 09:03:07 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.3.106])
 by sina.com with ESMTP
 id 5E353EC1000026FF; Sat, 1 Feb 2020 17:02:59 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 46649154919310
From: Hillf Danton <hdanton@sina.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
Date: Sat,  1 Feb 2020 17:02:47 +0800
Message-Id: <20200201090247.10928-1-hdanton@sina.com>
In-Reply-To: <20200201043209.13412-1-hdanton@sina.com>
References: <20200201043209.13412-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 01 Feb 2020 17:11:52 +0000
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
Cc: robdclark@chromium.org, daniel@ffwll.ch, davem@davemloft.net,
 airlied@linux.ie, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, eric@anholt.net,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


On Sat, 1 Feb 2020 09:17:57 +0300 Dan Carpenter wrote:
> On Sat, Feb 01, 2020 at 12:32:09PM +0800, Hillf Danton wrote:
> >
> > Release obj in error path.
> > 
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -196,10 +196,10 @@ static struct drm_gem_object *vgem_gem_c
> >  		return ERR_CAST(obj);
> >  
> >  	ret = drm_gem_handle_create(file, &obj->base, handle);
> > -	drm_gem_object_put_unlocked(&obj->base);
> > -	if (ret)
> > +	if (ret) {
> > +		drm_gem_object_put_unlocked(&obj->base);
> >  		return ERR_PTR(ret);
> > -
> > +	}
> >  	return &obj->base;
> 
> Oh yeah.  It's weird that we never noticed the success path was broken.
> It's been that way for three years and no one noticed at all.  Very
> strange.
> 
> Anyway, it already gets freed on error in drm_gem_handle_create() so
> we should just delete the drm_gem_object_put_unlocked() here it looks
> like.

Good catch, Dan :P
Would you please post a patch sometime convenient next week?

Thanks
Hillf

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
