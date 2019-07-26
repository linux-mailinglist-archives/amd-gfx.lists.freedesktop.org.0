Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF1764B3
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 13:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A51D6ED23;
	Fri, 26 Jul 2019 11:39:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329B6ED23
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 11:39:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f17so47401008wme.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 04:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=P9Q3/J7KxWM79cbMLotdNmvmnFAB6CWsyrZjUqsPpgs=;
 b=arO3E2ppP4HktPaFsbyISS6OblHzcrWjbkA+4rp/81lVsd+bt3LV0kQ7h9z+cjIeUD
 ZLsng60kNuRBgO5DUSHgl3wYGAMlWTO+iWF4S7fC0PRRTxoGJoBu9lf0G0DtbBvl8hcg
 q3azNXt51q68RoJ0RvwkRZacEi4oWiJnEAQGJdn4tuV12l9fOUox+mQPbdGfmf2Reofp
 5B7rfwgvAY6JIvMNHKZjoA5x82d8L0Y1hrdSigvhxahA/EM0rYLwogD1+gbFdV0PGSTS
 tzU010MI9iQT0xrpUnSgnoF6fsfsf7sGd4zf3yt+rE4RP25eLeCbjtdrcj9W8eS84VyY
 Fxvw==
X-Gm-Message-State: APjAAAV3LExItGAStWji7qe1iGhAAKfiZNqNQg2J/eWLpkDNVufc1cEP
 8PRNoYivd7zhi9sHPeBih0lLOPg7
X-Google-Smtp-Source: APXvYqz+yA6e2nHDfUES7eFEw3IqTCYWfiqELDkbctPnyx9junF7YBVvrbecumAQXr50Oe2/6GbkFQ==
X-Received: by 2002:a1c:3:: with SMTP id 3mr85852536wma.6.1564141169206;
 Fri, 26 Jul 2019 04:39:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f204sm77109051wme.18.2019.07.26.04.39.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 04:39:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
To: "Thai, Thong" <Thong.Thai@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190725155204.5739-1-thong.thai@amd.com>
 <2a7d972a-5916-7d00-c8ad-5ff33363d993@gmail.com>
 <BN6PR1201MB0178F74D883BC13DD35CDC369DC00@BN6PR1201MB0178.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b2caaa9f-c4f9-b1b9-4722-62fff3a5904c@gmail.com>
Date: Fri, 26 Jul 2019 13:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR1201MB0178F74D883BC13DD35CDC369DC00@BN6PR1201MB0178.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=P9Q3/J7KxWM79cbMLotdNmvmnFAB6CWsyrZjUqsPpgs=;
 b=ZI7xPuI74i6W5cnsRhjEMcBQQf5ofltvFLSVA/veHCN2Ndg/wZcwh/nIjXgT8PwPIE
 4KjZa80sflOvbK8Fqs+SAv3HvDfdIQRubTphRZ+6YoZ0u1Nof4424bJOF0rru+AigY/H
 qaya2f9+Q2D7vYpkpGuIdm8xB4R24xMrwFDmWKOjoM7YcJzjnRhbyLyOF9tpAtxnrcAc
 +v6k6yZxZ1LypfMjGQfaUkZuaFRNyScU5WyVbmzajOSfQEO7siMt+HC1XzaDFgrpIb3m
 xsLJ+j9Er0u/jMximVT5jiohQ7cy6Sqx8qR/BVXhoU1EGEUrH6xiCza+0N0LBUB5fwdq
 GPGw==
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
Content-Type: multipart/mixed; boundary="===============1201054984=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1201054984==
Content-Type: multipart/alternative;
 boundary="------------1A6E11B37A0FBBE6DDB024EA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1A6E11B37A0FBBE6DDB024EA
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Good point, this patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

But please ping the firmware guys if that really could be an issue,
Christian.

