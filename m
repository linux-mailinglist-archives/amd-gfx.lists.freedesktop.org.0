Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE8A64B08
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Mar 2025 11:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001810E3F0;
	Mon, 17 Mar 2025 10:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dnlPgf8v";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3050410E103;
 Sun, 16 Mar 2025 21:08:18 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6f7031ea11cso39027587b3.2; 
 Sun, 16 Mar 2025 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742159297; x=1742764097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8LVTXm8apFDWNBob0/3Y8MF8vabt+AVUTSggQKCHJA=;
 b=dnlPgf8vQF3/nJkkjaxrJ8BEYQ5sjRh6a46OIJieJPz8gvYWh2mr8tT019V37rvtD/
 xdHXGbfsiCehn3g0iNOLuDB5kwbcVUMOD9g9XZ7Tid7EFk4YXZXW0AACT8FQs15zILOS
 bWVdS6oOMtyhrTJU37gPo+zTK508nEoZrPH6e/Xjp1OdGEab+0/JTWGGj3+TH5L3z9ic
 HBZs4lQASqH1UrzgqfBw5+fZaTWM2UQvp6jUlqs1jFEpYyOxDzbLvKnabprXYg2M+vAQ
 f3Uoh8YFgFo7tHrjdY4uZI+DHv0AZmylVRtp3uKyyUk2Ebrcb7PdkiP6JT7sO5x++MuN
 I6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742159297; x=1742764097;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8LVTXm8apFDWNBob0/3Y8MF8vabt+AVUTSggQKCHJA=;
 b=betX2cRD/cJMYg6Pozk+L2PXq/CZ0itnGw6qXY/DeZDjc/Fd5kA5H56EK0jhA1QAtd
 hhQwSi5XA6Q7lJE9ePyPkJObl6kY/jBoCU+PkpmYyfr4cRr5QuSFJ4Yw0v3MSHrH0vwm
 3wdnimAhoHJavYsKHF5kdqEQBS8J309daBZle0UoSto3GC3Pq+KSIB9PQN6L7GnExYKH
 /SHRw5o8RtC9gaF2DEAK8OhGtW/1ikpj9wFEB+P2wiqLt+G5kFQ8Uk/hFiJZKUu13Q+B
 lda0QhOFILePkz8tVKmBDOSU3PJaRgIIt1rQZ/Z3N+FqimvvBCrdd11kw67MuIMgsjV/
 BMFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDyzkBU5hEVV2nAyEsGDypXQOruRsAAjGPMe07cboq0saK1HELcH0spaE0sPIThE4uTltcMnOou2//SyovqH+yg==@lists.freedesktop.org,
 AJvYcCUW9JcQ5QTFVW/kUEdm7laa7BlSBnBo746S1G02/obRB4c6JosJak7L9n93wB5nPQKc9eXeqlZtjrov@lists.freedesktop.org,
 AJvYcCVdIbVs687y1T57xnw9r63P4Rb8lKfenkXmE9x02qkwJ9rRSa8ntHSGXeI+PusozqsrNcfKXz4m6O6p@lists.freedesktop.org,
 AJvYcCWq26HAU0C0j4G9gB0rjsslwbE8zAG+nuB8TnQWcEGsc4dP1Z9v8h78CUyZ99VxeAzu3l2ybaGB@lists.freedesktop.org,
 AJvYcCXcaH5h+144whyywc4B51E6VdUNK4sBFraCMwNe+qLIQNB0siGZihw8dnswtafkN/2YiWhWBr4i4/48iRVzqg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGLoP5S7ckT5GtL4kgRAxH/M3ZKlggu6Sxzs68NaOwNLkYjtHl
 ZTUwMsyOvPkAvjYya2dArFmwYSekpEgY+Bo56ag26UaQ8iFKgt14f8MErpMvK9VAbYzjTBHzatU
 Q2b+C6ZKx+JgDGwSQHm7uXBqBRLA=
X-Gm-Gg: ASbGnctAZ52JhkuEE+L9I3wwJ1UDzaRlEYc9BR5v9t9jjH3U696wmuHXXoka3O8MKke
 bK61EeZpE4vgJPHPN1oJK1o2PGljtgAEGFa2ppv6TXnOXG2Yhq0L/FDZRibxlTpWLtnF3PaHpqk
 4vMPXfzR1lIzf5KBSTWRc/NDJk
X-Google-Smtp-Source: AGHT+IFZXmb8McwnECxEGjMOi3vOH7PTm7p0Z3I8oSYu65mifRnIL1f1QazmVQ2D7VMf/UTBnDjrxjOX5/KYKXBbQ74=
X-Received: by 2002:a05:690c:7308:b0:6fd:44a5:5b68 with SMTP id
 00721157ae682-6ff460f44ecmr138482327b3.35.1742159297114; Sun, 16 Mar 2025
 14:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-24-jim.cromie@gmail.com>
 <6234628f-4085-40ad-b521-4590db2cb5f5@bootlin.com>
In-Reply-To: <6234628f-4085-40ad-b521-4590db2cb5f5@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 15:07:51 -0600
X-Gm-Features: AQ5f1Jq_ALg0uSLYSl6DjhnMDW3WqAm38tBeiIZYEK2KAbe2YCDTg1pstyAzluQ
Message-ID: <CAJfuBxymeGJ7QtcoN+eO3CcN9+UmnuNBPf1CTAyXT6Brym02MQ@mail.gmail.com>
Subject: Re: [PATCH 23/63] dyndbg: fail modprobe on
 ddebug_class_range_overlap()
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Mar 2025 10:53:32 +0000
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

Im dropping the fail-on-modprobe.

theres some unrelated test-mod touches I'll examine and separate if theyre =
good

