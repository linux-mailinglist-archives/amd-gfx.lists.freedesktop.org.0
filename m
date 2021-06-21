Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD023AE9C1
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 15:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369096E02D;
	Mon, 21 Jun 2021 13:09:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 540 seconds by postgrey-1.36 at gabe;
 Mon, 21 Jun 2021 08:22:07 UTC
Received: from rhlx01.hs-esslingen.de (rhlx01.hs-esslingen.de
 [IPv6:2001:7c0:700::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD3489C93;
 Mon, 21 Jun 2021 08:22:07 +0000 (UTC)
Received: by rhlx01.hs-esslingen.de (Postfix, from userid 1203)
 id 1F6A42A01847; Mon, 21 Jun 2021 10:13:05 +0200 (CEST)
Date: Mon, 21 Jun 2021 10:13:05 +0200
From: Adrian Reber <adrian@lisas.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [RFC] CRIU support for ROCm
Message-ID: <YNBKEWlbCVFJHnsG@lisas.de>
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
 <YI2J97Rg4+1+KVNs@lisas.de>
 <e6a70c3c-c710-5566-4152-876324ddeb73@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6a70c3c-c710-5566-4152-876324ddeb73@amd.com>
X-Url: <http://lisas.de/~adrian/>
X-Operating-System: Linux (5.10.10-200.fc33.x86_64)
X-Load-Average: 5.25 6.63 7.53
X-Unexpected: The Spanish Inquisition
X-GnuPG-Key: gpg --recv-keys D3C4906A
X-Mailman-Approved-At: Mon, 21 Jun 2021 13:09:01 +0000
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Pavel Tikhomirov <snorcht@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>, criu@openvz.org, "Yat Sin,
 David" <David.YatSin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 05:48:33PM -0400, Felix Kuehling wrote:
> Am 2021-05-01 um 1:03 p.m. schrieb Adrian Reber:
> >
> > It would also be good to have your patchset submitted as a PR on github
> > to have our normal CI test coverage of the changes.
> 
> Hi Adrian,
> 
> We moved our work to a new github repository that is a fork of
> checkpoint-restore/criu so that we could send a pull request:
> https://github.com/checkpoint-restore/criu/pull/1519. This is still an
> RFC. It has some updates that Rajneesh explained in the pull request.
> Two big things still missing that we are working on now are:
> 
>   * New ioctl API to make it maintainable and extensible for the future
>   * Using DMA engines for saving/restoring VRAM contents
> 
> We should have another update with those two things in about two weeks.
> 
> We'd really appreciate feedback on the changes we had to make to core
> CRIU, and the build system changes for the new plugin directory.

See my comments on the pull request on github.

		Adrian
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
