Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E015A6E304
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Mar 2025 20:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7AB10E4BF;
	Mon, 24 Mar 2025 19:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wha4DXDp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDD710E4BF
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 19:03:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-223f7b10cbbso9812775ad.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Mar 2025 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742842999; x=1743447799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lFh7VJkfVFIO21sVlmHB25GbzknsuXLRFdOHSgRTZ8=;
 b=Wha4DXDp6kTusciIo6THGDXX8f7D0M9Xgxnbo1aBNf+XlSttu4IcE9Ys59nwAGQ59W
 KEXcIuu4fQV4m1Qj89W7ngCJfVecFuqmZxpbMBP/sSWgfQOHwzt0Dv4hmVP4td+Ht7KO
 fOaANgHQmVAGmORZ27rrCg5OxxSg+hgKUt+PCPyle8RV3dwaSk8asM3PARpG1rnJlstb
 YUS9iIbG6udiLoUHkGMn/qLjNZ2GcQ61PJnFCVaCcnJKvhalUoD2guCucRNmLGzHwxpZ
 IYBBFqLB2Vk7+umhF6TYkhvfhTZBw60E8Pj7pobYmasZtmvTiQN0Iac2ViS00O1DGItl
 aNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742842999; x=1743447799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lFh7VJkfVFIO21sVlmHB25GbzknsuXLRFdOHSgRTZ8=;
 b=g9d+CGat1KAf2gjU+ijjpJRbS1Kx10x0U2GdjJQIuAxFZbNEB3oZd6pe4BNZLr7klc
 XQsDPmLLzdpkOimyX0/CfEbnnueUEcFWenosPJsr3LIJG4rM4V0FBwYn6ODPhgm9KDyI
 uX/jBpMHzQ9v4N+nzkLlTmBgE51Wz79ezbjwzpd8Xy15CG4ksJcPtqXoT3qmNDkJJ1Qb
 9pLuqvrUAP87yDAvFbCQmNUCtWWgrw7nOH4LnMLJaj5gFQgiHJl6JjyERbw1iU8d7Iuf
 sF7SX4KEFaF0utz3vxHAaI3OZCcT9+EpY3YS7VnRS/ef9ZDjIFl6T9m9JUxnMEasX8KO
 wKQg==
X-Gm-Message-State: AOJu0YyOKYIZKwuBp49+KqX6iYC3d4x2s8cDDRba/eOflVXwfO/1vcd6
 RWeaJaWqq5lghs5RG5lB7N+Yysis3UD18XT9yF/5qE7omXpo0+7nI3gqzQtM/wXQgTq8hSebtMV
 9dUeAKlznkqmbHJM/vltg9/hbXOiG9g==
X-Gm-Gg: ASbGncsmNCFdJUsqxHXB543v18RCVlsEkhqerYk6YV48BpVDnt+lewdSHe24Y6bo9rP
 4TzxArjlv+o9HE10XVoFfcd33chlj5C9A1yj3PLUElQJNkkdhpzU3i9IZfMLZpu86nD8Qn4HQHT
 yU6aNg5Lj//tYo8ZDIEwU5Tb3e/A==
X-Google-Smtp-Source: AGHT+IGEufL+OTBm7EsaWiTNUVr6U+xisp3E1TXk/TcZxB6Qohy6+a5o8zZKUuF7Q/2AaVfY9Utq1q8YqQjfCINtCFs=
X-Received: by 2002:a17:902:d4c7:b0:224:1ed8:40e9 with SMTP id
 d9443c01a7336-227e29bddc7mr619505ad.13.1742842998600; Mon, 24 Mar 2025
 12:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250322014700.62356-1-alexandre.f.demers@gmail.com>
 <20250322014700.62356-11-alexandre.f.demers@gmail.com>
In-Reply-To: <20250322014700.62356-11-alexandre.f.demers@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Mar 2025 15:03:07 -0400
X-Gm-Features: AQ5f1Jq7NEwmmvflhvYcObmRcKDJWHLEVVUBfGqIoLspWqHdeWTurGFqler3hXI
Message-ID: <CADnq5_OcH-RHe1H=dwnCnD4qC21_9hFv0cJxOQEP=j3PEM=Pyg@mail.gmail.com>
Subject: Re: [PATCH 10/18] drm/amdgpu: add missing SMU6 defines,
 shifts and masks
