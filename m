Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5A5692B8
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Jul 2022 21:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8F11BE75;
	Wed,  6 Jul 2022 19:41:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8FF113654
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Jul 2022 17:48:25 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l7so18622369ljj.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 06 Jul 2022 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Tdf7ASxlbaDXe3UntpbJmcyMVIZx89GElFlVDq70G1E=;
 b=av5EmNC6KScDiSo3yZRxHh1JjVtGq58I72zcmjOS/GbgnhP9d8NL1M67W6AdDXWLBO
 smYrB5PVGshhhGcB3EOvl0VKQhQYBBZv45doGDeTc8aiualcqa94FJFkRbbZooofaXAR
 bXGL5bjfGNorBvl4Q/qYWvyzPb6qAA2SDjlNyda8uXSK9XxPxrO58pcJ14Td10bg1KFW
 EyHDqu5L8ZKn1kKjOWPdFbdL7k8qhfZbOZPv9OzdKlPYVeO2Q3u7kUhwgFhnQbQx+eVg
 9c74CIJZQE0C/YfHhRoBDFamJEMO/uldYuzvtYJC25qCRRqrPPcME4kMgAOeMfhB8wyR
 ZbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tdf7ASxlbaDXe3UntpbJmcyMVIZx89GElFlVDq70G1E=;
 b=ePgFpSSr6DVG+qBBCra/KjW8ZKWphYwFe1fN8mXIDjeLwocJsmQRMLzYk5GJs1wiF4
 xs7cml/JPV9aQ2tC82zUuIW7dKOkKGLSQJXUMsFoBqtXex7r0cWJ8oDPlREupbWWbnkm
 yqnnJ0uenXgXYkEE9J5ukuTpRfjFXUx8GHdIXRaafoLw/03Ax2ZsSfoieXvJT3Tn6Sea
 98LfLlujz+9rwW3NSNyFK0rr1VM+SBz27V3lOFcs6RMHvYE/HhDDctzpRQsFrQP1Ef0y
 ME4RpSb0n4ZZ2hjUa+hX1hvSUufWlBYEWchOIlSNAUH5NPYY4y22smeoNdyO1CZEEH/5
 UDTA==
X-Gm-Message-State: AJIora+VhHKY+3gOH5L0Hb/Rf3skvOhb3cyeX4HyFHmv7dXH2eP/Viba
 S7UpgmHX0Iz4TfwNxcg36Lg=
X-Google-Smtp-Source: AGRyM1u1HT+sFi2wLf7fp4YNZfwAKQU6WlrA9bLDUjbi9zIEm3uBpG7mqsv2U+35d/fU8R3i17yQvA==
X-Received: by 2002:a2e:9808:0:b0:25a:a30c:e5cb with SMTP id
 a8-20020a2e9808000000b0025aa30ce5cbmr24645544ljj.312.1657129703858; 
 Wed, 06 Jul 2022 10:48:23 -0700 (PDT)
Received: from pc638.lan ([155.137.26.201]) by smtp.gmail.com with ESMTPSA id
 c2-20020ac25f62000000b00478f3fe716asm6387536lfc.200.2022.07.06.10.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 10:48:22 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 6 Jul 2022 19:48:20 +0200
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: CONFIG_ANDROID (was: rcu_sched detected expedited stalls in
 amdgpu after suspend)
Message-ID: <YsXK5A0MiVgHd8Je@pc638.lan>
References: <1656357116.rhe0mufk6a.none.ref@localhost>
 <1656357116.rhe0mufk6a.none@localhost>
 <20220627204139.GL1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656379893.q9yb069erk.none@localhost>
 <20220628041252.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656421946.ic03168yc3.none@localhost>
 <20220628185437.GA1790663@paulmck-ThinkPad-P17-Gen-1>
 <1656443915.mdjoauhqe0.none@localhost> <YrtgeSmwLmpzN/zw@pc638>
 <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79c6ad70-47d9-47fe-4bb4-33fcf356dd37@amd.com>
X-Mailman-Approved-At: Wed, 06 Jul 2022 19:41:20 +0000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 paulmck@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui.Pan@amd.com, Martijn Coenen <maco@android.com>,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 rcu@vger.kernel.org, Hridya Valsaraju <hridya@google.com>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Uladzislau Rezki <urezki@gmail.com>, Todd Kjos <tkjos@android.com>,
 amd-gfx@lists.freedesktop.org, Christian Brauner <christian@brauner.io>,
 Joel Fernandes <joel@joelfernandes.org>, alexander.deucher@amd.com,
 uladzislau.rezki@sony.com, Suren Baghdasaryan <surenb@google.com>,
 wireguard@lists.zx2c4.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello.

On Mon, Jul 04, 2022 at 01:30:50PM +0200, Christian König wrote:
> Hi guys,
> 
> Am 28.06.22 um 22:11 schrieb Uladzislau Rezki:
> > > Excerpts from Paul E. McKenney's message of June 28, 2022 2:54 pm:
> > > > All you need to do to get the previous behavior is to add something like
> > > > this to your defconfig file:
> > > > 
> > > > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=21000
> > > > 
> > > > Any reason why this will not work for you?
> 
> sorry for jumping in so later, I was on vacation for a week.
> 
> Well when any RCU period is longer than 20ms and amdgpu in the backtrace my
> educated guess is that we messed up some timeout waiting for the hw.
> 
> We usually do wait a few us, but it can be that somebody is waiting for ms
> instead.
> 
> So there are some todos here as far as I can see and It would be helpful to
> get a cleaner backtrace if possible.
> 
Actually CONFIG_ANDROID looks like is going to be removed, so the CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
will not have any dependencies on the CONFIG_ANDROID anymore:

https://lkml.org/lkml/2022/6/29/756

--
Uladzislau Rezki