Am 26.07.19 um 12:45 schrieb Thai, Thong:
> Well, not through this particular piece of code, since this explicitly 
> sets it. But I would imagine someone could set the bit in userspace 
> and insert KMD commands in the BO as part of some IB instructions - 
> I’ll have a look.
>
> ------------------------------------------------------------------------
> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Friday, July 26, 2019 3:17:19 AM
> *To:* Thai, Thong <Thong.Thai@amd.com>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands 
> as KMD commands
> Am 25.07.19 um 17:52 schrieb Thai, Thong:
> > Sets the CMD_SOURCE bit for VCN 2.0 Decoder Ring Buffer commands. This
> > bit was previously set by the RBC HW on older firmware. Newer firmware
> > uses a SW RBC and this bit has to be set by the driver.
>
> Mhm, another question came to my mind: Would it now be possible for user
> space to set this flag and and gain access to the kernel driver commands?
>
> Cause that could be a security problem.
>
> Christian.
>
> >
> > Signed-off-by: Thong Thai <thong.thai@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
> >   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   | 12 ++++++------
> >   2 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> > index 5e2453ee6b29..4d3bf4adf1eb 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> > @@ -30,6 +30,7 @@
> >   #define AMDGPU_VCN_FIRMWARE_OFFSET  256
> >   #define AMDGPU_VCN_MAX_ENC_RINGS    3
> >
> > +#define VCN_DEC_KMD_CMD 0x80000000
> >   #define VCN_DEC_CMD_FENCE           0x00000000
> >   #define VCN_DEC_CMD_TRAP            0x00000001
> >   #define VCN_DEC_CMD_WRITE_REG 0x00000004
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c 
> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> > index bc9726787c97..7091aef95ff0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> > @@ -1488,7 +1488,7 @@ static void 
> vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));
> >        amdgpu_ring_write(ring, 0);
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | 
> (VCN_DEC_CMD_PACKET_START << 1));
> >   }
> >
> >   /**
> > @@ -1501,7 +1501,7 @@ static void 
> vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
> >   static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
> >   {
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | 
> (VCN_DEC_CMD_PACKET_END << 1));
> >   }
> >
> >   /**
> > @@ -1546,7 +1546,7 @@ static void 
> vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64
> >        amdgpu_ring_write(ring, upper_32_bits(addr) & 0xff);
> >
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_FENCE 
> << 1));
> >
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));
> >        amdgpu_ring_write(ring, 0);
> > @@ -1556,7 +1556,7 @@ static void 
> vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64
> >
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> >
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_TRAP << 
> 1));
> >   }
> >
> >   /**
> > @@ -1600,7 +1600,7 @@ static void 
> vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring,
> >
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> >
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_REG_READ_COND_WAIT << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | 
> (VCN_DEC_CMD_REG_READ_COND_WAIT << 1));
> >   }
> >
> >   static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,
> > @@ -1629,7 +1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(struct 
> amdgpu_ring *ring,
> >
> >        amdgpu_ring_write(ring, 
> PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));
> >
> > -     amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG << 1);
> > +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | 
> (VCN_DEC_CMD_WRITE_REG << 1));
> >   }
> >
> >   /**
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------1A6E11B37A0FBBE6DDB024EA
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Good point, this patch is Reviewed-by:
      Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>.<br>
      <br>
      But please ping the firmware guys if that really could be an
      issue,<br>
      Christian.<br>
      <br>
      Am 26.07.19 um 12:45 schrieb Thai, Thong:<br>
    </div>
    <blockquote type="cite"
cite="mid:BN6PR1201MB0178F74D883BC13DD35CDC369DC00@BN6PR1201MB0178.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>
        <div>
          <div>
            <div style="direction:ltr">Well, not through this particular
              piece of code, since this explicitly sets it. But I would
              imagine someone could set the bit in userspace and insert
              KMD commands in the BO as part of some IB instructions -
              I’ll have a look.</div>
          </div>
          <div><br>
          </div>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>Sent:</b> Friday, July 26, 2019 3:17:19 AM<br>
            <b>To:</b> Thai, Thong <a class="moz-txt-link-rfc2396E" href="mailto:Thong.Thai@amd.com">&lt;Thong.Thai@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0:
            Mark RB commands as KMD commands</font>
          <div> </div>
        </div>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">Am 25.07.19 um 17:52 schrieb Thai,
            Thong:<br>
            &gt; Sets the CMD_SOURCE bit for VCN 2.0 Decoder Ring Buffer
            commands. This<br>
            &gt; bit was previously set by the RBC HW on older firmware.
            Newer firmware<br>
            &gt; uses a SW RBC and this bit has to be set by the driver.<br>
            <br>
            Mhm, another question came to my mind: Would it now be
            possible for user <br>
            space to set this flag and and gain access to the kernel
            driver commands?<br>
            <br>
            Cause that could be a security problem.<br>
            <br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; Signed-off-by: Thong Thai <a class="moz-txt-link-rfc2396E" href="mailto:thong.thai@amd.com">&lt;thong.thai@amd.com&gt;</a><br>
            &gt; ---<br>
            &gt;   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +<br>
            &gt;   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   | 12
            ++++++------<br>
            &gt;   2 files changed, 7 insertions(+), 6 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
            &gt; index 5e2453ee6b29..4d3bf4adf1eb 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
            &gt; @@ -30,6 +30,7 @@<br>
            &gt;   #define AMDGPU_VCN_FIRMWARE_OFFSET  256<br>
            &gt;   #define AMDGPU_VCN_MAX_ENC_RINGS    3<br>
            &gt;   <br>
            &gt; +#define VCN_DEC_KMD_CMD                     
            0x80000000<br>
            &gt;   #define VCN_DEC_CMD_FENCE           0x00000000<br>
            &gt;   #define VCN_DEC_CMD_TRAP            0x00000001<br>
            &gt;   #define VCN_DEC_CMD_WRITE_REG              
            0x00000004<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
            b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
            &gt; index bc9726787c97..7091aef95ff0 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
            &gt; @@ -1488,7 +1488,7 @@ static void
            vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)<br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
            &gt;        amdgpu_ring_write(ring, 0);<br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt; -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START
            &lt;&lt; 1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   /**<br>
            &gt; @@ -1501,7 +1501,7 @@ static void
            vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)<br>
            &gt;   static void vcn_v2_0_dec_ring_insert_end(struct
            amdgpu_ring *ring)<br>
            &gt;   {<br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt; -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END
            &lt;&lt; 1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_PACKET_END &lt;&lt; 1));<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   /**<br>
            &gt; @@ -1546,7 +1546,7 @@ static void
            vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64
            addr, u64<br>
            &gt;        amdgpu_ring_write(ring, upper_32_bits(addr)
            &amp; 0xff);<br>
            &gt;   <br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt; -     amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE
            &lt;&lt; 1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_FENCE &lt;&lt; 1));<br>
            &gt;   <br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
            &gt;        amdgpu_ring_write(ring, 0);<br>
            &gt; @@ -1556,7 +1556,7 @@ static void
            vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64
            addr, u64<br>
            &gt;   <br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt;   <br>
            &gt; -     amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP &lt;&lt;
            1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_TRAP &lt;&lt; 1));<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   /**<br>
            &gt; @@ -1600,7 +1600,7 @@ static void
            vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring,<br>
            &gt;   <br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt;   <br>
            &gt; -     amdgpu_ring_write(ring,
            VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1));<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   static void vcn_v2_0_dec_ring_emit_vm_flush(struct
            amdgpu_ring *ring,<br>
            &gt; @@ -1629,7 +1629,7 @@ static void
            vcn_v2_0_dec_ring_emit_wreg(struct amdgpu_ring *ring,<br>
            &gt;   <br>
            &gt;        amdgpu_ring_write(ring,
            PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
            &gt;   <br>
            &gt; -     amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG
            &lt;&lt; 1);<br>
            &gt; +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD |
            (VCN_DEC_CMD_WRITE_REG &lt;&lt; 1));<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   /**<br>
            <br>
          </div>
        </span></font>
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

--------------1A6E11B37A0FBBE6DDB024EA--

--===============1201054984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1201054984==--
