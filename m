Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB4748CB
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 10:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB1D89122;
	Thu, 25 Jul 2019 08:09:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618D489122
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 08:09:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x4so49648791wrt.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 01:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=sulNXXK4olxyx2/WTRRwL0+jo93KbrJ80y7wkL40aPs=;
 b=c9lhX+ykkuX/M15OG+aT+tR/o3w9TCIqPKPD4/F9zsgSN+rP+AXI7a06JixXxIwXyF
 raqaUAxdLapB8sKTfme1NekqMoY7zfPcf9p0gj0CISfRSoKK5RSxJSxix9s6M6sPY+Vi
 Hq6hYe83ZwyhPlj2dAp6q8Wb2W5yIjvkMrGzyeMcnXantbMVbF7M9h1Q6xsyv3fH7ASJ
 mJ1KlN2/QswkzWR04s2yrrOjDSk1vGI0HzaiBFrsak6AY3Jxs2wC8bHipphJ2ri6TTF6
 WMOhoZuOY6/KqiksJYvCwM8WH7qhtsmfBPk+KuCqL8FkWqk3EmfL7pfwZDSurV2OH7FF
 o8jg==
X-Gm-Message-State: APjAAAVMzyIWzsCM6i9ZTHVM9sEH7VpHgGGm6uXsOI1JPh+HX2UWuWlR
 3IfNczWo89w3LFRIF31BjKW/+f+N
X-Google-Smtp-Source: APXvYqyJmRGHXyk0Wi/5gFznwVRs7ZppN76HswgIidgtNIOKW9EacQdP+Lou1MgLapgMZeuA332dmg==
X-Received: by 2002:adf:f28a:: with SMTP id k10mr14551112wro.343.1564042172684; 
 Thu, 25 Jul 2019 01:09:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j10sm48076877wrw.96.2019.07.25.01.09.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 01:09:31 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB commands
To: "Liu, Leo" <Leo.Liu@amd.com>, "Thai, Thong" <Thong.Thai@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <BN6PR1201MB0178175C942E341FCEB0D07B9DC60@BN6PR1201MB0178.namprd12.prod.outlook.com>
 <DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60@DM5PR12MB2456.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1117bfaf-9158-30f8-9ce1-47f87582ec06@gmail.com>
Date: Thu, 25 Jul 2019 10:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60@DM5PR12MB2456.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=sulNXXK4olxyx2/WTRRwL0+jo93KbrJ80y7wkL40aPs=;
 b=ExD8UMvF0+zGH28IP2f+3QzFLtcy30UBzwAIv1eV6pG4/va5EIXBkh3p0RMKQlexwX
 UatKsMaFCh+3AeyprZfAV/fOGk6l9FAGy0LKRZ5r+snRxj1WtmsE/uvSJ5JKGM18NpDA
 zxuRdXBm+wj/Ru5MG4idgLq8VIcuFlLNllgYh4HGK2iaVfZOoPdjy6Gw3ajROUzOx+G9
 t1WEOL9ObePOK1p5h1T1N81Sdcbe35Fc0ZSWHLp8i+tyLcXzwPRgLfSxHlYJ3bcN9Ywf
 cV3lC8o/iX7OTsZCH0o0tg6FOVJQO5J0m7UQUc8+TsCBVCEQRHuS8si7tXleQPN/Aobe
 B5oA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0525257288=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0525257288==
Content-Type: multipart/alternative;
 boundary="------------503B35CF84205E96698ED970"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------503B35CF84205E96698ED970
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Should we have a define for the 0x80000000 somewhere?

And please break the commit log into fewer characters per line.

Apart from that looks good to me,
Christian.

