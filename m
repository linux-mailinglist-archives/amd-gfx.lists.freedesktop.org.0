Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672E5BF296
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Sep 2022 03:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83310E7DE;
	Wed, 21 Sep 2022 01:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F18810E339;
 Wed, 21 Sep 2022 01:12:43 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 k10-20020a4ad10a000000b004756ab911f8so663863oor.2; 
 Tue, 20 Sep 2022 18:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=4tFgQb6cmV5UG8TH+Y2dN3YzBKPsNPDYuT5m1NmAQis=;
 b=LZZkFdkgc3doghZv4dC55o/2QDAz7GJMo7DHbmWAidgxJWPgL2PzlvJU2zRfBDIv1u
 X3UbTyi12OJJEOl9KiiGQvXV8RB9/w3LicG//djoKNHC7LfSoJ7LElnMdczEGk1TfSq0
 IPBU9bijp/P3OmuZNRuTMMkAE0im/5ukcvxl/V6z6r0ukgPuCA+jR0TLbomr1vu6kwRC
 MADrny5v91s4dN6Ans9TeBuBSGhRWEHf5lheWL6vqcuwkmSkYPbSDQL41Y5aceP5bdQ0
 oVcCzFFvCsac6pZtweRxojaopMNSPuY+M7+jpAABH8CdZPKuttqLLUKvnvChc6vA7OBh
 uWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4tFgQb6cmV5UG8TH+Y2dN3YzBKPsNPDYuT5m1NmAQis=;
 b=SuHYXoNGchxTv59zuPdcVX2d4gCO6ysxvtMn1d5mr2vPNNodE20wu1aGoSWUOVW15x
 ijc70TKYe24D2JrVkoTXPrFrNJRvEGfKtanBr6DvIxZECkx6kD8Xqdj8hlfQEd8qFlkt
 NrPG23ba55ka4KwLtWiN4WqFZ+5pdkJiqMb9yZZExALVlMMQIMbmYJU6gPmBOu0u9DCF
 IOzSCipPBufQeCasHbiUJZNBpvdKAxnAsIpzZrwKAHlvSzxqKCwioQ6xSaoAZZMlCKu4
 lIWko3GmFlfvMC9xGr0pyaAWwSOMxGm/hv2X6MinomSCMZ+xCaU73JyYVdKK8+b90qVa
 GkGQ==
X-Gm-Message-State: ACrzQf2HlggEfkjSjnd3rvyf9CPzm1whad+Pm+nBPLpdKpbhJ3+r+Kjo
 w9RJUNBHOM7IfPyZ3iatSpAGKoA9Hoa+Iy2lEqA=
X-Google-Smtp-Source: AMsMyM6eXApouVeyn1hBKeL9lH5df2VGqVB7yvLVcCeRWZ4k8YZ0fQPaPR8F/m93WAbnRIPCypVbnrMvutLMaj05Q08=
X-Received: by 2002:a4a:654c:0:b0:475:7b3b:6081 with SMTP id
 z12-20020a4a654c000000b004757b3b6081mr9658232oog.70.1663722762174; Tue, 20
 Sep 2022 18:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220916210658.3412450-1-nathan@kernel.org>
 <5e0b4692-b3ac-20ce-bd0b-65f52804601b@riseup.net>
 <CADnq5_O67aFW95nNbgPJipypnpzAC-HO=FYkdxOMpOJQXF+CKw@mail.gmail.com>
 <YypRRD+wWVBDPGL9@dev-arch.thelio-3990X>
In-Reply-To: <YypRRD+wWVBDPGL9@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Sep 2022 21:12:30 -0400
Message-ID: <CADnq5_PccJ90-qnj3BhudoG8irNXWkpj3nZpHc2jdcFpU0KHiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce number of arguments of
 dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 "kernelci.org bot" <bot@kernelci.org>, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 7:48 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> On Tue, Sep 20, 2022 at 12:06:46PM -0400, Alex Deucher wrote:
> > Applied the series.  Thanks!
>
> Great, thank you so much! Hopefully these could also be applied to the
> 6.0 branch so that this error can be resolved there as well. No worries
> on timeline if that was already the plan but I just want to keep -Werror
> on for arm64 and x86_64 allmodconfig for this release.

Yes, that is the plan.

Alex

