Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B9984528
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2024 13:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF0D10E4BA;
	Tue, 24 Sep 2024 11:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UEX4yFAP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EBE10E28E
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2024 16:49:02 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-5010322c1c1so1390745e0c.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2024 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727110141; x=1727714941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bP6mNa85r1fBTtVt4nmY2vTm3vDUYC2Hz0xY4IpddhM=;
 b=UEX4yFAPaLrmb02sJS0SMQT+r1ayD8GscrUpaNDmVCpv9tusfh4ts1B6f0RniL4up4
 JEntcU/P1omXYR7q9LqBB1Uk3XoAMzOy3962JJFEQlQt5nPYqzAG3Pzz/x1ovlqi63nd
 15QmvMfB+E46pRRb/S3WukzsKDNw6pMqnVt2wGP3ddIeT+7wdYrpE6Lm8datgSjapoQb
 +g1qfDe4sIpCNJBlppQHLOXlQD7t+KlnD5MteHwcNEmABTd8PlKLFTDgI67uzsZA0nrE
 KQhvoZs2BRWhbkZirV06Vxi0Pyu1TkQnCGKW6SIqcc4D/YSjbWr8SLUlgsrYkyb6tRmb
 0+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727110141; x=1727714941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bP6mNa85r1fBTtVt4nmY2vTm3vDUYC2Hz0xY4IpddhM=;
 b=u8wc/8jmS6FiIGiJZD5gsJgqVTiy+Yj4pjzOHZ+gYoBBj6CoO/xkEquk7Kszreki0u
 42YHoevyK/eKa/jvxaJL2VLPPNmrTkhbwDdq6yf54qzPh1Zw3tjDKBFhBiCQhIhl9efQ
 MQWAgPBawlcla72EmffTChrk/XkSK+ppDU7mKQBJXhgo0vHcwluFhPtPkNUdF0vBQyAk
 /5eq34zAlplewu0pNDL8m4lzzZEWBmbORUr0IdpCVhAx9Nlkw5KiqCWGzKmZlZjFKPi8
 ooWl53x6IXV21ZGXEi55U0P6aFrlLbqD+FCPBa8/bjPUFUd7dAO577Ym8QLmFxUixzLr
 +cLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ5Wo8hqcHeG0/v1Rdhe7fNs679dINtIRMWRgmNxP5Eow+qlo+bgfJr5CRsCLG4RryhnDmCoEw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuEGhUC9/XeHUpBSicXPRn5qtSeJ4Uu7WsV+5/JMHjFjO+LzXT
 0uqyq5I7crHvXDwebbU/01co+XWAe0bRM4kVgQYK694EM0y2SxAh8kkRoCyEE1bu8dqsbU3+9Rb
 lDjxIpDP0FIdkFYFjjMnrhqZTkUY=
X-Google-Smtp-Source: AGHT+IFNbT1NF2ZQcW+60PCG7onE1QaUl53pcxG7e0IIKdZvJGsmqe0pqk5Ntqlfn++uEdKuwK2FU8cMfzHHbzHmNkg=
X-Received: by 2002:a05:6122:891:b0:4f6:b094:80aa with SMTP id
 71dfb90a1353d-503e418c86dmr7471693e0c.9.1727110141412; Mon, 23 Sep 2024
 09:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240920090959.30755-1-kdipendra88@gmail.com>
 <ac13994c-b77b-48f2-b2cf-20299f02c2e8@amd.com>
 <CAEKBCKMg0c5AW7YggDMR+Kg7OGq3dXApLK-=RTR71H0KHO73+g@mail.gmail.com>
 <ae062c07-dc09-4975-ad31-2f9d9ea435f9@amd.com>
 <CAEKBCKMNZOof8KP5upY45djTC9Bk9+AFHZyZVoid2eevTtjykA@mail.gmail.com>
 <17eb00ef-f3db-4d42-a3fd-cbe6813075e5@amd.com>
In-Reply-To: <17eb00ef-f3db-4d42-a3fd-cbe6813075e5@amd.com>
From: Dipendra Khadka <kdipendra88@gmail.com>
Date: Mon, 23 Sep 2024 22:33:49 +0545
Message-ID: <CAEKBCKNesZRZx-PafM5+dfuLSgOQb7_0h5DvTT+YcfBmvj1ovQ@mail.gmail.com>
Subject: Re: [PATCH] Staging: drivers/gpu/drm/amd/amdgpu: Fix null pointer
 deference in amdkfd_fence_get_timeline_name
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Sep 2024 11:50:35 +0000
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