To: Alexandre Demers <alexandre.f.demers@gmail.com>
Cc: amd-gfx@lists.freedesktop.org
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 21, 2025 at 9:48=E2=80=AFPM Alexandre Demers
<alexandre.f.demers@gmail.com> wrote:
>
> They will be used later when switching away from sid.h/si_enums.h.
>
> To prevent redefinition clashes, comment out the ones in sid.h. They will=
 be
> removed later.
>
> Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> ---
>  .../drm/amd/include/asic_reg/smu/smu_6_0_d.h  |  44 ++++
>  .../include/asic_reg/smu/smu_6_0_sh_mask.h    | 190 +++++++++++++++++-
>  2 files changed, 230 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h b/drive=
rs/gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h
> index 6b10be61efc3..6e2459905abb 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h
> @@ -41,7 +41,49 @@
>  #define ixLCAC_MC5_CNTL 0x012B
>  #define ixLCAC_MC5_OVR_SEL 0x012C
>  #define ixLCAC_MC5_OVR_VAL 0x012D
> +
> +#define CG_SPLL_FUNC_CNTL                              0x0180
> +#define CG_SPLL_FUNC_CNTL_2                            0x0181
> +#define CG_SPLL_FUNC_CNTL_3                            0x0182
> +#define CG_SPLL_FUNC_CNTL_4                            0x0183
> +#define CG_SPLL_STATUS                                 0x0185
> +#define SPLL_CNTL_MODE                                 0x0186
> +#define CG_SPLL_SPREAD_SPECTRUM                                0x0188
> +#define CG_SPLL_SPREAD_SPECTRUM_2                      0x0189
> +#define CG_SPLL_AUTOSCALE_CNTL                         0x018B
> +#define MPLL_BYPASSCLK_SEL                             0x0197
> +#define CG_CLKPIN_CNTL                                    0x0198
> +#define CG_CLKPIN_CNTL_2                                  0x0199
> +#define THM_CLK_CNTL                                   0x019B
> +#define MISC_CLK_CNTL                                  0x019C
> +#define CG_THERMAL_CTRL                                        0x01C0
> +#define CG_THERMAL_STATUS                              0x01C1
> +#define CG_THERMAL_INT                                 0x01C2
> +#define CG_MULT_THERMAL_CTRL                                   0x01C4
> +#define CG_MULT_THERMAL_STATUS                                 0x01C5
> +#define CG_FDO_CTRL0                                   0x01D5
> +#define CG_FDO_CTRL1                                   0x01D6
> +#define CG_FDO_CTRL2                                   0x01D7
> +#define CG_TACH_CTRL                                    0x01DC
> +#define CG_TACH_STATUS                                  0x01DD
> +#define GENERAL_PWRMGT                                  0x1E0
> +#define CG_TPC                                            0x1E1
> +#define SCLK_PWRMGT_CNTL                                  0x1E2
> +#define TARGET_AND_CURRENT_PROFILE_INDEX                  0x01E6
> +#define CG_FTV                                            0x01EF
> +#define CG_FFCT_0                                         0x01F0
> +#define CG_BSP                                          0x01FF
> +#define CG_AT                                           0x0200
> +#define CG_GIT                                          0x0201
> +#define CG_SSP                                            0x0203
> +#define CG_DISPLAY_GAP_CNTL                               0x020A
> +#define CG_ULV_CONTROL                                 0x021E
> +#define CG_ULV_PARAMETER                               0x021F
> +#define SMC_SCRATCH0                                   0x0221
> +#define CG_CAC_CTRL                                    0x022E

These should be prefixed with mm since they are direct access memory
mapped registers.

Alex

