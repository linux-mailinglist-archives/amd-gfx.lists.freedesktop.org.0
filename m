Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F97912C4
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Sep 2023 09:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD310E2CC;
	Mon,  4 Sep 2023 07:58:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8781A10E2CC
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Sep 2023 07:58:06 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bb3df62b34so149606fac.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 04 Sep 2023 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693814286; x=1694419086; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWYPYRVmxFMR9u4NGuNYRI2QcWDZsUHtnYpHqK7BILw=;
 b=lGGOncACpMsqOVl/HKRFBPm77zZcpMfMIPuLWE9zZYgMP/TuTh5xHjB3GKte6c+KP0
 gvlo2Xn3af0JDwd+8L1K5holcPCyNe/mZxw71DzweLWMwmYHxJWKlSZrgtD/BmGziq5u
 Q7Gu6XdZ/YdIDm9iS6gGF/lzav9Wszt/A2pBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693814286; x=1694419086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWYPYRVmxFMR9u4NGuNYRI2QcWDZsUHtnYpHqK7BILw=;
 b=QssT6mUEWNjesN7WlUZLD/DgWrWhQUdaoyi8gqaPYwG+rxExCR9Mt9+xhN8tqZ4K5e
 ZR2QPv4uO4FDluuxU4PwGfhBS1DqeVQqyZIeb2HD6Ggtm+yMHCwcmh09AiGE7ouJgbmV
 i/3jwotWeCR5WGkAQ21opvg5jLdXrX8WXFxdPgEHPV2AeCBIb6N6JkE+3AYp5oGfeo4T
 U+rLCb2LYOTJmnZzf5qaU8eW0jknsr9agLOmzIxk93L8E7am5SQKP3xTBGOwKsBFs0Ro
 vCN2v1lHYM0C6j8btkoA1v/69Y9iDaez5fgGfP1dJDnTlpvNzoXjEUV/4EHEQET3HDWv
 SnZw==
X-Gm-Message-State: AOJu0YxKWdxzFVqTXjzw1qipu3eg/bljJO1sPd83TAnBXClVocB3aPmF
 TFbYGZ8jwIpk/fqLGs6g8VwRPoBeYPIuTft8dbVyAbNJ9hHCfrdk
X-Google-Smtp-Source: AGHT+IFbOx+AIeKpf2ld2ULwKLAoL5EviNsQuBZLrFy2bHHntq4kHgnfEog0NaKlZZ0dTn2Tjco5V3O5pPATlWglvuc=
X-Received: by 2002:a05:6870:5886:b0:192:6fce:d3be with SMTP id
 be6-20020a056870588600b001926fced3bemr10348833oab.1.1693814285834; Mon, 04
 Sep 2023 00:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com>
 <87il965gob.fsf@intel.com> <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
 <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com>
 <87h6oh0yz9.fsf@intel.com> <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
 <CADnq5_MBpxT5mPXq0N_=EC7oCQLLxMKVboziSYp6rNOGwTEJow@mail.gmail.com>
In-Reply-To: <CADnq5_MBpxT5mPXq0N_=EC7oCQLLxMKVboziSYp6rNOGwTEJow@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 4 Sep 2023 09:57:54 +0200
Message-ID: <CAKMK7uHxnzH54L04=3PaAXom+S-mDsWx_C90i5W9=9a-OEpotA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alex Hung <alex.hung@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Wang,
 Yu \(Charlie\)" <Yu.Wang4@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, 1 Sept 2023 at 21:00, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Aug 31, 2023 at 6:01=E2=80=AFPM Alex Hung <alex.hung@amd.com> wro=
te:
> >
> >
> >
> > On 2023-08-30 01:29, Jani Nikula wrote:
> > > On Tue, 29 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> > >> On 2023-08-29 11:03, Jani Nikula wrote:
> > >>> On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > >>>> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >>>>> On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@=
intel.com> wrote:
> > >>>>>>
> > >>>>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > >>>>>>> On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> > >>>>>>>> On 2023-08-22 06:01, Jani Nikula wrote:
> > >>>>>>>>> Over the past years I've been trying to unify the override an=
d firmware
> > >>>>>>>>> EDID handling as well as EDID property updates. It won't work=
 if drivers
> > >>>>>>>>> do their own random things.
> > >>>>>>>> Let's check how to replace these references by appropriate one=
s or fork
> > >>>>>>>> the function as reverting these patches causes regressions.
> > >>>>>>>
> > >>>>>>> I think the fundamental problem you have is conflating connecto=
r forcing
> > >>>>>>> with EDID override. They're orthogonal. The .force callback has=
 no
