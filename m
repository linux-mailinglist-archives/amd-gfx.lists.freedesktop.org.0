Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4927931E
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 23:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115D6ED58;
	Fri, 25 Sep 2020 21:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C8F6ED58
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 21:18:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c18so5332974wrm.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBj0wekxF1nf6zeYJf9lJIqnWaBS/Sfh98W2SeWrWl4=;
 b=aM/PXE7cCBJqsUn2mJ3l/zKp2qGoCq5SJKoL0RekSXQJTvEoNS9O0Rt9TPwNH7Kfs9
 6THYuUXD/4PtarEY2RCjF9KGTeZ8F0mO4Um5ehmB9DesFbgzb+u/n4/4NVKRdWSiKlXx
 qgavGnM8LSaib89Bm7EeqcZt8jz1xjc1hhMNtTn5ubikpmhwdWNe9OgKBhqhpNwxKzBF
 h6Ytw/6hTXUixj+ddPri1XgNhdADiacmotA/1G/a4NDA/AsSgYgdmg/sHqq9WFRPH4Cy
 oK4/unPoRBMcfgrJ+jwJlC+aLMP+D8bIK7JMEPWxYs0B6V31UbAJtiCPk+ior6/lwD5v
 cUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBj0wekxF1nf6zeYJf9lJIqnWaBS/Sfh98W2SeWrWl4=;
 b=izAKcrYS0ZqpUYZSyldnxTGrHPNJzAVWk1/e371H8xYyX0xuIkYUcXwudLli2PApYr
 Ml2UGG9w0iBINEaT4bKpuELQbyi5GT+ZPqKn2ESR/sEjqTx4b/R7g6xHG5x70aieyu/O
 4zwDRhE8vg+DgtwnLolCw+F+TYGqXjes0WcCSfuW3oifYV75gFmj5l+IUdMVaiMz7bmo
 vq5bu7Hc636ls8VHe8Olw2OHfD7EI+om1V+9BUy4niN4YbSzOsZHMve7pvSxH/RYp+Qp
 63VTYM6ncm9CTa/01Qqwhh89NYnP8ENMhveE1MPcq9qBn/3YzzviRZp8zbPUdZ6QxKPI
 rcTQ==
X-Gm-Message-State: AOAM532wJcLti7cqRgMqNO2zFams56PRhMSBbgd6Io5aoAYf/6HQfkeH
 XwVBoad2AuflA5rUm/gYtZIPzFeTvTAyxGI+Bn9xpFqY
X-Google-Smtp-Source: ABdhPJxJcvnodG/1lpldAitCD7Gf23KKGu75gL2V4X1vcAOvSrVECqUMA+CmVBTH6KvsGyTkEdi+fX1/lj5uuMnvUcE=
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr6370252wrr.111.1601068696702; 
 Fri, 25 Sep 2020 14:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <7cc7d590-f713-2060-6bac-37bed0df618a@ettle.org.uk>
 <CADnq5_OEzoEP93+MsGN1tspy0OrxVTkujKUhs+6LryVApvERkw@mail.gmail.com>
 <286845a3-4903-c169-aa36-1eb986492ea3@ettle.org.uk>
In-Reply-To: <286845a3-4903-c169-aa36-1eb986492ea3@ettle.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2020 17:18:05 -0400
Message-ID: <CADnq5_O8Wzddr3LryTuQ5Jqc5yt51wqkxv6zbSbr0_RBSQCA4g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Pixel encoding DRM property and module
 parameter
To: James Ettle <james@ettle.org.uk>
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <hwentlan@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 4:51 PM James Ettle <james@ettle.org.uk> wrote:
>
> On 22/09/2020 21:33, Alex Deucher wrote:
> >> +/**
> >> + * DOC: pixel_encoding (string)
> >> + * Specify the initial pixel encoding used by a connector.
> >> + */
> >> +static char amdgpu_pixel_encoding[MAX_INPUT];
> >> +MODULE_PARM_DESC(pixel_encoding, "Override pixel encoding");
> >> +module_param_string(pixel_encoding, amdgpu_pixel_encoding, sizeof(amdgpu_pixel_encoding), 0444);
> >
> > You can drop this part.  We don't need a module parameter if we have a
> > kms property.
> >
> > Alex
>
> OK, but is there then an alternative means of setting the pixel encoding to be used immediately on boot or when amdgpu loads? Also are there user tools other than xrandr to change a KMS property, for Wayland and console users?

You can force some things on the kernel command line, but I don't
recall whether that includes kms properties or not.  As for ways to
change properties, the KMS API provides a way.  those are exposed via
randr when using X.  When using wayland compositors, it depends on the
compositor.

Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
