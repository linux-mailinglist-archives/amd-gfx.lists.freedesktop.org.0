Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505EA37CAB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Feb 2025 09:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B2F10E394;
	Mon, 17 Feb 2025 08:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="pZvJP2Qb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Fri, 14 Feb 2025 21:20:46 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C210E08A
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Feb 2025 21:20:46 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id BD988240027
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Feb 2025 22:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1739567711; bh=fB11n5wO9tlUqyYIDC5H0rUx5EE3fZ7xtNTxlKauKn4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 Content-Transfer-Encoding:From;
 b=pZvJP2QbKM7i4ws6csGOZjXa+uwTEWOWDAhejy+YQ8lIOnYGqUfxiqvY5nfpHU/ks
 41Wu9QTjAKs5ZCK9Fg4hFLvhnsK+Z7L9zbnmxBn58Oe3EG7L5SaL02RBXjKFn8IKrg
 YdombZvuxCq9VR6md3reVLZ5nvj7KtbvF7/lxCg1JfJXjL1MY5jJwyYN61niLdl4ST
 ckj2xfKLE4XhMycHj7u+9DTWmOu0bhQhJcWw9Dx7fYLEfSTuEcgoJ7L9Mrg/OFUypl
 2Z5vGXD10a4KokKVT+z7+4aeqcZDiQ9NBpdbvbdnfoK4h8Pl+1tFyTd40BTHrbRYMY
 w/uf2yjWf3UkQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4YvlFB6T5Mz9rxB
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Feb 2025 22:15:10 +0100 (CET)
Message-ID: <416da75f-8de9-48bd-bc4e-50b586c23426@posteo.de>
Date: Fri, 14 Feb 2025 21:15:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 12/16] drm/amd/display: Support BT2020 YCbCr fullrange
To: amd-gfx@lists.freedesktop.org
References: <20250214150033.767978-1-Roman.Li@amd.com>
 <20250214150033.767978-13-Roman.Li@amd.com>
Content-Language: en-US
From: Robert Mader <robert.mader@posteo.de>
In-Reply-To: <20250214150033.767978-13-Roman.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 17 Feb 2025 08:02:00 +0000
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

Thanks a lot for the patch!

Small commit title nit, sorry for spotting this earlier: this commit 
adds BT2020 *limited* range - full range was already supported, see the 
changes in amdgpu_dm.c and dpp.h.

