Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D9290581
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Oct 2020 14:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278846EDD7;
	Fri, 16 Oct 2020 12:49:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C5D6E141;
 Fri, 16 Oct 2020 12:48:59 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 383A2806F9;
 Fri, 16 Oct 2020 14:48:52 +0200 (CEST)
Date: Fri, 16 Oct 2020 14:48:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 10/10] drm/fb_helper: Support framebuffers in I/O memory
Message-ID: <20201016124850.GA1174599@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-11-tzimmermann@suse.de>
 <20201016120347.GB1125266@ravnborg.org>
 <20201016141942.111e17f3@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016141942.111e17f3@linux-uq9g>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=6Hpfs63HWkxrz3fWGNMA:9
 a=w4pgIJ6L-nyCBc2a:21 a=gikFlJ38tUkSyios:21 a=wPNLvfGTeEIA:10
 a=qfUslh1TxfEA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: luben.tuikov@amd.com, heiko@sntech.de, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, eric@anholt.net, ray.huang@amd.com, kraxel@redhat.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com, krzk@kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 mripard@kernel.org, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 02:19:42PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> On Fri, 16 Oct 2020 14:03:47 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> =

> > Hi Thomas.
> > =

> > On Thu, Oct 15, 2020 at 02:38:06PM +0200, Thomas Zimmermann wrote:
> > > At least sparc64 requires I/O-specific access to framebuffers. This
> > > patch updates the fbdev console accordingly.
> > > =

> > > For drivers with direct access to the framebuffer memory, the callback
> > > functions in struct fb_ops test for the type of memory and call the r=
sp
> > > fb_sys_ of fb_cfb_ functions.
> > > =

> > > For drivers that employ a shadow buffer, fbdev's blit function retrie=
ves
> > > the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> > > interfaces to access the buffer.
> > > =

> > > The bochs driver on sparc64 uses a workaround to flag the framebuffer=
 as
> > > I/O memory and avoid a HW exception. With the introduction of struct
> > > dma_buf_map, this is not required any longer. The patch removes the r=
sp
> > > code from both, bochs and fbdev.
> > > =

> > > v4:
> > > 	* move dma_buf_map changes into separate patch (Daniel)
> > > 	* TODO list: comment on fbdev updates (Daniel)
> > > =

> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > The original workaround fixed it so we could run qemu with the
> > -nographic option.
> > =

> > So I went ahead and tried to run quemu version:
> > v5.0.0-1970-g0b100c8e72-dirty.
> > And with the BOCHS driver built-in.
> > =

> > With the following command line:
> > qemu-system-sparc64 -m 512 -kernel vmlinux -append console=3DttyS0 -nog=
raphic
> > =

> > Behaviour was the same before and after applying this patch.
> > (panic due to VFS: Unable to mount root fs on unknown-block(0,0))
> > So I consider it fixed for real now and not just a workaround.
> > =

> > I also tested with:
> > qemu-system-sparc64 -m 512 -kernel vmlinux -append console=3DttyS0 -ser=
ial
> > stdio
> > =

> > and it worked in both cases too.
> =

> FTR, you booted a kernel and got graphics output. The error is simply that
> there was no disk to mount?

The short version "Yes".

The longer version:

With "qemu-system-sparc64 -m 512 -kernel vmlinux -append console=3DttyS0
-serial stdio" I got graphical output - one penguin.

With "qemu-system-sparc64 -m 512 -kernel vmlinux -append console=3DttyS0
-nographic" I got no graphical output, as implied by the -nographic
option. But the boot continued - where it would panic before when we
accessed IO memory as system memory.

In both cases I got an error because I had not specified any rootfs, so
qemu failed to mount any rootfs. So expected.

	Sam

> =

> Best regards
> Thomas
> =

> > =

> > All the comments above so future-me have an easier time finding how to
> > reproduce.
> > =

> > Tested-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> > 	Sam
> > =

> > > ---
> > >  Documentation/gpu/todo.rst        |  19 ++-
> > >  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
> > >  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++=
--
> > >  include/drm/drm_mode_config.h     |  12 --
> > >  4 files changed, 220 insertions(+), 29 deletions(-)
> > > =

> > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > index 7e6fc3c04add..638b7f704339 100644
> > > --- a/Documentation/gpu/todo.rst
> > > +++ b/Documentation/gpu/todo.rst
> > > @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
> > >  ------------------------------------------------
> > >  =