Am 25.07.19 um 00:23 schrieb Liu, Leo:
> Please separate the patches to 2 patches. i. e. New ring test as one 
> patch.
>
> Regards,
> Leo
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Thai, Thong <Thong.Thai@amd.com>
> *Sent:* July 24, 2019 3:50:47 PM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Subject:* [PATCH] drm/amd/amdgpu/vcn_v2_0: Set CMD_SOURCE for RB 
> commands
> Sets the CMD_SOURCE bit for VCN 2.0 decoder ring-buffer commands. This 
> bit was previously set by the RBC HW on older versions of the 
> firmware, and now needs to be set by the driver in order to work with 
> the SW RBC found in newer versions of the firmware.
>
> Signed-off-by: Thong Thai <thong.thai@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 44 ++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c 
> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index bc9726787c97..8daee23425f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -1488,7 +1488,7 @@ static void 
> vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));
>          amdgpu_ring_write(ring, 0);
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_START 
> << 1));
>  }
>
>  /**
> @@ -1501,7 +1501,7 @@ static void 
> vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
>  static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
>  {
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_END 
> << 1));
>  }
>
>  /**
> @@ -1546,7 +1546,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct 
> amdgpu_ring *ring, u64 addr, u64
>          amdgpu_ring_write(ring, upper_32_bits(addr) & 0xff);
>
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_FENCE << 1));
>
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));
>          amdgpu_ring_write(ring, 0);
> @@ -1556,7 +1556,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct 
> amdgpu_ring *ring, u64 addr, u64
>
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
>
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_TRAP << 1));
>  }
>
>  /**
> @@ -1600,7 +1600,7 @@ static void 
> vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring,
>
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
>
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_REG_READ_COND_WAIT << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | 
> (VCN_DEC_CMD_REG_READ_COND_WAIT << 1));
>  }
>
>  static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,
> @@ -1629,7 +1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(struct 
> amdgpu_ring *ring,
>
>          amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
>
> -       amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG << 1);
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_WRITE_REG << 
> 1));
>  }
>
>  /**
> @@ -2082,6 +2082,36 @@ static int vcn_v2_0_process_interrupt(struct 
> amdgpu_device *adev,
>          return 0;
>  }
>
> +int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)
> +{
> +       struct amdgpu_device *adev = ring->adev;
> +       uint32_t tmp = 0;
> +       unsigned i;
> +       int r;
> +
> +       WREG32(adev->vcn.external.scratch9, 0xCAFEDEAD);
> +       r = amdgpu_ring_alloc(ring, 3);
> +       if (r)
> +               return r;
> +       amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
> +       amdgpu_ring_write(ring, 0x80000000 | (VCN_DEC_CMD_PACKET_START 
> << 1));
> +       amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.scratch9, 0));
> +       amdgpu_ring_write(ring, 0xDEADBEEF);
> +       amdgpu_ring_commit(ring);
> +       for (i = 0; i < adev->usec_timeout; i++) {
> +               tmp = RREG32(adev->vcn.external.scratch9);
> +               if (tmp == 0xDEADBEEF)
> +                       break;
> +               DRM_UDELAY(1);
> +       }
> +
> +       if (i >= adev->usec_timeout)
> +               r = -ETIMEDOUT;
> +
> +       return r;
> +}
> +
> +
>  static int vcn_v2_0_set_powergating_state(void *handle,
>                                            enum amd_powergating_state 
> state)
>  {
> @@ -2145,7 +2175,7 @@ static const struct amdgpu_ring_funcs 
> vcn_v2_0_dec_ring_vm_funcs = {
>          .emit_ib = vcn_v2_0_dec_ring_emit_ib,
>          .emit_fence = vcn_v2_0_dec_ring_emit_fence,
>          .emit_vm_flush = vcn_v2_0_dec_ring_emit_vm_flush,
> -       .test_ring = amdgpu_vcn_dec_ring_test_ring,
> +       .test_ring = vcn_v2_0_dec_ring_test_ring,
>          .test_ib = amdgpu_vcn_dec_ring_test_ib,
>          .insert_nop = vcn_v2_0_dec_ring_insert_nop,
>          .insert_start = vcn_v2_0_dec_ring_insert_start,
> -- 
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------503B35CF84205E96698ED970
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Should we have a define for the
      0x80000000 somewhere?<br>
      <br>
      And please break the commit log into fewer characters per line.<br>
      <br>
      Apart from that looks good to me,<br>
      Christian.<br>
      <br>
      Am 25.07.19 um 00:23 schrieb Liu, Leo:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM5PR12MB2456E8FF88AA6C6F48A0A12FE5C60@DM5PR12MB2456.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      Please separate the patches to 2 patches. i. e. New ring test as
      one patch.<br>
      <br>
      Regards, <br>
      Leo<br>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
          behalf of Thai, Thong <a class="moz-txt-link-rfc2396E" href="mailto:Thong.Thai@amd.com">&lt;Thong.Thai@amd.com&gt;</a><br>
          <b>Sent:</b> July 24, 2019 3:50:47 PM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
          <b>Subject:</b> [PATCH] drm/amd/amdgpu/vcn_v2_0: Set
          CMD_SOURCE for RB commands</font>
        <div> </div>
      </div>
      <div class="BodyFragment"><font size="2"><span
            style="font-size:11pt;">
            <div class="PlainText">Sets the CMD_SOURCE bit for VCN 2.0
              decoder ring-buffer commands. This bit was previously set
              by the RBC HW on older versions of the firmware, and now
              needs to be set by the driver in order to work with the SW
              RBC found in newer versions of the firmware.<br>
              <br>
              Signed-off-by: Thong Thai <a class="moz-txt-link-rfc2396E" href="mailto:thong.thai@amd.com">&lt;thong.thai@amd.com&gt;</a><br>
              ---<br>
               drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 44
              ++++++++++++++++++++++-----<br>
               1 file changed, 37 insertions(+), 7 deletions(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
              b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
              index bc9726787c97..8daee23425f8 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
              @@ -1488,7 +1488,7 @@ static void
              vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)<br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
                       amdgpu_ring_write(ring, 0);<br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
              -       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START
              &lt;&lt; 1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
               }<br>
               <br>
               /**<br>
              @@ -1501,7 +1501,7 @@ static void
              vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)<br>
               static void vcn_v2_0_dec_ring_insert_end(struct
              amdgpu_ring *ring)<br>
               {<br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
              -       amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END
              &lt;&lt; 1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_PACKET_END &lt;&lt; 1));<br>
               }<br>
               <br>
               /**<br>
              @@ -1546,7 +1546,7 @@ static void
              vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64
              addr, u64<br>
                       amdgpu_ring_write(ring, upper_32_bits(addr) &amp;
              0xff);<br>
               <br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
              -       amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE &lt;&lt;
              1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_FENCE &lt;&lt; 1));<br>
               <br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
                       amdgpu_ring_write(ring, 0);<br>
              @@ -1556,7 +1556,7 @@ static void
              vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64
              addr, u64<br>
               <br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
               <br>
              -       amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP &lt;&lt;
              1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_TRAP &lt;&lt; 1));<br>
               }<br>
               <br>
               /**<br>
              @@ -1600,7 +1600,7 @@ static void
              vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring,<br>
               <br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
               <br>
              -       amdgpu_ring_write(ring,
              VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1));<br>
               }<br>
               <br>
               static void vcn_v2_0_dec_ring_emit_vm_flush(struct
              amdgpu_ring *ring,<br>
              @@ -1629,7 +1629,7 @@ static void
              vcn_v2_0_dec_ring_emit_wreg(struct amdgpu_ring *ring,<br>
               <br>
                       amdgpu_ring_write(ring,
              PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
               <br>
              -       amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG
              &lt;&lt; 1);<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_WRITE_REG &lt;&lt; 1));<br>
               }<br>
               <br>
               /**<br>
              @@ -2082,6 +2082,36 @@ static int
              vcn_v2_0_process_interrupt(struct amdgpu_device *adev,<br>
                       return 0;<br>
               }<br>
               <br>
              +int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)<br>
              +{<br>
              +       struct amdgpu_device *adev = ring-&gt;adev;<br>
              +       uint32_t tmp = 0;<br>
              +       unsigned i;<br>
              +       int r;<br>
              +<br>
              +       WREG32(adev-&gt;vcn.external.scratch9,
              0xCAFEDEAD);<br>
              +       r = amdgpu_ring_alloc(ring, 3);<br>
              +       if (r)<br>
              +               return r;<br>
              +       amdgpu_ring_write(ring,
              PACKET0(adev-&gt;vcn.internal.cmd, 0));<br>
              +       amdgpu_ring_write(ring, 0x80000000 |
              (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
              +       amdgpu_ring_write(ring,
              PACKET0(adev-&gt;vcn.internal.scratch9, 0));<br>
              +       amdgpu_ring_write(ring, 0xDEADBEEF);<br>
              +       amdgpu_ring_commit(ring);<br>
              +       for (i = 0; i &lt; adev-&gt;usec_timeout; i++) {<br>
              +               tmp =
              RREG32(adev-&gt;vcn.external.scratch9);<br>
              +               if (tmp == 0xDEADBEEF)<br>
              +                       break;<br>
              +               DRM_UDELAY(1);<br>
              +       }<br>
              +<br>
              +       if (i &gt;= adev-&gt;usec_timeout)<br>
              +               r = -ETIMEDOUT;<br>
              +<br>
              +       return r;<br>
              +}<br>
              +<br>
              +<br>
               static int vcn_v2_0_set_powergating_state(void *handle,<br>
                                                         enum
              amd_powergating_state state)<br>
               {<br>
              @@ -2145,7 +2175,7 @@ static const struct
              amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {<br>
                       .emit_ib = vcn_v2_0_dec_ring_emit_ib,<br>
                       .emit_fence = vcn_v2_0_dec_ring_emit_fence,<br>
                       .emit_vm_flush = vcn_v2_0_dec_ring_emit_vm_flush,<br>
              -       .test_ring = amdgpu_vcn_dec_ring_test_ring,<br>
              +       .test_ring = vcn_v2_0_dec_ring_test_ring,<br>
                       .test_ib = amdgpu_vcn_dec_ring_test_ib,<br>
                       .insert_nop = vcn_v2_0_dec_ring_insert_nop,<br>
                       .insert_start = vcn_v2_0_dec_ring_insert_start,<br>
              -- <br>
              2.17.1<br>
              <br>
              _______________________________________________<br>
              amd-gfx mailing list<br>
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              <a
                href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
          </span></font></div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------503B35CF84205E96698ED970--

--===============0525257288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0525257288==--
