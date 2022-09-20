Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A65BF182
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Sep 2022 01:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73210E7CA;
	Tue, 20 Sep 2022 23:48:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183A10E7C6;
 Tue, 20 Sep 2022 23:48:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49F3462751;
 Tue, 20 Sep 2022 23:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF16AC433D6;
 Tue, 20 Sep 2022 23:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663717702;
 bh=A+pACHsSeHnV2BJ5JZ/T7Y4giljtZg3Vu/szqTstKiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKHIgTCBIlBZ9PzYIX1DFISV+NKvO/ZbCU3ealMkr25PQdJKlGekHK2kRIzeMEC8k
 xoK6H/xAWUZrkgyrkTAcxc1AUPL8sL1L+lclejv4iWy6HnLRJ2BlLLWvjm/ezk02y+
 D9UxT8Upbs6hjNDzToG+PbNkYg+5uPcHArfjsroxiaAuh0MAFY+wuPy8s97TIRvOec
 SErulQCVAc8AbL3jInJUOIiLzcOyfcEr4JEhQQiH+QfbhSy2aRm3gbyJRHbK8d9nOa
 MjoKXQpCaIziAJ74CqymDjJNgUDQiXGqktdQj2mnwXipfDrsQQEAzswtrhL7AatOlH
 DrEnKoorr7mnw==
Date: Tue, 20 Sep 2022 16:48:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce number of arguments of
 dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
Message-ID: <YypRRD+wWVBDPGL9@dev-arch.thelio-3990X>
References: <20220916210658.3412450-1-nathan@kernel.org>
 <5e0b4692-b3ac-20ce-bd0b-65f52804601b@riseup.net>
 <CADnq5_O67aFW95nNbgPJipypnpzAC-HO=FYkdxOMpOJQXF+CKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_O67aFW95nNbgPJipypnpzAC-HO=FYkdxOMpOJQXF+CKw@mail.gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 "kernelci.org bot" <bot@kernelci.org>, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 12:06:46PM -0400, Alex Deucher wrote:
> Applied the series.  Thanks!

Great, thank you so much! Hopefully these could also be applied to the
6.0 branch so that this error can be resolved there as well. No worries
on timeline if that was already the plan but I just want to keep -Werror
on for arm64 and x86_64 allmodconfig for this release.

Cheers,
Nathan

