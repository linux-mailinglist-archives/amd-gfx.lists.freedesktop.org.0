Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6057DC45
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Jul 2022 10:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4721318BAC1;
	Fri, 22 Jul 2022 08:22:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EDA18B973
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jul 2022 08:22:57 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ez10so7222180ejc.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jul 2022 01:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZILkT+jdGiQJpLkRQ2mOlKaZS/11NdKISgq7KHtzMlI=;
 b=hdqyhrzqxHq67WttF0uvblwKvH1n5SwEE0ZnmzGEXKm6GcFTO6qAsHpnMFKPNaOd6X
 Qp98ANffO0Z2UgGoQZDwo5D9DK6ChnWjBF284qum/NqPvyAEIT1fTaZ1wBnH0r7pkAOi
 hN833sQpH1IvHjbPQT/Zk3Z/0tLIQ9FA3iJEH72YpW4Nuvmq3yGkG5GDHWoA9Djk3G+8
 yYTEUauUlSx/EJsZanXRuSzoSYOAlHcBMjVhKyIBKIov1lhoh5mehKZXQ+QnCLvk/YmT
 a/oq5I+DR7PlaYNUj7z3Oc2nicOq9BKkc/dhSLXX7Ae9pq8/vSWGpSMZf/okuKVut2H7
 CUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZILkT+jdGiQJpLkRQ2mOlKaZS/11NdKISgq7KHtzMlI=;
 b=rCZ0nQcjlghmOwkuU5N3zPNN3diJvX7vLwHP+l8I0fHJzE/Zba7hCTOukVztxSUKIb
 1tnOzLo0WWemhPfB4KKNRXVPNRlDj5Gndi2sjSCT5rMcrhr/amcuYbNoHSxlZmjfQXf/
 cacCCURwt/5nJR789H/gNBPGrPnQaAJSe58VOTgNyZYqz/Gg77H3TOqK3WeaLwqM0vrJ
 U4tZUCGeZO7OpM4Ob5izMJGYoXnxtLKoF3DNBDX1Gn+cNvvbYaSHEdazt2blQEYaN75T
 AXqemireSzIcSuG42FlD94UjOJih/KDli9429JP5CBfBueDZKtMiftali4knSx8VHsLN
 3whQ==
X-Gm-Message-State: AJIora9kVgW1h/t1siyHiDYrMiAN1xr02FlodJxIeFYYlVwAgoYtP5qg
 VlVTZGe5kzyqwJ8vvbQeM90=
X-Google-Smtp-Source: AGRyM1sJt+cB7DAX9PS15nDjVitOWh9RMfZmOJYYh0Mi/7aBV8eCGwyzq9oBFiBL2/+WLboKx7R5Ug==
X-Received: by 2002:a17:907:a218:b0:72b:8aae:3f84 with SMTP id
 qp24-20020a170907a21800b0072b8aae3f84mr2168432ejc.367.1658478176014; 
 Fri, 22 Jul 2022 01:22:56 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:ed7f:6516:71c3:dc37?
 ([2a02:908:1256:79a0:ed7f:6516:71c3:dc37])
 by smtp.gmail.com with ESMTPSA id
 gr19-20020a170906e2d300b0072b2f95d5d1sm1735732ejb.170.2022.07.22.01.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 01:22:55 -0700 (PDT)