On Tue, Feb 25, 2025 at 7:27=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > 1. All classes used by a module (declared DYNDBG_CLASSMAP_{DEFINE,USE}
> > by module code) must share 0..62 class-id space; ie their respective
> > base,+length reservations shouldn't overlap.  Overlaps would lead to
> > unintended changes in ddebug enablements.
> >
> > Detecting these class-id range overlaps at compile-time would be ideal
> > but is not obvious how; failing at modprobe at least insures that the
> > developer sees and fixes the conflict.
> >
> > ddebug_class_range_overlap() implements the range check, accumulating
> > the reserved-ids as it examines each class.  It probably should use
> > bitmaps.
> >
> > A previous commit reworked the modprobe callchain to allow failure,
> > now call ddebug_class_range_overlap() to check when classid conflicts
> > happen, and signal that failure.
> >
> > NB: this can only happen when a module defines+uses several classmaps,
> >
> > TBD: failing modprobe is kinda harsh, maybe warn and proceed ?
> >
> > test_dynamic_debug*.ko:
> >
> > If built with -DFORCE_CLASSID_CONFLICT_MODPROBE, the modules get 2 bad
> > DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
> > conflict with one of the good ones in the parent (D2_CORE..etc),
> > causing the modprobe(s) to fail.  TODO: do in submod only, since fail
> > of parent prevents submod from ever trying.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > ---
> >   lib/dynamic_debug.c      | 30 ++++++++++++++++++++++++------
> >   lib/test_dynamic_debug.c | 11 ++++++++++-
> >   2 files changed, 34 insertions(+), 7 deletions(-)
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 8afcd4111531..8e1e087e07c3 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -1211,6 +1211,21 @@ static void ddebug_apply_params(const struct dde=
bug_class_map *cm, const char *m
> >       }
> >   }
> >
> > +static int ddebug_class_range_overlap(struct ddebug_class_map *cm,
> > +                                   u64 *reserved_ids)
> > +{
> > +     u64 range =3D (((1ULL << cm->length) - 1) << cm->base);
> > +
> > +     if (range & *reserved_ids) {
> > +             pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
> > +                    cm->base + cm->length - 1, cm->class_names[0],
> > +                    *reserved_ids);
> > +             return -EINVAL;
> > +     }
> > +     *reserved_ids |=3D range;
> > +     return 0;
> > +}
> > +
> >   /*
> >    * scan the named array: @_vec, ref'd from inside @_box, for the
> >    * start,len of the sub-array of elements matching on ->mod_name;
> > @@ -1242,9 +1257,11 @@ static int ddebug_module_apply_class_maps(struct=
 ddebug_table *dt,
> >       struct ddebug_class_map *cm;
> >       int i;
> >
> > -     for_subvec(i, cm, &dt->info, maps)
> > +     for_subvec(i, cm, &dt->info, maps) {
> > +             if (ddebug_class_range_overlap(cm, reserved_ids))
> > +                     return -EINVAL;
> >               ddebug_apply_params(cm, cm->mod_name);
> > -
> > +     }
> >       vpr_info("module:%s attached %d classmaps\n", dt->mod_name, dt->i=
nfo.maps.len);
> >       return 0;
> >   }
> > @@ -1255,10 +1272,11 @@ static int ddebug_module_apply_class_users(stru=
ct ddebug_table *dt,
> >       struct ddebug_class_user *cli;
> >       int i;
> >
> > -     /* now iterate dt */
> > -     for_subvec(i, cli, &dt->info, users)
> > +     for_subvec(i, cli, &dt->info, users) {
> > +             if (ddebug_class_range_overlap(cli->map, reserved_ids))
> > +                     return -EINVAL;
> >               ddebug_apply_params(cli->map, cli->mod_name);
> > -
> > +     }
> >       vpr_info("module:%s attached %d classmap uses\n", dt->mod_name, d=
t->info.users.len);
> >       return 0;
> >   }
> > @@ -1311,11 +1329,11 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >                       return rc;
> >               }
> >       }
> > +
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> >       mutex_unlock(&ddebug_lock);
> >
> > -
>
> Hi Jim,
>
> Strange line issues, can you squash it with the correct patch?
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Thanks,
>
> >       if (dt->info.users.len) {
> >               rc =3D ddebug_module_apply_class_users(dt, &reserved_ids)=
;
> >               if (rc)
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index b1555b0a2bb1..74b98adc4ed0 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -81,7 +81,7 @@ enum cat_disjoint_bits {
> >       D2_DRMRES };
> >
> >   /* numeric verbosity, V2 > V1 related */
> > -enum cat_level_num { V0 =3D 14, V1, V2, V3, V4, V5, V6, V7 };
> > +enum cat_level_num { V0 =3D 16, V1, V2, V3, V4, V5, V6, V7 };
> >
> >   /* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
> >   #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
> > @@ -90,6 +90,7 @@ enum cat_level_num { V0 =3D 14, V1, V2, V3, V4, V5, V=
6, V7 };
> >    * classmaps on the client enums above, and then declares the PARAMS
> >    * ref'g the classmaps.  Each is exported.
> >    */
> > +
> >   DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS=
,
> >                      D2_CORE,
> >                      "D2_CORE",
> > @@ -113,6 +114,14 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYP=
E_LEVEL_NUM,
> >   DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
> >   DYNDBG_CLASSMAP_PARAM(level_num, p);
> >
> > +#ifdef FORCE_CLASSID_CONFLICT_MODPROBE
> > +/*
> > + * Enable with -Dflag on compile to test overlapping class-id range
> > + * detection.  This should break on modprobe.
> > + */
> > +DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_COR=
E");
> > +#endif
> > +
> >   #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> >
> >   /*
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
