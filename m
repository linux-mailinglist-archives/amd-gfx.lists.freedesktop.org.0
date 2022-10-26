Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C117660E4F7
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Oct 2022 17:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73510E2F9;
	Wed, 26 Oct 2022 15:43:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB83210E315
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Oct 2022 15:43:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a14so24254586wru.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Oct 2022 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/IpvMgHAE4++3D+L8XFWaOKDbigg1W0VymjW9GxKRIs=;
 b=jJmHsW9QaEKRoYxuIh9QsdhdFyU4s/B9ySsKCk53GZY/DmnbwgnMo75O6ZAD+2Wnan
 sm/yyRcr1bmrdBdF3SefnnoBJvkswmkUBnBiB0GCWSRejcqVmC8RlVugA1hqUSlIQ2n8
 4ppRHEuWJ8/1P0vPHPjgH89Xp1Cp4ivaS0PBW+w1RWsWDd1V9/EYJ5IiRaxFE7pDPsgk
 Bt5NL83JDRTQefYj646kZlXDZ9tljk/AWWDcJXcPVrqj4C4mEYRTtrjKqUNWDHGkmMHT
 oY5hLKVbve3DIzJMsknuSJVhoFNrbR/Yq+UmS7egMwtxd17087UHBeOQkUOtFA0IcmOV
 kZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IpvMgHAE4++3D+L8XFWaOKDbigg1W0VymjW9GxKRIs=;
 b=7dR7EpH4SQcbCOH5aHp3q33fP0/GB1vCRPctlM9kIyWU7I8Z5UO8Qck0vbngWTuF2/
 AyRlXeap56whSMnKRsXB/SIo+JroCQmAq/A79weIJCeYGDv71L6+fG9Bw3WSBPdEo1hS
 YRnlwRgiOpJCF7Bx2OYiFY61YJrS+92Pn920tbIrmZYPLYFo5u4LgI4MxDbc4aJTzMtj
 AHZ+3D+puWHca3kIUOgyxi4q30bc7XuLBEn+yJKMcx+V/hmHjiRGsLswEBmJVOzASbrm
 MWAE1hbENy9jL6V8HHOUcD0sjTvcOv1dyvTVIMMsLXbipXpKVMvpe0fyxGAVU+9RBws9
 BQ/A==
X-Gm-Message-State: ACrzQf0UGgPfljiOLZ7da8VMRVLgjNbW0gBZznkhwt1Xm7QTP/RQ+8gC
 DkL2V59EpL98m3txdKpHK5XzDcX/t48sS5xUleE=
X-Google-Smtp-Source: AMsMyM6NhSyjm5hLAweKYILQkPdFAaICCDN/ErsokRNnfCG9iLNZtQ7BWwNpTMRkUA4kEdajkzLWREyu2SRS86utY8c=
X-Received: by 2002:a05:6000:23a:b0:236:71d7:5f90 with SMTP id
 l26-20020a056000023a00b0023671d75f90mr10797755wrz.322.1666799007203; Wed, 26
 Oct 2022 08:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221014041456.139813-1-Asher.Song@amd.com>
 <CANiD2e8PHA7u1qs8YkWkbbjxqB7JCnLNdR5OcHTH=dpfBWe7rg@mail.gmail.com>
 <DM4PR12MB513603C468CE9BA8DC933D118B309@DM4PR12MB5136.namprd12.prod.outlook.com>
 <CANiD2e-jjJyycgmBUDirBD+pGjf+Etifbvj5aBa0Q8Zd=KFxOg@mail.gmail.com>
 <CADnq5_PNhqNTnwkVTdhGXmJ=UNWwQQjuftA-zgdBXejPk4LKqg@mail.gmail.com>
In-Reply-To: <CADnq5_PNhqNTnwkVTdhGXmJ=UNWwQQjuftA-zgdBXejPk4LKqg@mail.gmail.com>
From: Yury Zhuravlev <stalkerg@gmail.com>
Date: Thu, 27 Oct 2022 00:41:54 +0900
Message-ID: <CANiD2e-wpom94j4UuqG7Et1DFyMwEafcLj1qCxwp5DyFwLSiYg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for
 vega10 properly"
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bc843f05ebf1e2cf"
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>, "Meng, Xiaohu" <Xiaohu.Meng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Song,
 Asher" <Asher.Song@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000bc843f05ebf1e2cf
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 11:38 PM Alex Deucher <alexdeucher@gmail.com> wrote:

> On Wed, Oct 26, 2022 at 5:07 AM Yury Zhuravlev <stalkerg@gmail.com> wrote:
> >
> > Hello Asher,
> >
> > Thanks for the information, is it open-source tests? Can I reproduce it?
> >
> > Also, it seems like Radeon Instinct MI25 was released before Radeon RX
> Vega, is it possible that they have different PowerPlay subsystems?
>
> Same silicon, same powerplay implementation.
>
Okay, what it means? Can I know what exactly you are tested by
"rsmitstReadWrite.FanReadWrite"?
I am working now with my patch, and I definitely can read and write fan
speed by PWM.
How can I help to solve this problem?

Regards,

--000000000000bc843f05ebf1e2cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 11:38 PM Alex=
 Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Oct 26, 2022 at 5:07 AM Yury Zhuravlev &lt;<a href=3D"mailto:stalke=
rg@gmail.com" target=3D"_blank">stalkerg@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Asher,<br>
&gt;<br>
&gt; Thanks for the information, is it open-source tests? Can I reproduce i=
t?<br>
&gt;<br>
&gt; Also, it seems like Radeon Instinct MI25 was released before Radeon RX=
 Vega, is it possible that they have different PowerPlay subsystems?<br>
<br>
Same silicon, same powerplay implementation.<br></blockquote><div>Okay, wha=
t it means? Can I know what exactly you are tested by &quot;rsmitstReadWrit=
e.FanReadWrite&quot;? <br></div><div>I am working now with my patch, and I =
definitely can read and write fan speed by PWM.</div><div>How can I help to=
 solve this problem?</div><div><br></div><div>Regards,<br></div><div><br></=
div></div></div>

--000000000000bc843f05ebf1e2cf--
