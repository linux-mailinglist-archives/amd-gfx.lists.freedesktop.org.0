Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DB56937B
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Jul 2022 22:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDAD10EE3D;
	Wed,  6 Jul 2022 20:42:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB51510EE3D
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Jul 2022 20:42:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 433D1620E7;
 Wed,  6 Jul 2022 20:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEDFC3411C;
 Wed,  6 Jul 2022 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657140122;
 bh=pe7a6K472B35Fk1ZLJZNNAu/QA2Cq/X9L9IX5KemqnU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=qurE6YFdbVvNvVoeXgoZcqxGE70mjJwBH7VgzxFINrciQcq8BLjc+FeG4xNN93Pe2
 H/LtYDggW0IcPgC2CZC0Lc8R17IIgPuXjBNeRVG1v5QQ+PYuYc/qyJ8Xbi4v8j/IjM
 iIc+nz4KDPB5AH9D+w8VV4qFYg7gJiQlww9o22b8B6QBTV897KH+gsuhmtqqG4xKfs
 cKe08VA1ykzmn54D2oNKC9IUT5tmylPHbG5InZ/V0KYLGOq0XW+ZLu+0x8apQs0mcg
 GFtEAkNGxEAszeaPzpBKxdcsmP1BgcwFmD1WHvMe1LUuzxgayYXPekA71qM6uFZn40
 sY92334nGM1yQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 369B35C0F78; Wed,  6 Jul 2022 13:42:02 -0700 (PDT)
Date: Wed, 6 Jul 2022 13:42:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <20220706204202.GJ1790663@paulmck-ThinkPad-P17-Gen-1>
References: <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
 <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656443915.mdjoauhqe0.none@localhost> <YrtgeSmwLmpzN/zw@pc638>
 <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
 <YsXK5A0MiVgHd8Je@pc638.lan>
 <20220706175836.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <YsXP7ZwHh/GvWM82@pc638.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsXP7ZwHh/GvWM82@pc638.lan>
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
Reply-To: paulmck@kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xinhui.Pan@amd.com,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>, rcu@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, amd-gfx@lists.freedesktop.org,
 Christian Brauner <christian@brauner.io>,
 Joel Fernandes <joel@joelfernandes.org>, alexander.deucher@amd.com,
 uladzislau.rezki@sony.com, Suren Baghdasaryan <surenb@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 wireguard@lists.zx2c4.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 08:09:49PM +0200, Uladzislau Rezki wrote:
> On Wed, Jul 06, 2022 at 10:58:36AM -0700, Paul E. McKenney wrote:
> > On Wed, Jul 06, 2022 at 07:48:20PM +0200, Uladzislau Rezki wrote:
> > > Hello.
> > > 
> > > On Mon, Jul 04, 2022 at 01:30:50PM +0200, Christian K�nig wrote:
> > > > Hi guys,
> > > > 
> > > > Am 28.06.22 um 22:11 schrieb Uladzislau Rezki:
> > > > > > Excerpts from Paul E. McKenney's message of June 28, 2022 2:54 pm:
> > > > > > > All you need to do to get the previous behavior is to add something like
> > > > > > > this to your defconfig file:
> > > > > > > 
> > > > > > > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
> > > > > > > 
> > > > > > > Any reason why this will not work for you?
> > > > 
> > > > sorry for jumping in so later, I was on vacation for a week.
> > > > 
> > > > Well when any RCU period is longer than 20ms and amdgpu in the backtrace my
> > > > educated guess is that we messed up some timeout waiting for the hw.
> > > > 
> > > > We usually do wait a few us, but it can be that somebody is waiting for ms
> > > > instead.
> > > > 
> > > > So there are some todos here as far as I can see and It would be helpful to
> > > > get a cleaner backtrace if possible.
> > > > 
> > > Actually CONFIG_ANDROID looks like is going to be removed, so the CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
> > > will not have any dependencies on the CONFIG_ANDROID anymore:
> > > 
> > > https://lkml.org/lkml/2022/6/29/756
> > 
> > But you can set the RCU_EXP_CPU_STALL_TIMEOUT Kconfig option, if you
> > wish.  Setting this option to 20 will get you the behavior previously
> > obtained by setting the now-defunct ANDROID Kconfig option.
> > 
> Right. Or over boot parameter. So for us it is not a big issue :)

Specifically rcupdate.rcu_exp_cpu_stall_timeout, for those just now
tuning in.  ;-)

							Thanx, Paul