> > >  Most drivers can use drm_fbdev_generic_setup(). Driver have to imple=
ment
> > > -atomic modesetting and GEM vmap support. Current generic fbdev emula=
tion
> > > -expects the framebuffer in system memory (or system-like memory).
> > > +atomic modesetting and GEM vmap support. Historically, generic fbdev
> > > emulation +expected the framebuffer in system memory or system-like
> > > memory. By employing +struct dma_buf_map, drivers with frambuffers in=
 I/O
> > > memory can be supported +as well.
> > >  =

> > >  Contact: Maintainer of the driver you plan to convert
> > >  =

> > >  Level: Intermediate
> > >  =

> > > +Reimplement functions in drm_fbdev_fb_ops without fbdev
> > > +-------------------------------------------------------
> > > +
> > > +A number of callback functions in drm_fbdev_fb_ops could benefit from
> > > +being rewritten without dependencies on the fbdev module. Some of the
> > > +helpers could further benefit from using struct dma_buf_map instead =
of
> > > +raw pointers.
> > > +
> > > +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> > > +
> > > +Level: Advanced
> > > +
> > > +
> > >  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
> > >  -----------------------------------------------------------------
> > >  =

> > > diff --git a/drivers/gpu/drm/bochs/bochs_kms.c
> > > b/drivers/gpu/drm/bochs/bochs_kms.c index 13d0d04c4457..853081d186d5
> > > 100644 --- a/drivers/gpu/drm/bochs/bochs_kms.c
> > > +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> > > @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
> > >  	bochs->dev->mode_config.preferred_depth =3D 24;
> > >  	bochs->dev->mode_config.prefer_shadow =3D 0;
> > >  	bochs->dev->mode_config.prefer_shadow_fbdev =3D 1;
> > > -	bochs->dev->mode_config.fbdev_use_iomem =3D true;
> > >  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order =3D
> > > true; =

> > >  	bochs->dev->mode_config.funcs =3D &bochs_mode_funcs;
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > > b/drivers/gpu/drm/drm_fb_helper.c index 6212cd7cde1d..462b0c130ebb 10=
0644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct
> > > work_struct *work) }
> > >  =

> > >  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> > > *fb_helper,
> > > -					  struct drm_clip_rect *clip)
> > > +					  struct drm_clip_rect *clip,
> > > +					  struct dma_buf_map *dst)
> > >  {
> > >  	struct drm_framebuffer *fb =3D fb_helper->fb;
> > >  	unsigned int cpp =3D fb->format->cpp[0];
> > >  	size_t offset =3D clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> > >  	void *src =3D fb_helper->fbdev->screen_buffer + offset;
> > > -	void *dst =3D fb_helper->buffer->map.vaddr + offset;
> > >  	size_t len =3D (clip->x2 - clip->x1) * cpp;
> > >  	unsigned int y;
> > >  =

> > > -	for (y =3D clip->y1; y < clip->y2; y++) {
> > > -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> > > -			memcpy(dst, src, len);
> > > -		else
> > > -			memcpy_toio((void __iomem *)dst, src, len);
> > > +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip
> > > rect */ =

> > > +	for (y =3D clip->y1; y < clip->y2; y++) {
> > > +		dma_buf_map_memcpy_to(dst, src, len);
> > > +		dma_buf_map_incr(dst, fb->pitches[0]);
> > >  		src +=3D fb->pitches[0];
> > > -		dst +=3D fb->pitches[0];
> > >  	}
> > >  }
> > >  =

> > > @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct
> > > work_struct *work) ret =3D drm_client_buffer_vmap(helper->buffer, &ma=
p);
> > >  			if (ret)
> > >  				return;
> > > -			drm_fb_helper_dirty_blit_real(helper,
> > > &clip_copy);
> > > +			drm_fb_helper_dirty_blit_real(helper,
> > > &clip_copy, &map); }
> > > +
> > >  		if (helper->fb->funcs->dirty)
> > >  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> > >  						 &clip_copy, 1);
> > > @@ -755,6 +754,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info
> > > *info, }
> > >  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> > >  =

