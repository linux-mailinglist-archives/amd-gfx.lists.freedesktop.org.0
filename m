Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C876955C00
	for <lists+amd-gfx@lfdr.de>; Sun, 18 Aug 2024 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E7210E170;
	Sun, 18 Aug 2024 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Px0anN5P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649AC10E16D
 for <amd-gfx@lists.freedesktop.org>; Sun, 18 Aug 2024 08:52:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-530e2287825so3484794e87.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 18 Aug 2024 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723971127; x=1724575927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaXM8tMajoENaQZObqdr4u+7t4wGj6GAMOQWM7gRwcQ=;
 b=Px0anN5PKR7n9NUToObL/CqlTaNj8EDQwcZbIvdm3ctrT6DmDW87OC3J/9ZZaZ363L
 uH3lXoAHWShZqZ7XYQDwzDRwmQ/M2BYyeAlj/bgFsZW9j7ErEKjj4kNmVNcCSRrfHIIx
 gjKuUOJWnHb6wHvs2ageGJySr1UzsQwyQwP/pSEtBxWWM72cy/dGVRw0uTYxHsnc7y/X
 xCKl2ammZ5ej73ZK1SlyW/1dFD8As/ELvWfRlUKdPHvOXsVHVAgLjn+nK1EKchuAVjJK
 fffA9IFDh5dgGIydpG3dXsizg286kgYwZsM1CG+Fn29wpqBngqCjHj1+8gaqWGo2GBn4
 Ho6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723971127; x=1724575927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaXM8tMajoENaQZObqdr4u+7t4wGj6GAMOQWM7gRwcQ=;
 b=VkREzGo1nuLGAc2HcUrgC7ThbsI+A7GbU1iFdC6g5yqrabJTG7c0sgSNtDxhnnOrpk
 pCVh5Os1gwLMQdnlMc9+wh8EE0eI6w9qd+lOXn61xcUK3WQlY3ByWHqVsd08R1h13NVy
 NGqk6Os6y+codoTft64t0X0o8jWhzYd1Zwxll6uHJyHwAPbOaFf6+Omhu3TOG9cDW3Z8
 T7sgnHMMDws1wTUj+/5FeE1pyWCpaspCH4O4Dp4V+GaWHGdZZyCbpG7L6M3itsIR2ANI
 A89BQSL9aOPOjm2m3ymExIw9QsSIvEv3LxxFKib21bKpBFHVIUtrXe30CwJ3dLfdUDIF
 9XXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2OUQNvNBgkEbfYYRQwbdFkP4rqzQccBdRLzx8mparXAlOHzwHSugQMxdO67VLuQmohbpN1lZE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfgyt+3OIkYYNlK7V2LlHBVy/V/pfBd8uvsDLIN6NHdWJEnTmE
 UZcKyTe/bpo32M2JXV8RdcEeaze/mZSSlfAZLknix+8T5b37O4jTsHbC2w/BNkPchflvJ84Mvku
 y/UvKgPdZ6SEE5+i7/cB62qoF5FjpDDJQPIE/Gg==
X-Google-Smtp-Source: AGHT+IFJBYUL4v23WKAddpRvtFX0zdPnk+dC7WJ66AsuREM0rgiVjFfkgvfqTjZKnZNVPt7mnctS4eUYkkKWTbTHLuc=
X-Received: by 2002:a05:6512:a8d:b0:52e:fa5f:b6b1 with SMTP id
 2adb3069b0e04-5331c6f46c2mr4360089e87.60.1723971126975; Sun, 18 Aug 2024
 01:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-26-tzimmermann@suse.de>
In-Reply-To: <20240816125408.310253-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 18 Aug 2024 10:51:56 +0200
Message-ID: <CACRpkdYBoz8s6_So00Y8=203Sf+wyQCvF89KXFTdgD7HuYeeyA@mail.gmail.com>
Subject: Re: [PATCH 25/86] drm/mcde: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 16, 2024 at 2:54=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The mcde driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
