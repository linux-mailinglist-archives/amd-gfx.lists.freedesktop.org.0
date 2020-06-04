Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238D1EED31
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 23:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607E6E5CD;
	Thu,  4 Jun 2020 21:15:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69856E5CD
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 21:15:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x14so7640653wrp.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2020 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VBlfaHLjMIZgRgPD33JNPvrhB3HtN3ppGeLfcO+LVM=;
 b=lBh7G0tU5xqsgrLgbPnokqBGg3NrgzAWb5dazcsqqzlWtOQsBjEA6kORBaTkYv3LL+
 lx4TwmUEDX4F/pBNtHhuq4jbPNto56J16Gnl/i0LaVOkGM0ss7hv6ie1c+IkPUhSi8Eo
 904LjVplthTb3Zyt4QDU9KtqwSm5gtPHqpKXRQS0UmexXKTilKe52ZeSN/SJxQvi5MCS
 sC9QHEBD2mpryFRrF0jpE2rP6xKz5hFj2Gwh87tUBkzvpoRb29/ldujSsx3yXM6STFQU
 ZMtflslqiYKNqWtkRfYDUeekqQRM8JE63bnJgQMIZ0ghKlsOFWRh9Kh5+ZphetdvtmMv
 b6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VBlfaHLjMIZgRgPD33JNPvrhB3HtN3ppGeLfcO+LVM=;
 b=jbcwmlaH7yd2nKrQnyUZB+czyb7Ww3y2DieU1z0GXhrxCT8qJGjwEZDbJqOB6QSSqY
 toI0t+ompkVjUTaTqq81IxTYouD2/eoKwseW6cRvN7/jrLWth+If/02aQ1+adtnGIdKS
 oWi/yPP0D+ONpfU1Aao17GtIzpt8lonCwlxkx/6adBMxvsQVA3ArSngdLR9Gs1p45l8S
 kpg/WBjRJwURntE9F9O1C6+JMoJ3oark4GqpJCsVqbD3rwgqDq6s51mnHcCgpnFJc7dg
 jrhXHcFlYrtqEEft+Ux8+vjs3N/pAB5d5GTIE+yPkL4zos8gno2rULd+icoh0qaPWipO
 E2/g==
X-Gm-Message-State: AOAM531gLnpIRQjbWxPjGX3I8eU94B+sWFxNOp+zKAPtH9ipCs7wf2x0
 3VBNDnrssfhXaK11ltlXjqBWHUiadc7tXHqC4Q0GnrI/
X-Google-Smtp-Source: ABdhPJy5xApZKczswv5rOMj7WjuA3sLe1IuCu3fXANYHECQ8iNubBpuuP35he1vD+tpd/JBzRxpwry7p3tb/+0BoNA4=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr6570717wrp.419.1591305309240; 
 Thu, 04 Jun 2020 14:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200604044619.18658-1-evan.quan@amd.com>
 <20200604044619.18658-16-evan.quan@amd.com>
In-Reply-To: <20200604044619.18658-16-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Jun 2020 17:14:57 -0400
Message-ID: <CADnq5_OxKQF9FoNLCSMHs=kmRaEexCQXP8hmhLZhP=HEedb3=A@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/amd/powerplay: skip BACO feature on DPMs
 disablement
