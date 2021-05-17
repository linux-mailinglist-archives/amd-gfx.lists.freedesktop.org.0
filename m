Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A9382C92
	for <lists+amd-gfx@lfdr.de>; Mon, 17 May 2021 14:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6686E94D;
	Mon, 17 May 2021 12:50:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686F96E8F8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 May 2021 08:45:08 +0000 (UTC)
Received: from zn.tnic (p200300ec2f061b00f416f01ed532e4bf.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:1b00:f416:f01e:d532:e4bf])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C8D211EC0345;
 Mon, 17 May 2021 10:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1621241105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=XT1VDWp+32xfBKa+NxSvVUNJdTSwHiQt0pKtZlWF3Fo=;
 b=d86DH9BA1D5hKYz4TGaXAEu9X9otE1AwGMoowBVFIjgaMq00StL+jcMx4/qnidJVV9KNhT
 R0EiPEh1KkqP1ywZ2e3+g4Y4EEh3z730jfT54rJHWvIaWWRrBVuzD6JNUVSbhoej9Sz+tQ
 PdQc2GDY5dxZIN9sqwkO5b6g0N7ypgs=
Date: Mon, 17 May 2021 10:44:59 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [5.13-rc1][bug] often hangs for no reason
Message-ID: <YKItC18evdS7efii@zn.tnic>
References: <CABXGCsMA4grweMDnN7_4jepk0w8hBbynMFfHUJv-PrM9STyZUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABXGCsMA4grweMDnN7_4jepk0w8hBbynMFfHUJv-PrM9STyZUw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 17 May 2021 12:50:53 +0000
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
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 03:27:23AM +0500, Mikhail Gavrilov wrote:
> Hi folks.
> 5.13-rc1 after 5.13-rc0 is a disaster because it hangs and hangs again
> after reboot.
> All hang's have in common is that they all happens in
> smp_call_function_many_cond function (I compared all trace [1], [2],
> [3], [4], [5])
> I do not know if this is a known problem or not, so I'm reporting here.

Looks like some splat, lockdep probably, in amdgpu when it gets loaded.
Maybe locking's botched although the beginning of the splats is missing
for whatever reason...

Adding them to Cc in case they have a better idea.

> Full logs here:
> [1] https://pastebin.com/u7SkKGDT
> [2] https://pastebin.com/fNae4dSL
> [3] https://pastebin.com/jEDMjQDy
> [4] https://pastebin.com/vEMhWGgE
> [5] https://pastebin.com/fvWx5ctR
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
