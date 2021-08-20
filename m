Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE783F271A
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Aug 2021 08:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF026EA08;
	Fri, 20 Aug 2021 06:59:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DDA6EA08
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 06:59:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f5so12590886wrm.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Aug 2021 23:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=vjTJKbDtogcH7F67RnpHSFC0Hg9RIm5bQ+G99zfh5Nw=;
 b=fJvss8e1Enn2jL/xXSSViPzJ1F+TkXnMAsL7bIKkyA3m62fBye2EkrAXaCtzdprjaj
 UpbWWOS7I2xSRqTF7fSbNwd5eTBgkzzB0cV4SivhjzbXuBNigG+Ym4bpg9j+1K3E2w/H
 oukbWdOpfSooF83D6SosAjhZPHi/E3Z2REA/FvV/ZY5CKn9xSQBkuDv4ot/muydYrUyf
 YEH37ZckLvuDgbUU+KhcOvNwSnGzTufB3osn6GawnZ338ePi7HKDn52ToVz8BS9ZN6QS
 krhQsL0x89Yh9nw+0P1kJJuky1eHbrC5c4HY8/S4H4Ubr2bxaPzkPeCktrrRxKdINWas
 O5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vjTJKbDtogcH7F67RnpHSFC0Hg9RIm5bQ+G99zfh5Nw=;
 b=WIBvSIFcmqAJtHYo0O9cO25kxRbQ/y4MFykABE5ZsWsDomckEBRlphiriioF3tIFxC
 wXyOVjrrePA76K+m3oXGn8nIJNxKXxzGQIicFMsjKwSOjWz4yszsBAib8tQajHK6dhxp
 gVo9GiMBm3j/lWc9pOyIk9Euz8gB8nxV5KiP7znoFSKZcGRUFhDVtEtoz1h+psIZHuOG
 iBnzOq+aaXRwpIi0TZz25hqZgK8MkwRg1ixZjR7j/DYtc6Rdhp8qcgn/MgEIrWIag4WV
 RAc4NzUa89uxGV8aVN3C4mnk97/p3E1PnkIXu3RmDbUbIh3WsZYXPbAqn4VRau7FC/HE
 Gs/Q==
X-Gm-Message-State: AOAM531K8RkePId1bk85bS+PRve2SdrUTexvC8lnnyjdRcSScw2BRSN3
 HPAr1+IslhrwalUWIoiDi/yiP81Hc8ZWLT//bRU=
X-Google-Smtp-Source: ABdhPJw4oGjwWbUK1VqXaTBNC7Z2JlrcNvbqG6moG7FAfmvDg9CIywkV9llBDpmpqkVEf1yzbEoRgA==
X-Received: by 2002:adf:a391:: with SMTP id l17mr8240933wrb.108.1629442784940; 
 Thu, 19 Aug 2021 23:59:44 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id g6sm4705158wmq.14.2021.08.19.23.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 23:59:44 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/amdgpu: Use SDMA1 for buffer movement on Aldebaran
To: Joseph Greathouse <Joseph.Greathouse@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20210820053245.340945-1-Joseph.Greathouse@amd.com>
 <20210820053245.340945-2-Joseph.Greathouse@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e61724d5-dddd-bcfb-29f7-8dcd49bc3252@gmail.com>
Date: Fri, 20 Aug 2021 08:59:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820053245.340945-2-Joseph.Greathouse@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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



Am 20.08.21 um 07:32 schrieb Joseph Greathouse:
> Aldebaran should not use SDMA0 for buffer funcs such as page migration.
> Instead, we move over to SDMA1 for these features. Leave SDMA0 in
> charge for all other existing chips to avoid any possibility of
> regressions.

The part why we do this is missing, apart from that looks good to me.

Christian.

>
> Signed-off-by: Joseph Greathouse <Joseph.Greathouse@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 8931000dcd41..771630d7bb3f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2689,11 +2689,15 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
>   
>   static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
>   {
> +	int engine = 0;
> +
> +	if (adev->asic_type == CHIP_ALDEBARAN)
> +		engine = 1;
>   	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
>   	if (adev->sdma.has_page_queue)
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
> +		adev->mman.buffer_funcs_ring = &adev->sdma.instance[engine].page;
>   	else
> -		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
> +		adev->mman.buffer_funcs_ring = &adev->sdma.instance[engine].ring;
>   }
>   
>   static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {

