Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722E628B48
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Nov 2022 22:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5910E334;
	Mon, 14 Nov 2022 21:24:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4711710E31E
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Nov 2022 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668461083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDnusRIn1gwb/arvCmVktYq22Wn9qjpGcuRUfMAU1qg=;
 b=dDExtGJ+hm91TRzEb84Xrd4/fJYyROpW+XiWKou0JF5ZorE+rE1Aclus0VoZPNk5vCtY+z
 UZ+N+SLP6kB6G6ky2zd4pEGK53F3TCzAK2alSdeA4pM3RTHMJf4lR3wTS7VI827jEirpaI
 55CqZDQ1IVHoTqugmtye55yF+Ync1xs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-BHgGQToPPmuDuwSRMXeKhg-1; Mon, 14 Nov 2022 16:24:42 -0500
X-MC-Unique: BHgGQToPPmuDuwSRMXeKhg-1
Received: by mail-qt1-f199.google.com with SMTP id
 gc12-20020a05622a59cc00b003a5444280e1so8921816qtb.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Nov 2022 13:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDnusRIn1gwb/arvCmVktYq22Wn9qjpGcuRUfMAU1qg=;
 b=CboSTCkYEJsj3qp+TldK9o0WyvL7RW28h4vzHJJ4/eDh6QFA7LtxU/Q/r2+Jd5Gcyc
 sipfFSS2Zbk7CWNUFK+1+dahLTuWisUQqlQJ3L/TXZlzCdO+YoWWd60QARO0OlbjdGDC
 +Na1pkowkcdBydrAsIfyihd0Co/vgWUVaygS7qYgLz719INyltoLf9oUJnfoSWSC+W5B
 51pAV92F183IajFcfWzMN0xFeSuX+BgQowMMHip+dez/iSWh4qmLMfFfm5LFNg1o4TQA
 zBCWiijmZ/ZG8gKjRwHH63DIOtNGVvsd2Rby5Xjp0z4x76W/hh2bnYW3QLE/SvIS8M1Z
 6VMA==
X-Gm-Message-State: ANoB5pmOA7cWWrbb5CET2NTSRy6ZDKSGT8aJac8vgNVmry2AtbCUdlwX
 6ocbtNwI7gzr8AZh/EJ5HCqKcxD+1B1q6evvk9g5EsLasoH7PAoIdogqIJVzyzyGWpX+OPNYuDl
 UhISlR3eI8OiMQxw5KdirclXlOg==
X-Received: by 2002:a0c:f651:0:b0:4be:e978:85ef with SMTP id
 s17-20020a0cf651000000b004bee97885efmr14849299qvm.73.1668461081594; 
 Mon, 14 Nov 2022 13:24:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5GNTjomZKeQU8K0N7e6L6IEbF77v169VGiaCnEzqll4vJffwyeMd34x3R3Xa9EMa7JSAft+w==
X-Received: by 2002:a0c:f651:0:b0:4be:e978:85ef with SMTP id
 s17-20020a0cf651000000b004bee97885efmr14849261qvm.73.1668461081305; 
 Mon, 14 Nov 2022 13:24:41 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a37ab06000000b006b615cd8c13sm6945223qke.106.2022.11.14.13.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 13:24:39 -0800 (PST)