> > >>>>>>> business basing the decisions on connector->edid_override. Forc=
e is
> > >>>>>>> force, override is override.
> > >>>>>>>
> > >>>>>>> The driver isn't even supposed to know or care if the EDID orig=
inates
> > >>>>>>> from the firmware loader or override EDID debugfs. drm_get_edid=
() will
> > >>>>>>> handle that for you transparently. It'll return the EDID, and y=
ou
> > >>>>>>> shouldn't look at connector->edid_blob_ptr either. Using that w=
ill make
> > >>>>>>> future work in drm_edid.c harder.
> > >>>>>>>
> > >>>>>>> You can't fix that with minor tweaks. I think you'll be better =
off
> > >>>>>>> starting from scratch.
> > >>>>>>>
> > >>>>>>> Also, connector->edid_override is debugfs. You actually can cha=
nge the
> > >>>>>>> behaviour. If your userspace, whatever it is, has been written =
to assume
> > >>>>>>> connector forcing if EDID override is set, you *do* have to fix=
 that,
> > >>>>>>> and set both.
> > >>>>>>
> > >>>>>> Any updates on fixing this, or shall we proceed with the reverts=
?
> > >>
> > >> There is a patch under internal reviews. It removes calls edid_overr=
ide
> > >> and drm_edid_override_connector_update as intended in this patchset =
but
> > >> does not remove the functionality.
> > >
> > > While I am happy to hear there's progress, I'm somewhat baffled the
> > > review is internal. The commits that I suggested to revert were also
> > > only reviewed internally, as far as I can see... And that's kind of t=
he
> > > problem.
> > >
> > > Upstream code should be reviewed in public.
> >
> > Hi Jani,
> >
> > All patches are sent for public reviews, the progress is summarized as
> > the followings:
> >
> > =3D=3D internal =3D=3D
> >
> > 1. a patch or patches are tested by CI.
> > 2. internal technical and IP reviews are performed to ensure no concern=
s
> > before patches are merged to internal branch.
> >
> > =3D=3D public =3D=3D
> >
> > 3. a regression test and IP reviews are performed by engineers before
> > sending to public mailing lists.
> > 4. the patchset is sent for public reviews ex.
> > https://patchwork.freedesktop.org/series/122498/
> > 5. patches are merged to public repo.
> >
>
> This sort of thing is fine for unreleased chips or new IP prior public
> exposure, but for released hardware, you really need to do the reviews
> on the mailing lists.

Aye. Maybe with the clarification that if the embargoed code touches
areas that are common code (or really should be handled in common
code), then the cross-driver parts also need to be reviewed in public
as upfront prep patches. If that's not possible (try to fix your
process to make that possible please), at least ping stakeholders in
private to give them a heads up, so that when the IP enabling gets
published it's not going to be held up in the review for the necessary
common changes. What's not good is if code that should be reviewed on
dri-devel bypasses all that just because it's part of a hardware
enabling series.

Cheers, Sima

> Alex
>
>
> > >
> > >
> > > BR,
> > > Jani.
> > >
> > >
> > >>
> > >> With the patch. both following git grep commands return nothing in
> > >> amd-staging-drm-next.
> > >>
> > >> $ git grep drm_edid_override_connector_update -- drivers/gpu/drm/amd
> > >> $ git grep edid_override -- drivers/gpu/drm/amd
> > >>
> > >> Best regards,
> > >> Alex Hung
> > >>
> > >>>>>
> > >>>>> What is the goal of the reverts?  I don't disagree that we may be
> > >>>>> using the interfaces wrong, but reverting them will regess
> > >>>>> functionality in the driver.
> > >>>>
> > >>>> The commits are in v6.5-rc1, but not yet in a release. No user dep=
ends
> > >>>> on them yet. I'd strongly prefer them not reaching v6.5 final and =
users.
> > >>>
> > >>> Sorry for confusion here, that's obviously come and gone already. :=
(
> > >>>
> > >>>> The firmware EDID, override EDID, connector forcing, the EDID prop=
erty,
> > >>>> etc. have been and somewhat still are a hairy mess that we must ke=
ep
> > >>>> untangling, and this isn't helping.
> > >>>>
> > >>>> I've put in crazy amounts of work on this, and I've added kernel-d=
oc
> > >>>> comments about stuff that should and should not be done, but they =
go
> > >>>> unread and ignored.
> > >>>>
> > >>>> I really don't want to end up having to clean this up myself befor=
e I
> > >>>> can embark on further cleanups and refactoring.
> > >>>>
> > >>>> And again, if the functionality in the driver depends on conflatin=
g two
> > >>>> things that should be separate, it's probably not such a hot idea =
to let
> > >>>> it reach users either. Even if it's just debugfs.
> > >>>>
> > >>>>
> > >>>> BR,
> > >>>> Jani.
> > >>>
> > >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
