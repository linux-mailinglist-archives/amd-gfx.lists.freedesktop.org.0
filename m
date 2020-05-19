Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB971D9FF6
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 20:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7976E06E;
	Tue, 19 May 2020 18:48:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC436E06E
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 18:48:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n18so347407wmj.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ew3qGlGNDTNoh8ZE6EnBCUhtDavSfARs8exR8LvgAk=;
 b=RlzpUktlKomNvPc0+Bfcq/wpxY5Dt21axnmSUauEVTDTW3hAhqfhivByw9qv4/83z/
 BrkUNEYaXmYc0cOxVaPGlDC0MwDHoQApw4AJwiPSF0B70uxCkecY12rlBqbJxz7LxUkv
 KhraF/Z4mX8+f9rln9arIfpUv4QGQWKHeLvFaHHr4Rc1Uu4gFzfFwiWOSySV2HMXKtpD
 +QIBTa/tsk55aTYRTpmlBWcb32bsgfuH+ajjt+WbtzVpy8CJZNUrLIOyLFDja/uGXD9b
 AXypCBtpGmQuLGs2Nit05jnTMQJNsthdpmP7B2Vl/U3iq4ABmYn8cc+5nwomCCJmfKvg
 KUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ew3qGlGNDTNoh8ZE6EnBCUhtDavSfARs8exR8LvgAk=;
 b=EC+UK9CK+SV0oDjBMaAikNeIH8d8ZvSLd3pyuox1sEszU5eStY0ev4Kz2sxBDt/029
 +WiYvF6pSoLRQ3aIit35pOEJG8Lej8uhQEBupPsQAMYx/zVNW+Rix4/SbvYWWzYk95jQ
 aer1nByVXMSwV0Ov+wopxtsGuol4qT48S8ihalCyEAEqW+4Y434huEiuKPOwX6saCYFG
 mvY0sqkyh/s6QYysD0IJh+AX1BTEfCc/Zk7tW+U7qdffrctxv+lhj+jYFZIkv7SFCHlb
 sty7zTjrgSST+Wqp2K5xx/lR66tk2FWXkhNkGEJqVOavbPs6D8Ffj13gFTDdkpaP3JgJ
 Qn1w==
X-Gm-Message-State: AOAM533CpnU42S0rZAZ1KBruB9Wp5229orLCppEeg5VwIUfbczIhE/1C
 UJ0VeiAPRkV2k1DvLTuM+7aCu6k9o5IOLYapeSI=
X-Google-Smtp-Source: ABdhPJyHwEkZVWLucfYOf9DAax0LH8ci5gTQKEXzm8Wa+ILhkTuErDSBAVXd1U+ajRF7J1tjWlzLluCP1WigROL6Oa8=
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr833353wme.56.1589914133044;
 Tue, 19 May 2020 11:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAEOHGO=uKYs0YQyG5K2BGd=_83j_m6nfompstAF-znRfus69Hw@mail.gmail.com>
In-Reply-To: <CAEOHGO=uKYs0YQyG5K2BGd=_83j_m6nfompstAF-znRfus69Hw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 May 2020 14:48:42 -0400
Message-ID: <CADnq5_NUhVDhoQEJPQ-Lr=zTR9rWUyvhtCk15=drtDnB+De+zg@mail.gmail.com>
Subject: Re: regarding vcn
To: Javad Karabi <karabijavad@gmail.com>
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

On Tue, May 19, 2020 at 2:45 PM Javad Karabi <karabijavad@gmail.com> wrote:
>
> for a rx 5600 xt graphics card, is VCN supposed to be set to disabled?
>
> if i understand correctly, 5600 is navi10, which has vcn
>
> but i currently see VCN: disabled
>
> $ sudo grep VCN /sys/kernel/debug/dri/1/amdgpu_pm_info
> VCN: Disabled

amdgpu_pm_info shows power information.  When the VCN block is not in
use, the driver disables it to save power.  If you read back the
amdgpu_pm_info while VCN is in use, it will show up as enabled.

Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