Message-ID: <ac1abf6b0e525160b91b75042b678c515b5780cd.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/mst: Stop ignoring error codes and
 deadlocking
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Mon, 14 Nov 2022 16:24:38 -0500
In-Reply-To: <CO6PR12MB5489E3850FE3C9FBDA7BAC29FC3E9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20221104235926.302883-1-lyude@redhat.com>
 <20221104235926.302883-2-lyude@redhat.com>
 <CO6PR12MB5489E3850FE3C9FBDA7BAC29FC3E9@CO6PR12MB5489.namprd12.prod.outlook.com>
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, David Airlie <airlied@gmail.com>, "Francis,
 David" <David.Francis@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Hung, 
 Alex" <Alex.Hung@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas, 
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, 2022-11-09 at 09:48 +0000, Lin, Wayne wrote:
> [Public]
> 
> Thanks, Lyude!
> Comments inline.
> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Saturday, November 5, 2022 7:59 AM
> > To: amd-gfx@lists.freedesktop.org
> > Cc: Wentland, Harry <Harry.Wentland@amd.com>; stable@vger.kernel.org;
> > Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Siqueira, Rodrigo
> > <Rodrigo.Siqueira@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Kazlauskas,
> > Nicholas <Nicholas.Kazlauskas@amd.com>; Pillai, Aurabindo
> > <Aurabindo.Pillai@amd.com>; Li, Roman <Roman.Li@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>; Lin, Wayne
> > <Wayne.Lin@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>;
> > Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Hung, Alex
> > <Alex.Hung@amd.com>; Francis, David <David.Francis@amd.com>; Mikita
> > Lipski <mikita.lipski@amd.com>; Liu, Wenjing <Wenjing.Liu@amd.com>;
> > open list:DRM DRIVERS <dri-devel@lists.freedesktop.org>; open list <linux-
> > kernel@vger.kernel.org>
> > Subject: [PATCH 1/2] drm/amdgpu/mst: Stop ignoring error codes and
> > deadlocking
> > 
> > It appears that amdgpu makes the mistake of completely ignoring the return
> > values from the DP MST helpers, and instead just returns a simple true/false.
> > In this case, it seems to have come back to bite us because as a result of
> > simply returning false from compute_mst_dsc_configs_for_state(), amdgpu
> > had no way of telling when a deadlock happened from these helpers. This
> > could definitely result in some kernel splats.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 8c20a1ed9b4f ("drm/amd/display: MST DSC compute fair share")
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: <stable@vger.kernel.org> # v5.6+
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  18 +--
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 107 ++++++++++------
> > --
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  12 +-
> >  3 files changed, 73 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 0db2a88cd4d7b..6f76b2c84cdb5 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -6462,7 +6462,7 @@ static int
> > dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
> >  	struct drm_connector_state *new_con_state;
> >  	struct amdgpu_dm_connector *aconnector;
> >  	struct dm_connector_state *dm_conn_state;
> > -	int i, j;
> > +	int i, j, ret;
> >  	int vcpi, pbn_div, pbn, slot_num = 0;
> > 
> >  	for_each_new_connector_in_state(state, connector,
> > new_con_state, i) { @@ -6509,8 +6509,11 @@ static int
> > dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
> >  			dm_conn_state->pbn = pbn;
> >  			dm_conn_state->vcpi_slots = slot_num;
> > 
> > -			drm_dp_mst_atomic_enable_dsc(state, aconnector-
> > > port, dm_conn_state->pbn,
> > -						     false);
> > +			ret = drm_dp_mst_atomic_enable_dsc(state,
> > aconnector->port,
> > +							   dm_conn_state-
> > > pbn, false);
> > +			if (ret != 0)
> > +				return ret;
> > +
> >  			continue;
> >  		}
> > 
> > @@ -9523,10 +9526,9 @@ static int amdgpu_dm_atomic_check(struct
> > drm_device *dev,
> > 
> >  #if defined(CONFIG_DRM_AMD_DC_DCN)
> >  	if (dc_resource_is_dsc_encoding_supported(dc)) {
> > -		if (!pre_validate_dsc(state, &dm_state, vars)) {
> > -			ret = -EINVAL;
> > +		ret = pre_validate_dsc(state, &dm_state, vars);
> > +		if (ret != 0)
> >  			goto fail;
> > -		}
> >  	}
> >  #endif
> > 
> > @@ -9621,9 +9623,9 @@ static int amdgpu_dm_atomic_check(struct
> > drm_device *dev,
> >  		}
> > 
> >  #if defined(CONFIG_DRM_AMD_DC_DCN)
> > -		if (!compute_mst_dsc_configs_for_state(state, dm_state-
> > > context, vars)) {
> > +		ret = compute_mst_dsc_configs_for_state(state, dm_state-
> > > context, vars);
> > +		if (ret) {
> > 
> > 	DRM_DEBUG_DRIVER("compute_mst_dsc_configs_for_state()
> > failed\n");
> > -			ret = -EINVAL;
> >  			goto fail;
> >  		}
> > 
> > diff --git
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 6ff96b4bdda5c..30bc2e5058b70 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -864,25 +864,25 @@ static bool try_disable_dsc(struct
> > drm_atomic_state *state,
> >  	return true;
> >  }
> > 
> > -static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state
> > *state,
> > -					     struct dc_state *dc_state,
> > -					     struct dc_link *dc_link,
> > -					     struct dsc_mst_fairness_vars *vars,
> > -					     struct drm_dp_mst_topology_mgr
> > *mgr,
> > -					     int *link_vars_start_index)
> > +static int compute_mst_dsc_configs_for_link(struct drm_atomic_state
> > *state,
> > +					    struct dc_state *dc_state,
> > +					    struct dc_link *dc_link,
> > +					    struct dsc_mst_fairness_vars *vars,
> > +					    struct drm_dp_mst_topology_mgr
> > *mgr,
> > +					    int *link_vars_start_index)
> >  {
> >  	struct dc_stream_state *stream;
> >  	struct dsc_mst_fairness_params params[MAX_PIPES];
> >  	struct amdgpu_dm_connector *aconnector;
> >  	struct drm_dp_mst_topology_state *mst_state =
> > drm_atomic_get_mst_topology_state(state, mgr);
> >  	int count = 0;
> > -	int i, k;
> > +	int i, k, ret;
> >  	bool debugfs_overwrite = false;
> > 
> >  	memset(params, 0, sizeof(params));
> > 
> >  	if (IS_ERR(mst_state))
> > -		return false;
> > +		return PTR_ERR(mst_state);
> > 
> >  	mst_state->pbn_div = dm_mst_get_pbn_divider(dc_link);  #if
> > defined(CONFIG_DRM_AMD_DC_DCN) @@ -933,7 +933,7 @@ static bool
> > compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
> > 
> >  	if (count == 0) {
> >  		ASSERT(0);
> > -		return true;
> > +		return 0;
> >  	}
> > 
> >  	/* k is start index of vars for current phy link used by mst hub */ @@
> > -949,11 +949,14 @@ static bool compute_mst_dsc_configs_for_link(struct
> > drm_atomic_state *state,
> >  		vars[i + k].bpp_x16 = 0;
> >  		if (drm_dp_atomic_find_time_slots(state, params[i].port-
> > > mgr, params[i].port,
> >  						  vars[i + k].pbn) < 0)
> > -			return false;
> > +			return -EINVAL;
> 
> Should we also return the error code get from drm_dp_atomic_find_time_slots() rather than 
> assigning a new one here?

Yes we should, nice catch!

> 
> >  	}
> > -	if (!drm_dp_mst_atomic_check(state) && !debugfs_overwrite) {
> > +	ret = drm_dp_mst_atomic_check(state);
> > +	if (ret == 0 && !debugfs_overwrite) {
> >  		set_dsc_configs_from_fairness_vars(params, vars, count, k);
> > -		return true;
> > +		return 0;
> > +	} else if (ret == -EDEADLK) {
> > +		return ret;
> 
> I think we should return here whenever there is an error. Not just for EDEADLK case. 

sgtm


> 
> >  	}
> > 
> >  	/* Try max compression */
> > @@ -964,29 +967,30 @@ static bool
> > compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
> >  			vars[i + k].bpp_x16 =
> > params[i].bw_range.min_target_bpp_x16;
> >  			if (drm_dp_atomic_find_time_slots(state,
> > params[i].port->mgr,
> >  							  params[i].port, vars[i
> > + k].pbn) < 0)
> > -				return false;
> > +				return -EINVAL;
> 
> Same as above.
> 
> >  		} else {
> >  			vars[i + k].pbn =
> > kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> >  			vars[i + k].dsc_enabled = false;
> >  			vars[i + k].bpp_x16 = 0;
> >  			if (drm_dp_atomic_find_time_slots(state,
> > params[i].port->mgr,
> >  							  params[i].port, vars[i
> > + k].pbn) < 0)
> > -				return false;
> > +				return -EINVAL;
> 
> Same as above.
> 
> >  		}
> >  	}
> > -	if (drm_dp_mst_atomic_check(state))
> > -		return false;
> > +	ret = drm_dp_mst_atomic_check(state);
> > +	if (ret != 0)
> > +		return ret;
> > 
> >  	/* Optimize degree of compression */
> >  	if (!increase_dsc_bpp(state, mst_state, dc_link, params, vars, count,
> > k))
> > -		return false;
> > +		return -ENOSPC;
> > 
> >  	if (!try_disable_dsc(state, dc_link, params, vars, count, k))
> > -		return false;
> > +		return -ENOSPC;
> > 
> >  	set_dsc_configs_from_fairness_vars(params, vars, count, k);
> > 
> > -	return true;
> > +	return 0;
> >  }
> > 
> >  static bool is_dsc_need_re_compute(
> > @@ -1087,15 +1091,16 @@ static bool is_dsc_need_re_compute(
> >  	return is_dsc_need_re_compute;
> >  }
> > 
> > -bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > -				       struct dc_state *dc_state,
> > -				       struct dsc_mst_fairness_vars *vars)
> > +int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > +				      struct dc_state *dc_state,
> > +				      struct dsc_mst_fairness_vars *vars)
> >  {
> >  	int i, j;
> >  	struct dc_stream_state *stream;
> >  	bool computed_streams[MAX_PIPES];
> >  	struct amdgpu_dm_connector *aconnector;
> >  	int link_vars_start_index = 0;
> > +	int ret = 0;
> > 
> >  	for (i = 0; i < dc_state->stream_count; i++)
> >  		computed_streams[i] = false;
> > @@ -1118,17 +1123,19 @@ bool compute_mst_dsc_configs_for_state(struct
> > drm_atomic_state *state,
> >  			continue;
> > 
> >  		if (dcn20_remove_stream_from_ctx(stream->ctx->dc,
> > dc_state, stream) != DC_OK)
> > -			return false;
> > +			return -EINVAL;
> > 
> >  		if (!is_dsc_need_re_compute(state, dc_state, stream->link))
> >  			continue;
> > 
> >  		mutex_lock(&aconnector->mst_mgr.lock);
> > -		if (!compute_mst_dsc_configs_for_link(state, dc_state,
> > stream->link, vars,
> > -						      &aconnector->mst_mgr,
> > -						      &link_vars_start_index)) {
> > +
> > +		ret = compute_mst_dsc_configs_for_link(state, dc_state,
> > stream->link, vars,
> > +						       &aconnector->mst_mgr,
> > +						       &link_vars_start_index);
> > +		if (ret != 0) {
> >  			mutex_unlock(&aconnector->mst_mgr.lock);
> > -			return false;
> > +			return ret;
> >  		}
> >  		mutex_unlock(&aconnector->mst_mgr.lock);
> > 
> > @@ -1143,22 +1150,22 @@ bool compute_mst_dsc_configs_for_state(struct
> > drm_atomic_state *state,
> > 
> >  		if (stream->timing.flags.DSC == 1)
> >  			if (dc_stream_add_dsc_to_resource(stream->ctx-
> > > dc, dc_state, stream) != DC_OK)
> > -				return false;
> > +				return -EINVAL;
> >  	}
> > 
> > -	return true;
> > +	return ret;
> >  }
> > 
> > -static bool
> > -	pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state
> > *state,
> > -					      struct dc_state *dc_state,
> > -					      struct dsc_mst_fairness_vars
> > *vars)
> > +static int pre_compute_mst_dsc_configs_for_state(struct
> > drm_atomic_state *state,
> > +						 struct dc_state *dc_state,
> > +						 struct dsc_mst_fairness_vars
> > *vars)
> >  {
> >  	int i, j;
> >  	struct dc_stream_state *stream;
> >  	bool computed_streams[MAX_PIPES];
> >  	struct amdgpu_dm_connector *aconnector;
> >  	int link_vars_start_index = 0;
> > +	int ret;
> > 
> >  	for (i = 0; i < dc_state->stream_count; i++)
> >  		computed_streams[i] = false;
> > @@ -1184,13 +1191,12 @@ static bool
> >  			continue;
> > 
> >  		mutex_lock(&aconnector->mst_mgr.lock);
> > -		if (!compute_mst_dsc_configs_for_link(state, dc_state,
> > stream->link, vars,
> > -						      &aconnector->mst_mgr,
> > -						      &link_vars_start_index)) {
> > -			mutex_unlock(&aconnector->mst_mgr.lock);
> > -			return false;
> > -		}
> > +		ret = compute_mst_dsc_configs_for_link(state, dc_state,
> > stream->link, vars,
> > +						       &aconnector->mst_mgr,
> > +						       &link_vars_start_index);
> >  		mutex_unlock(&aconnector->mst_mgr.lock);
> > +		if (ret != 0)
> > +			return ret;
> > 
> >  		for (j = 0; j < dc_state->stream_count; j++) {
> >  			if (dc_state->streams[j]->link == stream->link) @@ -
> > 1198,7 +1204,7 @@ static bool
> >  		}
> >  	}
> > 
> > -	return true;
> > +	return ret;
> >  }
> > 
> >  static int find_crtc_index_in_state_by_stream(struct drm_atomic_state
> > *state, @@ -1253,9 +1259,9 @@ static bool
> > is_dsc_precompute_needed(struct drm_atomic_state *state)
> >  	return ret;
> >  }
> > 
> > -bool pre_validate_dsc(struct drm_atomic_state *state,
> > -		      struct dm_atomic_state **dm_state_ptr,
> > -		      struct dsc_mst_fairness_vars *vars)
> > +int pre_validate_dsc(struct drm_atomic_state *state,
> > +		     struct dm_atomic_state **dm_state_ptr,
> > +		     struct dsc_mst_fairness_vars *vars)
> >  {
> >  	int i;
> >  	struct dm_atomic_state *dm_state;
> > @@ -1264,11 +1270,12 @@ bool pre_validate_dsc(struct drm_atomic_state
> > *state,
> > 
> >  	if (!is_dsc_precompute_needed(state)) {
> >  		DRM_INFO_ONCE("DSC precompute is not needed.\n");
> > -		return true;
> > +		return 0;
> >  	}
> > -	if (dm_atomic_get_state(state, dm_state_ptr)) {
> > +	ret = dm_atomic_get_state(state, dm_state_ptr);
> > +	if (ret != 0) {
> >  		DRM_INFO_ONCE("dm_atomic_get_state() failed\n");
> > -		return false;
> > +		return ret;
> >  	}
> >  	dm_state = *dm_state_ptr;
> > 
> > @@ -1280,7 +1287,7 @@ bool pre_validate_dsc(struct drm_atomic_state
> > *state,
> > 
> >  	local_dc_state = kmemdup(dm_state->context, sizeof(struct
> > dc_state), GFP_KERNEL);
> >  	if (!local_dc_state)
> > -		return false;
> > +		return -ENOMEM;
> > 
> >  	for (i = 0; i < local_dc_state->stream_count; i++) {
> >  		struct dc_stream_state *stream = dm_state->context-
> > > streams[i]; @@ -1316,9 +1323,9 @@ bool pre_validate_dsc(struct
> > drm_atomic_state *state,
> >  	if (ret != 0)
> >  		goto clean_exit;
> > 
> > -	if (!pre_compute_mst_dsc_configs_for_state(state, local_dc_state,
> > vars)) {
> > +	ret = pre_compute_mst_dsc_configs_for_state(state, local_dc_state,
> > vars);
> > +	if (ret != 0) {
> > 
> > 	DRM_INFO_ONCE("pre_compute_mst_dsc_configs_for_state()
> > failed\n");
> > -		ret = -EINVAL;
> >  		goto clean_exit;
> >  	}
> > 
> > @@ -1349,7 +1356,7 @@ bool pre_validate_dsc(struct drm_atomic_state
> > *state,
> > 
> >  	kfree(local_dc_state);
> > 
> > -	return (ret == 0);
> > +	return ret;
> >  }
> > 
> >  static unsigned int kbps_from_pbn(unsigned int pbn) diff --git
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > index b92a7c5671aa2..97fd70df531bf 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > +++
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> > @@ -53,15 +53,15 @@ struct dsc_mst_fairness_vars {
> >  	struct amdgpu_dm_connector *aconnector;  };
> > 
> > -bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > -				       struct dc_state *dc_state,
> > -				       struct dsc_mst_fairness_vars *vars);
> > +int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> > +				      struct dc_state *dc_state,
> > +				      struct dsc_mst_fairness_vars *vars);
> > 
> >  bool needs_dsc_aux_workaround(struct dc_link *link);
> > 
> > -bool pre_validate_dsc(struct drm_atomic_state *state,
> > -		      struct dm_atomic_state **dm_state_ptr,
> > -		      struct dsc_mst_fairness_vars *vars);
> > +int pre_validate_dsc(struct drm_atomic_state *state,
> > +		     struct dm_atomic_state **dm_state_ptr,
> > +		     struct dsc_mst_fairness_vars *vars);
> > 
> >  enum dc_status dm_dp_mst_is_port_support_mode(
> >  	struct amdgpu_dm_connector *aconnector,
> > --
> > 2.37.3
> ---
> Regards,
> Wayne Lin
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

