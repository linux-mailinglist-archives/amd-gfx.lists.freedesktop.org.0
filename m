Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD602829812
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jan 2024 11:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627FC10E76B;
	Wed, 10 Jan 2024 10:54:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F7710E76B
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jan 2024 10:54:42 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a2b27a67b7fso63395866b.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jan 2024 02:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704884081; x=1705488881; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NTmWilJtg5P8EAdgbWScW8Z1MmDyPZBrslnYAxCQJ+k=;
 b=Otz0dt2MyLM3OBySshP5BYf/PLL5upMKpBuGLW3IA+54H2+kbNmx1ydH3Q9Zljd4L/
 mGB2+rtnt4LVgVSszeKsJ/bppsDFYzuTA/5VHp77lJSnP94Nqgz7/uVs0VmCRk+4qrXE
 ZfYJLzHD5UL+RJ2XSGw/5tZZmkAiYztE5Almo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704884081; x=1705488881;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NTmWilJtg5P8EAdgbWScW8Z1MmDyPZBrslnYAxCQJ+k=;
 b=FEaTCKb5r8fn1lvBsYX4+zK1vigFsll4XPqIN+YL22ZXe5EqXqEfoqkzhRL6xY9KVN
 M3TScKBhj0p9Yg/Ru/WWaSUJ1AlWsfbcFxqAjAeERFN7z5luGpYCHov8WmQfbsKhy7dD
 Ab0OG6HnBQicGCMkSnFNSScTZicijcVc/H6/iU2ilwPF4RYEOky43Px3B9s2xNxpl610
 JAoDPwun4sMovMpT6i0jvxsxSNsnV32U+q2rpAu/KmKJnWqJ9KCVAYma6SthPuuG4MgR
 N/35WJpYuqVSKobWtF81BOzofLrSmOalHWSmfS+yHV0yKnH8D7q8C+MFnydW6h8ECAxx
 5xVg==
X-Gm-Message-State: AOJu0YwsKhbiHqxZ5X2wh1m1KVRkQVGWOUQQtEr/EE4jGZTqb8edQVws
 q/yThsfn/itM4dUzYc5wwctJYFjlOxvh7w==
X-Google-Smtp-Source: AGHT+IF26BHWkbNetn2BtGgHHzVb6jLZLRczSK0sZB7UCsLEM4cE+FPYCzjPJpBMyiinoDO1Yg5X9A==
X-Received: by 2002:a17:906:7d8:b0:a28:ab63:db33 with SMTP id
 m24-20020a17090607d800b00a28ab63db33mr979438ejc.7.1704884081031; 
 Wed, 10 Jan 2024 02:54:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a170906680200b00a28f51adc39sm1967689ejr.61.2024.01.10.02.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:54:40 -0800 (PST)
Date: Wed, 10 Jan 2024 11:54:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Message-ID: <ZZ53bhLcH-YO24-F@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
 <8ce0d90d-c751-4250-8656-fcab27aec6c2@amd.com>
 <ZZ5v7Fm-Iccw7nJR@phenom.ffwll.local>
 <12505066-eb42-4ddf-9c6d-29eca6eefdbc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12505066-eb42-4ddf-9c6d-29eca6eefdbc@amd.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, Chen Jiqian <Jiqian.Chen@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, David Airlie <airlied@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>,
 Julia Zhang <julia.zhang@amd.com>, virtualization@lists.linux-foundation.org,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 11:46:35AM +0100, Christian K�nig wrote:
> Am 10.01.24 um 11:22 schrieb Daniel Vetter:
> > On Wed, Jan 10, 2024 at 11:19:37AM +0100, Christian K�nig wrote:
> > > Am 10.01.24 um 10:56 schrieb Julia Zhang:
> > > > drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
> > > > implemented, or else return ENOSYS. Virtio has no get_sg_table
> > > > implemented for vram object. To fix this, add a new device_attach to
> > > > call drm_gem_map_attach() for shmem object and return 0 for vram object
> > > > instead of calling drm_gem_map_attach for both of these two kinds of
> > > > object.
> > > Well as far as I can see this is nonsense from the DMA-buf side of things.
> > > 
> > > SG tables are always needed as long as you don't re-import the same object
> > > into your driver and then you shouldn't end up in this function in the first
> > > place.
> > > 
> > > So that drm_gem_map_attach() requires get_sg_table to be implemented is
> > > intentional and should never be overridden like this.
> > See my reply, tldr; you're allowed to reject ->attach with -EBUSY to
> > handle exactly this case of non-shareable buffer types. But definitely
> > don't silently fail, that's a "we'll oops on map_attachment" kind of bug
> > :-)
> 
> Ah, yes that makes much more sense!
> 
> So basically just the "return 0;" needs to be "return -EBUSY;".

Well plus 2nd patch to polish the virtio_dma_buf docs a bit, that would be
nice :-D
-Sima

> 
> Regards,
> Christian.
> 
> > -Sima
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> > > > ---
> > > >    drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
> > > >    1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > > > index 44425f20d91a..f0b0ff6f3813 100644
> > > > --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> > > > +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > > > @@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
> > > >    	drm_gem_unmap_dma_buf(attach, sgt, dir);
> > > >    }
> > > > +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> > > > +				     struct dma_buf_attachment *attach)
> > > > +{
> > > > +	struct drm_gem_object *obj = attach->dmabuf->priv;
> > > > +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> > > > +
> > > > +	if (virtio_gpu_is_vram(bo))
> > > > +		return 0;
> > > > +
> > > > +	return drm_gem_map_attach(dma_buf, attach);
> > > > +}
> > > > +
> > > >    static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
> > > >    	.ops = {
> > > >    		.cache_sgt_mapping = true,
> > > > @@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
> > > >    		.vmap = drm_gem_dmabuf_vmap,
> > > >    		.vunmap = drm_gem_dmabuf_vunmap,
> > > >    	},
> > > > -	.device_attach = drm_gem_map_attach,
> > > > +	.device_attach = virtgpu_gem_device_attach,
> > > >    	.get_uuid = virtgpu_virtio_get_uuid,
> > > >    };
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