>
> Cheers,
> Nathan
>
> > On Sat, Sep 17, 2022 at 8:38 AM Ma=C3=ADra Canal <mairacanal@riseup.net=
> wrote:
> > >
> > > Hi Nathan,
> > >
> > > On 9/16/22 18:06, Nathan Chancellor wrote:
> > > > Most of the arguments are identical between the two call sites and =
they
> > > > can be accessed through the 'struct vba_vars_st' pointer. This redu=
ces
> > > > the total amount of stack space that
> > > > dml314_ModeSupportAndSystemConfigurationFull() uses by 240 bytes wi=
th
> > > > LLVM 16 (2216 -> 1976), helping clear up the following clang warnin=
g:
> > > >
> > > >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_=
vba_314.c:4020:6: error: stack frame size (2216) exceeds limit (2048) in 'd=
ml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> > > >   void dml314_ModeSupportAndSystemConfigurationFull(struct display_=
mode_lib *mode_lib)
> > > >        ^
> > > >   1 error generated.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1710
> > > > Reported-by: "kernelci.org bot" <bot@kernelci.org>
> > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > I have built-tested the whole series with clang 14.0.5 (Fedora
> > > 14.0.5-1.fc36), using:
> > >
> > > $ make -kj"$(nproc)" ARCH=3Dx86_64 LLVM=3D1 mrproper allmodconfig
> > > drivers/gpu/drm/amd/amdgpu/
> > >
> > > Another great patch to the DML! As Tom, I also would like to see this
> > > expand to all display_mode_vba files, but so far this is great to
> > > unbreak the build.
> > >
> > > To the whole series:
> > >
> > > Tested-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> > >
> > > Best Regards,
> > > - Ma=C3=ADra Canal
> > >
> > > > ---
> > > >
> > > > This is just commit ab2ac59c32db ("drm/amd/display: Reduce number o=
f
> > > > arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()=
")
> > > > applied to dml314.
> > > >
> > > >  .../dc/dml/dcn314/display_mode_vba_314.c      | 248 ++++----------=
----
> > > >  1 file changed, 52 insertions(+), 196 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode=
_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314=
.c
> > > > index 2829f179f982..32ceb72f7a14 100644
> > > > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_31=
4.c
> > > > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_31=
4.c
> > > > @@ -325,64 +325,28 @@ static void CalculateVupdateAndDynamicMetadat=
aParameters(
> > > >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > > >               struct display_mode_lib *mode_lib,
> > > >               unsigned int PrefetchMode,
> > > > -             unsigned int NumberOfActivePlanes,
> > > > -             unsigned int MaxLineBufferLines,
> > > > -             unsigned int LineBufferSize,
> > > > -             unsigned int WritebackInterfaceBufferSize,
> > > >               double DCFCLK,
> > > >               double ReturnBW,
> > > > -             bool SynchronizedVBlank,
> > > > -             unsigned int dpte_group_bytes[],
> > > > -             unsigned int MetaChunkSize,
> > > >               double UrgentLatency,
> > > >               double ExtraLatency,
> > > > -             double WritebackLatency,
> > > > -             double WritebackChunkSize,
> > > >               double SOCCLK,
> > > > -             double DRAMClockChangeLatency,
> > > > -             double SRExitTime,
> > > > -             double SREnterPlusExitTime,
> > > > -             double SRExitZ8Time,
> > > > -             double SREnterPlusExitZ8Time,
> > > >               double DCFCLKDeepSleep,
> > > >               unsigned int DETBufferSizeY[],
> > > >               unsigned int DETBufferSizeC[],
> > > >               unsigned int SwathHeightY[],
> > > >               unsigned int SwathHeightC[],
> > > > -             unsigned int LBBitPerPixel[],
> > > >               double SwathWidthY[],
> > > >               double SwathWidthC[],
> > > > -             double HRatio[],
> > > > -             double HRatioChroma[],
> > > > -             unsigned int vtaps[],
> > > > -             unsigned int VTAPsChroma[],
> > > > -             double VRatio[],
> > > > -             double VRatioChroma[],
> > > > -             unsigned int HTotal[],
> > > > -             double PixelClock[],
> > > > -             unsigned int BlendingAndTiming[],
> > > >               unsigned int DPPPerPlane[],
> > > >               double BytePerPixelDETY[],
> > > >               double BytePerPixelDETC[],
> > > > -             double DSTXAfterScaler[],
> > > > -             double DSTYAfterScaler[],
> > > > -             bool WritebackEnable[],
> > > > -             enum source_format_class WritebackPixelFormat[],
> > > > -             double WritebackDestinationWidth[],
> > > > -             double WritebackDestinationHeight[],
> > > > -             double WritebackSourceHeight[],
> > > >               bool UnboundedRequestEnabled,
> > > >               unsigned int CompressedBufferSizeInkByte,
> > > >               enum clock_change_support *DRAMClockChangeSupport,
> > > > -             double *UrgentWatermark,
> > > > -             double *WritebackUrgentWatermark,
> > > > -             double *DRAMClockChangeWatermark,
> > > > -             double *WritebackDRAMClockChangeWatermark,
> > > >               double *StutterExitWatermark,
> > > >               double *StutterEnterPlusExitWatermark,
> > > >               double *Z8StutterExitWatermark,
> > > > -             double *Z8StutterEnterPlusExitWatermark,
> > > > -             double *MinActiveDRAMClockChangeLatencySupported);
> > > > +             double *Z8StutterEnterPlusExitWatermark);
> > > >
> > > >  static void CalculateDCFCLKDeepSleep(
> > > >               struct display_mode_lib *mode_lib,
> > > > @@ -3041,64 +3005,28 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPre=
fetchParametersWatermarksAndPerforman
> > > >               CalculateWatermarksAndDRAMSpeedChangeSupport(
> > > >                               mode_lib,
> > > >                               PrefetchMode,
> > > > -                             v->NumberOfActivePlanes,
> > > > -                             v->MaxLineBufferLines,
> > > > -                             v->LineBufferSize,
> > > > -                             v->WritebackInterfaceBufferSize,
> > > >                               v->DCFCLK,
> > > >                               v->ReturnBW,
> > > > -                             v->SynchronizedVBlank,
> > > > -                             v->dpte_group_bytes,
> > > > -                             v->MetaChunkSize,
> > > >                               v->UrgentLatency,
> > > >                               v->UrgentExtraLatency,
> > > > -                             v->WritebackLatency,
> > > > -                             v->WritebackChunkSize,
> > > >                               v->SOCCLK,
> > > > -                             v->DRAMClockChangeLatency,
> > > > -                             v->SRExitTime,
> > > > -                             v->SREnterPlusExitTime,
> > > > -                             v->SRExitZ8Time,
> > > > -                             v->SREnterPlusExitZ8Time,
> > > >                               v->DCFCLKDeepSleep,
> > > >                               v->DETBufferSizeY,
> > > >                               v->DETBufferSizeC,
> > > >                               v->SwathHeightY,
> > > >                               v->SwathHeightC,
> > > > -                             v->LBBitPerPixel,
> > > >                               v->SwathWidthY,
> > > >                               v->SwathWidthC,
> > > > -                             v->HRatio,
> > > > -                             v->HRatioChroma,
> > > > -                             v->vtaps,
> > > > -                             v->VTAPsChroma,
> > > > -                             v->VRatio,
> > > > -                             v->VRatioChroma,
> > > > -                             v->HTotal,
> > > > -                             v->PixelClock,
> > > > -                             v->BlendingAndTiming,
> > > >                               v->DPPPerPlane,
> > > >                               v->BytePerPixelDETY,
> > > >                               v->BytePerPixelDETC,
> > > > -                             v->DSTXAfterScaler,
> > > > -                             v->DSTYAfterScaler,
> > > > -                             v->WritebackEnable,
> > > > -                             v->WritebackPixelFormat,
> > > > -                             v->WritebackDestinationWidth,
> > > > -                             v->WritebackDestinationHeight,
> > > > -                             v->WritebackSourceHeight,
> > > >                               v->UnboundedRequestEnabled,
> > > >                               v->CompressedBufferSizeInkByte,
> > > >                               &DRAMClockChangeSupport,
> > > > -                             &v->UrgentWatermark,
> > > > -                             &v->WritebackUrgentWatermark,
> > > > -                             &v->DRAMClockChangeWatermark,
> > > > -                             &v->WritebackDRAMClockChangeWatermark=
,
> > > >                               &v->StutterExitWatermark,
> > > >                               &v->StutterEnterPlusExitWatermark,
> > > >                               &v->Z8StutterExitWatermark,
> > > > -                             &v->Z8StutterEnterPlusExitWatermark,
> > > > -                             &v->MinActiveDRAMClockChangeLatencySu=
pported);
> > > > +                             &v->Z8StutterEnterPlusExitWatermark);
> > > >
> > > >               for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > >                       if (v->WritebackEnable[k] =3D=3D true) {
> > > > @@ -5496,64 +5424,28 @@ void dml314_ModeSupportAndSystemConfigurati=
onFull(struct display_mode_lib *mode_
> > > >                       CalculateWatermarksAndDRAMSpeedChangeSupport(
> > > >                                       mode_lib,
> > > >                                       v->PrefetchModePerState[i][j]=
,
> > > > -                                     v->NumberOfActivePlanes,
> > > > -                                     v->MaxLineBufferLines,
> > > > -                                     v->LineBufferSize,
> > > > -                                     v->WritebackInterfaceBufferSi=
ze,
> > > >                                       v->DCFCLKState[i][j],
> > > >                                       v->ReturnBWPerState[i][j],
> > > > -                                     v->SynchronizedVBlank,
> > > > -                                     v->dpte_group_bytes,
> > > > -                                     v->MetaChunkSize,
> > > >                                       v->UrgLatency[i],
> > > >                                       v->ExtraLatency,
> > > > -                                     v->WritebackLatency,
> > > > -                                     v->WritebackChunkSize,
> > > >                                       v->SOCCLKPerState[i],
> > > > -                                     v->DRAMClockChangeLatency,
> > > > -                                     v->SRExitTime,
> > > > -                                     v->SREnterPlusExitTime,
> > > > -                                     v->SRExitZ8Time,
> > > > -                                     v->SREnterPlusExitZ8Time,
> > > >                                       v->ProjectedDCFCLKDeepSleep[i=
][j],
> > > >                                       v->DETBufferSizeYThisState,
> > > >                                       v->DETBufferSizeCThisState,
> > > >                                       v->SwathHeightYThisState,
> > > >                                       v->SwathHeightCThisState,
> > > > -                                     v->LBBitPerPixel,
> > > >                                       v->SwathWidthYThisState,
> > > >                                       v->SwathWidthCThisState,
> > > > -                                     v->HRatio,
> > > > -                                     v->HRatioChroma,
> > > > -                                     v->vtaps,
> > > > -                                     v->VTAPsChroma,
> > > > -                                     v->VRatio,
> > > > -                                     v->VRatioChroma,
> > > > -                                     v->HTotal,
> > > > -                                     v->PixelClock,
> > > > -                                     v->BlendingAndTiming,
> > > >                                       v->NoOfDPPThisState,
> > > >                                       v->BytePerPixelInDETY,
> > > >                                       v->BytePerPixelInDETC,
> > > > -                                     v->DSTXAfterScaler,
> > > > -                                     v->DSTYAfterScaler,
> > > > -                                     v->WritebackEnable,
> > > > -                                     v->WritebackPixelFormat,
> > > > -                                     v->WritebackDestinationWidth,
> > > > -                                     v->WritebackDestinationHeight=
,
> > > > -                                     v->WritebackSourceHeight,
> > > >                                       UnboundedRequestEnabledThisSt=
ate,
> > > >                                       CompressedBufferSizeInkByteTh=
isState,
> > > >                                       &v->DRAMClockChangeSupport[i]=
[j],
> > > > -                                     &v->UrgentWatermark,
> > > > -                                     &v->WritebackUrgentWatermark,
> > > > -                                     &v->DRAMClockChangeWatermark,
> > > > -                                     &v->WritebackDRAMClockChangeW=
atermark,
> > > > -                                     &dummy,
> > > >                                       &dummy,
> > > >                                       &dummy,
> > > >                                       &dummy,
> > > > -                                     &v->MinActiveDRAMClockChangeL=
atencySupported);
> > > > +                                     &dummy);
> > > >               }
> > > >       }
> > > >
> > > > @@ -5679,64 +5571,28 @@ void dml314_ModeSupportAndSystemConfigurati=
onFull(struct display_mode_lib *mode_
> > > >  static void CalculateWatermarksAndDRAMSpeedChangeSupport(
> > > >               struct display_mode_lib *mode_lib,
> > > >               unsigned int PrefetchMode,
> > > > -             unsigned int NumberOfActivePlanes,
> > > > -             unsigned int MaxLineBufferLines,
> > > > -             unsigned int LineBufferSize,
> > > > -             unsigned int WritebackInterfaceBufferSize,
> > > >               double DCFCLK,
> > > >               double ReturnBW,
> > > > -             bool SynchronizedVBlank,
> > > > -             unsigned int dpte_group_bytes[],
> > > > -             unsigned int MetaChunkSize,
> > > >               double UrgentLatency,
> > > >               double ExtraLatency,
> > > > -             double WritebackLatency,
> > > > -             double WritebackChunkSize,
> > > >               double SOCCLK,
> > > > -             double DRAMClockChangeLatency,
> > > > -             double SRExitTime,
> > > > -             double SREnterPlusExitTime,
> > > > -             double SRExitZ8Time,
> > > > -             double SREnterPlusExitZ8Time,
> > > >               double DCFCLKDeepSleep,
> > > >               unsigned int DETBufferSizeY[],
> > > >               unsigned int DETBufferSizeC[],
> > > >               unsigned int SwathHeightY[],
> > > >               unsigned int SwathHeightC[],
> > > > -             unsigned int LBBitPerPixel[],
> > > >               double SwathWidthY[],
> > > >               double SwathWidthC[],
> > > > -             double HRatio[],
> > > > -             double HRatioChroma[],
> > > > -             unsigned int vtaps[],
> > > > -             unsigned int VTAPsChroma[],
> > > > -             double VRatio[],
> > > > -             double VRatioChroma[],
> > > > -             unsigned int HTotal[],
> > > > -             double PixelClock[],
> > > > -             unsigned int BlendingAndTiming[],
> > > >               unsigned int DPPPerPlane[],
> > > >               double BytePerPixelDETY[],
> > > >               double BytePerPixelDETC[],
> > > > -             double DSTXAfterScaler[],
> > > > -             double DSTYAfterScaler[],
> > > > -             bool WritebackEnable[],
> > > > -             enum source_format_class WritebackPixelFormat[],
> > > > -             double WritebackDestinationWidth[],
> > > > -             double WritebackDestinationHeight[],
> > > > -             double WritebackSourceHeight[],
> > > >               bool UnboundedRequestEnabled,
> > > >               unsigned int CompressedBufferSizeInkByte,
> > > >               enum clock_change_support *DRAMClockChangeSupport,
> > > > -             double *UrgentWatermark,
> > > > -             double *WritebackUrgentWatermark,
> > > > -             double *DRAMClockChangeWatermark,
> > > > -             double *WritebackDRAMClockChangeWatermark,
> > > >               double *StutterExitWatermark,
> > > >               double *StutterEnterPlusExitWatermark,
> > > >               double *Z8StutterExitWatermark,
> > > > -             double *Z8StutterEnterPlusExitWatermark,
> > > > -             double *MinActiveDRAMClockChangeLatencySupported)
> > > > +             double *Z8StutterEnterPlusExitWatermark)
> > > >  {
> > > >       struct vba_vars_st *v =3D &mode_lib->vba;
> > > >       double EffectiveLBLatencyHidingY;
> > > > @@ -5756,103 +5612,103 @@ static void CalculateWatermarksAndDRAMSpe=
edChangeSupport(
> > > >       double TotalPixelBW =3D 0.0;
> > > >       int k, j;
> > > >
> > > > -     *UrgentWatermark =3D UrgentLatency + ExtraLatency;
> > > > +     v->UrgentWatermark =3D UrgentLatency + ExtraLatency;
> > > >
> > > >  #ifdef __DML_VBA_DEBUG__
> > > >       dml_print("DML::%s: UrgentLatency =3D %f\n", __func__, Urgent=
Latency);
> > > >       dml_print("DML::%s: ExtraLatency =3D %f\n", __func__, ExtraLa=
tency);
> > > > -     dml_print("DML::%s: UrgentWatermark =3D %f\n", __func__, *Urg=
entWatermark);
> > > > +     dml_print("DML::%s: UrgentWatermark =3D %f\n", __func__, v->U=
rgentWatermark);
> > > >  #endif
> > > >
> > > > -     *DRAMClockChangeWatermark =3D DRAMClockChangeLatency + *Urgen=
tWatermark;
> > > > +     v->DRAMClockChangeWatermark =3D v->DRAMClockChangeLatency + v=
->UrgentWatermark;
> > > >
> > > >  #ifdef __DML_VBA_DEBUG__
> > > > -     dml_print("DML::%s: DRAMClockChangeLatency =3D %f\n", __func_=
_, DRAMClockChangeLatency);
> > > > -     dml_print("DML::%s: DRAMClockChangeWatermark =3D %f\n", __fun=
c__, *DRAMClockChangeWatermark);
> > > > +     dml_print("DML::%s: v->DRAMClockChangeLatency =3D %f\n", __fu=
nc__, v->DRAMClockChangeLatency);
> > > > +     dml_print("DML::%s: DRAMClockChangeWatermark =3D %f\n", __fun=
c__, v->DRAMClockChangeWatermark);
> > > >  #endif
> > > >
> > > >       v->TotalActiveWriteback =3D 0;
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > -             if (WritebackEnable[k] =3D=3D true) {
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > > +             if (v->WritebackEnable[k] =3D=3D true) {
> > > >                       v->TotalActiveWriteback =3D v->TotalActiveWri=
teback + 1;
> > > >               }
> > > >       }
> > > >
> > > >       if (v->TotalActiveWriteback <=3D 1) {
> > > > -             *WritebackUrgentWatermark =3D WritebackLatency;
> > > > +             v->WritebackUrgentWatermark =3D v->WritebackLatency;
> > > >       } else {
> > > > -             *WritebackUrgentWatermark =3D WritebackLatency + Writ=
ebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > > > +             v->WritebackUrgentWatermark =3D v->WritebackLatency +=
 v->WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > > >       }
> > > >
> > > >       if (v->TotalActiveWriteback <=3D 1) {
> > > > -             *WritebackDRAMClockChangeWatermark =3D DRAMClockChang=
eLatency + WritebackLatency;
> > > > +             v->WritebackDRAMClockChangeWatermark =3D v->DRAMClock=
ChangeLatency + v->WritebackLatency;
> > > >       } else {
> > > > -             *WritebackDRAMClockChangeWatermark =3D DRAMClockChang=
eLatency + WritebackLatency + WritebackChunkSize * 1024.0 / 32.0 / SOCCLK;
> > > > +             v->WritebackDRAMClockChangeWatermark =3D v->DRAMClock=
ChangeLatency + v->WritebackLatency + v->WritebackChunkSize * 1024.0 / 32.0=
 / SOCCLK;
> > > >       }
> > > >
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > >               TotalPixelBW =3D TotalPixelBW
> > > > -                             + DPPPerPlane[k] * (SwathWidthY[k] * =
BytePerPixelDETY[k] * VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] * VR=
atioChroma[k])
> > > > -                                             / (HTotal[k] / PixelC=
lock[k]);
> > > > +                             + DPPPerPlane[k] * (SwathWidthY[k] * =
BytePerPixelDETY[k] * v->VRatio[k] + SwathWidthC[k] * BytePerPixelDETC[k] *=
 v->VRatioChroma[k])
> > > > +                                             / (v->HTotal[k] / v->=
PixelClock[k]);
> > > >       }
> > > >
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > >               double EffectiveDETBufferSizeY =3D DETBufferSizeY[k];
> > > >
> > > >               v->LBLatencyHidingSourceLinesY =3D dml_min(
> > > > -                             (double) MaxLineBufferLines,
> > > > -                             dml_floor(LineBufferSize / LBBitPerPi=
xel[k] / (SwathWidthY[k] / dml_max(HRatio[k], 1.0)), 1)) - (vtaps[k] - 1);
> > > > +                             (double) v->MaxLineBufferLines,
> > > > +                             dml_floor(v->LineBufferSize / v->LBBi=
tPerPixel[k] / (SwathWidthY[k] / dml_max(v->HRatio[k], 1.0)), 1)) - (v->vta=
ps[k] - 1);
> > > >
> > > >               v->LBLatencyHidingSourceLinesC =3D dml_min(
> > > > -                             (double) MaxLineBufferLines,
> > > > -                             dml_floor(LineBufferSize / LBBitPerPi=
xel[k] / (SwathWidthC[k] / dml_max(HRatioChroma[k], 1.0)), 1)) - (VTAPsChro=
ma[k] - 1);
> > > > +                             (double) v->MaxLineBufferLines,
> > > > +                             dml_floor(v->LineBufferSize / v->LBBi=
tPerPixel[k] / (SwathWidthC[k] / dml_max(v->HRatioChroma[k], 1.0)), 1)) - (=
v->VTAPsChroma[k] - 1);
> > > >
> > > > -             EffectiveLBLatencyHidingY =3D v->LBLatencyHidingSourc=
eLinesY / VRatio[k] * (HTotal[k] / PixelClock[k]);
> > > > +             EffectiveLBLatencyHidingY =3D v->LBLatencyHidingSourc=
eLinesY / v->VRatio[k] * (v->HTotal[k] / v->PixelClock[k]);
> > > >
> > > > -             EffectiveLBLatencyHidingC =3D v->LBLatencyHidingSourc=
eLinesC / VRatioChroma[k] * (HTotal[k] / PixelClock[k]);
> > > > +             EffectiveLBLatencyHidingC =3D v->LBLatencyHidingSourc=
eLinesC / v->VRatioChroma[k] * (v->HTotal[k] / v->PixelClock[k]);
> > > >
> > > >               if (UnboundedRequestEnabled) {
> > > >                       EffectiveDETBufferSizeY =3D EffectiveDETBuffe=
rSizeY
> > > > -                                     + CompressedBufferSizeInkByte=
 * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * VRatio[k] / (HTotal[k] / P=
ixelClock[k]) / TotalPixelBW;
> > > > +                                     + CompressedBufferSizeInkByte=
 * 1024 * SwathWidthY[k] * BytePerPixelDETY[k] * v->VRatio[k] / (v->HTotal[=
k] / v->PixelClock[k]) / TotalPixelBW;
> > > >               }
> > > >
> > > >               LinesInDETY[k] =3D (double) EffectiveDETBufferSizeY /=
 BytePerPixelDETY[k] / SwathWidthY[k];
