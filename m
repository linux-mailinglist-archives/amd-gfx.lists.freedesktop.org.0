Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA7268434
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Sep 2020 07:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692CD89AC2;
	Mon, 14 Sep 2020 05:46:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E7489AC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 05:46:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k15so17201938wrn.10
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Sep 2020 22:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nJ1CDBfqrFU9hv1lKXABmfQfLHNDJ5sMGWgZOv7MGu8=;
 b=dF4YOI3st+njKZy/5fzTzN6R5zxiirzFLHEwdDebQhMBpl0dsYFLdRMsM3Kpo9RSSs
 ik4SrN6CytdghM0rKFcxTVuO6WEzOIM94xtlO2goEvOS8lHEiGvVliSZuHhscYA7ASy+
 x2+SKBfmwv3NVVdWXhQrg7dJtNzHj5a8ytzT520mt33yKoXUe+Z8lAShiUDBZniKZnUx
 qHzqcU9Qf4IReEc8upETCyD2IgAFfkojPkSP6J4d+fgKsrYrwAovJkp+3IuEXNC5Z9Kf
 YZPUva5pxjaDaZZPuq0HXn5oGsGB+gpEljmj/8cn31z4vh8Rq1ih0tmV6XaXriyS0TO4
 SJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nJ1CDBfqrFU9hv1lKXABmfQfLHNDJ5sMGWgZOv7MGu8=;
 b=oVDgH01Ckh0FkhCXpyU0CvsBEblBiSSXommtRgssKsMBu6HKBFnFs0ivCpQAzhTIsW
 BBGMsLE+TiBuwOLBo4vzQ8x44K2ivqRRbH/0mfL9nHIBbSJ/qKg7zC2kfXfCHgIH28O4
 KR+S3UIi3+sWl1h4XX3QPz4dVKlQIidk3B4wwO90AxlEoNydPDk3s6OmlLq3zHyo/AIE
 5zEutRtgzviTUaZA3mKS0Rz+av2MHWWRSPt1qVcauFql6ihqSU4SsnKMLc4Bt/IVCUJF
 HNphyxKZaOJHjZ8f8kQYzzrGhB0CWCD8R5UMf5cTNvYOut7L7GzroeLlZkR7Z8lDRpzl
 Fm6A==
X-Gm-Message-State: AOAM531W4AEaEh813aFQsMdzGuWpEzpjSv+a++h6hQ5bZN6zHGmn5pgB
 v+/MkWwBGsqyxDHzRnEDT4u6xtxtKKxcUMvLJBQ=
X-Google-Smtp-Source: ABdhPJymh8Y1Rp0YuAC9g+MdMRdPD+sK/7NgKyFOFw54bziH9E+xJd5kOHRBcsPWBgsWbGzHLjXJnmWGi8GAP2hsV8U=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr14479062wru.374.1600062376303; 
 Sun, 13 Sep 2020 22:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
In-Reply-To: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2020 01:46:05 -0400
Message-ID: <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
Subject: Re: Power-saving/performance toggles for amdgpu
To: Bastien Nocera <hadess@hadess.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Sep 7, 2020 at 10:30 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> Hey,
>
> I'm currently working on a daemon that allows a UI that will eventually
> look like the power mode section in this mockup:
> https://gitlab.gnome.org/Teams/Design/settings-mockups/-/blob/master/power/power.png
>
> The daemon:
> https://gitlab.freedesktop.org/hadess/power-profiles-daemon
> The UI:
> https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/816
>
> It might be interesting, on some systems, to nudge the GPU drivers
> in the direction wanted by the user, either enabling aggressive power-
> saving or allowing more power to be used for better temporary
> performance.
>
> I was wondering whether the tweaks
> in /sys/class/drm/card*/device/power_profile
> and /sys/class/drm/card*/device/power_method were things that this
> daemon could and should tweak, or whether it was present solely for
> debug purposes and shouldn't be needed even when high performance or
> power-saving is wanted:
> https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/issues/3
>
> Thanks in advance!
>

On older radeons (e.g., pre-GCN hardware), there were separate power
states for battery and AC, but these asics are supported by the radeon
kernel driver.  None of the hardware supported by amdgpu exposes
anything like that anymore.  The rest is mainly for profiling and
debugging.  For more information see the relevant kernel
documentation:
https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#gpu-power-thermal-controls-and-monitoring
I don't think there is anything you'd want to tweak there.

Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
