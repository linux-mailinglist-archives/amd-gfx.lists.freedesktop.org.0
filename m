Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C162FE41
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Nov 2022 20:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDAB10E7AC;
	Fri, 18 Nov 2022 19:48:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403810E7AC
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Nov 2022 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668800882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+zBkcW5Z9mXHbfkq0verFE+bRvuvsPCYXH9teMOQZI=;
 b=ZHp+Vz5ukZ4FW27aXVM1lH0bh+r3/CzE1z3QK9Zj7OjDDuPvNcDVgUalJwewrrzDJMJKYn
 fPEBzL9Vz1kD+clxy4e4OD45dhrkG6RbYw6goyx+OkrOhyeeO1sK+cfGsmh6SIHITA/xBw
 n7OZfrwNVSHAoEEr6FI3VKp4Lb20dXs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-HUlXPkLuPDqQUcLG1SDl5w-1; Fri, 18 Nov 2022 14:48:01 -0500
X-MC-Unique: HUlXPkLuPDqQUcLG1SDl5w-1
Received: by mail-qv1-f69.google.com with SMTP id
 x5-20020ad44585000000b004bb6c687f47so5523189qvu.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Nov 2022 11:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+zBkcW5Z9mXHbfkq0verFE+bRvuvsPCYXH9teMOQZI=;
 b=yC/ue7QdYpeD34ifv6D9YnVOB9CKBIW7LZjYuVcdUF9mHEXS8KLUQITPQCyO1+TxLW
 R1TFy5FKOyZpXL5Xj2gR/1iARL8oNm4FAaUwJq96F4DhS0bjHnUz74P+bkFAG+/Kr4vH
 ChAfk94v6+fWs4Me95/WckVSDwo8B+UCrmCSdMngbxWeoUDYk95enFaYUHOjh5mLK7qR
 Rfb+/bCEd0C4XkOeqlrLs1ywLyMOByyzdj8lDb9QpD5sPAzOSwpTvQl33cpr0qCOA2T7
 WGwHP2xCq9VV8HDB07KtOTUUM8J9i+lbRX8oR+KDc96/Ku3d/1ZeHcBe7yHvHYndtEkf
 AYTg==
X-Gm-Message-State: ANoB5pkl0o6WZtrLmpomDpYkWKu/ZSwZ8XL0CULhXu8NsjTKtMILG2Zq
 Xei3zgI4VGsdUdhgqoL3PW+0iG2kO8x7BtOZF1Npn/bAb3UkxNduarfgVU4ARnQ3hP92x9gBzgb
 jrUxIvaG0MW2QcpwnOGUW4ziZ6w==
X-Received: by 2002:a05:622a:4d47:b0:3a5:6f39:4bd9 with SMTP id
 fe7-20020a05622a4d4700b003a56f394bd9mr8174719qtb.234.1668800879322; 
 Fri, 18 Nov 2022 11:47:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Fj5T/t5CLDsGB/OkBkB9n2kcke20lc42tY+E/Klz03qm45BoysGHedfTUsO+/2TLCNf8BQw==
X-Received: by 2002:a05:622a:4d47:b0:3a5:6f39:4bd9 with SMTP id
 fe7-20020a05622a4d4700b003a56f394bd9mr8174698qtb.234.1668800878980; 
 Fri, 18 Nov 2022 11:47:58 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a280900b006fa4b111c76sm2827101qkp.36.2022.11.18.11.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 11:47:58 -0800 (PST)
Message-ID: <cf10ae993fb08c474b1dff1e2a5ef7d11d519055.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] drm/amdgpu/mst: Stop ignoring error codes and
 deadlocking
From: Lyude Paul <lyude@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Nov 2022 14:47:56 -0500
In-Reply-To: <CADnq5_PgU-XO2nYGYwmod0VX750SXarkk+tsX3qfzqyos7Cx1g@mail.gmail.com>
References: <20221114221754.385090-1-lyude@redhat.com>
 <20221114221754.385090-2-lyude@redhat.com>
 <CO6PR12MB548932515652B8D3130C66DEFC079@CO6PR12MB5489.namprd12.prod.outlook.com>
 <35e55d8040afdcb5684bec16ff710ce5ff32b202.camel@redhat.com>
 <CADnq5_PgU-XO2nYGYwmod0VX750SXarkk+tsX3qfzqyos7Cx1g@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Li,
 Roman" <Roman.Li@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 David Airlie <airlied@gmail.com>, "Francis, David" <David.Francis@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Hung,
 Alex" <Alex.Hung@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Lin, Wayne" <Wayne.Lin@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