> +
>  #define ixSMC_PC_C 0x80000370
> +
>  #define ixTHM_TMON0_DEBUG 0x03F0
>  #define ixTHM_TMON0_INT_DATA 0x0380
>  #define ixTHM_TMON0_RDIL0_DATA 0x0300
> @@ -110,6 +152,7 @@
>  #define ixTHM_TMON1_RDIR7_DATA 0x0337
>  #define ixTHM_TMON1_RDIR8_DATA 0x0338
>  #define ixTHM_TMON1_RDIR9_DATA 0x0339
> +
>  #define mmGPIOPAD_A 0x05E7
>  #define mmGPIOPAD_EN 0x05E8
>  #define mmGPIOPAD_EXTERN_TRIG_CNTL 0x05F1
> @@ -127,6 +170,7 @@
>  #define mmGPIOPAD_STRENGTH 0x05E5
>  #define mmGPIOPAD_SW_INT_STAT 0x05E4
>  #define mmGPIOPAD_Y 0x05E9
> +
>  #define mmSMC_IND_ACCESS_CNTL 0x008A
>  #define mmSMC_IND_DATA_0 0x0081
>  #define mmSMC_IND_DATA 0x0081
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h b=
/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h
> index 7d3925b7266e..3c6824b6b530 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h
> @@ -23,10 +23,142 @@
>  #ifndef SMU_6_0_SH_MASK_H
>  #define SMU_6_0_SH_MASK_H
>
> -#define CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV_MASK 0x03ffffffL
> -#define CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV__SHIFT 0x00000000
> -#define CG_SPLL_FUNC_CNTL__SPLL_REF_DIV_MASK 0x000003f0L
> +#define CG_AT__CG_R_MASK 0x0000FFFFL   // (0xffff << 0)

Please drop the C++ style comments here and below.

Alex

> +#define CG_AT__CG_R__SHIFT 0x00000000
> +#define CG_AT__CG_L_MASK 0xFFFF0000L   // (0xffff << 16)
> +#define CG_AT__CG_L__SHIFT 0x00000010
> +
> +#define CG_BSP__BSP_MASK 0x0000FFFFL   // (0xffff << 0)
> +#define CG_BSP__BSP__SHIFT 0x00000000
> +#define CG_BSP__BSU_MASK 0x000F0000L   // (0xf << 16)
> +#define CG_BSP__BSU__SHIFT 0x00000010
> +
> +#define CG_CAC_CTRL__CAC_WINDOW_MASK 0x00FFFFFFL       // (0x00FFFFFF <<=
 0)
