Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF310909185
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2024 19:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9680010EDF7;
	Fri, 14 Jun 2024 17:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iD5Gveq4";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912C10E18C
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2024 17:32:31 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso40268281fa.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2024 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718386350; x=1718991150; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aesDOEiRaG9Aa3dzWhXp6jZ8a3i1f0OGXi6kYr7Lp3g=;
 b=iD5Gveq4izPNzTlEStzjXuoxLzHpTF8egbOnxo8swyejW+RBEho3hhhH5tkElQJiOU
 qINPcvdJ7FrJjlDnku/8tyRCYvk3MUY1hxIolK0K7FcL3EmpQacO3dfwP+m+zUYO3Yxw
 9ADQJ1hXwiOLS2HeKhwNvSyY5eEaV+Zy89tl/PL3TkAhmc2DdtpBs3ahLDabyJWPdivS
 zuLgGfe5ikuQt6+sdJV/N/zhMsHSkX530RoN+2NNelthsof2tkUOzatiiXwxbtR0nPDT
 EuXp0sKI58pdoh02lrQ78N/nDCoIALWL9hI5mVS9EUEBimgnqpdr63c794f8+X1tF1ZO
 Q+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718386350; x=1718991150;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aesDOEiRaG9Aa3dzWhXp6jZ8a3i1f0OGXi6kYr7Lp3g=;
 b=Dwfhytc5M24pTfuIGz/uFd8PxXtr22oyRuP6TLmST/GgITK8apJ8m39um0pjYTLoB3
 wfgepxqtvjugL2zXeGhpPKfJlgZQ4bBfideGIDzhBNrAqdrSscTGOMVUJYup9uXmhans
 CsgZEAOoPv0bVQpq84/uUQfhtb20YiKLvikmSU7Uj1DZx+In8phLrNyglmqVn2j+H4mP
 QEucsMNgE2k5mN67qN++tkxOiluJtGx2zKRE50bRUeaRP13uNCB2cYHz/gFeCsCE8TRK
 B5p4+4XlCvByoTrovoFUbxJes5jClX4b6X/c2wxh9sMGfYx6d6uu1WzHWr/IKDwocmRy
 BN1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/YGBVG+aK7CtGpDssAZ1wrPKbP+KS58QrCIyRrxrR+SXTYkR7+ypgsI2irW9/krk/h9elXfY81rmeV+CMZEcKHRuv0i4puImSZI5kvQ==
X-Gm-Message-State: AOJu0YwdogTrg2yjAwswzeVgFvb6CLdp/Tt/fHbgZPlk79E6GyXxCgMi
 H0HdumC/Mz3w5S5R9bikxL61Ro4hTo/LW0iytN9RUkn4PqFdxrlah8bvn5w9cDA=
X-Google-Smtp-Source: AGHT+IGLrcrZDaWk6pfDosOul/t/KBqIO2jt9kIWRmffUF1VJ4nmfE1a3L0RBgRcNwyxpKBRaxNgSA==
X-Received: by 2002:a2e:8681:0:b0:2ec:18bc:c455 with SMTP id
 38308e7fff4ca-2ec18bcc6a3mr19931571fa.10.1718386349908; 
 Fri, 14 Jun 2024 10:32:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05d08470sm5669821fa.60.2024.06.14.10.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 10:32:29 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:32:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, 
 Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, 
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v6 2/8] drm: Support per-plane async flip configuration
Message-ID: <ycgax5ulfcdho2ocrqhzwuvrtwjkwuzi4ghnutl72e5ye3wkxf@ajirwgg7ozwp>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
 <20240614153535.351689-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614153535.351689-3-andrealmeid@igalia.com>
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

On Fri, Jun 14, 2024 at 12:35:29PM GMT, Andr� Almeida wrote:
> Drivers have different capabilities on what plane types they can or
> cannot perform async flips. Create a plane::async_flip field so each
> driver can choose which planes they allow doing async flips.
> 
> Signed-off-by: Andr� Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
>  include/drm/drm_plane.h           | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 2e1d9391febe..ed1af3455477 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1079,9 +1079,9 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  			break;
>  		}
>  
> -		if (async_flip && plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +		if (async_flip && !plane->async_flip) {

So, after this patch async flips becomes disabled until the driver
enables that manually. Whether that's desired or not is a separate
topic, but this definitely should be explicitly mentioned in the commit
message.

>  			drm_dbg_atomic(prop->dev,
> -				       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
> +				       "[PLANE:%d] does not support async flips\n",
>  				       obj->id);
>  			ret = -EINVAL;
>  			break;
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 9507542121fa..0bebc72af5c3 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -786,6 +786,11 @@ struct drm_plane {
>  	 * @kmsg_panic: Used to register a panic notifier for this plane
>  	 */
>  	struct kmsg_dumper kmsg_panic;
> +
> +	/**
> +	 * @async_flip: indicates if a plane can do async flips
> +	 */
> +	bool async_flip;
>  };
>  
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