To: Evan Quan <evan.quan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 12:47 AM Evan Quan <evan.quan@amd.com> wrote:
>
> Instead of disabling and reenabling it later.
>
> Change-Id: I90775202178f3b7695f42f39ce240bbfd51a1346
> Signed-off-by: Evan Quan <evan.quan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 72 ++++++++++------------
>  1 file changed, 31 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index d9a9d9723be1..b645bba1d201 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -110,28 +110,32 @@ static int smu_feature_update_enable_state(struct smu_context *smu,
>                                            bool enabled)
>  {
>         struct smu_feature *feature = &smu->smu_feature;
> -       uint32_t feature_low = 0, feature_high = 0;
>         int ret = 0;
>
> -       feature_low = (feature_mask >> 0 ) & 0xffffffff;
> -       feature_high = (feature_mask >> 32) & 0xffffffff;
> -
>         if (enabled) {
> -               ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeaturesLow,
> -                                                 feature_low, NULL);
> +               ret = smu_send_smc_msg_with_param(smu,
> +                                                 SMU_MSG_EnableSmuFeaturesLow,
> +                                                 lower_32_bits(feature_mask),
> +                                                 NULL);
>                 if (ret)
>                         return ret;
> -               ret = smu_send_smc_msg_with_param(smu, SMU_MSG_EnableSmuFeaturesHigh,
> -                                                 feature_high, NULL);
> +               ret = smu_send_smc_msg_with_param(smu,
> +                                                 SMU_MSG_EnableSmuFeaturesHigh,
> +                                                 upper_32_bits(feature_mask),
> +                                                 NULL);
>                 if (ret)
>                         return ret;
>         } else {
> -               ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeaturesLow,
> -                                                 feature_low, NULL);
> +               ret = smu_send_smc_msg_with_param(smu,
> +                                                 SMU_MSG_DisableSmuFeaturesLow,
> +                                                 lower_32_bits(feature_mask),
> +                                                 NULL);
>                 if (ret)
>                         return ret;
> -               ret = smu_send_smc_msg_with_param(smu, SMU_MSG_DisableSmuFeaturesHigh,
> -                                                 feature_high, NULL);
> +               ret = smu_send_smc_msg_with_param(smu,
> +                                                 SMU_MSG_DisableSmuFeaturesHigh,
> +                                                 upper_32_bits(feature_mask),
> +                                                 NULL);
>                 if (ret)
>                         return ret;
>         }
> @@ -1305,6 +1309,7 @@ static int smu_hw_init(void *handle)
>  static int smu_disable_dpms(struct smu_context *smu)
>  {
>         struct amdgpu_device *adev = smu->adev;
> +       uint64_t features_to_disable;
>         int ret = 0;
>         bool use_baco = !smu->is_apu &&
>                 ((adev->in_gpu_reset &&
> @@ -1336,36 +1341,21 @@ static int smu_disable_dpms(struct smu_context *smu)
>                 return 0;
>
>         /*
> -        * Disable all enabled SMU features.
> -        * This should be handled in SMU FW, as a backup
> -        * driver can issue call to SMU FW until sequence
> -        * in SMU FW is operational.
> -        */
> -       ret = smu_system_features_control(smu, false);
> -       if (ret) {
> -               pr_err("Failed to disable smu features.\n");
> -               return ret;
> -       }
> -
> -       /*
> -        * For baco, need to leave BACO feature enabled
> -        *
> -        * Correct the way for checking whether SMU_FEATURE_BACO_BIT
> -        * is supported.
> -        *
> -        * Since 'smu_feature_is_enabled(smu, SMU_FEATURE_BACO_BIT)' will
> -        * always return false as the 'smu_system_features_control(smu, false)'
> -        * was just issued above which disabled all SMU features.
> -        *
> -        * Thus 'smu_feature_get_index(smu, SMU_FEATURE_BACO_BIT)' is used
> -        * now for the checking.
> +        * For gpu reset, runpm and hibernation through BACO,
> +        * BACO feature has to be kept enabled.
>          */
> -       if (use_baco && (smu_feature_get_index(smu, SMU_FEATURE_BACO_BIT) >= 0)) {
> -               ret = smu_feature_set_enabled(smu, SMU_FEATURE_BACO_BIT, true);
> -               if (ret) {
> -                       pr_warn("set BACO feature enabled failed, return %d\n", ret);
> -                       return ret;
> -               }
> +       if (use_baco && smu_feature_is_enabled(smu, SMU_FEATURE_BACO_BIT)) {
> +               features_to_disable = U64_MAX &
> +                       ~(1ULL << smu_feature_get_index(smu, SMU_FEATURE_BACO_BIT));
> +               ret = smu_feature_update_enable_state(smu,
> +                                                     features_to_disable,
> +                                                     0);
> +               if (ret)
> +                       pr_err("Failed to disable smu features except BACO.\n");
> +       } else {
> +               ret = smu_system_features_control(smu, false);
> +               if (ret)
> +                       pr_err("Failed to disable smu features.\n");
>         }
>
>         if (adev->asic_type >= CHIP_NAVI10 &&
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