> +#define CG_CAC_CTRL__CAC_WINDOW__SHIFT 0x00000000      // ((x) << 0)
> +
> +#define CG_CLKPIN_CNTL__XTALIN_DIVIDE_MASK 0x00000002L // (1 << 1)
> +#define CG_CLKPIN_CNTL__XTALIN_DIVIDE__SHIFT 0x00000001
> +#define CG_CLKPIN_CNTL__BCLK_AS_XCLK_MASK 0x00000004L  // (1 << 2)
> +#define CG_CLKPIN_CNTL__BCLK_AS_XCLK__SHIFT 0x00000002
> +#define CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN_MASK 0x00000008L // (1 << =
3)
> +#define CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN__SHIFT 0x00000003
> +#define CG_CLKPIN_CNTL_2__MUX_TCLK_TO_XCLK_MASK 0x00000100L    // (1 << =
8)
> +#define CG_CLKPIN_CNTL_2__MUX_TCLK_TO_XCLK__SHIFT 0x00000008
> +
> +#define CG_DISPLAY_GAP_CNTL__DISP1_GAP_MASK 0x00000003L        // (3 << =
0)
> +#define CG_DISPLAY_GAP_CNTL__DISP1_GAP__SHIFT 0x00000000
> +#define CG_DISPLAY_GAP_CNTL__DISP2_GAP_MASK 0x0000000CL        // (3 << =
2)
> +#define CG_DISPLAY_GAP_CNTL__DISP2_GAP__SHIFT 0x00000002
> +#define CG_DISPLAY_GAP_CNTL__VBI_TIMER_COUNT_MASK 0x0003FFF0L  // (0x3ff=
f << 4)
> +#define CG_DISPLAY_GAP_CNTL__VBI_TIMER_COUNT__SHIFT 0x00000004
> +#define CG_DISPLAY_GAP_CNTL__VBI_TIMER_UNIT_MASK 0x00700000    // (7 << =
20)
> +#define CG_DISPLAY_GAP_CNTL__VBI_TIMER_UNIT__SHIFT 0x00000014
> +#define CG_DISPLAY_GAP_CNTL__DISP1_GAP_MCHG_MASK 0x03000000L   // (3 << =
24)
> +#define CG_DISPLAY_GAP_CNTL__DISP1_GAP_MCHG__SHIFT 0x00000018
> +#define CG_DISPLAY_GAP_CNTL__DISP2_GAP_MCHG_MASK 0x0C000000L   // (3 << =
26)
> +#define CG_DISPLAY_GAP_CNTL__DISP2_GAP_MCHG__SHIFT 0x0000001A
> +
> +#define CG_FFCT_0__UTC_0_MASK 0x000003FFL      // (0x3ff << 0)
> +#define CG_FFCT_0__UTC_0__SHIFT 0x00000000
> +#define CG_FFCT_0__DTC_0_MASK 0x000FFC00L      // (0x3ff << 10)
> +#define CG_FFCT_0__DTC_0__SHIFT 0x0000000A
> +
> +#define CG_GIT__CG_GICST_MASK 0x0000FFFFL      // (0xffff << 0)
> +#define CG_GIT__CG_GICST__SHIFT 0x00000000
> +#define CG_GIT__CG_GIPOT_MASK 0xFFFF0000L      // (0xffff << 16)
> +#define CG_GIT__CG_GIPOT__SHIFT 0x00000010
> +
> +#define CG_SPLL_FUNC_CNTL__SPLL_RESET_MASK 0x00000001L // (1 << 0)
> +#define CG_SPLL_FUNC_CNTL__SPLL_RESET__SHIFT 0x00000000
> +#define CG_SPLL_FUNC_CNTL__SPLL_SLEEP_MASK 0x00000002L // (1 << 1)
> +#define CG_SPLL_FUNC_CNTL__SPLL_SLEEP__SHIFT 0x00000001
> +#define CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN_MASK 0x00000008L     // (1 << =
3)
> +#define CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN__SHIFT 0x00000003
> +#define CG_SPLL_FUNC_CNTL__SPLL_REF_DIV_MASK 0x000003F0L       // (0x3f =
<< 4)
>  #define CG_SPLL_FUNC_CNTL__SPLL_REF_DIV__SHIFT 0x00000004
> +#define CG_SPLL_FUNC_CNTL__SPLL_PDIV_A_MASK 0x007F00000        // (0x7f =
<< 20)
> +#define CG_SPLL_FUNC_CNTL__SPLL_PDIV_A__SHIFT 0x00000014
> +#define CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL_MASK 0x0000001FF     // (0x1ff=
 << 0)
> +#define CG_SPLL_FUNC_CNTL_2__SCLK_MUX_SEL__SHIFT 0x00000000
> +#define CG_SPLL_FUNC_CNTL_2__SPLL_CTLREQ_CHG_MASK 0x00800000   // (1 << =
23)
> +#define CG_SPLL_FUNC_CNTL_2__SPLL_CTLREQ_CHG__SHIFT 0x00000017
> +#define CG_SPLL_FUNC_CNTL_2__SCLK_MUX_UPDATE_MASK 0x04000000   // (1 << =
26)
> +#define CG_SPLL_FUNC_CNTL_2__SCLK_MUX_UPDATE__SHIFT 0x0000001A
> +#define CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV_MASK 0x03FFFFFFL      // (0x3ff=
ffff << 0)
> +#define CG_SPLL_FUNC_CNTL_3__SPLL_FB_DIV__SHIFT 0x00000000
> +#define CG_SPLL_FUNC_CNTL_3__SPLL_DITHEN_MASK 0x10000000L      // (1 << =
28)
> +#define CG_SPLL_FUNC_CNTL_3__SPLL_DITHEN__SHIFT 0x0000001C
> +#define CG_SPLL_STATUS__SPLL_CHG_STATUS_MASK 0x00000002L       // (1 << =
1)
> +#define CG_SPLL_STATUS__SPLL_CHG_STATUS__SHIFT 0x00000001
> +#define CG_SPLL_SPREAD_SPECTRUM__SSEN_MASK 0x00000001L // (1 << 0)
> +#define CG_SPLL_SPREAD_SPECTRUM__SSEN__SHIFT 0x00000000
> +#define CG_SPLL_SPREAD_SPECTRUM__CLK_S_MASK 0x0000FFF0L        // (0xfff=
 << 4)