> > > +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __u=
ser
> > > *buf,
> > > +				      size_t count, loff_t *ppos)
> > > +{
> > > +	unsigned long p =3D *ppos;
> > > +	u8 *dst;
> > > +	u8 __iomem *src;
> > > +	int c, err =3D 0;
> > > +	unsigned long total_size;
> > > +	unsigned long alloc_size;
> > > +	ssize_t ret =3D 0;
> > > +
> > > +	if (info->state !=3D FBINFO_STATE_RUNNING)
> > > +		return -EPERM;
> > > +
> > > +	total_size =3D info->screen_size;
> > > +
> > > +	if (total_size =3D=3D 0)
> > > +		total_size =3D info->fix.smem_len;
> > > +
> > > +	if (p >=3D total_size)
> > > +		return 0;
> > > +
> > > +	if (count >=3D total_size)
> > > +		count =3D total_size;
> > > +
> > > +	if (count + p > total_size)
> > > +		count =3D total_size - p;
> > > +
> > > +	src =3D (u8 __iomem *)(info->screen_base + p);
> > > +
> > > +	alloc_size =3D min(count, PAGE_SIZE);
> > > +
> > > +	dst =3D kmalloc(alloc_size, GFP_KERNEL);
> > > +	if (!dst)
> > > +		return -ENOMEM;
> > > +
> > > +	while (count) {
> > > +		c =3D min(count, alloc_size);
> > > +
> > > +		memcpy_fromio(dst, src, c);
> > > +		if (copy_to_user(buf, dst, c)) {
> > > +			err =3D -EFAULT;
> > > +			break;
> > > +		}
> > > +
> > > +		src +=3D c;
> > > +		*ppos +=3D c;
> > > +		buf +=3D c;
> > > +		ret +=3D c;
> > > +		count -=3D c;
> > > +	}
> > > +
> > > +	kfree(dst);
> > > +
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const c=
har
> > > __user *buf,
> > > +				       size_t count, loff_t *ppos)
> > > +{
> > > +	unsigned long p =3D *ppos;
> > > +	u8 *src;
> > > +	u8 __iomem *dst;
> > > +	int c, err =3D 0;
> > > +	unsigned long total_size;
> > > +	unsigned long alloc_size;
> > > +	ssize_t ret =3D 0;
> > > +
> > > +	if (info->state !=3D FBINFO_STATE_RUNNING)
> > > +		return -EPERM;
> > > +
> > > +	total_size =3D info->screen_size;
> > > +
> > > +	if (total_size =3D=3D 0)
> > > +		total_size =3D info->fix.smem_len;
> > > +
> > > +	if (p > total_size)
> > > +		return -EFBIG;
> > > +
> > > +	if (count > total_size) {
> > > +		err =3D -EFBIG;
> > > +		count =3D total_size;
> > > +	}
> > > +
> > > +	if (count + p > total_size) {
> > > +		/*
> > > +		 * The framebuffer is too small. We do the
> > > +		 * copy operation, but return an error code
> > > +		 * afterwards. Taken from fbdev.
> > > +		 */
> > > +		if (!err)
> > > +			err =3D -ENOSPC;
> > > +		count =3D total_size - p;
> > > +	}
> > > +
> > > +	alloc_size =3D min(count, PAGE_SIZE);
> > > +
> > > +	src =3D kmalloc(alloc_size, GFP_KERNEL);
> > > +	if (!src)
> > > +		return -ENOMEM;
> > > +
> > > +	dst =3D (u8 __iomem *)(info->screen_base + p);
> > > +
> > > +	while (count) {
> > > +		c =3D min(count, alloc_size);
> > > +
> > > +		if (copy_from_user(src, buf, c)) {
> > > +			err =3D -EFAULT;
> > > +			break;
> > > +		}
> > > +		memcpy_toio(dst, src, c);
> > > +
> > > +		dst +=3D c;
> > > +		*ppos +=3D c;
> > > +		buf +=3D c;
> > > +		ret +=3D c;
> > > +		count -=3D c;
> > > +	}
> > > +
> > > +	kfree(src);
> > > +
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  /**
> > >   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
> > >   * @info: fbdev registered by the helper
> > > @@ -2027,6 +2156,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *i=
nfo,
> > > struct vm_area_struct *vma) return -ENODEV;
> > >  }
> > >  =

> > > +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *=
buf,
> > > +				 size_t count, loff_t *ppos)
> > > +{
> > > +	struct drm_fb_helper *fb_helper =3D info->par;
> > > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > > +
> > > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > > +		return drm_fb_helper_sys_read(info, buf, count, ppos);
> > > +	else
> > > +		return drm_fb_helper_cfb_read(info, buf, count, ppos);
> > > +}
> > > +
> > > +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char
> > > __user *buf,
> > > +				  size_t count, loff_t *ppos)
> > > +{
> > > +	struct drm_fb_helper *fb_helper =3D info->par;
> > > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > > +
> > > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > > +		return drm_fb_helper_sys_write(info, buf, count, ppos);
> > > +	else
> > > +		return drm_fb_helper_cfb_write(info, buf, count, ppos);
> > > +}
> > > +
> > > +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> > > +				  const struct fb_fillrect *rect)
> > > +{
> > > +	struct drm_fb_helper *fb_helper =3D info->par;
> > > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > > +
> > > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > > +		drm_fb_helper_sys_fillrect(info, rect);
> > > +	else
> > > +		drm_fb_helper_cfb_fillrect(info, rect);
> > > +}
> > > +
> > > +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> > > +				  const struct fb_copyarea *area)
> > > +{
> > > +	struct drm_fb_helper *fb_helper =3D info->par;
> > > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > > +
> > > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > > +		drm_fb_helper_sys_copyarea(info, area);
> > > +	else
> > > +		drm_fb_helper_cfb_copyarea(info, area);
> > > +}
> > > +
> > > +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> > > +				   const struct fb_image *image)
> > > +{
> > > +	struct drm_fb_helper *fb_helper =3D info->par;
> > > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > > +
> > > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > > +		drm_fb_helper_sys_imageblit(info, image);
> > > +	else
> > > +		drm_fb_helper_cfb_imageblit(info, image);
> > > +}
> > > +
> > >  static const struct fb_ops drm_fbdev_fb_ops =3D {
> > >  	.owner		=3D THIS_MODULE,
> > >  	DRM_FB_HELPER_DEFAULT_OPS,
> > > @@ -2034,11 +2223,11 @@ static const struct fb_ops drm_fbdev_fb_ops =
=3D {
> > >  	.fb_release	=3D drm_fbdev_fb_release,
> > >  	.fb_destroy	=3D drm_fbdev_fb_destroy,
> > >  	.fb_mmap	=3D drm_fbdev_fb_mmap,
> > > -	.fb_read	=3D drm_fb_helper_sys_read,
> > > -	.fb_write	=3D drm_fb_helper_sys_write,
> > > -	.fb_fillrect	=3D drm_fb_helper_sys_fillrect,
> > > -	.fb_copyarea	=3D drm_fb_helper_sys_copyarea,
> > > -	.fb_imageblit	=3D drm_fb_helper_sys_imageblit,
> > > +	.fb_read	=3D drm_fbdev_fb_read,
> > > +	.fb_write	=3D drm_fbdev_fb_write,
> > > +	.fb_fillrect	=3D drm_fbdev_fb_fillrect,
> > > +	.fb_copyarea	=3D drm_fbdev_fb_copyarea,
> > > +	.fb_imageblit	=3D drm_fbdev_fb_imageblit,
> > >  };
> > >  =

> > >  static struct fb_deferred_io drm_fbdev_defio =3D {
> > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_con=
fig.h
> > > index 5ffbb4ed5b35..ab424ddd7665 100644
> > > --- a/include/drm/drm_mode_config.h
> > > +++ b/include/drm/drm_mode_config.h
> > > @@ -877,18 +877,6 @@ struct drm_mode_config {
> > >  	 */
> > >  	bool prefer_shadow_fbdev;
> > >  =

> > > -	/**
> > > -	 * @fbdev_use_iomem:
> > > -	 *
> > > -	 * Set to true if framebuffer reside in iomem.
> > > -	 * When set to true memcpy_toio() is used when copying the
> > > framebuffer in
> > > -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> > > -	 *
> > > -	 * FIXME: This should be replaced with a per-mapping is_iomem
> > > -	 * flag (like ttm does), and then used everywhere in fbdev code.
> > > -	 */
> > > -	bool fbdev_use_iomem;
> > > -
> > >  	/**
> > >  	 * @quirk_addfb_prefer_xbgr_30bpp:
> > >  	 *
> > > -- =

> > > 2.28.0
> =

> =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