Hi Christian,

On Mon, 23 Sept 2024 at 18:57, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 21.09.24 um 06:25 schrieb Dipendra Khadka:
> > On Sat, 21 Sept 2024 at 00:43, Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 20.09.24 um 18:31 schrieb Dipendra Khadka:
> >>> On Fri, 20 Sept 2024 at 16:01, Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> >>>> Am 20.09.24 um 11:09 schrieb Dipendra Khadka:
> >>>>> '''
> >>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:108:9: error: Null=
 pointer dereference: fence [nullPointer]
> >>>>>     return fence->timeline_name;
> >>>>>            ^
> >>>>> '''
> >>>>>
> >>>>> The method to_amdgpu_amdkfd_fence can return NULL incase of empty f
> >>>>> or f->ops !=3D &amdkfd_fence_ops.Hence, check has been added .
> >>>>> If fence is null , then null is returned.
> >>>> Well NAK, completely nonsense. Calling the function with a NULL fenc=
e is
> >>>> illegal.
> >>> Thanks for enlightening me .
> >> Well sorry to be so direct, but what the heck did you tried to do here=
?
> >>
> > Hi Christian,
> >
> > cppcheck reported null pointer dereference in the line  " return
> > fence->timeline_name;" in the function "static const char
> > *amdkfd_fence_get_timeline_name(struct dma_fence *f)".
> > In the function , we are getting the value of fence like this :
> > "struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fence(f);"
> >
> > When I went through the function " to_amdgpu_amdkfd_fence" whose defini=
tion is :
> > '''
> > struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
> > {
> > struct amdgpu_amdkfd_fence *fence;
> >
> > if (!f)
> > return NULL;
> >
> > fence =3D container_of(f, struct amdgpu_amdkfd_fence, base);
> > if (f->ops =3D=3D &amdkfd_fence_ops)
> > return fence;
> >
> > return NULL;
> > }
> > '''
> >
> > Here, the function to_amdgpu_amdkfd_fence can return NULL when f is
> > empty or f->ops !=3D &amdkfd_fence_ops .So the fence in function
> > "amdkfd_fence_get_timeline_name" can be NULL.
> > Hence , I thought dereferencing NULL fence like "return
> > fence->timeline_name" may result in the runtime crashing. So, I
> > proposed this fix. Sorry, I was not aware about the behaviour of the
> > fence.
> > I am interested in the development and tried to fix this .
>
> Well it's in general a good idea that you looked into this, but you
> should have put more thoughts into it.
>
> That the fence can't be NULL is just implicit when you take a closer
> look at the code.
>
> amdkfd_fence_get_timeline_name() is only called through the pointer in
> amdkfd_fence_ops. This makes the condition "f->ops =3D=3D &amdkfd_fence_o=
ps"
> always true inside the function.
>

I am learning driver development and was not sure how it works. Now, I got =
it.

> The only other possibility is that the f parameter is NULL, but that in
> turn is impossible because the function is called like
> f->ops->get_timeline_name(f) and so the caller would have crashed even
> before entering the function.
>
> And finally you didn't looked at the documentation. The kerneldoc for
> get_timeline_name clearly states that the callback is mandatory and
> therefore can't return NULL.
>
> So to sum it up you suggested something which is not only unnecessary,
> but results in documented illegal behavior.
>
> The C language unfortunately doesn't have the necessary annotation
> possibilities that a function can't return a NULL string (at least as
> far as I know). So cppcheck can't know any of this.
>
> Please don't trust the automated tool to much and put a bit more time
> into patches like this.
>

Thank you so much for the insight and your time. I will make sure to
see the kernel doc as well as try to think more.

Best Regards,
Dipendra

> Regards,
> Christian.
>
> >
> >> I mean that is broken on so many different levels that I can't
> >> understand why somebody is suggesting something like that.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 3 +++
> >>>>>     1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/dri=
vers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> >>>>> index 1ef758ac5076..2313babcc944 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> >>>>> @@ -105,6 +105,9 @@ static const char *amdkfd_fence_get_timeline_na=
me(struct dma_fence *f)
> >>>>>     {
> >>>>>         struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fenc=
e(f);
> >>>>>
> >>>>> +     if (!fence)
> >>>>> +             return NULL;
> >>>>> +
> >>>>>         return fence->timeline_name;
> >>>>>     }
> >>>>>
> >>> Regards,
> >>> Dipendra Khadka
> > Regards,
> > Dipendra Khadka
>