> +#define CG_SPLL_SPREAD_SPECTRUM__CLK_S__SHIFT 0x00000004
> +#define CG_SPLL_SPREAD_SPECTRUM_2__CLK_V_MASK 0x00000200L      // (0x3ff=
ffff << 0)
> +#define CG_SPLL_SPREAD_SPECTRUM_2__CLK_V__SHIFT 0x00000000
> +#define CG_SPLL_AUTOSCALE_CNTL__AUTOSCALE_ON_SS_CLEAR_MASK 0x03FFFFFFL /=
/ (1 << 9)
> +#define CG_SPLL_AUTOSCALE_CNTL__AUTOSCALE_ON_SS_CLEAR__SHIFT 0x00000009
> +
> +#define CG_SSP__SST_MASK 0x0000FFFFL   //  (0xffff << 0)
> +#define CG_SSP__SST__SHIFT 0x00000000
> +#define CG_SSP__SSTU_MASK 0x000F0000L  // (0xf << 16)
> +#define CG_SSP__SSTU__SHIFT 0x00000010
> +
> +#define CG_THERMAL_CTRL__DPM_EVENT_SRC_MASK 0x00000007L        // (7 << =
0)
> +#define CG_THERMAL_CTRL__DPM_EVENT_SRC__SHIFT 0x00000000
> +#define CG_THERMAL_CTRL__DIG_THERM_DPM_MASK 0x003FC000 // (00xFF << 14)
> +#define CG_THERMAL_CTRL__DIG_THERM_DPM__SHIFT 0x0000000E
> +#define CG_THERMAL_STATUS__FDO_PWM_DUTY_MASK 0x0001FE00L       // (0xff =
<< 9)
> +#define CG_THERMAL_STATUS__FDO_PWM_DUTY__SHIFT 0x00000009
> +#define CG_THERMAL_INT__DIG_THERM_INTH_MASK 0x0000FF00L        // (0xFF =
<< 8)
> +#define CG_THERMAL_INT__DIG_THERM_INTH__SHIFT 0x00000008
> +#define CG_THERMAL_INT__DIG_THERM_INTL_MASK 0x00FF0000L        // (0xFF =
<< 16)
> +#define CG_THERMAL_INT__DIG_THERM_INTL__SHIFT 0x00000010
> +#define CG_THERMAL_INT__THERM_INT_MASK_HIGH_MASK 0x01000000L   // (1 << =
24)
> +#define CG_THERMAL_INT__THERM_INT_MASK_HIGH__SHIFT 0x00000018
> +#define CG_THERMAL_INT__THERM_INT_MASK_LOW_MASK        0x02000000      /=
/ (1 << 25)
> +#define CG_THERMAL_INT__THERM_INT_MASK_LOW__SHIFT 0x00000019
> +
> +#define CG_MULT_THERMAL_CTRL__TEMP_SEL_MASK    0x0FF00000L     // (0xff =
<< 20)
> +#define CG_MULT_THERMAL_CTRL__TEMP_SEL__SHIFT 0x00000014
> +#define CG_MULT_THERMAL_STATUS__ASIC_MAX_TEMP_MASK     0x000001FFL     /=
/ (0x1FF << 0)
> +#define CG_MULT_THERMAL_STATUS__ASIC_MAX_TEMP__SHIFT 0x00000000
> +#define CG_MULT_THERMAL_STATUS__CTF_TEMP_MASK  0x0003fe00L     // (0x1FF=
 << 9)