> On Sat, Sep 17, 2022 at 8:38 AM Ma�ra Canal <mairacanal@riseup.net> wrote:
> >
> > Hi Nathan,
> >
> > On 9/16/22 18:06, Nathan Chancellor wrote:
> > > Most of the arguments are identical between the two call sites and they
> > > can be accessed through the 'struct vba_vars_st' pointer. This reduces
> > > the total amount of stack space that
> > > dml314_ModeSupportAndSystemConfigurationFull() uses by 240 bytes with
> > > LLVM 16 (2216 -> 1976), helping clear up the following clang warning:
> > >
> > >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:4020:6: error: stack frame size (2216) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> > >   void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> > >        ^
> > >   1 error generated.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1710
> > > Reported-by: "kernelci.org bot" <bot@kernelci.org>
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I have built-tested the whole series with clang 14.0.5 (Fedora
> > 14.0.5-1.fc36), using:
> >
> > $ make -kj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper allmodconfig
> > drivers/gpu/drm/amd/amdgpu/
> >
> > Another great patch to the DML! As Tom, I also would like to see this
> > expand to all display_mode_vba files, but so far this is great to
> > unbreak the build.
> >
> > To the whole series:
> >
> > Tested-by: Ma�ra Canal <mairacanal@riseup.net>
> >
> > Best Regards,
> > - Ma�ra Canal
> >
> > > ---
> > >
> > > This is just commit ab2ac59c32db ("drm/amd/display: Reduce number of
> > > arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()")
> > > applied to dml314.
> > >
> > >  .../dc/dml/dcn314/display_mode_vba_314.c      | 248 ++++--------------
> > >  1 file changed, 52 insertions(+), 196 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > > index 2829f179f982..32ceb72f7a14 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> > > @@ -325,64 +325,28 @@ static void CalculateVupdateAndDynamicMetadataParameters(
> > >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >               struct display_mode_lib *mode_lib,
> > >               unsigned int PrefetchMode,
> > > -             unsigned int NumberOfActivePlanes,
> > > -             unsigned int MaxLineBufferLines,
> > > -             unsigned int LineBufferSize,
> > > -             unsigned int WritebackInterfaceBufferSize,
> > >               double DCFCLK,
> > >               double ReturnBW,
> > > -             bool SynchronizedVBlank,
> > > -             unsigned int dpte_group_bytes[],
> > > -             unsigned int MetaChunkSize,
> > >               double UrgentLatency,
> > >               double ExtraLatency,
> > > -             double WritebackLatency,
> > > -             double WritebackChunkSize,
> > >               double SOCCLK,
> > > -             double DRAMClockChangeLatency,
> > > -             double SRExitTime,
> > > -             double SREnterPlusExitTime,
> > > -             double SRExitZ8Time,
> > > -             double SREnterPlusExitZ8Time,
> > >               double DCFCLKDeepSleep,
> > >               unsigned int DETBufferSizeY[],
> > >               unsigned int DETBufferSizeC[],
> > >               unsigned int SwathHeightY[],
> > >               unsigned int SwathHeightC[],
> > > -             unsigned int LBBitPerPixel[],
> > >               double SwathWidthY[],
> > >               double SwathWidthC[],
> > > -             double HRatio[],
> > > -             double HRatioChroma[],
> > > -             unsigned int vtaps[],
> > > -             unsigned int VTAPsChroma[],
> > > -             double VRatio[],
> > > -             double VRatioChroma[],
> > > -             unsigned int HTotal[],
> > > -             double PixelClock[],
> > > -             unsigned int BlendingAndTiming[],
> > >               unsigned int DPPPerPlane[],
> > >               double BytePerPixelDETY[],
> > >               double BytePerPixelDETC[],
> > > -             double DSTXAfterScaler[],
> > > -             double DSTYAfterScaler[],
> > > -             bool WritebackEnable[],
> > > -             enum source_format_class WritebackPixelFormat[],
> > > -             double WritebackDestinationWidth[],
> > > -             double WritebackDestinationHeight[],
> > > -             double WritebackSourceHeight[],
> > >               bool UnboundedRequestEnabled,
> > >               unsigned int CompressedBufferSizeInkByte,
> > >               enum clock_change_support *DRAMClockChangeSupport,
> > > -             double *UrgentWatermark,
> > > -             double *WritebackUrgentWatermark,
> > > -             double *DRAMClockChangeWatermark,
> > > -             double *WritebackDRAMClockChangeWatermark,
> > >               double *StutterExitWatermark,
> > >               double *StutterEnterPlusExitWatermark,
> > >               double *Z8StutterExitWatermark,
> > > -             double *Z8StutterEnterPlusExitWatermark,
> > > -             double *MinActiveDRAMClockChangeLatencySupported);
> > > +             double *Z8StutterEnterPlusExitWatermark);
> > >
> > >  static void CalculateDCFCLKDeepSleep(
> > >               struct display_mode_lib *mode_lib,
> > > @@ -3041,64 +3005,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
> > >               CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >                               mode_lib,
> > >                               PrefetchMode,
> > > -                             v->NumberOfActivePlanes,
> > > -                             v->MaxLineBufferLines,
> > > -                             v->LineBufferSize,
> > > -                             v->WritebackInterfaceBufferSize,
> > >                               v->DCFCLK,
> > >                               v->ReturnBW,
> > > -                             v->SynchronizedVBlank,
> > > -                             v->dpte_group_bytes,
> > > -                             v->MetaChunkSize,
> > >                               v->UrgentLatency,
> > >                               v->UrgentExtraLatency,
> > > -                             v->WritebackLatency,
> > > -                             v->WritebackChunkSize,
> > >                               v->SOCCLK,
> > > -                             v->DRAMClockChangeLatency,
> > > -                             v->SRExitTime,
> > > -                             v->SREnterPlusExitTime,
> > > -                             v->SRExitZ8Time,
> > > -                             v->SREnterPlusExitZ8Time,
> > >                               v->DCFCLKDeepSleep,
> > >                               v->DETBufferSizeY,
> > >                               v->DETBufferSizeC,
> > >                               v->SwathHeightY,
> > >                               v->SwathHeightC,
> > > -                             v->LBBitPerPixel,
> > >                               v->SwathWidthY,
> > >                               v->SwathWidthC,
> > > -                             v->HRatio,
> > > -                             v->HRatioChroma,
> > > -                             v->vtaps,
> > > -                             v->VTAPsChroma,
> > > -                             v->VRatio,
> > > -                             v->VRatioChroma,
> > > -                             v->HTotal,
> > > -                             v->PixelClock,
> > > -                             v->BlendingAndTiming,
> > >                               v->DPPPerPlane,
> > >                               v->BytePerPixelDETY,
> > >                               v->BytePerPixelDETC,
> > > -                             v->DSTXAfterScaler,
> > > -                             v->DSTYAfterScaler,
> > > -                             v->WritebackEnable,
> > > -                             v->WritebackPixelFormat,
> > > -                             v->WritebackDestinationWidth,
> > > -                             v->WritebackDestinationHeight,
> > > -                             v->WritebackSourceHeight,
> > >                               v->UnboundedRequestEnabled,
> > >                               v->CompressedBufferSizeInkByte,
> > >                               &DRAMClockChangeSupport,
> > > -                             &v->UrgentWatermark,
> > > -                             &v->WritebackUrgentWatermark,
> > > -                             &v->DRAMClockChangeWatermark,
> > > -                             &v->WritebackDRAMClockChangeWatermark,
> > >                               &v->StutterExitWatermark,
> > >                               &v->StutterEnterPlusExitWatermark,
> > >                               &v->Z8StutterExitWatermark,
> > > -                             &v->Z8StutterEnterPlusExitWatermark,
> > > -                             &v->MinActiveDRAMClockChangeLatencySupported);
> > > +                             &v->Z8StutterEnterPlusExitWatermark);
> > >
> > >               for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > >                       if (v->WritebackEnable[k] == true) {
> > > @@ -5496,64 +5424,28 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
> > >                       CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >                                       mode_lib,
> > >                                       v->PrefetchModePerState[i][j],
> > > -                                     v->NumberOfActivePlanes,
> > > -                                     v->MaxLineBufferLines,
> > > -                                     v->LineBufferSize,
> > > -                                     v->WritebackInterfaceBufferSize,
> > >                                       v->DCFCLKState[i][j],
> > >                                       v->ReturnBWPerState[i][j],
> > > -                                     v->SynchronizedVBlank,
> > > -                                     v->dpte_group_bytes,
> > > -                                     v->MetaChunkSize,
> > >                                       v->UrgLatency[i],
> > >                                       v->ExtraLatency,
> > > -                                     v->WritebackLatency,
> > > -                                     v->WritebackChunkSize,
> > >                                       v->SOCCLKPerState[i],
> > > -                                     v->DRAMClockChangeLatency,
> > > -                                     v->SRExitTime,
> > > -                                     v->SREnterPlusExitTime,
> > > -                                     v->SRExitZ8Time,
> > > -                                     v->SREnterPlusExitZ8Time,
> > >                                       v->ProjectedDCFCLKDeepSleep[i][j],
> > >                                       v->DETBufferSizeYThisState,
> > >                                       v->DETBufferSizeCThisState,
> > >                                       v->SwathHeightYThisState,
> > >                                       v->SwathHeightCThisState,
> > > -                                     v->LBBitPerPixel,
> > >                                       v->SwathWidthYThisState,
> > >                                       v->SwathWidthCThisState,
> > > -                                     v->HRatio,
> > > -                                     v->HRatioChroma,
> > > -                                     v->vtaps,
> > > -                                     v->VTAPsChroma,
> > > -                                     v->VRatio,
> > > -                                     v->VRatioChroma,
> > > -                                     v->HTotal,
> > > -                                     v->PixelClock,
> > > -                                     v->BlendingAndTiming,
> > >                                       v->NoOfDPPThisState,
> > >                                       v->BytePerPixelInDETY,
> > >                                       v->BytePerPixelInDETC,
> > > -                                     v->DSTXAfterScaler,
> > > -                                     v->DSTYAfterScaler,
> > > -                                     v->WritebackEnable,
> > > -                                     v->WritebackPixelFormat,
> > > -                                     v->WritebackDestinationWidth,
> > > -                                     v->WritebackDestinationHeight,
> > > -                                     v->WritebackSourceHeight,
> > >                                       UnboundedRequestEnabledThisState,
> > >                                       CompressedBufferSizeInkByteThisState,
> > >                                       &v->DRAMClockChangeSupport[i][j],
> > > -                                     &v->UrgentWatermark,
> > > -                                     &v->WritebackUrgentWatermark,
> > > -                                     &v->DRAMClockChangeWatermark,
> > > -                                     &v->WritebackDRAMClockChangeWatermark,
> > > -                                     &dummy,
> > >                                       &dummy,
> > >                                       &dummy,
> > >                                       &dummy,
> > > -                                     &v->MinActiveDRAMClockChangeLatencySupported);
> > > +                                     &dummy);
> > >               }
> > >       }
> > >
> > > @@ -5679,64 +5571,28 @@ void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_
> > >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >               struct display_mode_lib *mode_lib,
> > >               unsigned int PrefetchMode,
> > > -             unsigned int NumberOfActivePlanes,
> > > -             unsigned int MaxLineBufferLines,
> > > -             unsigned int LineBufferSize,
> > > -             unsigned int WritebackInterfaceBufferSize,
> > >               double DCFCLK,
> > >               double ReturnBW,
> > > -             bool SynchronizedVBlank,
> > > -             unsigned int dpte_group_bytes[],
> > > -             unsigned int MetaChunkSize,
> > >               double UrgentLatency,
> > >               double ExtraLatency,
> > > -             double WritebackLatency,
> > > -             double WritebackChunkSize,
> > >               double SOCCLK,
> > > -             double DRAMClockChangeLatency,
> > > -             double SRExitTime,
> > > -             double SREnterPlusExitTime,
> > > -             double SRExitZ8Time,
> > > -             double SREnterPlusExitZ8Time,
> > >               double DCFCLKDeepSleep,
> > >               unsigned int DETBufferSizeY[],
> > >               unsigned int DETBufferSizeC[],
> > >               unsigned int SwathHeightY[],
> > >               unsigned int SwathHeightC[],
> > > -             unsigned int LBBitPerPixel[],
> > >               double SwathWidthY[],
> > >               double SwathWidthC[],
> > > -             double HRatio[],
> > > -             double HRatioChroma[],
> > > -             unsigned int vtaps[],
> > > -             unsigned int VTAPsChroma[],
> > > -             double VRatio[],
> > > -             double VRatioChroma[],
> > > -             unsigned int HTotal[],
> > > -             double PixelClock[],
> > > -             unsigned int BlendingAndTiming[],
> > >               unsigned int DPPPerPlane[],
> > >               double BytePerPixelDETY[],
> > >               double BytePerPixelDETC[],
> > > -             double DSTXAfterScaler[],
> > > -             double DSTYAfterScaler[],
> > > -             bool WritebackEnable[],
> > > -             enum source_format_class WritebackPixelFormat[],
> > > -             double WritebackDestinationWidth[],
> > > -             double WritebackDestinationHeight[],
> > > -             double WritebackSourceHeight[],
> > >               bool UnboundedRequestEnabled,
> > >               unsigned int CompressedBufferSizeInkByte,
> > >               enum clock_change_support *DRAMClockChangeSupport,
> > > -             double *UrgentWatermark,
> > > -             double *WritebackUrgentWatermark,
> > > -             double *DRAMClockChangeWatermark,
> > > -             double *WritebackDRAMClockChangeWatermark,
> > >               double *StutterExitWatermark,
> > >               double *StutterEnterPlusExitWatermark,
> > >               double *Z8StutterExitWatermark,
> > > -             double *Z8StutterEnterPlusExitWatermark,
> > > -             double *MinActiveDRAMClockChangeLatencySupported)
> > > +             double *Z8StutterEnterPlusExitWatermark)
> > >  {
> > >       struct vba_vars_st *v = &mode_lib->vba;
> > >       double EffectiveLBLatencyHidingY;
> > > @@ -5756,103 +5612,103 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >       double TotalPixelBW = 0.0;
> > >       int k, j;
> > >
> > > -     *UrgentWatermark = UrgentLatency + ExtraLatency;
> > > +     v->UrgentWatermark = UrgentLatency + ExtraLatency;
> > >
> > >  #ifdef __DML_VBA_DEBUG__
> > >       dml_print("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
> > >       dml_print("DML::%s: ExtraLatency = %f\n", __func__, ExtraLatency);
> > > -     dml_print("DML::%s: UrgentWatermark = %f\n", __func__, *UrgentWatermark);
> > > +     dml_print("DML::%s: UrgentWatermark = %f\n", __func__, v->UrgentWatermark);
> > >  #endif
> > >
> > > -     *DRAMClockChangeWatermark = DRAMClockChangeLatency + *UrgentWatermark;
> > > +     v->DRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->UrgentWatermark;
> > >
> > >  #ifdef __DML_VBA_DEBUG__
> > > -     dml_print("DML::%s: DRAMClockChangeLatency = %f\n", __func__, DRAMClockChangeLatency);
> > > -     dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, *DRAMClockChangeWatermark);
> > > +     dml_print("DML::%s: v->DRAMClockChangeLatency = %f\n", __func__, v->DRAMClockChangeLatency);
> > > +     dml_print("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, v->DRAMClockChangeWatermark);
> > >  #endif
> > >
> > >       v->TotalActiveWriteback = 0;
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > -             if (WritebackEnable[k] == true) {
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > > +             if (v->WritebackEnable[k] == true) {
> > >                       v->TotalActiveWriteback = v->TotalActiveWriteback + 1;
> > >               }
> > >       }
> > >
> > >       if (v->TotalActiveWriteback <= 1) {
> > > -             *WritebackUrgentWatermark = WritebackLatency;
> > > +             v->WritebackUrgentWatermark = v->WritebackLatency;
> > >       } else {
> > > -             *WritebackUrgentWatermark = WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > > +             v->WritebackUrgentWatermark = v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > >       }
> > >
> > >       if (v->TotalActiveWriteback <= 1) {
> > > -             *WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency;
> > > +             v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency;
> > >       } else {
> > > -             *WritebackDRAMClockChangeWatermark = DRAMClockChangeLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > > +             v->WritebackDRAMClockChangeWatermark = v->DRAMClockChangeLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > >       }
> > >
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > >               TotalPixelBW = TotalPixelBW
> > > -                             + DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * VRatioChroma[k])
> > > -                                             / (HTotal[k] / PixelClock[k]);
> > > +                             + DPPPerPlane[k] * (SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * v->VRatioChroma[k])
> > > +                                             / (v->HTotal[k] / v->PixelClock[k]);
> > >       }
> > >
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > >               double EffectiveDETBufferSizeY = DETBufferSizeY[k];
> > >
> > >               v->LBLatencyHidingSourceLinesY = dml_min(
> > > -                             (double) MaxLineBufferLines,
> > > -                             dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
> > > +                             (double) v->MaxLineBufferLines,
> > > +                             dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vtaps[k] - 1);
> > >
> > >               v->LBLatencyHidingSourceLinesC = dml_min(
> > > -                             (double) MaxLineBufferLines,
> > > -                             dml_floor(LineBufferSize / LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChroma[k] - 1);
> > > +                             (double) v->MaxLineBufferLines,
> > > +                             dml_floor(v->LineBufferSize / v->LBBitPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (v->VTAPsChroma[k] - 1);
> > >
> > > -             EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
> > > +             EffectiveLBLatencyHidingY = v->LBLatencyHidingSourceLinesY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
> > >
> > > -             EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
> > > +             EffectiveLBLatencyHidingC = v->LBLatencyHidingSourceLinesC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
> > >
> > >               if (UnboundedRequestEnabled) {
> > >                       EffectiveDETBufferSizeY = EffectiveDETBufferSizeY
> > > -                                     + CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] / (HTotal[k] / PixelClock[k]) / TotalPixelBW;
> > > +                                     + CompressedBufferSizeInkByte * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] / (v->HTotal[k] / v->PixelClock[k]) / TotalPixelBW;
> > >               }
> > >
> > >               LinesInDETY[k] = (double) EffectiveDETBufferSizeY / BytePerPixelDETY[k] / SwathWidthY[k];
> > >               LinesInDETYRoundedDownToSwath[k] = dml_floor(LinesInDETY[k], SwathHeightY[k]);
> > > -             FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
> > > +             FullDETBufferingTimeY = LinesInDETYRoundedDownToSwath[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
> > >               if (BytePerPixelDETC[k] > 0) {
> > >                       LinesInDETC = v->DETBufferSizeC[k] / BytePerPixelDETC[k] / SwathWidthC[k];
> > >                       LinesInDETCRoundedDownToSwath = dml_floor(LinesInDETC, SwathHeightC[k]);
> > > -                     FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
> > > +                     FullDETBufferingTimeC = LinesInDETCRoundedDownToSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
> > >               } else {
> > >                       LinesInDETC = 0;
> > >                       FullDETBufferingTimeC = 999999;
> > >               }
> > >
> > >               ActiveDRAMClockChangeLatencyMarginY = EffectiveLBLatencyHidingY + FullDETBufferingTimeY
> > > -                             - ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
> > > +                             - ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
> > >
> > > -             if (NumberOfActivePlanes > 1) {
> > > +             if (v->NumberOfActivePlanes > 1) {
> > >                       ActiveDRAMClockChangeLatencyMarginY = ActiveDRAMClockChangeLatencyMarginY
> > > -                                     - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
> > > +                                     - (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k];
> > >               }
> > >
> > >               if (BytePerPixelDETC[k] > 0) {
> > >                       ActiveDRAMClockChangeLatencyMarginC = EffectiveLBLatencyHidingC + FullDETBufferingTimeC
> > > -                                     - ((double) DSTXAfterScaler[k] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark - *DRAMClockChangeWatermark;
> > > +                                     - ((double) v->DSTXAfterScaler[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
> > >
> > > -                     if (NumberOfActivePlanes > 1) {
> > > +                     if (v->NumberOfActivePlanes > 1) {
> > >                               ActiveDRAMClockChangeLatencyMarginC = ActiveDRAMClockChangeLatencyMarginC
> > > -                                             - (1 - 1.0 / NumberOfActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[k];
> > > +                                             - (1 - 1.0 / v->NumberOfActivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatioChroma[k];
> > >                       }
> > >                       v->ActiveDRAMClockChangeLatencyMargin[k] = dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMarginC);
> > >               } else {
> > >                       v->ActiveDRAMClockChangeLatencyMargin[k] = ActiveDRAMClockChangeLatencyMarginY;
> > >               }
> > >
> > > -             if (WritebackEnable[k] == true) {
> > > -                     WritebackDRAMClockChangeLatencyHiding = WritebackInterfaceBufferSize * 1024
> > > -                                     / (WritebackDestinationWidth[k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] / PixelClock[k]) * 4);
> > > -                     if (WritebackPixelFormat[k] == dm_444_64) {
> > > +             if (v->WritebackEnable[k] == true) {
> > > +                     WritebackDRAMClockChangeLatencyHiding = v->WritebackInterfaceBufferSize * 1024
> > > +                                     / (v->WritebackDestinationWidth[k] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v->HTotal[k] / v->PixelClock[k]) * 4);
> > > +                     if (v->WritebackPixelFormat[k] == dm_444_64) {
> > >                               WritebackDRAMClockChangeLatencyHiding = WritebackDRAMClockChangeLatencyHiding / 2;
> > >                       }
> > >                       WritebackDRAMClockChangeLatencyMargin = WritebackDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
> > > @@ -5862,14 +5718,14 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >
> > >       v->MinActiveDRAMClockChangeMargin = 999999;
> > >       PlaneWithMinActiveDRAMClockChangeMargin = 0;
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > >               if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->MinActiveDRAMClockChangeMargin) {
> > >                       v->MinActiveDRAMClockChangeMargin = v->ActiveDRAMClockChangeLatencyMargin[k];
> > > -                     if (BlendingAndTiming[k] == k) {
> > > +                     if (v->BlendingAndTiming[k] == k) {
> > >                               PlaneWithMinActiveDRAMClockChangeMargin = k;
> > >                       } else {
> > > -                             for (j = 0; j < NumberOfActivePlanes; ++j) {
> > > -                                     if (BlendingAndTiming[k] == j) {
> > > +                             for (j = 0; j < v->NumberOfActivePlanes; ++j) {
> > > +                                     if (v->BlendingAndTiming[k] == j) {
> > >                                               PlaneWithMinActiveDRAMClockChangeMargin = j;
> > >                                       }
> > >                               }
> > > @@ -5877,11 +5733,11 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >               }
> > >       }
> > >
> > > -     *MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + DRAMClockChangeLatency;
> > > +     v->MinActiveDRAMClockChangeLatencySupported = v->MinActiveDRAMClockChangeMargin + v->DRAMClockChangeLatency ;
> > >
> > >       SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = 999999;
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > -             if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (BlendingAndTiming[k] == k)) && !(BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > > +             if (!((k == PlaneWithMinActiveDRAMClockChangeMargin) && (v->BlendingAndTiming[k] == k)) && !(v->BlendingAndTiming[k] == PlaneWithMinActiveDRAMClockChangeMargin)
> > >                               && v->ActiveDRAMClockChangeLatencyMargin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
> > >                       SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank = v->ActiveDRAMClockChangeLatencyMargin[k];
> > >               }
> > > @@ -5889,25 +5745,25 @@ static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > >
> > >       v->TotalNumberOfActiveOTG = 0;
> > >
> > > -     for (k = 0; k < NumberOfActivePlanes; ++k) {
> > > -             if (BlendingAndTiming[k] == k) {
> > > +     for (k = 0; k < v->NumberOfActivePlanes; ++k) {
> > > +             if (v->BlendingAndTiming[k] == k) {
> > >                       v->TotalNumberOfActiveOTG = v->TotalNumberOfActiveOTG + 1;
> > >               }
> > >       }
> > >
> > >       if (v->MinActiveDRAMClockChangeMargin > 0 && PrefetchMode == 0) {
> > >               *DRAMClockChangeSupport = dm_dram_clock_change_vactive;
> > > -     } else if ((SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
> > > +     } else if ((v->SynchronizedVBlank == true || v->TotalNumberOfActiveOTG == 1
> > >                       || SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank > 0) && PrefetchMode == 0) {
> > >               *DRAMClockChangeSupport = dm_dram_clock_change_vblank;
> > >       } else {
> > >               *DRAMClockChangeSupport = dm_dram_clock_change_unsupported;
> > >       }
> > >
> > > -     *StutterExitWatermark = SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > -     *StutterEnterPlusExitWatermark = (SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
> > > -     *Z8StutterExitWatermark = SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > -     *Z8StutterEnterPlusExitWatermark = SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > +     *StutterExitWatermark = v->SRExitTime + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > +     *StutterEnterPlusExitWatermark = (v->SREnterPlusExitTime + ExtraLatency + 10 / DCFCLKDeepSleep);
> > > +     *Z8StutterExitWatermark = v->SRExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > +     *Z8StutterEnterPlusExitWatermark = v->SREnterPlusExitZ8Time + ExtraLatency + 10 / DCFCLKDeepSleep;
> > >
> > >  #ifdef __DML_VBA_DEBUG__
> > >       dml_print("DML::%s: StutterExitWatermark = %f\n", __func__, *StutterExitWatermark);
> > >
> > > base-commit: dacd2d2d9d800b7ab2ee2734578112532cba8105