On 14.02.25 16:00, Roman.Li@amd.com wrote:
> From: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
>
> [Why/How]
> Need to add support for full-range quantization for YCbCr in BT2020
> color space.
>
> Reviewed-by: Krunoslav Kovac <krunoslav.kovac@amd.com>
> Signed-off-by: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
> Signed-off-by: Roman Li <roman.li@amd.com>
> Tested-by: Robert Mader <robert.mader@collabora.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 6 +++---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/basics/dc_common.c           | 3 ++-
>   drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c       | 5 +++--
>   drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 4 ++--
>   drivers/gpu/drm/amd/display/dc/dc_hw_types.h                | 4 +++-
>   drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c     | 3 ++-
>   .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c | 3 ++-
>   .../amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c   | 3 ++-
>   .../amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c  | 3 ++-
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h                 | 6 +++++-
>   .../gpu/drm/amd/display/modules/info_packet/info_packet.c   | 4 ++--
>   12 files changed, 29 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b1b5f352b9aa..4ae54b3573ba 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5616,9 +5616,9 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
>   
>   	case DRM_COLOR_YCBCR_BT2020:
>   		if (full_range)
> -			*color_space = COLOR_SPACE_2020_YCBCR;
> +			*color_space = COLOR_SPACE_2020_YCBCR_FULL;
>   		else
> -			return -EINVAL;
> +			*color_space = COLOR_SPACE_2020_YCBCR_LIMITED;
>   		break;
>   
>   	default:
> @@ -6114,7 +6114,7 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>   		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
>   			color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>   		else
> -			color_space = COLOR_SPACE_2020_YCBCR;
> +			color_space = COLOR_SPACE_2020_YCBCR_LIMITED;
>   		break;
>   	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
>   	default:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 049046c60462..c7d13e743e6c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1169,7 +1169,7 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
>   	case COLOR_SPACE_2020_RGB_FULLRANGE:
>   		seq_puts(m, "BT2020_RGB");
>   		break;
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
>   		seq_puts(m, "BT2020_YCC");
>   		break;
>   	default:
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/dc_common.c b/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
> index b2fc4f8e6482..a51c2701da24 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/dc_common.c
> @@ -40,7 +40,8 @@ bool is_rgb_cspace(enum dc_color_space output_color_space)
>   	case COLOR_SPACE_YCBCR709:
>   	case COLOR_SPACE_YCBCR601_LIMITED:
>   	case COLOR_SPACE_YCBCR709_LIMITED:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
> +	case COLOR_SPACE_2020_YCBCR_FULL:
>   		return false;
>   	default:
>   		/* Add a case to switch */
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> index 6eb9bae3af91..6b514fd03f16 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> @@ -176,7 +176,7 @@ static bool is_ycbcr2020_type(
>   {
>   	bool ret = false;
>   
> -	if (color_space == COLOR_SPACE_2020_YCBCR)
> +	if (color_space == COLOR_SPACE_2020_YCBCR_LIMITED || color_space == COLOR_SPACE_2020_YCBCR_FULL)
>   		ret = true;
>   	return ret;
>   }
> @@ -247,7 +247,8 @@ void color_space_to_black_color(
>   	case COLOR_SPACE_YCBCR709_BLACK:
>   	case COLOR_SPACE_YCBCR601_LIMITED:
>   	case COLOR_SPACE_YCBCR709_LIMITED:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
> +	case COLOR_SPACE_2020_YCBCR_FULL:
>   		*black_color = black_color_format[BLACK_COLOR_FORMAT_YUV_CV];
>   		break;
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index e6bc479497e8..7eb91612b60d 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -4488,7 +4488,7 @@ static void set_avi_info_frame(
>   		break;
>   	case COLOR_SPACE_2020_RGB_FULLRANGE:
>   	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
>   		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_BT2020RGBYCBCR;
>   		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
>   		break;
> @@ -4502,7 +4502,7 @@ static void set_avi_info_frame(
>   		break;
>   	}
>   
> -	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR &&
> +	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR_LIMITED &&
>   			stream->out_transfer_func.tf == TRANSFER_FUNCTION_GAMMA22) {
>   		hdmi_info.bits.EC0_EC2 = 0;
>   		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU709;
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
> index 5ac55601a6da..9f3dd8824ed5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
> @@ -653,7 +653,8 @@ enum dc_color_space {
>   	COLOR_SPACE_YCBCR709_LIMITED,
>   	COLOR_SPACE_2020_RGB_FULLRANGE,
>   	COLOR_SPACE_2020_RGB_LIMITEDRANGE,
> -	COLOR_SPACE_2020_YCBCR,
> +	COLOR_SPACE_2020_YCBCR_LIMITED,
> +	COLOR_SPACE_2020_YCBCR_FULL,
>   	COLOR_SPACE_ADOBERGB,
>   	COLOR_SPACE_DCIP3,
>   	COLOR_SPACE_DISPLAYNATIVE,
> @@ -661,6 +662,7 @@ enum dc_color_space {
>   	COLOR_SPACE_APPCTRL,
>   	COLOR_SPACE_CUSTOMPOINTS,
>   	COLOR_SPACE_YCBCR709_BLACK,
> +	COLOR_SPACE_2020_YCBCR = COLOR_SPACE_2020_YCBCR_LIMITED,
>   };
>   
>   enum dc_dither_option {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> index d199e4ed2e59..1130d7619b26 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
> @@ -418,7 +418,7 @@ static void dce110_stream_encoder_dp_set_stream_attribute(
>   			dynamic_range_rgb = 1; /*limited range*/
>   			break;
>   		case COLOR_SPACE_2020_RGB_FULLRANGE:
> -		case COLOR_SPACE_2020_YCBCR:
> +		case COLOR_SPACE_2020_YCBCR_LIMITED:
>   		case COLOR_SPACE_XR_RGB:
>   		case COLOR_SPACE_MSREF_SCRGB:
>   		case COLOR_SPACE_ADOBERGB:
> @@ -430,6 +430,7 @@ static void dce110_stream_encoder_dp_set_stream_attribute(
>   		case COLOR_SPACE_APPCTRL:
>   		case COLOR_SPACE_CUSTOMPOINTS:
>   		case COLOR_SPACE_UNKNOWN:
> +		default:
>   			/* do nothing */
>   			break;
>   		}
> diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
> index d01a8b8f9595..22e66b375a7f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
> @@ -391,7 +391,7 @@ void enc1_stream_encoder_dp_set_stream_attribute(
>   		break;
>   	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
>   	case COLOR_SPACE_2020_RGB_FULLRANGE:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
>   	case COLOR_SPACE_XR_RGB:
>   	case COLOR_SPACE_MSREF_SCRGB:
>   	case COLOR_SPACE_ADOBERGB:
> @@ -404,6 +404,7 @@ void enc1_stream_encoder_dp_set_stream_attribute(
>   	case COLOR_SPACE_CUSTOMPOINTS:
>   	case COLOR_SPACE_UNKNOWN:
>   	case COLOR_SPACE_YCBCR709_BLACK:
> +	default:
>   		/* do nothing */
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
> index 334fb5e2c003..4bab180e1938 100644
> --- a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
> @@ -632,7 +632,7 @@ void enc401_stream_encoder_dp_set_stream_attribute(
>   		break;
>   	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
>   	case COLOR_SPACE_2020_RGB_FULLRANGE:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
>   	case COLOR_SPACE_XR_RGB:
>   	case COLOR_SPACE_MSREF_SCRGB:
>   	case COLOR_SPACE_ADOBERGB:
> @@ -645,6 +645,7 @@ void enc401_stream_encoder_dp_set_stream_attribute(
>   	case COLOR_SPACE_CUSTOMPOINTS:
>   	case COLOR_SPACE_UNKNOWN:
>   	case COLOR_SPACE_YCBCR709_BLACK:
> +	default:
>   		/* do nothing */
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
> index 678db949cfe3..759b453385c4 100644
> --- a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
> @@ -323,7 +323,7 @@ static void dcn31_hpo_dp_stream_enc_set_stream_attribute(
>   		break;
>   	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
>   	case COLOR_SPACE_2020_RGB_FULLRANGE:
> -	case COLOR_SPACE_2020_YCBCR:
> +	case COLOR_SPACE_2020_YCBCR_LIMITED:
>   	case COLOR_SPACE_XR_RGB:
>   	case COLOR_SPACE_MSREF_SCRGB:
>   	case COLOR_SPACE_ADOBERGB:
> @@ -336,6 +336,7 @@ static void dcn31_hpo_dp_stream_enc_set_stream_attribute(
>   	case COLOR_SPACE_CUSTOMPOINTS:
>   	case COLOR_SPACE_UNKNOWN:
>   	case COLOR_SPACE_YCBCR709_BLACK:
> +	default:
>   		/* do nothing */
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> index 0150f2581ee4..0c5675d1c593 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> @@ -119,10 +119,14 @@ static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] =
>   		{ 0x39a6, 0x2568, 0,      0xe0d6,
>   		  0xeedd, 0x2568, 0xf925, 0x9a8,
>   		  0,      0x2568, 0x43ee, 0xdbb2 } },
> -	{ COLOR_SPACE_2020_YCBCR,
> +	{ COLOR_SPACE_2020_YCBCR_FULL,
>   		{ 0x2F30, 0x2000, 0,      0xE869,
>   		  0xEDB7, 0x2000, 0xFABC, 0xBC6,
>   		  0,      0x2000, 0x3C34, 0xE1E6 } },
> +	{ COLOR_SPACE_2020_YCBCR_LIMITED,
> +		{ 0x35B9, 0x2543, 0,      0xE2B2,
> +		  0xEB2F, 0x2543, 0xFA01, 0x0B1F,
> +		  0,      0x2543, 0x4489, 0xDB42 } },
>   	{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
>   		{ 0x35E0, 0x255F, 0,      0xE2B3,
>   		  0xEB20, 0x255F, 0xF9FD, 0xB1E,
> diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> index a344e2e49b0e..b3d55cac3569 100644
> --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> @@ -383,10 +383,10 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
>   				colorimetryFormat = ColorimetryYCC_DP_ITU709;
>   			else if (cs == COLOR_SPACE_ADOBERGB)
>   				colorimetryFormat = ColorimetryYCC_DP_AdobeYCC;
> -			else if (cs == COLOR_SPACE_2020_YCBCR)
> +			else if (cs == COLOR_SPACE_2020_YCBCR_LIMITED)
>   				colorimetryFormat = ColorimetryYCC_DP_ITU2020YCbCr;
>   
> -			if (cs == COLOR_SPACE_2020_YCBCR && tf == TRANSFER_FUNC_GAMMA_22)
> +			if (cs == COLOR_SPACE_2020_YCBCR_LIMITED && tf == TRANSFER_FUNC_GAMMA_22)
>   				colorimetryFormat = ColorimetryYCC_DP_ITU709;
>   			break;
>   