> > > >               LinesInDETYRoundedDownToSwath[k] =3D dml_floor(LinesI=
nDETY[k], SwathHeightY[k]);
> > > > -             FullDETBufferingTimeY =3D LinesInDETYRoundedDownToSwa=
th[k] * (HTotal[k] / PixelClock[k]) / VRatio[k];
> > > > +             FullDETBufferingTimeY =3D LinesInDETYRoundedDownToSwa=
th[k] * (v->HTotal[k] / v->PixelClock[k]) / v->VRatio[k];
> > > >               if (BytePerPixelDETC[k] > 0) {
> > > >                       LinesInDETC =3D v->DETBufferSizeC[k] / BytePe=
rPixelDETC[k] / SwathWidthC[k];
> > > >                       LinesInDETCRoundedDownToSwath =3D dml_floor(L=
inesInDETC, SwathHeightC[k]);
> > > > -                     FullDETBufferingTimeC =3D LinesInDETCRoundedD=
ownToSwath * (HTotal[k] / PixelClock[k]) / VRatioChroma[k];
> > > > +                     FullDETBufferingTimeC =3D LinesInDETCRoundedD=
ownToSwath * (v->HTotal[k] / v->PixelClock[k]) / v->VRatioChroma[k];
> > > >               } else {
> > > >                       LinesInDETC =3D 0;
> > > >                       FullDETBufferingTimeC =3D 999999;
> > > >               }
> > > >
> > > >               ActiveDRAMClockChangeLatencyMarginY =3D EffectiveLBLa=
tencyHidingY + FullDETBufferingTimeY
> > > > -                             - ((double) DSTXAfterScaler[k] / HTot=
al[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWatermark =
- *DRAMClockChangeWatermark;
> > > > +                             - ((double) v->DSTXAfterScaler[k] / v=
->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock[k] - v-=
>UrgentWatermark - v->DRAMClockChangeWatermark;
> > > >
> > > > -             if (NumberOfActivePlanes > 1) {
> > > > +             if (v->NumberOfActivePlanes > 1) {
> > > >                       ActiveDRAMClockChangeLatencyMarginY =3D Activ=
eDRAMClockChangeLatencyMarginY
> > > > -                                     - (1 - 1.0 / NumberOfActivePl=
anes) * SwathHeightY[k] * HTotal[k] / PixelClock[k] / VRatio[k];
> > > > +                                     - (1 - 1.0 / v->NumberOfActiv=
ePlanes) * SwathHeightY[k] * v->HTotal[k] / v->PixelClock[k] / v->VRatio[k]=
;
> > > >               }
> > > >
> > > >               if (BytePerPixelDETC[k] > 0) {
> > > >                       ActiveDRAMClockChangeLatencyMarginC =3D Effec=
tiveLBLatencyHidingC + FullDETBufferingTimeC
> > > > -                                     - ((double) DSTXAfterScaler[k=
] / HTotal[k] + DSTYAfterScaler[k]) * HTotal[k] / PixelClock[k] - *UrgentWa=
termark - *DRAMClockChangeWatermark;
> > > > +                                     - ((double) v->DSTXAfterScale=
r[k] / v->HTotal[k] + v->DSTYAfterScaler[k]) * v->HTotal[k] / v->PixelClock=
[k] - v->UrgentWatermark - v->DRAMClockChangeWatermark;
> > > >
> > > > -                     if (NumberOfActivePlanes > 1) {
> > > > +                     if (v->NumberOfActivePlanes > 1) {
> > > >                               ActiveDRAMClockChangeLatencyMarginC =
=3D ActiveDRAMClockChangeLatencyMarginC
> > > > -                                             - (1 - 1.0 / NumberOf=
ActivePlanes) * SwathHeightC[k] * HTotal[k] / PixelClock[k] / VRatioChroma[=
k];
> > > > +                                             - (1 - 1.0 / v->Numbe=
rOfActivePlanes) * SwathHeightC[k] * v->HTotal[k] / v->PixelClock[k] / v->V=
RatioChroma[k];
> > > >                       }
> > > >                       v->ActiveDRAMClockChangeLatencyMargin[k] =3D =
dml_min(ActiveDRAMClockChangeLatencyMarginY, ActiveDRAMClockChangeLatencyMa=
rginC);
> > > >               } else {
> > > >                       v->ActiveDRAMClockChangeLatencyMargin[k] =3D =
ActiveDRAMClockChangeLatencyMarginY;
> > > >               }
> > > >
> > > > -             if (WritebackEnable[k] =3D=3D true) {
> > > > -                     WritebackDRAMClockChangeLatencyHiding =3D Wri=
tebackInterfaceBufferSize * 1024
> > > > -                                     / (WritebackDestinationWidth[=
k] * WritebackDestinationHeight[k] / (WritebackSourceHeight[k] * HTotal[k] =
/ PixelClock[k]) * 4);
> > > > -                     if (WritebackPixelFormat[k] =3D=3D dm_444_64)=
 {
> > > > +             if (v->WritebackEnable[k] =3D=3D true) {
> > > > +                     WritebackDRAMClockChangeLatencyHiding =3D v->=
WritebackInterfaceBufferSize * 1024
> > > > +                                     / (v->WritebackDestinationWid=
th[k] * v->WritebackDestinationHeight[k] / (v->WritebackSourceHeight[k] * v=
->HTotal[k] / v->PixelClock[k]) * 4);
> > > > +                     if (v->WritebackPixelFormat[k] =3D=3D dm_444_=
64) {
> > > >                               WritebackDRAMClockChangeLatencyHiding=
 =3D WritebackDRAMClockChangeLatencyHiding / 2;
> > > >                       }
> > > >                       WritebackDRAMClockChangeLatencyMargin =3D Wri=
tebackDRAMClockChangeLatencyHiding - v->WritebackDRAMClockChangeWatermark;
> > > > @@ -5862,14 +5718,14 @@ static void CalculateWatermarksAndDRAMSpeed=
ChangeSupport(
> > > >
> > > >       v->MinActiveDRAMClockChangeMargin =3D 999999;
> > > >       PlaneWithMinActiveDRAMClockChangeMargin =3D 0;
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > >               if (v->ActiveDRAMClockChangeLatencyMargin[k] < v->Min=
ActiveDRAMClockChangeMargin) {
> > > >                       v->MinActiveDRAMClockChangeMargin =3D v->Acti=
veDRAMClockChangeLatencyMargin[k];
> > > > -                     if (BlendingAndTiming[k] =3D=3D k) {
> > > > +                     if (v->BlendingAndTiming[k] =3D=3D k) {
> > > >                               PlaneWithMinActiveDRAMClockChangeMarg=
in =3D k;
> > > >                       } else {
> > > > -                             for (j =3D 0; j < NumberOfActivePlane=
s; ++j) {
> > > > -                                     if (BlendingAndTiming[k] =3D=
=3D j) {
> > > > +                             for (j =3D 0; j < v->NumberOfActivePl=
anes; ++j) {
> > > > +                                     if (v->BlendingAndTiming[k] =
=3D=3D j) {
> > > >                                               PlaneWithMinActiveDRA=
MClockChangeMargin =3D j;
> > > >                                       }
> > > >                               }
> > > > @@ -5877,11 +5733,11 @@ static void CalculateWatermarksAndDRAMSpeed=
ChangeSupport(
> > > >               }
> > > >       }
> > > >
> > > > -     *MinActiveDRAMClockChangeLatencySupported =3D v->MinActiveDRA=
MClockChangeMargin + DRAMClockChangeLatency;
> > > > +     v->MinActiveDRAMClockChangeLatencySupported =3D v->MinActiveD=
RAMClockChangeMargin + v->DRAMClockChangeLatency ;
> > > >
> > > >       SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank =3D 99=
9999;
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > -             if (!((k =3D=3D PlaneWithMinActiveDRAMClockChangeMarg=
in) && (BlendingAndTiming[k] =3D=3D k)) && !(BlendingAndTiming[k] =3D=3D Pl=
aneWithMinActiveDRAMClockChangeMargin)
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > > +             if (!((k =3D=3D PlaneWithMinActiveDRAMClockChangeMarg=
in) && (v->BlendingAndTiming[k] =3D=3D k)) && !(v->BlendingAndTiming[k] =3D=
=3D PlaneWithMinActiveDRAMClockChangeMargin)
> > > >                               && v->ActiveDRAMClockChangeLatencyMar=
gin[k] < SecondMinActiveDRAMClockChangeMarginOneDisplayInVBLank) {
> > > >                       SecondMinActiveDRAMClockChangeMarginOneDispla=
yInVBLank =3D v->ActiveDRAMClockChangeLatencyMargin[k];
> > > >               }
> > > > @@ -5889,25 +5745,25 @@ static void CalculateWatermarksAndDRAMSpeed=
ChangeSupport(
> > > >
> > > >       v->TotalNumberOfActiveOTG =3D 0;
> > > >
> > > > -     for (k =3D 0; k < NumberOfActivePlanes; ++k) {
> > > > -             if (BlendingAndTiming[k] =3D=3D k) {
> > > > +     for (k =3D 0; k < v->NumberOfActivePlanes; ++k) {
> > > > +             if (v->BlendingAndTiming[k] =3D=3D k) {
> > > >                       v->TotalNumberOfActiveOTG =3D v->TotalNumberO=
fActiveOTG + 1;
> > > >               }
> > > >       }
> > > >
> > > >       if (v->MinActiveDRAMClockChangeMargin > 0 && PrefetchMode =3D=
=3D 0) {
> > > >               *DRAMClockChangeSupport =3D dm_dram_clock_change_vact=
ive;
> > > > -     } else if ((SynchronizedVBlank =3D=3D true || v->TotalNumberO=
fActiveOTG =3D=3D 1
> > > > +     } else if ((v->SynchronizedVBlank =3D=3D true || v->TotalNumb=
erOfActiveOTG =3D=3D 1
> > > >                       || SecondMinActiveDRAMClockChangeMarginOneDis=
playInVBLank > 0) && PrefetchMode =3D=3D 0) {
> > > >               *DRAMClockChangeSupport =3D dm_dram_clock_change_vbla=
nk;
> > > >       } else {
> > > >               *DRAMClockChangeSupport =3D dm_dram_clock_change_unsu=
pported;
> > > >       }
> > > >
> > > > -     *StutterExitWatermark =3D SRExitTime + ExtraLatency + 10 / DC=
FCLKDeepSleep;
> > > > -     *StutterEnterPlusExitWatermark =3D (SREnterPlusExitTime + Ext=
raLatency + 10 / DCFCLKDeepSleep);
> > > > -     *Z8StutterExitWatermark =3D SRExitZ8Time + ExtraLatency + 10 =
/ DCFCLKDeepSleep;
> > > > -     *Z8StutterEnterPlusExitWatermark =3D SREnterPlusExitZ8Time + =
ExtraLatency + 10 / DCFCLKDeepSleep;
> > > > +     *StutterExitWatermark =3D v->SRExitTime + ExtraLatency + 10 /=
 DCFCLKDeepSleep;
> > > > +     *StutterEnterPlusExitWatermark =3D (v->SREnterPlusExitTime + =
ExtraLatency + 10 / DCFCLKDeepSleep);
> > > > +     *Z8StutterExitWatermark =3D v->SRExitZ8Time + ExtraLatency + =
10 / DCFCLKDeepSleep;
> > > > +     *Z8StutterEnterPlusExitWatermark =3D v->SREnterPlusExitZ8Time=
 + ExtraLatency + 10 / DCFCLKDeepSleep;
> > > >
> > > >  #ifdef __DML_VBA_DEBUG__
> > > >       dml_print("DML::%s: StutterExitWatermark =3D %f\n", __func__,=
 *StutterExitWatermark);
> > > >
> > > > base-commit: dacd2d2d9d800b7ab2ee2734578112532cba8105
