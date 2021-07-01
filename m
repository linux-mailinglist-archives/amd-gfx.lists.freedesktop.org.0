Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC43B8D31
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Jul 2021 06:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91896E9C3;
	Thu,  1 Jul 2021 04:40:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F046E9C3
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Jul 2021 04:40:08 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x22-20020a9d6d960000b0290474a76f8bd4so3641935otp.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Jun 2021 21:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I26Qit5rCX3hiqBxXo0cdspPhc5KLoexOO+hBGI7SGI=;
 b=A7iFAVMxeO6vPM3G3kzmENqhY3ie4AkIar9B9NijueF4phTKsmttINJ1bNnoFQ6Gc7
 fFhx3aNm3HwE7a9Br4S8DkCB6cagNTqZFGgdsDTBSlbL/2AAzeworsCbYWpqZE68iVzJ
 9wkk58EIXuEXfiuaGQTezni2/IfgpTp/PswF1n2VBi888/Ynq1T7oK9bvd1/hgtwTfF+
 v6FnISZuBwtYAi8eaICHDBlGenVz8V/fi9T71QcrM1i+xCCHRgWxJsDnkG/jttglVF2E
 50b5yUXYa0zled/qoLLAJSe80ZIlkqQO+rqEwloFEutFuUCCKS/XX3+WNKBD2VxtU4ij
 eN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I26Qit5rCX3hiqBxXo0cdspPhc5KLoexOO+hBGI7SGI=;
 b=fmtt0gMIFeI98KVpRzx6MaN+1Ytuzr+YqwYmb1pWfkUX8vvxDyS4aI4CpYvqaNjrdL
 OxK2pYH7g76kno1F2zbD4XYWLScQvIp6oFpQIY/lip06S98vzl4s+xpPvvHzck6qh6pY
 CpHgF6vq/DBIeE4urapDMwWJFZMBHc5KBlNkSHkOMsXYVBCQgBVW8disgQZzrfQXygVu
 s97pkZENZxJM3lYhM7q8Sj7ngi/oUiEhO9b/Vg3VOvXpW0i/OD5FIzimIixpR1fOGUq4
 nCuolXkh7CeFuWTIt1QN8IYTvz/sbbwXZv+3+ij52Is6CZS7zT4+Z6jOmzSsDm1DsOCg
 AxIA==
X-Gm-Message-State: AOAM532M9LkvUcTPJHaswT+Tv4yXXg5LFL/xmE2qQlr3rXPv+i72el+O
 TWewNKViTWIjTCx/bEpkUJPrrXWEkUpNigVqi80=
X-Google-Smtp-Source: ABdhPJxFeFX0KLqBUxMC/p4thSEpDDFePki51tkg+S4OuPY0JRFF9jS2+J3cStIm2RrTemek9lO2JiwHY5qVbKWbU/o=
X-Received: by 2002:a05:6830:4119:: with SMTP id
 w25mr12502209ott.132.1625114407420; 
 Wed, 30 Jun 2021 21:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3xKZ09=gOH21Epsu6kWqRbU0ftbuyuixZ0A+rN1X4GJVRQ7Q@mail.gmail.com>
In-Reply-To: <CAB3xKZ09=gOH21Epsu6kWqRbU0ftbuyuixZ0A+rN1X4GJVRQ7Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Jul 2021 00:39:56 -0400
Message-ID: <CADnq5_N=XD6iWaPRjF7VpsKDpo09pVw=Vog=8jc37G6yXFx4wg@mail.gmail.com>
Subject: Re: AMDGPU error: "[drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
 *ERROR* Waiting for fences timed out!"
To: Ketsui <esgwpl@gmail.com>
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

On Wed, Jun 30, 2021 at 8:35 AM Ketsui <esgwpl@gmail.com> wrote:
>
> >I could be wrong. I can't remember what marketing names map to what
> >asics. I can tell if you can get your dmesg output.
> Here it is.

Thanks.  It is a picasso system.

Alex

> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