> +#define CG_MULT_THERMAL_STATUS__CTF_TEMP__SHIFT 0x00000009
> +
> +#define CG_FDO_CTRL0__FDO_STATIC_DUTY_MASK     0x000000FFL     // (0xFF =
<< 0)
> +#define CG_FDO_CTRL0__FDO_STATIC_DUTY__SHIFT 0x00000000
> +#define CG_FDO_CTRL1__FMAX_DUTY100_MASK        0x000000FFL     // (0xFF =
<< 0)
> +#define CG_FDO_CTRL1__FMAX_DUTY100__SHIFT 0x00000000
> +#define CG_FDO_CTRL2__TMIN_MASK        0x000000FFL     // (0xFF << 0)
> +#define CG_FDO_CTRL2__TMIN__SHIFT 0x00000000
> +#define CG_FDO_CTRL2__FDO_PWM_MODE_MASK        0x00003800L     // (7 << =
11)
> +#define CG_FDO_CTRL2__FDO_PWM_MODE__SHIFT 0x0000000B
> +#define CG_FDO_CTRL2__TACH_PWM_RESP_RATE_MASK  0xFE000000L     // (0x7f =
<< 25)
> +#define CG_FDO_CTRL2__TACH_PWM_RESP_RATE__SHIFT 0x00000019
> +
> +#define CG_TACH_CTRL__EDGE_PER_REV_MASK        0x00000007L     // (0x7 <=
< 0)
> +#define CG_TACH_CTRL__EDGE_PER_REV__SHIFT 0x00000000
> +#define CG_TACH_CTRL__TARGET_PERIOD_MASK       0xFFFFFFF8L     // (0x1FF=
FFFFF << 3)
> +#define CG_TACH_CTRL__TARGET_PERIOD__SHIFT 0x00000003
> +#define CG_TACH_STATUS__TACH_PERIOD_MASK       0xFFFFFFFFL     // (0xFFF=
FFFFF << 0)
> +#define CG_TACH_STATUS__TACH_PERIOD__SHIFT 0x00000000
> +
> +#define GENERAL_PWRMGT__GLOBAL_PWRMGT_EN_MASK  0x00000001L     // (1 << =
0)
> +#define GENERAL_PWRMGT__GLOBAL_PWRMGT_EN__SHIFT 0x00000000
> +#define GENERAL_PWRMGT__STATIC_PM_EN_MASK      0x00000002L     // (1 << =
1)
> +#define GENERAL_PWRMGT__STATIC_PM_EN__SHIFT 0x00000001
> +#define GENERAL_PWRMGT__THERMAL_PROTECTION_DIS_MASK    0x00000004L     /=
/ (1 << 2)
> +#define GENERAL_PWRMGT__THERMAL_PROTECTION_DIS__SHIFT 0x00000002
> +#define GENERAL_PWRMGT__THERMAL_PROTECTION_TYPE_MASK   0x00000008L     /=
/ (1 << 3)
> +#define GENERAL_PWRMGT__THERMAL_PROTECTION_TYPE__SHIFT 0x00000003
> +#define GENERAL_PWRMGT__SW_SMIO_INDEX_MASK     0x00000040L     // (1 << =
6)
> +#define GENERAL_PWRMGT__SW_SMIO_INDEX__SHIFT 0x00000006
> +#define GENERAL_PWRMGT__VOLT_PWRMGT_EN_MASK    0x00000400L     // (1 << =
10)
> +#define GENERAL_PWRMGT__VOLT_PWRMGT_EN__SHIFT 0x0000000A
> +#define GENERAL_PWRMGT__DYN_SPREAD_SPECTRUM_EN_MASK    0x00800000L     /=
/  (1 << 23)
> +#define GENERAL_PWRMGT__DYN_SPREAD_SPECTRUM_EN__SHIFT 0x00000017
> +
>  #define GPIOPAD_A__GPIO_A_MASK 0x7fffffffL
>  #define GPIOPAD_A__GPIO_A__SHIFT 0x00000000
>  #define GPIOPAD_EN__GPIO_EN_MASK 0x7fffffffL
> @@ -195,6 +327,7 @@
>  #define GPIOPAD_SW_INT_STAT__SW_INT_STAT__SHIFT 0x00000000
>  #define GPIOPAD_Y__GPIO_Y_MASK 0x7fffffffL
>  #define GPIOPAD_Y__GPIO_Y__SHIFT 0x00000000
> +
>  #define LCAC_MC0_CNTL__MC0_ENABLE_MASK 0x00000001L
>  #define LCAC_MC0_CNTL__MC0_ENABLE__SHIFT 0x00000000
>  #define LCAC_MC0_CNTL__MC0_THRESHOLD_MASK 0x0001fffeL
> @@ -243,6 +376,37 @@
>  #define LCAC_MC5_OVR_SEL__MC5_OVR_SEL__SHIFT 0x00000000
>  #define LCAC_MC5_OVR_VAL__MC5_OVR_VAL_MASK 0xffffffffL
>  #define LCAC_MC5_OVR_VAL__MC5_OVR_VAL__SHIFT 0x00000000
> +
> +#define MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL_MASK 0x0000FF00L    // 0xFF0=
0
> +#define MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT 0x00000008  // ((x) <=
< 8)
> +
> +#define SCLK_PWRMGT_CNTL__SCLK_PWRMGT_OFF_MASK 0x00000001L     //  (1 <<=
 0)
