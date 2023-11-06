Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37E7E2C3E
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Nov 2023 19:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86E410E3BF;
	Mon,  6 Nov 2023 18:46:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873210E3AB;
 Mon,  6 Nov 2023 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ek+4F7J7Mk3BtUTbVzvnULJL2UXDYC7qnurmKj3yZbQ=; b=iuQy/YSb33Y5QG0A/ShNcPy1+x
 zXgPQTi5hL6xHscwY78f0DFx/B9r2mCTZDvVji7bAZdgdCbMcEwdOrzHKk3MSlXF4c6O45nYgqWXR
 XM9DPxxxjkHiqjuUt2mHDSyGhlJ54YgUPPJuN+8aXsBZHeVgvJKtWTDfJa8N1N8lAHNUC2dGClidU
 ZjW6lkURhE8yIURex70DFofiNkQRkUxaImLe/m5rXzbeBy5K83rRF/kpr+2SFlYQ6Ct/qpS8oRCRf
 52TpuiPiOOPTGx8TYiNWtGY/TW75qylAwwBAThyLh+0nWXj0wbl5kt1Cy0IbjkiahYCQS5h4P1YlK
 0GTG2wJQ==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r04cO-0007JS-0L; Mon, 06 Nov 2023 19:46:36 +0100
Date: Mon, 6 Nov 2023 17:46:11 -0100
From: Melissa Wen <mwen@igalia.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v4 09/32] drm/amd/display: add plane 3D LUT
 driver-specific properties
Message-ID: <20231106184611.j5ufxr732glcdetn@mail.igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
 <20231005171527.203657-10-mwen@igalia.com>
 <20231006090948.GA400742@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006090948.GA400742@toolbox>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 airlied@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 10/06, Sebastian Wick wrote:
