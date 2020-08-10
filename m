Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89D2402DB
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEA36E3D8;
	Mon, 10 Aug 2020 07:36:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4414F6E083
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 06:43:59 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 435F440A2060;
 Mon, 10 Aug 2020 06:43:57 +0000 (UTC)
Date: Mon, 10 Aug 2020 09:43:57 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Ignat Insarov <kindaro@gmail.com>
Subject: Re: Non-deterministically boot into dark screen with `amdgpu`
In-Reply-To: <CAB-2Q08KQmS0D06k1QEUpccybGqCY+HYaZkF=sY0t1EX8Y_u2Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.20.13.2008100928010.2454@monopod.intra.ispras.ru>
References: <CAB-2Q08KQmS0D06k1QEUpccybGqCY+HYaZkF=sY0t1EX8Y_u2Q@mail.gmail.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="168458499-1805300261-1597041837=:2454"
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:36:09 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168458499-1805300261-1597041837=:2454
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi,

you should Сс a specialized mailing list and a relevant maintainer,
otherwise your email is likely to be ignored as LKML is an incredibly
high-volume list. Adding amd-gfx and Alex Deucher.

More thoughts below.

On Sun, 9 Aug 2020, Ignat Insarov wrote:

> Hello!
> 
> This is an issue report. I am not familiar with the Linux kernel
> development procedure, so please direct me to a more appropriate or
> specialized medium if this is not the right avenue.
> 
> My laptop (Ryzen 7 Pro CPU/GPU) boots into dark screen more often than
> not. Screen blackness correlates with a line in the `systemd` journal
> that says `RAM width Nbits DDR4`, where N is either 128 (resulting in
> dark screen) or 64 (resulting in a healthy boot). The number seems to
> be chosen at random with bias towards 128. This has been going on for
> a while so here is some statistics:
> 
> * 356 boots proceed far enough to  attempt mode setting.
> * 82 boots set RAM width to 64 bits and presumably succeed.
> * 274 boots set RAM width to 128 bits and presumably fail.
> 
> The issue is prevented with the `nomodeset` kernel option.
> 
> I reported this previously (about a year ago) on the forum of my Linux
> distribution.[1] The issue still persists as of  linux 5.8.0.
> 
> The details of my graphics controller, as well as some journal
> excerpts, can be seen at [1]. One thing that has changed since then is
> that on failure, there now appears a null pointer dereference error. I
> am attaching the log of kernel messages from the most recent failed
> boot — please request more information if needed.
> 
> I appreciate any directions and advice as to how I may go about fixing
> this annoyance.
> 
> [1]: https://bbs.archlinux.org/viewtopic.php?id=248273


On the forum you show that in the "success" case there's one less "BIOS
signature incorrect" message. This implies that amdgpu_get_bios() in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
gets the video BIOS from a different source. If that happens every time
(one "signature incorrect" message for "success", two for "failure")
that may be relevant to the problem you're experiencing.

If you don't mind patching and rebuilding the kernel I suggest adding
debug printks to the aforementioned function to see exactly which methods
fail with wrong signature and which succeeds.

Also might be worthwhile to check if there's a BIOS update for your laptop.

Alexander
--168458499-1805300261-1597041837=:2454
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--168458499-1805300261-1597041837=:2454--
