Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928555ED14
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Jun 2022 20:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB77E11337A;
	Tue, 28 Jun 2022 18:54:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1AA11337A
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jun 2022 18:54:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85F7A61B2A;
 Tue, 28 Jun 2022 18:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1812C3411D;
 Tue, 28 Jun 2022 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656442478;
 bh=u8hEW7vux9iWZsA17pwpC0Xoyc2INnxaQpwJS9+5oLU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=aut/A4GTMw3jzzC61HvV4Pxub63Yl3zq1QD/P6hCp9Odn+bJBnqwbhJc1wO812UBG
 9GN86SmtgztNokhvz+GV7j4zHrYA97eQVl+zEa7MuNNK9DQNv3x8ztCFnW7laCPHY0
 Mj0gx40mMyh/ymF9hpdAoINHsMpzBsBNiEAHQHvlsxiEZViaFDrAhN8Ec58WZ8wnQh
 b9qEVAXZhD3+zLdQU5zMmtZs9AyAQRwCiononG+SwYvjpwQZwRT3SN7vBE/tEcGStS
 JSG4tuHyhF/MOJSS+ItO9iWfSLBJlPTM6G3R/LaKMcEmx+d+6B0BTxDmuW/LD4DBMu
 RZyiNpwXXEmYQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id BC78C5C0458; Tue, 28 Jun 2022 11:54:37 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:54:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
References: <1656357116.rhe0mufk6a.none.ref@localhost>
 <1656357116.rhe0mufk6a.none@localhost>
 <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656421946.ic03168yc3.none@localhost>
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
Cc: wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Todd Kjos <tkjos@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, rcu@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, urezki@gmail.com,
 Christian Brauner <christian@brauner.io>,
 Joel Fernandes <joel@joelfernandes.org>, Theodore Ts'o <tytso@mit.edu>,
 Martijn Coenen <maco@android.com>, Suren Baghdasaryan <surenb@google.com>,
 uladzislau.rezki@sony.com, alexander.deucher@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 11:02:40AM -0400, Alex Xu (Hello71) wrote:
> Excerpts from Paul E. McKenney's message of June 28, 2022 12:12 am:
> > On Mon, Jun 27, 2022 at 09:50:53PM -0400, Alex Xu (Hello71) wrote:
> >> Ah, I see. I have selected the default value for 
> >> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT, but that is 20 if ANDROID. I am not 
> >> using Android; I'm not sure there exist Android devices with AMD GPUs. 
> >> However, I have set CONFIG_ANDROID=y in order to use 
> >> ANDROID_BINDER_IPC=m for emulation.
> >> 
> >> In general, I think CONFIG_ANDROID is not a reliable method for 
> >> detecting if the kernel is for an Android device; for example, Fedora 
> >> sets CONFIG_ANDROID, but (AFAIK) its kernel is not intended for use with 
> >> Android userspace.
> >> 
> >> On the other hand, it's not clear to me why the value 20 should be for 
> >> Android only anyways. If, as you say in 
> >> https://lore.kernel.org/lkml/20220216195508.GM4285@paulmck-ThinkPad-P17-Gen-1/,
> >> it is related to the size of the system, perhaps some other heuristic 
> >> would be more appropriate.
> > 
> > It is related to the fact that quite a few Android guys want these
> > 20-millisecond short-timeout expedited RCU CPU stall warnings, but no one
> > else does.  Not yet anyway.
> > 
> > And let's face it, the intent and purpose of CONFIG_ANDROID=y is extremely
> > straightforward and unmistakeable.  So perhaps people not running Android
> > devices but wanting a little bit of the Android functionality should do
> > something other than setting CONFIG_ANDROID=y in their .config files.  Me,
> > I am surprised that it took this long for something like this to bite you.
> > 
> > But just out of curiosity, what would you suggest instead?
> 
> Both Debian and Fedora set CONFIG_ANDROID, specifically for binder. If 
> major distro vendors are consistently making this "mistake", then 
> perhaps the problem is elsewhere.
> 
> In my own opinion, assuming that binderfs means Android vendor is not a 
> good assumption. The ANDROID help says:
> 
> > Enable support for various drivers needed on the Android platform
> 
> It doesn't say "Enable only if building an Android device", or "Enable 
> only if you are Google". Isn't the traditional Linux philosophy a 
> collection of pieces to be assembled, without gratuitous hidden 
> dependencies? For example, [0] removes the unnecessary Android 
> dependency, it doesn't block the whole thing with "depends on ANDROID".
> 
> It seems to me that the proper way to set some configuration for Android 
> kernels is or should be to ask the Android kernel config maintainers, 
> not to set it based on an upstream kernel option. There is, after all, 
> no CONFIG_FEDORA or CONFIG_UBUNTU or CONFIG_HANNAH_MONTANA.
> 
> WireGuard and random also use CONFIG_ANDROID in a similar "proxy" way as 
> rcu, there to see if suspends are "frequent". This seems dubious for the 
> same reasons.
> 
> I wonder if it might be time to retire CONFIG_ANDROID: the only 
> remaining driver covered is binder, which originates from Android but 
> is no longer used exclusively on Android systems. Like ufs-qcom, binder 
> is no longer used exclusively on Android devices; it is also used for 
> Android device emulators, which might be used on Android-like mobile 
> devices, or might not.
> 
> My understanding is that both Android and upstream kernel developers 
> intend to add no more Android-specific drivers, so binder should be the 
> only one covered for the foreseeable future.

Thank you for the perspective, but you never did suggest an alternative.

So here is is what I suggest given the current setup:

config RCU_EXP_CPU_STALL_TIMEOUT
	int "Expedited RCU CPU stall timeout in milliseconds"
	depends on RCU_STALL_COMMON
	range 0 21000
	default 20 if ANDROID
	default 0 if !ANDROID
	help
	  If a given expedited RCU grace period extends more than the
	  specified number of milliseconds, a CPU stall warning is printed.
	  If the RCU grace period persists, additional CPU stall warnings
	  are printed at more widely spaced intervals.  A value of zero
	  says to use the RCU_CPU_STALL_TIMEOUT value converted from
	  seconds to milliseconds.

The default, and only the default, is controlled by ANDROID.

All you need to do to get the previous behavior is to add something like
this to your defconfig file:

CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000

Any reason why this will not work for you?

> > For that matter, why the private reply?
> 
> Mail client issues, not intentional. Lists re-added, plus Android, 
> WireGuard, and random.

Thank you!

							Thanx, Paul

> Thanks,
> Alex.
> 
> [0] https://lore.kernel.org/all/20220321151853.24138-1-krzk@kernel.org/