> On Thu, Oct 05, 2023 at 04:15:04PM -0100, Melissa Wen wrote:
> > Add 3D LUT property for plane color transformations using a 3D lookup
> > table. 3D LUT allows for highly accurate and complex color
> > transformations and is suitable to adjust the balance between color
> > channels. It's also more complex to manage and require more
> > computational resources.
> > 
> > Since a 3D LUT has a limited number of entries in each dimension we want
> > to use them in an optimal fashion. This means using the 3D LUT in a
> > colorspace that is optimized for human vision, such as sRGB, PQ, or
> > another non-linear space. Therefore, userpace may need one 1D LUT
> > (shaper) before it to delinearize content and another 1D LUT after 3D
> > LUT (blend) to linearize content again for blending. The next patches
> > add these 1D LUTs to the plane color mgmt pipeline.
> > 
> > v3:
> > - improve commit message about 3D LUT
> > - describe the 3D LUT entries and size (Harry)
> > 
> > v4:
> > - advertise 3D LUT max size as the size of a single-dimension
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 18 +++++++++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
> >  4 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > index 62044d41da75..f7adaa52c23f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -363,6 +363,24 @@ struct amdgpu_mode_info {
> >  	 * @plane_hdr_mult_property:
> >  	 */
> >  	struct drm_property *plane_hdr_mult_property;
> > +	/**
> > +	 * @plane_lut3d_property: Plane property for color transformation using
> > +	 * a 3D LUT (pre-blending), a three-dimensional array where each
> > +	 * element is an RGB triplet. Each dimension has a size of the cubed
> > +	 * root of lut3d_size. The array contains samples from the approximated
> 
> This should be "Each dimension has a size of lut3d_size" now.

You're right. Thanks for pointed it out.

> 
> > +	 * function. On AMD, values between samples are estimated by
> > +	 * tetrahedral interpolation. The array is accessed with three indices,
> > +	 * one for each input dimension (color channel), blue being the
> > +	 * outermost dimension, red the innermost.
> > +	 */
> > +	struct drm_property *plane_lut3d_property;
> > +	/**
> > +	 * @plane_degamma_lut_size_property: Plane property to define the max
> > +	 * size of 3D LUT as supported by the driver (read-only). The max size
> > +	 * is the max size of one dimension and, therefore, the max number of
> > +	 * entries for 3D LUT array is the 3D LUT size cubed;
> > +	 */
> > +	struct drm_property *plane_lut3d_size_property;
> >  };
> >  
> >  #define AMDGPU_MAX_BL_LEVEL 0xFF
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index bb2ce843369d..7a2350c62cf1 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -784,6 +784,11 @@ struct dm_plane_state {
> >  	 * TF is needed for any subsequent linear-to-non-linear transforms.
> >  	 */
> >  	__u64 hdr_mult;
> > +	/**
> > +	 * @lut3d: 3D lookup table blob. The blob (if not NULL) is an array of
> > +	 * &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *lut3d;
> >  };
> >  
> >  struct dm_crtc_state {
> > @@ -869,6 +874,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >  
> >  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
> >  
> > +/* 3D LUT max size is 17x17x17 (4913 entries) */
> > +#define MAX_COLOR_3DLUT_SIZE 17
> > +#define MAX_COLOR_3DLUT_BITDEPTH 12
> > +/* 1D LUT size */
> >  #define MAX_COLOR_LUT_ENTRIES 4096
> >  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
> >  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index caf49a044ab4..011f2f9ec890 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -230,6 +230,20 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_hdr_mult_property = prop;
> >  
> > +	prop = drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_PLANE_LUT3D", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_lut3d_property = prop;
> > +
> > +	prop = drm_property_create_range(adev_to_drm(adev),
> > +					 DRM_MODE_PROP_IMMUTABLE,
> > +					 "AMD_PLANE_LUT3D_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_lut3d_size_property = prop;
> > +
> >  	return 0;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index ae64d4b73360..068798ffdd56 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1359,6 +1359,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_get(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->lut3d)
> > +		drm_property_blob_get(dm_plane_state->lut3d);
> >  
> >  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> >  	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
> > @@ -1432,6 +1434,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
> >  
> >  	if (dm_plane_state->degamma_lut)
> >  		drm_property_blob_put(dm_plane_state->degamma_lut);
> > +	if (dm_plane_state->lut3d)
> > +		drm_property_blob_put(dm_plane_state->lut3d);
> >  
> >  	if (dm_plane_state->dc_state)
> >  		dc_plane_state_release(dm_plane_state->dc_state);
> > @@ -1462,6 +1466,14 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
> >  	drm_object_attach_property(&plane->base,
> >  				   dm->adev->mode_info.plane_hdr_mult_property,
> >  				   AMDGPU_HDR_MULT_DEFAULT);
> > +
> > +	if (dpp_color_caps.hw_3d_lut) {
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_lut3d_property, 0);
> > +		drm_object_attach_property(&plane->base,
> > +					   mode_info.plane_lut3d_size_property,
> > +					   MAX_COLOR_3DLUT_SIZE);
> > +	}
> >  }
> >  
> >  static int
> > @@ -1493,6 +1505,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
> >  			dm_plane_state->hdr_mult = val;
> >  			dm_plane_state->base.color_mgmt_changed = 1;
> >  		}
> > +	} else if (property == adev->mode_info.plane_lut3d_property) {
> > +		ret = drm_property_replace_blob_from_id(plane->dev,
> > +							&dm_plane_state->lut3d,
> > +							val, -1,
> > +							sizeof(struct drm_color_lut),
> > +							&replaced);
> > +		dm_plane_state->base.color_mgmt_changed |= replaced;
> > +		return ret;
> >  	} else {
> >  		drm_dbg_atomic(plane->dev,
> >  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> > @@ -1520,6 +1540,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
> >  		*val = dm_plane_state->degamma_tf;
> >  	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> >  		*val = dm_plane_state->hdr_mult;
> > +	} else 	if (property == adev->mode_info.plane_lut3d_property) {
> > +		*val = (dm_plane_state->lut3d) ?
> > +			dm_plane_state->lut3d->base.id : 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > -- 
> > 2.40.1
> > 
> 
