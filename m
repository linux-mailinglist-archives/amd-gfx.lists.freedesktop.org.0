Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C217984275
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2024 11:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0445F10E258;
	Tue, 24 Sep 2024 09:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FmIftIPi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82B10E20F
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2024 09:44:28 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so694719566b.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2024 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727171066; x=1727775866; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Nbn/6+v2ehxmHa7cg3r77Fli54C3nSXS3mSaA/pM1FI=;
 b=FmIftIPiBy3rGv4x0dJpaMtiNAWthzOUdNZbtXhAJ8boh8xCA0taTa7oQ7flSJHJuP
 1YFtnk+6AabKWq48MvhQ90wC82/0tqka+Vkb8ahkPVnhZi/0gggjiVchLVZHwTREKlP4
 ZdJXgMmZCuQvafRn0Cw43NRnuS8rlD+uyATPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727171066; x=1727775866;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbn/6+v2ehxmHa7cg3r77Fli54C3nSXS3mSaA/pM1FI=;
 b=i5ihd4/32TgYXrsgvayfImhBxICSdSa6cotRpj/0SphF4lW777dkFc9uHcsSqWFaAr
 zOOc+JKh2+NyVIU+/Uqud99RRp3LDyXxsVlZzWtIqH45bsk4cIQxbnu7c3RkZUyCq4JD
 AOC780fekAqiiILMe/vQS59MLzhHI44ERoXntW3l6WocB6Cy4yg2bQaH3uExXHdRTJwy
 n8w8lCc4/XkH8pJfbFHUtZ45u4equPIifZpHCZA+CDaFZhSa8fQnLphcAPQu6oeO2e/f
 KddTifBV5eUv2zk8nHrhxf0O4k6xHBWqvTECWHuzDwJcYF2eFfMmbaBdqcJ7ynHPt6sa
 Mklg==
X-Gm-Message-State: AOJu0YwHcNj1Rx/xUpLKGofthJRI4M0KK7fBl0aDYr9fkjwuQCczVrFg
 Rn6OksH18tnpjuae4N3Q5W3v/e7HW9lXIwa9a0c+shEiM5D7+evWkaH4VyoFHv4=
X-Google-Smtp-Source: AGHT+IErkgAbjopa95AIxPtQugGsVlAny+uC5pcURYXuikKjfJFFr4nUSjfDgekYmG434eKcDUtQWw==
X-Received: by 2002:a17:907:c7dc:b0:a8a:6c5d:63b2 with SMTP id
 a640c23a62f3a-a90d4ffdde9mr1412258266b.18.1727171066559; 
 Tue, 24 Sep 2024 02:44:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f342b2sm64122466b.35.2024.09.24.02.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:44:26 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:44:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
Message-ID: <ZvKJ-GFYij1gJT2Z@phenom.ffwll.local>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-7-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240909171937.51550-7-tursulin@igalia.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Mon, Sep 09, 2024 at 06:19:35PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Lets re-order the members to make it clear which are protected by the lock
> and at the same time document it via kerneldoc.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K�nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>  include/drm/gpu_scheduler.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a06753987d93..d4a3ba333568 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -243,10 +243,10 @@ struct drm_sched_entity {
>  /**
>   * struct drm_sched_rq - queue of entities to be scheduled.
>   *
> - * @lock: to modify the entities list.
>   * @sched: the scheduler to which this rq belongs to.
> - * @entities: list of the entities to be scheduled.
> + * @lock: protects the list, tree and current entity.
>   * @current_entity: the entity which is to be scheduled.
> + * @entities: list of the entities to be scheduled.
>   * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
> @@ -254,10 +254,12 @@ struct drm_sched_entity {
>   * the next entity to emit commands from.
>   */
>  struct drm_sched_rq {
> -	spinlock_t			lock;
>  	struct drm_gpu_scheduler	*sched;
> -	struct list_head		entities;
> +
> +	spinlock_t			lock;
> +	/* Following members are protected by the @lock: */

Bit a bikeshed, but I think the moment you feel like you need to sprinkle
additional comments around you should switch over to the in-line
documentation style, where you can have all the space to add everything.
For structures in general I think the top comment style for members isn't
a good idea except for really trivial structs.

But yeah I know it's a bit of work to shuffle stuff around, so maybe next
time ..
-Sima

>  	struct drm_sched_entity		*current_entity;
> +	struct list_head		entities;
>  	struct rb_root_cached		rb_tree_root;
>  };
>  
> -- 
> 2.46.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
