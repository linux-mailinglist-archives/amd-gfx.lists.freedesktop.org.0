Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BE53BAA0
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Jun 2022 16:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E79A112A3A;
	Thu,  2 Jun 2022 14:23:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951D112DF7
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jun 2022 14:22:56 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3DD9A1FB0B;
 Thu,  2 Jun 2022 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654179775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvN2PshnIH1exR1KbRpjusqsf1VXZ+aaDCmblhMpJAc=;
 b=bu/T8kaUxQ5PH3E1vCbXmRxQmGm8ZKjbOZMjQdHrmmFSjxIG9njx4tpwoVocJuJHumbJg/
 Sa2D9+X6k4NTVahYiWbaTojnRBdLqOYITnuq5WOs2xWkonX7Z5uWAaEk6sRwTybIotS/A8
 jRjO615pLsf6tCZR3wm/7CfBuHZiC24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654179775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvN2PshnIH1exR1KbRpjusqsf1VXZ+aaDCmblhMpJAc=;
 b=ehljsyKxXUl7jspzGcAhzTOwacu0xBDxqroa1Q3+XSDJbNTvsNQ5ZMhWYcV0q9DYIa4i8v
 1Ul4B+DhUdPkXsDw==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 31A612C141;
 Thu,  2 Jun 2022 14:22:55 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
 id 0AAA5602C2; Thu,  2 Jun 2022 16:22:54 +0200 (CEST)
Date: Thu, 2 Jun 2022 16:22:54 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: (REGRESSION bisected) Re: amdgpu errors (VM fault / GPU fault
 detected) with 5.19 merge window snapshots
Message-ID: <20220602142254.2ck7dw7u3xlzdnt2@lion.mk-sys.cz>
References: <20220527090039.pdrazo5e6mwgo3d3@lion.mk-sys.cz>
 <20220527124459.mfo4tjdsjohamsvy@lion.mk-sys.cz>
 <CADnq5_Pr-FKfhuXT9DR2rYD=dMfD=+Dfev+CO-xeaPGnhwSQaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="htbgsjem3lhh7ns3"
Content-Disposition: inline
In-Reply-To: <CADnq5_Pr-FKfhuXT9DR2rYD=dMfD=+Dfev+CO-xeaPGnhwSQaA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 02 Jun 2022 14:23:37 +0000
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--htbgsjem3lhh7ns3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 09:58:22AM -0400, Alex Deucher wrote:
> On Fri, May 27, 2022 at 8:58 AM Michal Kubecek <mkubecek@suse.cz> wrote:
> > On Fri, May 27, 2022 at 11:00:39AM +0200, Michal Kubecek wrote:
> > > Hello,
> > >
> > > while testing 5.19 merge window snapshots (commits babf0bb978e3 and
> > > 7e284070abe5), I keep getting errors like below. I have not seen them
> > > with 5.18 final or older.
> > >
> > > ---------------------------------------------------------------------=
---
> > > [  247.150333] gmc_v8_0_process_interrupt: 46 callbacks suppressed
> > > [  247.150336] amdgpu 0000:0c:00.0: amdgpu: GPU fault detected: 147 0=
x00020802 for process firefox pid 6101 thread firefox:cs0 pid 6116
> > > [  247.150339] amdgpu 0000:0c:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_=
FAULT_ADDR   0x00107800
> > > [  247.150340] amdgpu 0000:0c:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_=
FAULT_STATUS 0x0D008002
> > > [  247.150341] amdgpu 0000:0c:00.0: amdgpu: VM fault (0x02, vmid 6, p=
asid 32780) at page 1079296, write from 'TC2' (0x54433200) (8)
> > [...]
> > > [  249.925909] amdgpu 0000:0c:00.0: amdgpu: IH ring buffer overflow (=
0x000844C0, 0x00004A00, 0x000044D0)
> > > [  250.434986] [drm] Fence fallback timer expired on ring sdma0
> > > [  466.621568] gmc_v8_0_process_interrupt: 122 callbacks suppressed
> > [...]
> > > ---------------------------------------------------------------------=
---
> > >
> > > There does not seem to be any apparent immediate problem with graphics
> > > but when running commit babf0bb978e3, there seemed to be a noticeable
> > > lag in some operations, e.g. when moving a window or repainting large
> > > part of the terminal window in konsole (no idea if it's related).
> > >
> > > My GPU is Radeon Pro WX 2100 (1002:6995). What other information shou=
ld
> > > I collect to help debugging the issue?
> >
> > Bisected to commit 5255e146c99a ("drm/amdgpu: rework TLB flushing").
> > There seem to be later commits depending on it so I did not test
> > a revert on top of current mainline.
> >
> > I should also mention that most commits tested as "bad" during the
> > bisect did behave much worse than current mainline (errors starting as
> > early as with sddm, visibly damaged screen content, sometimes even
> > crashes). But all of them issued messages similar to those above into
> > kernel log.
>=20
> Can you verify that the kernel you tested has this patch:
> https://cgit.freedesktop.org/drm/drm/commit/?id=3D5be323562c6a699d38430bc=
068a3fd192be8ed0d

Yes, both of them:

mike@lion:~/work/git/kernel-upstream> git merge-base --is-ancestor 5be32356=
2c6a babf0bb978e3 && echo yes
yes

(7e284070abe5 is a later mainline snapshot so it also contains
5be323562c6a)

But it's likely that commit 5be323562c6a fixed most of the problem and
only some corner case was left as most bisect steps had many more error
messages and some even crashed before I was able to even log into KDE.
Compared to that, the mainline snapshots show much fewer errors, no
distorted picture and no crash; on the other hand, applications like
firefox or stellarium seem to trigger the errors quite consistently.

Michal

--htbgsjem3lhh7ns3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmKYx7gACgkQ538sG/LR
dpXsyAf/W3UCoFNauzV+jOw5doy9JrJs7ZPifk6iXZxvVSM1aV88VdBUQClWMBTy
6WevZzqkpY5gmWPAeWNRfQs1hpiHzuDpD27yJSZPTVXn6JW6p6X7AJDHfBLnmpWd
dm6Jwfrir38yIowAlM2fKqVFJWVKfF7LqDS+PS99cB4QYKQe/SNyMQYkvpuRlNyZ
GdNJOlZQfHkIad5t3U36nrh5xPtOVFzwnkIhJCnkYBoDZTa+R+YHRWlW5mK5J81W
qpkHbrgBrJzsgjThwI8JxXKMJ5gTRiNvDVF8G7Yf5Va1VYHdgID2gI/BHXZdeI/8
rNpd5pgrsL9TPwRl+cvsD2WD1CMGPw==
=A2F7
-----END PGP SIGNATURE-----

--htbgsjem3lhh7ns3--
