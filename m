Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D536138DA
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Oct 2022 15:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929C910E2C8;
	Mon, 31 Oct 2022 14:19:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E719010E2C7;
 Mon, 31 Oct 2022 14:19:20 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-12c8312131fso13605024fac.4; 
 Mon, 31 Oct 2022 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OTCJd+1wJT6G45tYv477hj01EwJNiRQVl/SOj44L6Do=;
 b=EN2PsHEvmyuS/RHMWVKhIgJudBkHIwqUBCRq0/ruHgcNluvapeQQbzhITrOvfVFhvh
 N4tA1SqHjsu5n/0l7t2AZJvQVNR7sgufdFTcg3BTtpvIhfOfzFyVh6jvKDMeVFIZ/GGn
 wqQjct/WGSnYrRE35VU91QDGHxJJrpKwgVOfMRp8NrIJl11f9nCKKdYphmQVUCoJhaJl
 A21TiP1/pX8TW486SbrY128wfDMcBdtAlenaaF67TTgiOXSSJH53fOVWrjGgmKhptIak
 aTyk6wPHx+EQGGpPZO9ScrjcQGKiWNu2rlMoC2DsUjjeYFKe+j2W09ynrN7vWbzP0oe+
 no0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OTCJd+1wJT6G45tYv477hj01EwJNiRQVl/SOj44L6Do=;
 b=EYedEk1iB6VIlwEKuB7F/aQBjgKuiLkhOtoxiFYuc975bJRV+pRBfLoxH/U8qh/37O
 U9Cn5Q6K/WoaKtdcdDSLz+HnkweVRyNDlI3nVy4yF1BJDecBnzaE1KDdEoUGgeu8O+j0
 ot3MeOZ0qgOXXFeChAScpEeaPAriMcLkOdRY19+lk5ZPRcJQpC4rhX9PkBNqoNtgrgXR
 FlWjgv9hPPqAdVrgRHd77dFOyBOKOKytFGN6wRWorlOfxMdL2H4dMd1Jgzuw/HSXYvAh
 QsACcZi/YSH32c09BywyPLw7Pehui0vi+lbllFs2Jek1AupOcQksQCBlQz4NPJFJC4j8
 G3qA==
X-Gm-Message-State: ACrzQf2jS2/E/6RQ2IJVYg4sqWXRt4LiC76/9yFtzsfyadzdyBVtrgEe
 fU8oNr3ANqPdEvzNuj66qe0kA0SBw5ArDhJnG3o=
X-Google-Smtp-Source: AMsMyM4zyC9CXeJP/t4xMbCAShy2CtgYfJ4BnKP9ptCpjr6VulD8tFU2J51Klurn9ChU2MTn9r8K73v6WKCMYqNrEyI=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr7714241oao.96.1667225960160; Mon, 31
 Oct 2022 07:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221029032110.151981-1-alex.hung@amd.com>
In-Reply-To: <20221029032110.151981-1-alex.hung@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Oct 2022 10:19:08 -0400
Message-ID: <CADnq5_O36H2vK_wg5+56nzBHsiyhggKHdajUExs+GZt46KQVUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix an incorrect comment
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: HaoPing.Liu@amd.com, hacc1225@gmail.com, tao.zhou1@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, airlied@linux.ie,
 YiPeng.Chai@amd.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 11:22 PM Alex Hung <alex.hung@amd.com> wrote:
>
> This is a copy-and-paste error. Fix the comment to match the macro
> definition.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
> index 63219ecd8478..1bf6b12f5663 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
> @@ -29,4 +29,4 @@
>
>  void dcn10_resource_construct_fp(struct dc *dc);
>
> -#endif /* __DCN20_FPU_H__ */
> +#endif /* __DCN10_FPU_H__ */
> --
> 2.38.1
>
