Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A87E994A
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Nov 2023 10:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7410E32A;
	Mon, 13 Nov 2023 09:44:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE5A10E329;
 Mon, 13 Nov 2023 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699868666; x=1700127866;
 bh=4cUr+dEfME37FPxFHeIbt8JPHNpEiIuEOSNTafJhkXA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QlmObd4rIaOKoxhoh2Aob21CpGpT6dZMHpcbPqCeG/BjkzLHXgeIlDZZQ5B8W4fb/
 YG4SU2vCR28Ov8gRYmeyQfIN4HmQAYH/rU0qyI2yWypJ41fgcrBFGa115ku7qDuqN0
 YaukYZup6BZNpiPDOvuHAw0qqi25HHxHUuU+T1OHH8st2GK3Tz6SYtypD5DmE7gnBw
 l8vWO41WSkWXNhVPTX2yHdfMlEJAVVjxFOuMpy88nh85rTWsWPT8rj1kPofaeC0XA+
 FiRzk+9k5zAWrap6f69IE9oYRRmwuI/lZyF4JPiuR4Tr9Tcb9aPoN6WzoYQBRzklqg
 e0R4R8isOP6OA==
Date: Mon, 13 Nov 2023 09:44:15 +0000
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Message-ID: <ha7UwaZ0eilF_Hl6wWqJXJQ0oy9_rD1FKUNDwIlNxC-vT3InSP4bpTRwVnZG9QvzZBsX4W-p_vz5FfByoAXuGewyhVtwVd4KyRSMJ4G8cQ4=@emersion.fr>
In-Reply-To: <20231113113804.6e2adfa8@eldfell>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
 <20231113113804.6e2adfa8@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, November 13th, 2023 at 10:38, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> On Mon, 13 Nov 2023 09:18:39 +0000
> Simon Ser contact@emersion.fr wrote:
>=20
> > On Monday, October 23rd, 2023 at 10:25, Simon Ser contact@emersion.fr w=
rote:
> >=20
> > > > > > > > > > > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_=
ASYNC is allowed to
> > > > > > > > > > > > +effectively change only the FB_ID property on any =
planes. No-operation changes
> > > > > > > > > > > > +are ignored as always. [...]
> > > > > > > > > > > > During the hackfest in Brno, it was mentioned that =
a commit which re-sets the same FB_ID could actually have an effect with VR=
R: It could trigger scanout of the next frame before vertical blank has rea=
ched its maximum duration. Some kind of mechanism is required for this in o=
rder to allow user space to perform low frame rate compensation.
> > > > > > > > > >=20
> > > > > > > > > > Xaver tested this hypothesis in a flipping the same fb =
in a VRR monitor
> > > > > > > > > > and it worked as expected, so this shouldn't be a conce=
rn.
> > > > > > > > > > Right, so it must have some effect. It cannot be simply=
 ignored like in
> > > > > > > > > > the proposed doc wording. Do we special-case re-setting=
 the same FB_ID
> > > > > > > > > > as "not a no-op" or "not ignored" or some other way?
> > > > > > > > > > There's an effect in the refresh rate, the image won't =
change but it
> > > > > > > > > > will report that a flip had happened asynchronously so =
the reported
> > > > > > > > > > framerate will be increased. Maybe an additional wordin=
g could be like:
> > > > > > > >=20
> > > > > > > > Flipping to the same FB_ID will result in a immediate flip =
as if it was
> > > > > > > > changing to a different one, with no effect on the image bu=
t effecting
> > > > > > > > the reported frame rate.
> > > > > > >=20
> > > > > > > Re-setting FB_ID to its current value is a special case regar=
dless of
> > > > > > > PAGE_FLIP_ASYNC, is it not?
> > > > > >=20
> > > > > > No. The rule has so far been that all side effects are observed
> > > > > > even if you flip to the same fb. And that is one of my annoyanc=
es
> > > > > > with this proposal. The rules will now be different for async f=
lips
> > > > > > vs. everything else.
> > > > >=20
> > > > > Well with the patches the async page-flip case is exactly the sam=
e as
> > > > > the non-async page-flip case. In both cases, if a FB_ID is includ=
ed in
> > > > > an atomic commit then the side effects are triggered even if the =
property
> > > > > value didn't change. The rules are the same for everything.
> > > >=20
> > > > I see it only checking if FB_ID changes or not. If it doesn't
> > > > change then the implication is that the side effects will in
> > > > fact be skipped as not all planes may even support async flips.
> > >=20
> > > Hm right. So the problem is that setting any prop =3D same value as
> > > previous one will result in a new page-flip for asynchronous page-fli=
ps,
> > > but will not result in any side-effect for asynchronous page-flips.
> > >=20
> > > Does it actually matter though? For async page-flips, I don't think t=
his
> > > would result in any actual difference in behavior?
>=20
>=20
> Hi Simon,
>=20
> a fly-by question...
>=20
> > To sum this up, here is a matrix of behavior as seen by user-space:
> >=20
> > - Sync atomic page-flip
> > - Set FB_ID to different value: programs hw for page-flip, sends uevent
> > - Set FB_ID to same value: same (important for VRR)
> > - Set another plane prop to same value: same
> > - Set another plane prop to different value: maybe rejected if modeset =
required
> > - Async atomic page-flip
> > - Set FB_ID to different value: updates hw with new FB address, sends
> > immediate uevent
> > - Set FB_ID to same value: same (no-op for the hw)
>=20
> It should not be a no-op for the hw, because the hw might be in the
> middle of a VRR front-porch waiting period, and the commit needs to end
> the waiting immediately rather than time out?

I'm not sure=20

> > - Set another plane prop to same value: ignored, sends immediate uevent
> > (special codepath)
>=20
> If the sync case says "same", then shouldn't this say "same" as well to
> be consistent?

Okay, I think I chose my words badly. By "same" I meant "same as
previous item in the list".

Here I tried to be more explicit and explain why it's the same behavior.
We have a special path in the kernel code that ignores the change, but
the effective result is that it doesn't differ from the sync case.

Here's a fixed matrix where I don't use confusing words:

- Sync atomic page-flip
  - Set FB_ID to different value: programs hw for page-flip, sends uevent
  - Set FB_ID to same value: programs hw for page-flip, sends uevent (impor=
tant
    for VRR)
  - Set another plane prop to same value: programs hw for page-flip, sends
    uevent
  - Set another plane prop to different value: maybe rejected if modeset re=
quired
- Async atomic page-flip
  - Set FB_ID to different value: updates hw with new FB address, sends
    immediate uevent
  - Set FB_ID to same value: updates hw with new FB address (no-op for the =
hw),
    sends immediate uevent
  - Set another plane prop to same value: ignored, sends immediate uevent
    (special codepath)
  - Set another plane prop to different value: always rejected