Message-ID: <74eada76-0445-2d10-87d7-90fe177b307f@gmail.com>
Date: Fri, 22 Jul 2022 10:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amd/display: reduce stack size in dcn32 dml (v2)
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220720160520.2992065-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220720160520.2992065-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 20.07.22 um 18:05 schrieb Alex Deucher:
> Move additional dummy structures off the stack and into
> the dummy vars structure.
>
> Fixes the following:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>   1659 | }
>        | ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'dml32_ModeSupportAndSystemConfigurationFull':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2464 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>   3799 | } // ModeSupportAndSystemConfigurationFull
>        | ^
>
> v2: more more stuff to dummy structure, fix init order (Alex)
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   .../dc/dml/dcn32/display_mode_vba_32.c        | 406 ++++++++----------
>   .../drm/amd/display/dc/dml/display_mode_vba.h |  35 ++
>   2 files changed, 214 insertions(+), 227 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> index 349e36ae9333..91450a973920 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> @@ -67,6 +67,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   	int iteration;
>   	double MaxTotalRDBandwidth;
>   	unsigned int NextPrefetchMode;
> +	double MaxTotalRDBandwidthNoUrgentBurst = 0.0;
> +	bool DestinationLineTimesForPrefetchLessThan2 = false;
> +	bool VRatioPrefetchMoreThanMax = false;
> +	double TWait;
> +	double TotalWRBandwidth = 0;
> +	double WRBandwidth = 0;
>   
>   #ifdef __DML_VBA_DEBUG__
>   	dml_print("DML::%s: --- START ---\n", __func__);
> @@ -702,11 +708,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   	NextPrefetchMode = mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb];
>   
>   	do {
> -		double MaxTotalRDBandwidthNoUrgentBurst = 0.0;
> -		bool DestinationLineTimesForPrefetchLessThan2 = false;
> -		bool VRatioPrefetchMoreThanMax = false;
> -		double dummy_unit_vector[DC__NUM_DPP__MAX];
> -
>   		MaxTotalRDBandwidth = 0;
>   #ifdef __DML_VBA_DEBUG__
>   		dml_print("DML::%s: Start loop: VStartup = %d\n", __func__, mode_lib->vba.VStartupLines);
> @@ -715,41 +716,39 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   			/* NOTE PerfetchMode variable is invalid in DAL as per the input received.
>   			 * Hence the direction is to use PrefetchModePerState.
>   			 */
> -			double TWait = dml32_CalculateTWait(
> -					mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
> -					mode_lib->vba.UsesMALLForPStateChange[k],
> -					mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
> -					mode_lib->vba.DRRDisplay[k],
> -					mode_lib->vba.DRAMClockChangeLatency,
> -					mode_lib->vba.FCLKChangeLatency, v->UrgentLatency,
> -					mode_lib->vba.SREnterPlusExitTime);
> -
> -			DmlPipe myPipe;
> -
> -			myPipe.Dppclk = mode_lib->vba.DPPCLK[k];
> -			myPipe.Dispclk = mode_lib->vba.DISPCLK;
> -			myPipe.PixelClock = mode_lib->vba.PixelClock[k];
> -			myPipe.DCFClkDeepSleep = v->DCFCLKDeepSleep;
> -			myPipe.DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
> -			myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
> -			myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
> -			myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
> -			myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
> -			myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
> -			myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
> -			myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
> -			myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
> -			myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
> -			myPipe.HTotal = mode_lib->vba.HTotal[k];
> -			myPipe.HActive = mode_lib->vba.HActive[k];
> -			myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
> -			myPipe.ODMMode = mode_lib->vba.ODMCombineEnabled[k];
> -			myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
> -			myPipe.BytePerPixelY = v->BytePerPixelY[k];
> -			myPipe.BytePerPixelC = v->BytePerPixelC[k];
> -			myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
> +			TWait = dml32_CalculateTWait(
> +				mode_lib->vba.PrefetchModePerState[mode_lib->vba.VoltageLevel][mode_lib->vba.maxMpcComb],
> +				mode_lib->vba.UsesMALLForPStateChange[k],
> +				mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
> +				mode_lib->vba.DRRDisplay[k],
> +				mode_lib->vba.DRAMClockChangeLatency,
> +				mode_lib->vba.FCLKChangeLatency, v->UrgentLatency,
> +				mode_lib->vba.SREnterPlusExitTime);
> +
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.Dppclk = mode_lib->vba.DPPCLK[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.Dispclk = mode_lib->vba.DISPCLK;
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DCFClkDeepSleep = v->DCFCLKDeepSleep;
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DPPPerSurface = mode_lib->vba.DPPPerPlane[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockWidth256BytesY = v->BlockWidth256BytesY[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockHeight256BytesY = v->BlockHeight256BytesY[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockWidth256BytesC = v->BlockWidth256BytesC[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BlockHeight256BytesC = v->BlockHeight256BytesC[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.HTotal = mode_lib->vba.HTotal[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.HActive = mode_lib->vba.HActive[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ODMMode = mode_lib->vba.ODMCombineEnabled[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelY = v->BytePerPixelY[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.BytePerPixelC = v->BytePerPixelC[k];
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe.ProgressiveToInterlaceUnitInOPP = mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
>   			v->ErrorResult[k] = dml32_CalculatePrefetchSchedule(v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.HostVMInefficiencyFactor,
> -					&myPipe, v->DSCDelay[k],
> +					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.myPipe, v->DSCDelay[k],
>   					mode_lib->vba.DPPCLKDelaySubtotal + mode_lib->vba.DPPCLKDelayCNVCFormater,
>   					mode_lib->vba.DPPCLKDelaySCL,
>   					mode_lib->vba.DPPCLKDelaySCLLBOnly,
> @@ -898,8 +897,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   #endif
>   
>   		{
> -			double dummy_single[1];
> -
>   			dml32_CalculatePrefetchBandwithSupport(
>   					mode_lib->vba.NumberOfActiveSurfaces,
>   					mode_lib->vba.ReturnBW,
> @@ -923,16 +920,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   					/* output */
>   					&MaxTotalRDBandwidth,
> -					&dummy_single[0],
> +					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
>   					&v->PrefetchModeSupported);
>   		}
>   
>   		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
> -			dummy_unit_vector[k] = 1.0;
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector[k] = 1.0;
>   
>   		{
> -			double  dummy_single[1];
> -			bool dummy_boolean[1];
>   			dml32_CalculatePrefetchBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
>   					mode_lib->vba.ReturnBW,
>   					v->NoUrgentLatencyHidingPre,
> @@ -946,17 +941,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   					v->cursor_bw_pre,
>   					v->prefetch_vmrow_bw,
>   					mode_lib->vba.DPPPerPlane,
> -					dummy_unit_vector,
> -					dummy_unit_vector,
> -					dummy_unit_vector,
> -					dummy_unit_vector,
> -					dummy_unit_vector,
> -					dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +					v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
>   
>   					/* output */
> -					&dummy_single[0],
> +					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
>   					&v->FractionOfUrgentBandwidth,
> -					&dummy_boolean[0]);
> +					&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);
>   		}
>   
>   		if (VRatioPrefetchMoreThanMax != false || DestinationLineTimesForPrefetchLessThan2 != false) {
> @@ -1039,8 +1034,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   			}
>   
>   			{
> -				double  dummy_single[2];
> -				bool dummy_boolean[1];
>   				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
>   						mode_lib->vba.ReturnBW,
>   						mode_lib->vba.ImmediateFlipRequirement,
> @@ -1064,7 +1057,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   						/* output */
>   						&v->total_dcn_read_bw_with_flip,    // Single  *TotalBandwidth
> -						&dummy_single[0],                        // Single  *FractionOfUrgentBandwidth
> +						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],                        // Single  *FractionOfUrgentBandwidth
>   						&v->ImmediateFlipSupported);        // Boolean *ImmediateFlipBandwidthSupport
>   
>   				dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
> @@ -1081,17 +1074,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   						v->cursor_bw_pre,
>   						v->prefetch_vmrow_bw,
>   						mode_lib->vba.DPPPerPlane,
> -						dummy_unit_vector,
> -						dummy_unit_vector,
> -						dummy_unit_vector,
> -						dummy_unit_vector,
> -						dummy_unit_vector,
> -						dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
> +						v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_unit_vector,
>   
>   						/* output */
> -						&dummy_single[1],                                // Single  *TotalBandwidth
> +						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[1],                                // Single  *TotalBandwidth
>   						&v->FractionOfUrgentBandwidthImmediateFlip, // Single  *FractionOfUrgentBandwidth
> -						&dummy_boolean[0]);                              // Boolean *ImmediateFlipBandwidthSupport
> +						&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);                              // Boolean *ImmediateFlipBandwidthSupport
>   			}
>   
>   			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
> @@ -1149,22 +1142,17 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   	//Watermarks and NB P-State/DRAM Clock Change Support
>   	{
> -		SOCParametersList mmSOCParameters;
> -		enum clock_change_support dummy_dramchange_support;
> -		enum dm_fclock_change_support dummy_fclkchange_support;
> -		bool dummy_USRRetrainingSupport;
> -
> -		mmSOCParameters.UrgentLatency = v->UrgentLatency;
> -		mmSOCParameters.ExtraLatency = v->UrgentExtraLatency;
> -		mmSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
> -		mmSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
> -		mmSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
> -		mmSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
> -		mmSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
> -		mmSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
> -		mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
> -		mmSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
> -		mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.UrgentLatency = v->UrgentLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.ExtraLatency = v->UrgentExtraLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
> +		v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
>   
>   		dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
>   			mode_lib->vba.USRRetrainingRequiredFinal,
> @@ -1182,7 +1170,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   			v->dpte_group_bytes,
>   			v->meta_row_height,
>   			v->meta_row_height_chroma,
> -			mmSOCParameters,
> +			v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.mmSOCParameters,
>   			mode_lib->vba.WritebackChunkSize,
>   			mode_lib->vba.SOCCLK,
>   			v->DCFCLKDeepSleep,
> @@ -1219,12 +1207,12 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   			/* Output */
>   			&v->Watermark,
> -			&dummy_dramchange_support,
> +			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_dramchange_support,
>   			v->MaxActiveDRAMClockChangeLatencySupported,
>   			v->SubViewportLinesNeededInMALL,
> -			&dummy_fclkchange_support,
> +			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_fclkchange_support,
>   			&v->MinActiveFCLKChangeLatencySupported,
> -			&dummy_USRRetrainingSupport,
> +			&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_USRRetrainingSupport,
>   			mode_lib->vba.ActiveDRAMClockChangeLatencyMargin);
>   
>   		/* DCN32 has a new struct Watermarks (typedef) which is used to store
> @@ -1486,9 +1474,6 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   	{
>   		//Maximum Bandwidth Used
> -		double TotalWRBandwidth = 0;
> -		double WRBandwidth = 0;
> -
>   		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   			if (mode_lib->vba.WritebackEnable[k] == true
>   					&& mode_lib->vba.WritebackPixelFormat[k] == dm_444_32) {
> @@ -1582,9 +1567,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   #ifdef __DML_VBA_ALLOW_DELTA__
>   	{
> -		double dummy_single[2];
>   		unsigned int dummy_integer[1];
> -		bool dummy_boolean[1];
>   
>   		// Calculate z8 stutter eff assuming 0 reserved space
>   		dml32_CalculateStutterEfficiency(v->CompressedBufferSizeInkByte,
> @@ -1637,14 +1620,14 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   				v->meta_row_bw, v->dpte_row_bw,
>   
>   				/* Output */
> -				&dummy_single[0],
> -				&dummy_single[1],
> +				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[0],
> +				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_single[1],
>   				&dummy_integer[0],
>   				&v->Z8StutterEfficiencyNotIncludingVBlankBestCase,
>   				&v->Z8StutterEfficiencyBestCase,
>   				&v->Z8NumberOfStutterBurstsPerFrameBestCase,
>   				&v->StutterPeriodBestCase,
> -				&dummy_boolean[0]);
> +				&v->dummy_vars.DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation.dummy_boolean);
>   	}
>   #else
>   	v->Z8StutterEfficiencyNotIncludingVBlankBestCase = v->Z8StutterEfficiencyNotIncludingVBlank;
> @@ -1660,29 +1643,16 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>   
>   void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>   {
> -	unsigned int dummy_integer[4];
> -	bool MPCCombineMethodAsNeededForPStateChangeAndVoltage;
> -	bool MPCCombineMethodAsPossible;
> -	enum odm_combine_mode dummy_odm_mode[DC__NUM_DPP__MAX];
> -	unsigned int TotalNumberOfActiveOTG;
> -	unsigned int TotalNumberOfActiveHDMIFRL;
> -	unsigned int TotalNumberOfActiveDP2p0;
> -	unsigned int TotalNumberOfActiveDP2p0Outputs;
> -	unsigned int TotalDSCUnitsRequired;
> -	unsigned int m;
> -	unsigned int ReorderingBytes;
> -	bool FullFrameMALLPStateMethod;
> -	bool SubViewportMALLPStateMethod;
> -	bool PhantomPipeMALLPStateMethod;
> +	struct vba_vars_st *v = &mode_lib->vba;
> +	int i, j;
> +	unsigned int k, m;
>   	unsigned int MaximumMPCCombine;
> +	unsigned int NumberOfNonCombinedSurfaceOfMaximumBandwidth;
> +	unsigned int TotalSlots;
>   
>   #ifdef __DML_VBA_DEBUG__
>   	dml_print("DML::%s: called\n", __func__);
>   #endif
> -	struct vba_vars_st *v = &mode_lib->vba;
> -
> -	int i, j;
> -	unsigned int k;
>   
>   	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
>   
> @@ -1951,7 +1921,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			mode_lib->vba.Read256BlockHeightC,
>   			mode_lib->vba.Read256BlockWidthY,
>   			mode_lib->vba.Read256BlockWidthC,
> -			dummy_odm_mode,
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_odm_mode,
>   			mode_lib->vba.BlendingAndTiming,
>   			mode_lib->vba.BytePerPixelY,
>   			mode_lib->vba.BytePerPixelC,
> @@ -1977,35 +1947,26 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			mode_lib->vba.SingleDPPViewportSizeSupportPerSurface,/* bool ViewportSizeSupportPerSurface[] */
>   			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[1][0]); /* bool           *ViewportSizeSupport */
>   
> -	MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
> -	MPCCombineMethodAsPossible = false;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = false;
>   
>   	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_reduce_voltage_and_clocks)
> -			MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
>   		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_always_when_possible)
> -			MPCCombineMethodAsPossible = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = true;
>   	}
> -	mode_lib->vba.MPCCombineMethodIncompatible = MPCCombineMethodAsNeededForPStateChangeAndVoltage
> -			&& MPCCombineMethodAsPossible;
> +	mode_lib->vba.MPCCombineMethodIncompatible = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage
> +			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible;
>   
>   	for (i = 0; i < v->soc.num_states; i++) {
>   		for (j = 0; j < 2; j++) {
> -			bool NoChroma;
>   			mode_lib->vba.TotalNumberOfActiveDPP[i][j] = 0;
>   			mode_lib->vba.TotalAvailablePipesSupport[i][j] = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC = dm_odm_combine_mode_disabled;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC = dm_odm_combine_mode_disabled;
>   
>   			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
> -
> -				bool TotalAvailablePipesSupportNoDSC;
> -				unsigned int NumberOfDPPNoDSC;
> -				enum odm_combine_mode ODMModeNoDSC = dm_odm_combine_mode_disabled;
> -				double RequiredDISPCLKPerSurfaceNoDSC;
> -				bool TotalAvailablePipesSupportDSC;
> -				unsigned int NumberOfDPPDSC;
> -				enum odm_combine_mode ODMModeDSC = dm_odm_combine_mode_disabled;
> -				double RequiredDISPCLKPerSurfaceDSC;
> -
>   				dml32_CalculateODMMode(
>   						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
>   						mode_lib->vba.HActive[k],
> @@ -2022,10 +1983,10 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
>   
>   						/* Output */
> -						&TotalAvailablePipesSupportNoDSC,
> -						&NumberOfDPPNoDSC,
> -						&ODMModeNoDSC,
> -						&RequiredDISPCLKPerSurfaceNoDSC);
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC);
>   
>   				dml32_CalculateODMMode(
>   						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
> @@ -2043,10 +2004,10 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
>   
>   						/* Output */
> -						&TotalAvailablePipesSupportDSC,
> -						&NumberOfDPPDSC,
> -						&ODMModeDSC,
> -						&RequiredDISPCLKPerSurfaceDSC);
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC);
>   
>   				dml32_CalculateOutputLink(
>   						mode_lib->vba.PHYCLKPerState[i],
> @@ -2064,8 +2025,8 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						mode_lib->vba.NumberOfDSCSlices[k],
>   						mode_lib->vba.AudioSampleRate[k],
>   						mode_lib->vba.AudioSampleLayout[k],
> -						ODMModeNoDSC,
> -						ODMModeDSC,
> +						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
> +						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
>   						mode_lib->vba.DSCEnable[k],
>   						mode_lib->vba.OutputLinkDPLanes[k],
>   						mode_lib->vba.OutputLinkDPRate[k],
> @@ -2079,21 +2040,21 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						&mode_lib->vba.RequiredSlots[i][k]);
>   
>   				if (mode_lib->vba.RequiresDSC[i][k] == false) {
> -					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeNoDSC;
> +					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC;
>   					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
> -							RequiredDISPCLKPerSurfaceNoDSC;
> -					if (!TotalAvailablePipesSupportNoDSC)
> +							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC;
> +					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC)
>   						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
>   					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
> -							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPNoDSC;
> +							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC;
>   				} else {
> -					mode_lib->vba.ODMCombineEnablePerState[i][k] = ODMModeDSC;
> +					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC;
>   					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
> -							RequiredDISPCLKPerSurfaceDSC;
> -					if (!TotalAvailablePipesSupportDSC)
> +							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC;
> +					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC)
>   						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
>   					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
> -							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + NumberOfDPPDSC;
> +							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC;
>   				}
>   			}
>   
> @@ -2128,7 +2089,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			}
>   
>   			mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] = 0;
> -			NoChroma = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = true;
>   
>   			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   				if (mode_lib->vba.NoOfDPP[i][j][k] == 1)
> @@ -2138,17 +2099,17 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_10
>   						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12
>   						|| mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
> -					NoChroma = false;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = false;
>   				}
>   			}
>   
>   			if (j == 1 && !dml32_UnboundedRequest(mode_lib->vba.UseUnboundedRequesting,
> -							mode_lib->vba.TotalNumberOfActiveDPP[i][j], NoChroma,
> +							mode_lib->vba.TotalNumberOfActiveDPP[i][j], v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma,
>   							mode_lib->vba.Output[0])) {
>   				while (!(mode_lib->vba.TotalNumberOfActiveDPP[i][j] >= mode_lib->vba.MaxNumDPP
>   						|| mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] == 0)) {
> -					double BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
> -					unsigned int NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
> +					NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
>   
>   					for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   						if (mode_lib->vba.MPCCombineUse[k]
> @@ -2156,13 +2117,13 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   							mode_lib->vba.MPCCombineUse[k] != dm_mpc_reduce_voltage &&
>   							mode_lib->vba.ReadBandwidthLuma[k] +
>   							mode_lib->vba.ReadBandwidthChroma[k] >
> -							BWOfNonCombinedSurfaceOfMaximumBandwidth &&
> +							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth &&
>   							(mode_lib->vba.ODMCombineEnablePerState[i][k] !=
>   							dm_odm_combine_mode_2to1 &&
>   							mode_lib->vba.ODMCombineEnablePerState[i][k] !=
>   							dm_odm_combine_mode_4to1) &&
>   								mode_lib->vba.MPCCombine[i][j][k] == false) {
> -							BWOfNonCombinedSurfaceOfMaximumBandwidth =
> +							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth =
>   								mode_lib->vba.ReadBandwidthLuma[k]
>   								+ mode_lib->vba.ReadBandwidthChroma[k];
>   							NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
> @@ -2228,28 +2189,28 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   	} // i (VOLTAGE_STATE)
>   
>   	/* Total Available OTG, HDMIFRL, DP Support Check */
> -	TotalNumberOfActiveOTG = 0;
> -	TotalNumberOfActiveHDMIFRL = 0;
> -	TotalNumberOfActiveDP2p0 = 0;
> -	TotalNumberOfActiveDP2p0Outputs = 0;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = 0;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL = 0;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = 0;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = 0;
>   
>   	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   		if (mode_lib->vba.BlendingAndTiming[k] == k) {
> -			TotalNumberOfActiveOTG = TotalNumberOfActiveOTG + 1;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG + 1;
>   			if (mode_lib->vba.Output[k] == dm_dp2p0) {
> -				TotalNumberOfActiveDP2p0 = TotalNumberOfActiveDP2p0 + 1;
> +				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 + 1;
>   				if (mode_lib->vba.OutputMultistreamId[k]
>   						== k || mode_lib->vba.OutputMultistreamEn[k] == false) {
> -					TotalNumberOfActiveDP2p0Outputs = TotalNumberOfActiveDP2p0Outputs + 1;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs + 1;
>   				}
>   			}
>   		}
>   	}
>   
> -	mode_lib->vba.NumberOfOTGSupport = (TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
> -	mode_lib->vba.NumberOfHDMIFRLSupport = (TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
> -	mode_lib->vba.NumberOfDP2p0Support = (TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
> -			&& TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
> +	mode_lib->vba.NumberOfOTGSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
> +	mode_lib->vba.NumberOfHDMIFRLSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
> +	mode_lib->vba.NumberOfDP2p0Support = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
> +			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
>   
>   	/* Display IO and DSC Support Check */
>   	mode_lib->vba.NonsupportedDSCInputBPC = false;
> @@ -2264,8 +2225,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   	}
>   
>   	for (i = 0; i < v->soc.num_states; ++i) {
> -		unsigned int TotalSlots;
> -
>   		mode_lib->vba.ExceededMultistreamSlots[i] = false;
>   		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   			if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == k) {
> @@ -2436,12 +2395,12 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   	}
>   
>   	/* Check DSC Unit and Slices Support */
> -	TotalDSCUnitsRequired = 0;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
>   
>   	for (i = 0; i < v->soc.num_states; ++i) {
>   		mode_lib->vba.NotEnoughDSCUnits[i] = false;
>   		mode_lib->vba.NotEnoughDSCSlices[i] = false;
> -		TotalDSCUnitsRequired = 0;
> +		v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
>   		mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = true;
>   		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   			if (mode_lib->vba.RequiresDSC[i][k] == true) {
> @@ -2449,33 +2408,31 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					if (mode_lib->vba.HActive[k]
>   							> 4 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
>   						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
> -					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 4;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 4;
>   					if (mode_lib->vba.NumberOfDSCSlices[k] > 16)
>   						mode_lib->vba.NotEnoughDSCSlices[i] = true;
>   				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
>   					if (mode_lib->vba.HActive[k]
>   							> 2 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
>   						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
> -					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 2;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 2;
>   					if (mode_lib->vba.NumberOfDSCSlices[k] > 8)
>   						mode_lib->vba.NotEnoughDSCSlices[i] = true;
>   				} else {
>   					if (mode_lib->vba.HActive[k] > mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
>   						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
> -					TotalDSCUnitsRequired = TotalDSCUnitsRequired + 1;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 1;
>   					if (mode_lib->vba.NumberOfDSCSlices[k] > 4)
>   						mode_lib->vba.NotEnoughDSCSlices[i] = true;
>   				}
>   			}
>   		}
> -		if (TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
> +		if (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
>   			mode_lib->vba.NotEnoughDSCUnits[i] = true;
>   	}
>   
>   	/*DSC Delay per state*/
>   	for (i = 0; i < v->soc.num_states; ++i) {
> -		unsigned int m;
> -
>   		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   			mode_lib->vba.DSCDelayPerState[i][k] = dml32_DSCDelayRequirement(
>   					mode_lib->vba.RequiresDSC[i][k], mode_lib->vba.ODMCombineEnablePerState[i][k],
> @@ -2932,7 +2889,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   		}
>   	}
>   
> -	ReorderingBytes = mode_lib->vba.NumberOfChannels
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes = mode_lib->vba.NumberOfChannels
>   			* dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
>   					mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
>   					mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly);
> @@ -2988,20 +2945,20 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame));
>   	}
>   
> -	FullFrameMALLPStateMethod = false;
> -	SubViewportMALLPStateMethod = false;
> -	PhantomPipeMALLPStateMethod = false;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = false;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = false;
> +	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = false;
>   
>   	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
> -			FullFrameMALLPStateMethod = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = true;
>   		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
> -			SubViewportMALLPStateMethod = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = true;
>   		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe)
> -			PhantomPipeMALLPStateMethod = true;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = true;
>   	}
> -	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (SubViewportMALLPStateMethod
> -			!= PhantomPipeMALLPStateMethod) || (SubViewportMALLPStateMethod && FullFrameMALLPStateMethod);
> +	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod
> +			!= v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod) || (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod && v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod);
>   
>   	if (mode_lib->vba.UseMinimumRequiredDCFCLK == true) {
>   		dml32_UseMinimumDCFCLK(
> @@ -3015,7 +2972,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				mode_lib->vba.SREnterPlusExitTime,
>   				mode_lib->vba.ReturnBusWidth,
>   				mode_lib->vba.RoundTripPingLatencyCycles,
> -				ReorderingBytes,
> +				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
>   				mode_lib->vba.PixelChunkSizeInKByte,
>   				mode_lib->vba.MetaChunkSize,
>   				mode_lib->vba.GPUVMEnable,
> @@ -3078,7 +3035,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					/ mode_lib->vba.ReturnBWPerState[i][j]
>   					> (mode_lib->vba.RoundTripPingLatencyCycles + 32)
>   							/ mode_lib->vba.DCFCLKState[i][j]
> -							+ ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
> +							+ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
>   				mode_lib->vba.ROBSupport[i][j] = true;
>   			} else {
>   				mode_lib->vba.ROBSupport[i][j] = false;
> @@ -3120,9 +3077,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   
>   	for (i = 0; i < (int) v->soc.num_states; ++i) {
>   		for (j = 0; j <= 1; ++j) {
> -			double VMDataOnlyReturnBWPerState;
> -			double HostVMInefficiencyFactor;
> -			unsigned int NextPrefetchModeState;
>   
>   			mode_lib->vba.TimeCalc = 24 / mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
>   
> @@ -3162,37 +3116,35 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					mode_lib->vba.UrgentBurstFactorChroma,
>   					mode_lib->vba.UrgentBurstFactorCursor);
>   
> -			VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
>   					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.FabricClockPerState[i],
>   					mode_lib->vba.DRAMSpeedPerState[i]);
> -			HostVMInefficiencyFactor = 1;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = 1;
>   
>   			if (mode_lib->vba.GPUVMEnable && mode_lib->vba.HostVMEnable)
> -				HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
> -						/ VMDataOnlyReturnBWPerState;
> +				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
> +						/ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState;
>   
>   			mode_lib->vba.ExtraLatency = dml32_CalculateExtraLatency(
> -					mode_lib->vba.RoundTripPingLatencyCycles, ReorderingBytes,
> +					mode_lib->vba.RoundTripPingLatencyCycles, v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
>   					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.TotalNumberOfActiveDPP[i][j],
>   					mode_lib->vba.PixelChunkSizeInKByte,
>   					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j], mode_lib->vba.MetaChunkSize,
>   					mode_lib->vba.ReturnBWPerState[i][j], mode_lib->vba.GPUVMEnable,
>   					mode_lib->vba.HostVMEnable, mode_lib->vba.NumberOfActiveSurfaces,
>   					mode_lib->vba.NoOfDPPThisState, mode_lib->vba.dpte_group_bytes,
> -					HostVMInefficiencyFactor, mode_lib->vba.HostVMMinPageSize,
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor, mode_lib->vba.HostVMMinPageSize,
>   					mode_lib->vba.HostVMMaxNonCachedPageTableLevels);
>   
> -			NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
> +			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
>   
>   			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
>   
>   			do {
> -				mode_lib->vba.PrefetchModePerState[i][j] = NextPrefetchModeState;
> +				mode_lib->vba.PrefetchModePerState[i][j] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState;
>   				mode_lib->vba.MaxVStartup = mode_lib->vba.NextMaxVStartup;
>   
>   				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
> -					DmlPipe myPipe;
> -
>   					mode_lib->vba.TWait = dml32_CalculateTWait(
>   							mode_lib->vba.PrefetchModePerState[i][j],
>   							mode_lib->vba.UsesMALLForPStateChange[k],
> @@ -3202,34 +3154,34 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   							mode_lib->vba.FCLKChangeLatency, mode_lib->vba.UrgLatency[i],
>   							mode_lib->vba.SREnterPlusExitTime);
>   
> -					myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
> -					myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
> -					myPipe.PixelClock = mode_lib->vba.PixelClock[k];
> -					myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
> -					myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
> -					myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
> -					myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
> -					myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
> -					myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
> -					myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
> -					myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
> -					myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
> -					myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
> -					myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
> -					myPipe.HTotal = mode_lib->vba.HTotal[k];
> -					myPipe.HActive = mode_lib->vba.HActive[k];
> -					myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
> -					myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
> -					myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
> -					myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
> -					myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
> -					myPipe.ProgressiveToInterlaceUnitInOPP =
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HTotal = mode_lib->vba.HTotal[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HActive = mode_lib->vba.HActive[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ProgressiveToInterlaceUnitInOPP =
>   							mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
>   
>   					mode_lib->vba.NoTimeForPrefetch[i][j][k] =
>   						dml32_CalculatePrefetchSchedule(
> -							HostVMInefficiencyFactor,
> -							&myPipe,
> +							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
> +							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe,
>   							mode_lib->vba.DSCDelayPerState[i][k],
>   							mode_lib->vba.DPPCLKDelaySubtotal +
>   								mode_lib->vba.DPPCLKDelayCNVCFormater,
> @@ -3288,7 +3240,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],         // double *Tdmdl_vm
>   							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],         // double *Tdmdl
>   							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[2],         // double *TSetup
> -							&dummy_integer[0],         							    // unsigned int   *VUpdateOffsetPix
> +							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0],         							    // unsigned int   *VUpdateOffsetPix
>   							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[3],         // unsigned int   *VUpdateWidthPix
>   							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[4]);        // unsigned int   *VReadyOffsetPix
>   				}
> @@ -3417,7 +3369,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					}
>   
>   					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
> -						dml32_CalculateFlipSchedule(HostVMInefficiencyFactor,
> +						dml32_CalculateFlipSchedule(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
>   							mode_lib->vba.ExtraLatency,
>   							mode_lib->vba.UrgLatency[i],
>   							mode_lib->vba.GPUVMMaxPageTableLevels,
> @@ -3491,7 +3443,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				if (mode_lib->vba.MaxVStartup <= __DML_VBA_MIN_VSTARTUP__
>   						|| mode_lib->vba.AnyLinesForVMOrRowTooLarge == false) {
>   					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
> -					NextPrefetchModeState = NextPrefetchModeState + 1;
> +					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState + 1;
>   				} else {
>   					mode_lib->vba.NextMaxVStartup = mode_lib->vba.NextMaxVStartup - 1;
>   				}
> @@ -3505,7 +3457,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   							&& !mode_lib->vba.ImmediateFlipRequiredFinal)
>   							|| mode_lib->vba.ImmediateFlipSupportedForState[i][j] == true))
>   					|| (mode_lib->vba.NextMaxVStartup == mode_lib->vba.MaxMaxVStartup[i][j]
> -							&& NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
> +							&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
>   
>   			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
>   				mode_lib->vba.use_one_row_for_frame_this_state[k] =
> @@ -3581,7 +3533,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   						&mode_lib->vba.Watermark, // Store the values in vba
>   						&mode_lib->vba.DRAMClockChangeSupport[i][j],
>   						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
> -						&dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
> +						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
>   						&mode_lib->vba.FCLKChangeSupport[i][j],
>   						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
>   						&mode_lib->vba.USRRetrainingSupport[i][j],
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> index 47b149d4bfcf..d4b6fa0a9ee3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.h
> @@ -197,6 +197,13 @@ struct DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal
>   	unsigned int ReorderBytes;
>   	unsigned int VMDataOnlyReturnBW;
>   	double HostVMInefficiencyFactor;
> +	DmlPipe myPipe;
> +	SOCParametersList mmSOCParameters;
> +	double dummy_unit_vector[DC__NUM_DPP__MAX];
> +	double dummy_single[2];
> +	enum clock_change_support dummy_dramchange_support;
> +	enum dm_fclock_change_support dummy_fclkchange_support;
> +	bool dummy_USRRetrainingSupport;
>   };
>   
>   struct dml32_ModeSupportAndSystemConfigurationFull {
> @@ -212,6 +219,34 @@ struct dml32_ModeSupportAndSystemConfigurationFull {
>   	double DSTXAfterScaler[DC__NUM_DPP__MAX];
>   	double MaxTotalVActiveRDBandwidth;
>   	bool dummy_boolean_array[2][DC__NUM_DPP__MAX];
> +	enum odm_combine_mode dummy_odm_mode[DC__NUM_DPP__MAX];
> +	DmlPipe myPipe;
> +	unsigned int dummy_integer[4];
> +	unsigned int TotalNumberOfActiveOTG;
> +	unsigned int TotalNumberOfActiveHDMIFRL;
> +	unsigned int TotalNumberOfActiveDP2p0;
> +	unsigned int TotalNumberOfActiveDP2p0Outputs;
> +	unsigned int TotalDSCUnitsRequired;
> +	unsigned int ReorderingBytes;
> +	unsigned int TotalSlots;
> +	unsigned int NumberOfDPPDSC;
> +	unsigned int NumberOfDPPNoDSC;
> +	unsigned int NextPrefetchModeState;
> +	bool MPCCombineMethodAsNeededForPStateChangeAndVoltage;
> +	bool MPCCombineMethodAsPossible;
> +	bool FullFrameMALLPStateMethod;
> +	bool SubViewportMALLPStateMethod;
> +	bool PhantomPipeMALLPStateMethod;
> +	bool NoChroma;
> +	bool TotalAvailablePipesSupportNoDSC;
> +	bool TotalAvailablePipesSupportDSC;
> +	enum odm_combine_mode ODMModeNoDSC;
> +	enum odm_combine_mode ODMModeDSC;
> +	double RequiredDISPCLKPerSurfaceNoDSC;
> +	double RequiredDISPCLKPerSurfaceDSC;
> +	double BWOfNonCombinedSurfaceOfMaximumBandwidth;
> +	double VMDataOnlyReturnBWPerState;
> +	double HostVMInefficiencyFactor;
>   };
>   
>   struct dummy_vars {