> +#define SCLK_PWRMGT_CNTL__SCLK_PWRMGT_OFF__SHIFT 0x00000000
> +#define SCLK_PWRMGT_CNTL__SCLK_LOW_D1_MASK     0x00000002L     //  (1 <<=
 1)
> +#define SCLK_PWRMGT_CNTL__SCLK_LOW_D1__SHIFT 0x00000001
> +#define SCLK_PWRMGT_CNTL__FIR_RESET_MASK       0x00000010L     //  (1 <<=
 4)
> +#define SCLK_PWRMGT_CNTL__FIR_RESET__SHIFT 0x00000004
> +#define SCLK_PWRMGT_CNTL__FIR_FORCE_TREND_SEL_MASK     0x00000020L     /=
/  (1 << 5)
> +#define SCLK_PWRMGT_CNTL__FIR_FORCE_TREND_SEL__SHIFT 0x00000005
> +#define SCLK_PWRMGT_CNTL__FIR_TREND_MODE_MASK  0x00000040L     //  (1 <<=
 6)
> +#define SCLK_PWRMGT_CNTL__FIR_TREND_MODE__SHIFT 0x00000006
> +#define SCLK_PWRMGT_CNTL__DYN_GFX_CLK_OFF_EN_MASK      0x00000080L     /=
/  (1 << 7)
> +#define SCLK_PWRMGT_CNTL__DYN_GFX_CLK_OFF_EN__SHIFT 0x00000007
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_FORCE_ON_MASK        0x00000100L     /=
/  (1 << 8)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_FORCE_ON__SHIFT 0x00000008
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_REQUEST_OFF_MASK     0x00000200L     /=
/  (1 << 9)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_REQUEST_OFF__SHIFT 0x00000009
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_FORCE_OFF_MASK       0x00000400L     /=
/  (1 << 10)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_FORCE_OFF__SHIFT 0x0000000A
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D1_MASK     0x00000800L     /=
/  (1 << 11)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D1__SHIFT 0x0000000B
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D2_MASK     0x00001000L     /=
/  (1 << 12)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D2__SHIFT 0x0000000C
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D3_MASK     0x00002000L     /=
/  (1 << 13)
> +#define SCLK_PWRMGT_CNTL__GFX_CLK_OFF_ACPI_D3__SHIFT 0x0000000D
> +#define SCLK_PWRMGT_CNTL__DYN_LIGHT_SLEEP_EN_MASK      0x00004000L     /=
/  (1 << 14)
> +#define SCLK_PWRMGT_CNTL__DYN_LIGHT_SLEEP_EN__SHIFT 0x0000000E
> +
>  #define SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0_MASK 0x00000001L
>  #define SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_0__SHIFT 0x00000000
>  #define SMC_IND_ACCESS_CNTL__AUTO_INCREMENT_IND_1_MASK 0x00000100L
> @@ -285,6 +449,7 @@
>  #define SMC_RESP_1__SMC_RESP__SHIFT 0x00000000
>  #define SMC_RESP_2__SMC_RESP_MASK 0xffffffffL
>  #define SMC_RESP_2__SMC_RESP__SHIFT 0x00000000
> +
>  #define SPLL_CNTL_MODE__SPLL_CTLREQ_DLY_CNT_MASK 0x000ff000L
>  #define SPLL_CNTL_MODE__SPLL_CTLREQ_DLY_CNT__SHIFT 0x0000000c
>  #define SPLL_CNTL_MODE__SPLL_ENSAT_MASK 0x00000010L
> @@ -293,9 +458,11 @@
>  #define SPLL_CNTL_MODE__SPLL_FASTEN__SHIFT 0x00000003
>  #define SPLL_CNTL_MODE__SPLL_LEGACY_PDIV_MASK 0x00000002L
>  #define SPLL_CNTL_MODE__SPLL_LEGACY_PDIV__SHIFT 0x00000001
> +#define SPLL_CNTL_MODE__SPLL_REFCLK_SEL_MASK 0x0C000000L       // (3 << =
26)
> +#define SPLL_CNTL_MODE__SPLL_REFCLK_SEL__SHIFT 0x0000001A
>  #define SPLL_CNTL_MODE__SPLL_RESET_EN_MASK 0x10000000L
>  #define SPLL_CNTL_MODE__SPLL_RESET_EN__SHIFT 0x0000001c
> -#define SPLL_CNTL_MODE__SPLL_SW_DIR_CONTROL_MASK 0x00000001L
> +#define SPLL_CNTL_MODE__SPLL_SW_DIR_CONTROL_MASK 0x00000001L   // (1 << =
0)
>  #define SPLL_CNTL_MODE__SPLL_SW_DIR_CONTROL__SHIFT 0x00000000
>  #define SPLL_CNTL_MODE__SPLL_TEST_CLK_EXT_DIV_MASK 0x00000c00L
>  #define SPLL_CNTL_MODE__SPLL_TEST_CLK_EXT_DIV__SHIFT 0x0000000a
> @@ -303,10 +470,25 @@
>  #define SPLL_CNTL_MODE__SPLL_TEST__SHIFT 0x00000002
>  #define SPLL_CNTL_MODE__SPLL_VCO_MODE_MASK 0x60000000L
>  #define SPLL_CNTL_MODE__SPLL_VCO_MODE__SHIFT 0x0000001d
> +
>  #define TARGET_AND_CURRENT_PROFILE_INDEX_1__CURR_PCIE_INDEX_MASK 0x0f000=
000L
>  #define TARGET_AND_CURRENT_PROFILE_INDEX_1__CURR_PCIE_INDEX__SHIFT 0x000=
00018
>  #define TARGET_AND_CURRENT_PROFILE_INDEX_1__TARG_PCIE_INDEX_MASK 0xf0000=
000L
>  #define TARGET_AND_CURRENT_PROFILE_INDEX_1__TARG_PCIE_INDEX__SHIFT 0x000=
0001c
> +
> +#define TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX_MASK 0x000=
000F0L // (0xf << 4)
> +#define TARGET_AND_CURRENT_PROFILE_INDEX__CURRENT_STATE_INDEX__SHIFT 0x0=
0000004
> +
> +#define THM_CLK_CNTL__CMON_CLK_SEL_MASK 0x000000FFL    // 0xFF
> +#define THM_CLK_CNTL__CMON_CLK_SEL__SHIFT 0x00000000   // ((x) << 0)
> +#define THM_CLK_CNTL__TMON_CLK_SEL_MASK 0x0000FF00L    // 0xFF00
> +#define THM_CLK_CNTL__TMON_CLK_SEL__SHIFT 0x00000008   // ((x) << 8)
> +
> +#define MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL_MASK 0x000000FFL     // 0xFF
> +#define MISC_CLK_CNTL__DEEP_SLEEP_CLK_SEL__SHIFT 0x00000000    // ((x) <=
< 0)
> +#define MISC_CLK_CNTL__ZCLK_SEL_MASK 0x0000FF00L       // 0xFF00
> +#define MISC_CLK_CNTL__ZCLK_SEL__SHIFT 0x00000008      // ((x) << 8)
> +
>  #define THM_TMON0_DEBUG__DEBUG_RDI_MASK 0x0000001fL
>  #define THM_TMON0_DEBUG__DEBUG_RDI__SHIFT 0x00000000
>  #define THM_TMON0_DEBUG__DEBUG_Z_MASK 0x0000ffe0L
> --
> 2.48.1
>