of course, will do in just a moment

On Fri, 2022-11-18 at 14:46 -0500, Alex Deucher wrote:
> I've already picked this up.  Can you send a follow up patch with just
> the coverity fix?
> 
> Alex
> 
> On Fri, Nov 18, 2022 at 2:17 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > JFYI, Coverity pointed out one more issue with this series so I'm going to
> > send out a respin real quick to fix it. It's just a missing variable
> > assignment (we leave ret unassigned by mistake in
> > pre_compute_mst_dsc_configs()) so I will carry over your r-b on it.
> > 
> > On Wed, 2022-11-16 at 04:39 +0000, Lin, Wayne wrote:
> > > [Public]
> > > 
> > > All the patch set looks good to me. Feel free to add:
> > > Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
> > > 
> > > Again, thank you Lyude for helping on this!!!
> > > 
> > > Regards,
> > > Wayne
> > > > -----Original Message-----
> > > > From: Lyude Paul <lyude@redhat.com>
> > > > Sent: Tuesday, November 15, 2022 6:18 AM
> > > > To: amd-gfx@lists.freedesktop.org
> > > > Cc: Wentland, Harry <Harry.Wentland@amd.com>; stable@vger.kernel.org;
> > > > Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo
> > > > <Rodrigo.Siqueira@amd.com>; Deucher, Alexander
> > > > <Alexander.Deucher@amd.com>; Koenig, Christian
> > > > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > > > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Kazlauskas,
> > > > Nicholas <Nicholas.Kazlauskas@amd.com>; Pillai, Aurabindo
> > > > <Aurabindo.Pillai@amd.com>; Li, Roman <Roman.Li@amd.com>; Zuo, Jerry
> > > > <Jerry.Zuo@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Lin, Wayne
> > > > <Wayne.Lin@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>;
> > > > Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Hung, Alex
> > > > <Alex.Hung@amd.com>; Mikita Lipski <mikita.lipski@amd.com>; Liu,
> > > > Wenjing <Wenjing.Liu@amd.com>; Francis, David
> > > > <David.Francis@amd.com>; open list:DRM DRIVERS <dri-
> > > > devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>
> > > > Subject: [PATCH v2 1/4] drm/amdgpu/mst: Stop ignoring error codes and
> > > > deadlocking
> > > > 
> > > > It appears that amdgpu makes the mistake of completely ignoring the return
> > > > values from the DP MST helpers, and instead just returns a simple true/false.
> > > > In this case, it seems to have come back to bite us because as a result of
> > > > simply returning false from compute_mst_dsc_configs_for_state(), amdgpu
> > > > had no way of telling when a deadlock happened from these helpers. This
> > > > could definitely result in some kernel splats.
> > > > 
> > > > V2:
> > > > * Address Wayne's comments (fix another bunch of spots where we weren't
> > > >   passing down return codes)
> > > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Fixes: 8c20a1ed9b4f ("drm/amd/display: MST DSC compute fair share")
> > > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > > Cc: <stable@vger.kernel.org> # v5.6+
> > > > ---
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  18 +-
> > > >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 235 ++++++++++------
> > > > --
> > > >  .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  12 +-
> > > >  3 files changed, 147 insertions(+), 118 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > index 0db2a88cd4d7b..852a2100c6b38 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > @@ -6462,7 +6462,7 @@ static int
> > > > dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
> > > >     struct drm_connector_state *new_con_state;
> > > >     struct amdgpu_dm_connector *aconnector;
> > > >     struct dm_connector_state *dm_conn_state;
> > > > -   int i, j;
> > > > +   int i, j, ret;
> > > >     int vcpi, pbn_div, pbn, slot_num = 0;
> > > > 
> > > >     for_each_new_connector_in_state(state, connector,
> > > > new_con_state, i) { @@ -6509,8 +6509,11 @@ static int
> > > > dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
> > > >                     dm_conn_state->pbn = pbn;
> > > >                     dm_conn_state->vcpi_slots = slot_num;
> > > > 
> > > > -                   drm_dp_mst_atomic_enable_dsc(state, aconnector-
> > > > > port, dm_conn_state->pbn,
> > > > -                                                false);
> > > > +                   ret = drm_dp_mst_atomic_enable_dsc(state,
> > > > aconnector->port,
> > > > +                                                      dm_conn_state-
> > > > > pbn, false);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > > +
> > > >                     continue;
> > > >             }
> > > > 
> > > > @@ -9523,10 +9526,9 @@ static int amdgpu_dm_atomic_check(struct
> > > > drm_device *dev,
> > > > 
> > > >  #if defined(CONFIG_DRM_AMD_DC_DCN)
> > > >     if (dc_resource_is_dsc_encoding_supported(dc)) {
> > > > -           if (!pre_validate_dsc(state, &dm_state, vars)) {
> > > > -                   ret = -EINVAL;
> > > > +           ret = pre_validate_dsc(state, &dm_state, vars);
> > > > +           if (ret != 0)
> > > >                     goto fail;
> > > > -           }
> > > >     }
> > > >  #endif
> > > > 
> > > > @@ -9621,9 +9623,9 @@ static int amdgpu_dm_atomic_check(struct
> > > > drm_device *dev,
> > > >             }
> > > > 
> > > >  #if defined(CONFIG_DRM_AMD_DC_DCN)
> > > > -           if (!compute_mst_dsc_configs_for_state(state, dm_state-
> > > > > context, vars)) {
> > > > +           ret = compute_mst_dsc_configs_for_state(state, dm_state-
> > > > > context, vars);
> > > > +           if (ret) {
> > > > 
> > > >     DRM_DEBUG_DRIVER("compute_mst_dsc_configs_for_state()
> > > > failed\n");
> > > > -                   ret = -EINVAL;
> > > >                     goto fail;
> > > >             }
> > > > 
> > > > diff --git
> > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > index 6ff96b4bdda5c..bba2e8aaa2c20 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > +++
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > @@ -703,13 +703,13 @@ static int bpp_x16_from_pbn(struct
> > > > dsc_mst_fairness_params param, int pbn)
> > > >     return dsc_config.bits_per_pixel;
> > > >  }
> > > > 
> > > > -static bool increase_dsc_bpp(struct drm_atomic_state *state,
> > > > -                        struct drm_dp_mst_topology_state *mst_state,
> > > > -                        struct dc_link *dc_link,
> > > > -                        struct dsc_mst_fairness_params *params,
> > > > -                        struct dsc_mst_fairness_vars *vars,
> > > > -                        int count,
> > > > -                        int k)
> > > > +static int increase_dsc_bpp(struct drm_atomic_state *state,
> > > > +                       struct drm_dp_mst_topology_state *mst_state,
> > > > +                       struct dc_link *dc_link,
> > > > +                       struct dsc_mst_fairness_params *params,
> > > > +                       struct dsc_mst_fairness_vars *vars,
> > > > +                       int count,
> > > > +                       int k)
> > > >  {
> > > >     int i;
> > > >     bool bpp_increased[MAX_PIPES];
> > > > @@ -719,6 +719,7 @@ static bool increase_dsc_bpp(struct
> > > > drm_atomic_state *state,
> > > >     int remaining_to_increase = 0;
> > > >     int link_timeslots_used;
> > > >     int fair_pbn_alloc;
> > > > +   int ret = 0;
> > > > 
> > > >     for (i = 0; i < count; i++) {
> > > >             if (vars[i + k].dsc_enabled) {
> > > > @@ -757,52 +758,60 @@ static bool increase_dsc_bpp(struct
> > > > drm_atomic_state *state,
> > > > 
> > > >             if (initial_slack[next_index] > fair_pbn_alloc) {
> > > >                     vars[next_index].pbn += fair_pbn_alloc;
> > > > -                   if (drm_dp_atomic_find_time_slots(state,
> > > > -
> > > > params[next_index].port->mgr,
> > > > -
> > > > params[next_index].port,
> > > > -
> > > > vars[next_index].pbn) < 0)
> > > > -                           return false;
> > > > -                   if (!drm_dp_mst_atomic_check(state)) {
> > > > +                   ret = drm_dp_atomic_find_time_slots(state,
> > > > +
> > > > params[next_index].port->mgr,
> > > > +
> > > > params[next_index].port,
> > > > +
> > > > vars[next_index].pbn);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > > +
> > > > +                   ret = drm_dp_mst_atomic_check(state);
> > > > +                   if (ret == 0) {
> > > >                             vars[next_index].bpp_x16 =
> > > > bpp_x16_from_pbn(params[next_index], vars[next_index].pbn);
> > > >                     } else {
> > > >                             vars[next_index].pbn -= fair_pbn_alloc;
> > > > -                           if (drm_dp_atomic_find_time_slots(state,
> > > > -
> > > > params[next_index].port->mgr,
> > > > -
> > > > params[next_index].port,
> > > > -
> > > > vars[next_index].pbn) < 0)
> > > > -                                   return false;
> > > > +                           ret = drm_dp_atomic_find_time_slots(state,
> > > > +
> > > > params[next_index].port->mgr,
> > > > +
> > > > params[next_index].port,
> > > > +
> > > > vars[next_index].pbn);
> > > > +                           if (ret < 0)
> > > > +                                   return ret;
> > > >                     }
> > > >             } else {
> > > >                     vars[next_index].pbn += initial_slack[next_index];
> > > > -                   if (drm_dp_atomic_find_time_slots(state,
> > > > -
> > > > params[next_index].port->mgr,
> > > > -
> > > > params[next_index].port,
> > > > -
> > > > vars[next_index].pbn) < 0)
> > > > -                           return false;
> > > > -                   if (!drm_dp_mst_atomic_check(state)) {
> > > > +                   ret = drm_dp_atomic_find_time_slots(state,
> > > > +
> > > > params[next_index].port->mgr,
> > > > +
> > > > params[next_index].port,
> > > > +
> > > > vars[next_index].pbn);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > > +
> > > > +                   ret = drm_dp_mst_atomic_check(state);
> > > > +                   if (ret == 0) {
> > > >                             vars[next_index].bpp_x16 =
> > > > params[next_index].bw_range.max_target_bpp_x16;
> > > >                     } else {
> > > >                             vars[next_index].pbn -=
> > > > initial_slack[next_index];
> > > > -                           if (drm_dp_atomic_find_time_slots(state,
> > > > -
> > > > params[next_index].port->mgr,
> > > > -
> > > > params[next_index].port,
> > > > -
> > > > vars[next_index].pbn) < 0)
> > > > -                                   return false;
> > > > +                           ret = drm_dp_atomic_find_time_slots(state,
> > > > +
> > > > params[next_index].port->mgr,
> > > > +
> > > > params[next_index].port,
> > > > +
> > > > vars[next_index].pbn);
> > > > +                           if (ret < 0)
> > > > +                                   return ret;
> > > >                     }
> > > >             }
> > > > 
> > > >             bpp_increased[next_index] = true;
> > > >             remaining_to_increase--;
> > > >     }
> > > > -   return true;
> > > > +   return 0;
> > > >  }
> > > > 
> > > > -static bool try_disable_dsc(struct drm_atomic_state *state,
> > > > -                       struct dc_link *dc_link,
> > > > -                       struct dsc_mst_fairness_params *params,
> > > > -                       struct dsc_mst_fairness_vars *vars,
> > > > -                       int count,
> > > > -                       int k)
> > > > +static int try_disable_dsc(struct drm_atomic_state *state,
> > > > +                      struct dc_link *dc_link,
> > > > +                      struct dsc_mst_fairness_params *params,
> > > > +                      struct dsc_mst_fairness_vars *vars,
> > > > +                      int count,
> > > > +                      int k)
> > > >  {
> > > >     int i;
> > > >     bool tried[MAX_PIPES];
> > > > @@ -810,6 +819,7 @@ static bool try_disable_dsc(struct drm_atomic_state
> > > > *state,
> > > >     int max_kbps_increase;
> > > >     int next_index;
> > > >     int remaining_to_try = 0;
> > > > +   int ret;
> > > > 
> > > >     for (i = 0; i < count; i++) {
> > > >             if (vars[i + k].dsc_enabled
> > > > @@ -840,49 +850,52 @@ static bool try_disable_dsc(struct
> > > > drm_atomic_state *state,
> > > >                     break;
> > > > 
> > > >             vars[next_index].pbn =
> > > > kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps);
> > > > -           if (drm_dp_atomic_find_time_slots(state,
> > > > -                                             params[next_index].port-
> > > > > mgr,
> > > > -                                             params[next_index].port,
> > > > -                                             vars[next_index].pbn) < 0)
> > > > -                   return false;
> > > > +           ret = drm_dp_atomic_find_time_slots(state,
> > > > +                                               params[next_index].port-
> > > > > mgr,
> > > > +                                               params[next_index].port,
> > > > +                                               vars[next_index].pbn);
> > > > +           if (ret < 0)
> > > > +                   return ret;
> > > > 
> > > > -           if (!drm_dp_mst_atomic_check(state)) {
> > > > +           ret = drm_dp_mst_atomic_check(state);
> > > > +           if (ret == 0) {
> > > >                     vars[next_index].dsc_enabled = false;
> > > >                     vars[next_index].bpp_x16 = 0;
> > > >             } else {
> > > >                     vars[next_index].pbn =
> > > > kbps_to_peak_pbn(params[next_index].bw_range.max_kbps);
> > > > -                   if (drm_dp_atomic_find_time_slots(state,
> > > > -
> > > > params[next_index].port->mgr,
> > > > -
> > > > params[next_index].port,
> > > > -
> > > > vars[next_index].pbn) < 0)
> > > > -                           return false;
> > > > +                   ret = drm_dp_atomic_find_time_slots(state,
> > > > +
> > > > params[next_index].port->mgr,
> > > > +
> > > > params[next_index].port,
> > > > +
> > > > vars[next_index].pbn);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > >             }
> > > > 
> > > >             tried[next_index] = true;
> > > >             remaining_to_try--;
> > > >     }
> > > > -   return true;
> > > > +   return 0;
> > > >  }
> > > > 
> > > > -static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state
> > > > *state,
> > > > -                                        struct dc_state *dc_state,
> > > > -                                        struct dc_link *dc_link,
> > > > -                                        struct dsc_mst_fairness_vars *vars,
> > > > -                                        struct drm_dp_mst_topology_mgr
> > > > *mgr,
> > > > -                                        int *link_vars_start_index)
> > > > +static int compute_mst_dsc_configs_for_link(struct drm_atomic_state
> > > > *state,
> > > > +                                       struct dc_state *dc_state,
> > > > +                                       struct dc_link *dc_link,
> > > > +                                       struct dsc_mst_fairness_vars *vars,
> > > > +                                       struct drm_dp_mst_topology_mgr
> > > > *mgr,
> > > > +                                       int *link_vars_start_index)
> > > >  {
> > > >     struct dc_stream_state *stream;
> > > >     struct dsc_mst_fairness_params params[MAX_PIPES];
> > > >     struct amdgpu_dm_connector *aconnector;
> > > >     struct drm_dp_mst_topology_state *mst_state =
> > > > drm_atomic_get_mst_topology_state(state, mgr);
> > > >     int count = 0;
> > > > -   int i, k;
> > > > +   int i, k, ret;
> > > >     bool debugfs_overwrite = false;
> > > > 
> > > >     memset(params, 0, sizeof(params));
> > > > 
> > > >     if (IS_ERR(mst_state))
> > > > -           return false;
> > > > +           return PTR_ERR(mst_state);
> > > > 
> > > >     mst_state->pbn_div = dm_mst_get_pbn_divider(dc_link);  #if
> > > > defined(CONFIG_DRM_AMD_DC_DCN) @@ -933,7 +946,7 @@ static bool
> > > > compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
> > > > 
> > > >     if (count == 0) {
> > > >             ASSERT(0);
> > > > -           return true;
> > > > +           return 0;
> > > >     }
> > > > 
> > > >     /* k is start index of vars for current phy link used by mst hub */ @@
> > > > -947,13 +960,17 @@ static bool compute_mst_dsc_configs_for_link(struct
> > > > drm_atomic_state *state,
> > > >             vars[i + k].pbn =
> > > > kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> > > >             vars[i + k].dsc_enabled = false;
> > > >             vars[i + k].bpp_x16 = 0;
> > > > -           if (drm_dp_atomic_find_time_slots(state, params[i].port-
> > > > > mgr, params[i].port,
> > > > -                                             vars[i + k].pbn) < 0)
> > > > -                   return false;
> > > > +           ret = drm_dp_atomic_find_time_slots(state, params[i].port-
> > > > > mgr, params[i].port,
> > > > +                                               vars[i + k].pbn);
> > > > +           if (ret < 0)
> > > > +                   return ret;
> > > >     }
> > > > -   if (!drm_dp_mst_atomic_check(state) && !debugfs_overwrite) {
> > > > +   ret = drm_dp_mst_atomic_check(state);
> > > > +   if (ret == 0 && !debugfs_overwrite) {
> > > >             set_dsc_configs_from_fairness_vars(params, vars, count, k);
> > > > -           return true;
> > > > +           return 0;
> > > > +   } else if (ret != -ENOSPC) {
> > > > +           return ret;
> > > >     }
> > > > 
> > > >     /* Try max compression */
> > > > @@ -962,31 +979,36 @@ static bool
> > > > compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
> > > >                     vars[i + k].pbn =
> > > > kbps_to_peak_pbn(params[i].bw_range.min_kbps);
> > > >                     vars[i + k].dsc_enabled = true;
> > > >                     vars[i + k].bpp_x16 =
> > > > params[i].bw_range.min_target_bpp_x16;
> > > > -                   if (drm_dp_atomic_find_time_slots(state,
> > > > params[i].port->mgr,
> > > > -                                                     params[i].port, vars[i
> > > > + k].pbn) < 0)
> > > > -                           return false;
> > > > +                   ret = drm_dp_atomic_find_time_slots(state,
> > > > params[i].port->mgr,
> > > > +                                                       params[i].port,
> > > > vars[i + k].pbn);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > >             } else {
> > > >                     vars[i + k].pbn =
> > > > kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> > > >                     vars[i + k].dsc_enabled = false;
> > > >                     vars[i + k].bpp_x16 = 0;
> > > > -                   if (drm_dp_atomic_find_time_slots(state,
> > > > params[i].port->mgr,
> > > > -                                                     params[i].port, vars[i
> > > > + k].pbn) < 0)
> > > > -                           return false;
> > > > +                   ret = drm_dp_atomic_find_time_slots(state,
> > > > params[i].port->mgr,
> > > > +                                                       params[i].port,
> > > > vars[i + k].pbn);
> > > > +                   if (ret < 0)
> > > > +                           return ret;
> > > >             }
> > > >     }
> > > > -   if (drm_dp_mst_atomic_check(state))
> > > > -           return false;
> > > > +   ret = drm_dp_mst_atomic_check(state);
> > > > +   if (ret != 0)
> > > > +           return ret;
> > > > 
> > > >     /* Optimize degree of compression */
> > > > -   if (!increase_dsc_bpp(state, mst_state, dc_link, params, vars, count,
> > > > k))
> > > > -           return false;
> > > > +   ret = increase_dsc_bpp(state, mst_state, dc_link, params, vars,
> > > > count, k);
> > > > +   if (ret < 0)
> > > > +           return ret;
> > > > 
> > > > -   if (!try_disable_dsc(state, dc_link, params, vars, count, k))
> > > > -           return false;
> > > > +   ret = try_disable_dsc(state, dc_link, params, vars, count, k);
> > > > +   if (ret < 0)
> > > > +           return ret;
> > > > 
> > > >     set_dsc_configs_from_fairness_vars(params, vars, count, k);
> > > > 
> > > > -   return true;
> > > > +   return 0;
> > > >  }
> > > > 
> > > >  static bool is_dsc_need_re_compute(
> > > > @@ -1087,15 +1109,16 @@ static bool is_dsc_need_re_compute(
> > > >     return is_dsc_need_re_compute;
> > > >  }
> > > > 
> > > > -bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > > > -                                  struct dc_state *dc_state,
> > > > -                                  struct dsc_mst_fairness_vars *vars)
> > > > +int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > > > +                                 struct dc_state *dc_state,
> > > > +                                 struct dsc_mst_fairness_vars *vars)
> > > >  {
> > > >     int i, j;
> > > >     struct dc_stream_state *stream;
> > > >     bool computed_streams[MAX_PIPES];
> > > >     struct amdgpu_dm_connector *aconnector;
> > > >     int link_vars_start_index = 0;
> > > > +   int ret = 0;
> > > > 
> > > >     for (i = 0; i < dc_state->stream_count; i++)
> > > >             computed_streams[i] = false;
> > > > @@ -1118,17 +1141,19 @@ bool compute_mst_dsc_configs_for_state(struct
> > > > drm_atomic_state *state,
> > > >                     continue;
> > > > 
> > > >             if (dcn20_remove_stream_from_ctx(stream->ctx->dc,
> > > > dc_state, stream) != DC_OK)
> > > > -                   return false;
> > > > +                   return -EINVAL;
> > > > 
> > > >             if (!is_dsc_need_re_compute(state, dc_state, stream->link))
> > > >                     continue;
> > > > 
> > > >             mutex_lock(&aconnector->mst_mgr.lock);
> > > > -           if (!compute_mst_dsc_configs_for_link(state, dc_state,
> > > > stream->link, vars,
> > > > -                                                 &aconnector->mst_mgr,
> > > > -                                                 &link_vars_start_index)) {
> > > > +
> > > > +           ret = compute_mst_dsc_configs_for_link(state, dc_state,
> > > > stream->link, vars,
> > > > +                                                  &aconnector->mst_mgr,
> > > > +                                                  &link_vars_start_index);
> > > > +           if (ret != 0) {
> > > >                     mutex_unlock(&aconnector->mst_mgr.lock);
> > > > -                   return false;
> > > > +                   return ret;
> > > >             }
> > > >             mutex_unlock(&aconnector->mst_mgr.lock);
> > > > 
> > > > @@ -1143,22 +1168,22 @@ bool compute_mst_dsc_configs_for_state(struct
> > > > drm_atomic_state *state,
> > > > 
> > > >             if (stream->timing.flags.DSC == 1)
> > > >                     if (dc_stream_add_dsc_to_resource(stream->ctx-
> > > > > dc, dc_state, stream) != DC_OK)
> > > > -                           return false;
> > > > +                           return -EINVAL;
> > > >     }
> > > > 
> > > > -   return true;
> > > > +   return ret;
> > > >  }
> > > > 
> > > > -static bool
> > > > -   pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state
> > > > *state,
> > > > -                                         struct dc_state *dc_state,
> > > > -                                         struct dsc_mst_fairness_vars
> > > > *vars)
> > > > +static int pre_compute_mst_dsc_configs_for_state(struct
> > > > drm_atomic_state *state,
> > > > +                                            struct dc_state *dc_state,
> > > > +                                            struct dsc_mst_fairness_vars
> > > > *vars)
> > > >  {
> > > >     int i, j;
> > > >     struct dc_stream_state *stream;
> > > >     bool computed_streams[MAX_PIPES];
> > > >     struct amdgpu_dm_connector *aconnector;
> > > >     int link_vars_start_index = 0;
> > > > +   int ret;
> > > > 
> > > >     for (i = 0; i < dc_state->stream_count; i++)
> > > >             computed_streams[i] = false;
> > > > @@ -1184,11 +1209,12 @@ static bool
> > > >                     continue;
> > > > 
> > > >             mutex_lock(&aconnector->mst_mgr.lock);
> > > > -           if (!compute_mst_dsc_configs_for_link(state, dc_state,
> > > > stream->link, vars,
> > > > -                                                 &aconnector->mst_mgr,
> > > > -                                                 &link_vars_start_index)) {
> > > > +           ret = compute_mst_dsc_configs_for_link(state, dc_state,
> > > > stream->link, vars,
> > > > +                                                  &aconnector->mst_mgr,
> > > > +                                                  &link_vars_start_index);
> > > > +           if (ret != 0) {
> > > >                     mutex_unlock(&aconnector->mst_mgr.lock);
> > > > -                   return false;
> > > > +                   return ret;
> > > >             }
> > > >             mutex_unlock(&aconnector->mst_mgr.lock);
> > > > 
> > > > @@ -1198,7 +1224,7 @@ static bool
> > > >             }
> > > >     }
> > > > 
> > > > -   return true;
> > > > +   return ret;
> > > >  }
> > > > 
> > > >  static int find_crtc_index_in_state_by_stream(struct drm_atomic_state
> > > > *state, @@ -1253,9 +1279,9 @@ static bool
> > > > is_dsc_precompute_needed(struct drm_atomic_state *state)
> > > >     return ret;
> > > >  }
> > > > 
> > > > -bool pre_validate_dsc(struct drm_atomic_state *state,
> > > > -                 struct dm_atomic_state **dm_state_ptr,
> > > > -                 struct dsc_mst_fairness_vars *vars)
> > > > +int pre_validate_dsc(struct drm_atomic_state *state,
> > > > +                struct dm_atomic_state **dm_state_ptr,
> > > > +                struct dsc_mst_fairness_vars *vars)
> > > >  {
> > > >     int i;
> > > >     struct dm_atomic_state *dm_state;
> > > > @@ -1264,11 +1290,12 @@ bool pre_validate_dsc(struct drm_atomic_state
> > > > *state,
> > > > 
> > > >     if (!is_dsc_precompute_needed(state)) {
> > > >             DRM_INFO_ONCE("DSC precompute is not needed.\n");
> > > > -           return true;
> > > > +           return 0;
> > > >     }
> > > > -   if (dm_atomic_get_state(state, dm_state_ptr)) {
> > > > +   ret = dm_atomic_get_state(state, dm_state_ptr);
> > > > +   if (ret != 0) {
> > > >             DRM_INFO_ONCE("dm_atomic_get_state() failed\n");
> > > > -           return false;
> > > > +           return ret;
> > > >     }
> > > >     dm_state = *dm_state_ptr;
> > > > 
> > > > @@ -1280,7 +1307,7 @@ bool pre_validate_dsc(struct drm_atomic_state
> > > > *state,
> > > > 
> > > >     local_dc_state = kmemdup(dm_state->context, sizeof(struct
> > > > dc_state), GFP_KERNEL);
> > > >     if (!local_dc_state)
> > > > -           return false;
> > > > +           return -ENOMEM;
> > > > 
> > > >     for (i = 0; i < local_dc_state->stream_count; i++) {
> > > >             struct dc_stream_state *stream = dm_state->context-
> > > > > streams[i]; @@ -1316,9 +1343,9 @@ bool pre_validate_dsc(struct
> > > > drm_atomic_state *state,
> > > >     if (ret != 0)
> > > >             goto clean_exit;
> > > > 
> > > > -   if (!pre_compute_mst_dsc_configs_for_state(state, local_dc_state,
> > > > vars)) {
> > > > +   ret = pre_compute_mst_dsc_configs_for_state(state, local_dc_state,
> > > > vars);
> > > > +   if (ret != 0) {
> > > > 
> > > >     DRM_INFO_ONCE("pre_compute_mst_dsc_configs_for_state()
> > > > failed\n");
> > > > -           ret = -EINVAL;
> > > >             goto clean_exit;
> > > >     }
> > > > 
> > > > @@ -1349,7 +1376,7 @@ bool pre_validate_dsc(struct drm_atomic_state
> > > > *state,
> > > > 
> > > >     kfree(local_dc_state);
> > > > 
> > > > -   return (ret == 0);
> > > > +   return ret;
> > > >  }
> > > > 
> > > >  static unsigned int kbps_from_pbn(unsigned int pbn) diff --git
> > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > > > index b92a7c5671aa2..97fd70df531bf 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > > > +++
> > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > > > @@ -53,15 +53,15 @@ struct dsc_mst_fairness_vars {
> > > >     struct amdgpu_dm_connector *aconnector;  };
> > > > 
> > > > -bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > > > -                                  struct dc_state *dc_state,
> > > > -                                  struct dsc_mst_fairness_vars *vars);
> > > > +int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > > > +                                 struct dc_state *dc_state,
> > > > +                                 struct dsc_mst_fairness_vars *vars);
> > > > 
> > > >  bool needs_dsc_aux_workaround(struct dc_link *link);
> > > > 
> > > > -bool pre_validate_dsc(struct drm_atomic_state *state,
> > > > -                 struct dm_atomic_state **dm_state_ptr,
> > > > -                 struct dsc_mst_fairness_vars *vars);
> > > > +int pre_validate_dsc(struct drm_atomic_state *state,
> > > > +                struct dm_atomic_state **dm_state_ptr,
> > > > +                struct dsc_mst_fairness_vars *vars);
> > > > 
> > > >  enum dc_status dm_dp_mst_is_port_support_mode(
> > > >     struct amdgpu_dm_connector *aconnector,
> > > > --
> > > > 2.37.3
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

