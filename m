Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49E3E2E51
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Aug 2021 18:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6A6E04B;
	Fri,  6 Aug 2021 16:28:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6B36EB91
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Aug 2021 16:20:54 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id ED3AC60005;
 Fri,  6 Aug 2021 16:20:52 +0000 (UTC)
Message-ID: <c49e9e5350e98a78d99cb99f244ba6805847aba2.camel@hadess.net>
Subject: Re: Power-saving/performance toggles for amdgpu
From: Bastien Nocera <hadess@hadess.net>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Date: Fri, 06 Aug 2021 18:20:52 +0200
In-Reply-To: <CADnq5_MQq3BYiJTb6YMVZ3pPzfgLrQYXFncohYdThGrNmJXuKw@mail.gmail.com>
References: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
 <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
 <3524e3fb29d40003e59645a9ee5364ac62d34879.camel@hadess.net>
 <CADnq5_ORyFoNHk0Zng_6Ei6NEm557bpdtR6o5zE=3fpBp3qddw@mail.gmail.com>
 <38ddd7e5b2056d6efbf0267eb74ace4245d09ea8.camel@hadess.net>
 <CADnq5_MQq3BYiJTb6YMVZ3pPzfgLrQYXFncohYdThGrNmJXuKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Aug 2021 16:28:36 +0000
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

On Fri, 2021-08-06 at 11:45 -0400, Alex Deucher wrote:
> You could set one of the profiles which sets more or less aggressive
> clocking, but you still get the advantages of the SMU being able to
> dynamically adjust the clocks.  If you manually force the clock to low
> or high, you end up forcing all clocks, even if a particular engine is
> not in use.  E.g., if you are not using video decode, there is no need
> to force the decoder clocks high as well.  Also, if the userspace tool
> dies for some reason, that will leave the clocks in the forced state.

This looks like the best option for that use case. I've documented it
here:
https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/issues/3#note_1021578

Thanks very much for your help!

