Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C847929D033
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Oct 2020 15:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569886E52A;
	Wed, 28 Oct 2020 14:10:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B26E52D
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 14:10:37 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id f6so1422093ybr.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hd5/FXdHaMaZQgbcaIh1R7z9tK8mUKgg59yu1uRA2Yg=;
 b=NpXiuRPTVwH545h3okItLlp0plhlQW5uhAcKEwwZvItnnHGa+1T0/LhqluYVl2JUMC
 YDC1SEwDQEBWZ/cqPwJUWrC8uDk1fWzv1MLR8ixD6kvsgoecNxg/fzTLlu1OomL7ixzZ
 WxWA6fq0K8FILe2YUSUzcCtEALlKqKI014eA+kfJqroXngOhmi1R4AWh6bBBO/+oFDq7
 hmQq8ffo9LEGz5Tl+N/AnyGJdYHFKr0ZX6DTioNHnQXyPLO9HwzLg0h7Q8DHkcqIxxmB
 HdhpAr08degvCW6vkaUHaN0Ej6lnR18J43SnbPGDAXS3n8C5IqKL+0BeAPE3VrK+8D9n
 FG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hd5/FXdHaMaZQgbcaIh1R7z9tK8mUKgg59yu1uRA2Yg=;
 b=qXSK2BUALSmnoVi4nX2fcJ2incng2g6uCpldMW3ZNiAMpVVt9byy2T4k8K/bo+vtzQ
 T6p7xfM+SvRAGdbodBBxDMNvVI60gT37Ja63Dv7b0qDyyV6L3rpOcLrER4JE9q0S92hq
 Md32B4sRFVGbsCF/tfxXHQrAf0BAR2VqS+LHOarXqrHYceE7UeCzm1lLiS13WTxhtIQ1
 QOjHLlUY4myZP5sPAx65n7q1YGjnxEsEyW4AXL8Yjb3Q3AvUEPEjlIKlc0s89grhXOLX
 uOYlkb1oLoGIcxdu2zpPaG8t5HoGxP7zXl27mFMwMSonmqdXhqUJX3dU47yxJwx5NkvS
 LWaw==
X-Gm-Message-State: AOAM533gpLYtQStnRRjF6sdeQIhgvnLUR2XiS+62tbeiWiJuG80jWrL7
 9BqYMZcqixlnd9USmbkCgtiVUxXldRtg7O7YtmczZ8KQa2M=
X-Google-Smtp-Source: ABdhPJyPTSjldNmMWe9B7kZucb5dUclXCMck0oAKjEU61BdbuyJiJaxy/MxXxEmDFhqTfWcl/ApN9+Y0AmsfJatse+s=
X-Received: by 2002:a25:2389:: with SMTP id j131mr9791578ybj.25.1603894236800; 
 Wed, 28 Oct 2020 07:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201027024025.32269-1-evan.quan@amd.com>
 <CAGPDPzDniqOW7YyRQht0Fx7uqReQk3zm89rwsZJEhjtrt4WN_Q@mail.gmail.com>
 <CAGPDPzB69-phK2hPYSv_qZLO-gB1ikMrAZRDYE85pO0rFAXSFw@mail.gmail.com>
 <CAGPDPzBbEspwRvgnzKt+siPDZqGMFH0Zunc3GXVPUzSb3U0hww@mail.gmail.com>
 <DM6PR12MB2619444751837A8BAAC3B2D2E4170@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619444751837A8BAAC3B2D2E4170@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Sandeep <sandy.8925@gmail.com>
Date: Wed, 28 Oct 2020 19:40:26 +0530
Message-ID: <CAGPDPzAPxw0kxXq-i0Gsg87NMhMuOhWSst9z5rfx+JrJqGtUzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/pm: enable baco reset for Hawaii
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, 28 Oct 2020 at 07:01, Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Sandeep,
>
> Did you run the tests on Hawaii?
> And can you help to confirm which method is used for gpu reset? "BACO reset" or " PCI CONFIG reset" (you can grep these keywords in dmesg)?
>
> BR
> Evan

Yes, I ran the tests on Hawaii. The reset method isn't printed out in
dmesg. Is it only printed out during hibernate? When I run the kernel
with the above patch, the computer hangs when I attempt to hibernate,
and kernel logs don't get written to disk, so I'm unable to  figure
out which method it's using with your patches.

However, I did look at the reset method for earlier kernels, and I
believe it's using the PCI config reset method. I will try your other
patchset to see if it fixes the issue.

- Sandeep
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
