Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD89F82D7
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Dec 2024 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C812210ED7B;
	Thu, 19 Dec 2024 18:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HOwgFisF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0710ED86
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Dec 2024 18:03:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361f796586so11995035e9.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Dec 2024 10:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734631409; x=1735236209; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wj6fKybvhpdLo8S03Sc82p7qiE0cE5iZZNXR/q2KG50=;
 b=HOwgFisFIA47lT2WjGJ4Sm2fAmboJy/MJmXfMDdW4Wa/fEp7rPqRg7498J+F9/lC4T
 p7elj2AOcGnaScen/CzsQ2Xpat3OYJ9IpQJOccXF/zSXW6b07xgaDk8HqKXgQucql+PW
 COoijK74NW7FuhWVD1p2+IkXMGOjyIKBcaFRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734631409; x=1735236209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wj6fKybvhpdLo8S03Sc82p7qiE0cE5iZZNXR/q2KG50=;
 b=WIdnBH/nH6dop7U6bJHHV1dmxj87xXoqJX7bVX2zrFaXrnVNMXePWPafchMANd7vsc
 LNbFq7WJia8fyl4S3eXaEwoUl4G4wg6sBqSFwUnPSLdDu2pASE1e01nySH0S0esQnB1B
 BI6XTYFEBMNaCT5grvDZtbB610icAWHTzDboGey2c0X5qnS4YbW0z7KmfO23ACFM6h/m
 oSrpJymQp8FL3PDMiq5+M2deqOBm/t0DM9+r06evy6coNWwFefpKlXy0YYRcBOkokVzN
 Z7ICvmUVEKF2jRzAFJgiOLgpw5B6fyUgvztJrpu02YB++lcqA2DGkAtjj6eqnwMpmes8
 jvpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8QedEpPXXU3pU+amBX4T9QB1Isy07NbHXHUBw9K+co8tGXwNo1+Ta7LLMWBLhI9WFrl+XPI7S@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/4rPJ6D6YX27CTZXKVgsVT2y7mWB+OkSw76GhimUcfPCDRBs6
 C59DVcnRBOJ1AYWkdDQLbysev9JU+x/ML8vLZ3oex28Wsre9aOOzBuyMTM+2RBQ=
X-Gm-Gg: ASbGnctpxeRKSE5K138K/10IkgCJAoteKDJxbBxMbhiY9Yg5SbfFTabD+EcsgzqTLOs
 vqmZyIqwcwyqhHI9BJa0FjI/gnypg2M2vWPMFzl7PHl0Wdzc+7cPhNG7v8fz8rOwasKPjWCaE0q
 PsAN3ixXhHeROlpbWxQsato0sXwOWuLKqx1SZJbpxeP/2el3BDhOBd8vYlAWa9Bo3Nn2IpZns5s
 l22AkSLltAPZZOWRJqdB0k0ljEYs2HCQxtOYkkeEtnpwkzupu/OI7Esq8+KDlNjuvAw
X-Google-Smtp-Source: AGHT+IFKEJdmGgm6Veb+9/tSj+uVDABACLdWgALXb2yDU5/KP1uI3+AxmFUe7k6w9BBfbvbE2dUKkA==
X-Received: by 2002:a5d:5e09:0:b0:385:f909:eb2c with SMTP id
 ffacd0b85a97d-38a223f7548mr31845f8f.38.1734631408916; 
 Thu, 19 Dec 2024 10:03:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e126sm2049240f8f.65.2024.12.19.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 10:03:28 -0800 (PST)
Date: Thu, 19 Dec 2024 19:03:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Brian Starkey <brian.starkey@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
> > On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> > > For that reason I think linear modifiers with explicit pitch/size
> > > alignment constraints is a sound concept and fits into how modifiers work
> > > overall.
> >
> > Could we make it (more) clear that pitch alignment is a "special"
> > constraint (in that it's really a description of the buffer layout),
> > and that constraints in-general shouldn't be exposed via modifiers?
> 
> It's still worryingly common to see requirements for contiguous
> allocation, if for no other reason than we'll all be stuck with
> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
> for expressing constraints via modifiers as well, and if so, should we
> be trying to use feature bits to express this?
> 
> How this would be used in practice is also way too underdocumented. We
> need to document that exact-round-up 64b is more restrictive than
> any-multiple-of 64b is more restrictive than 'classic' linear. We need
> to document what people should advertise - if we were starting from
> scratch, the clear answer would be that anything which doesn't care
> should advertise all three, anything advertising any-multiple-of
> should also advertise exact-round-up, etc.
> 
> But we're not starting from scratch, and since linear is 'special',
> userspace already has explicit knowledge of it. So AMD is going to
> have to advertise LINEAR forever, because media frameworks know about
> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> that the buffer is linear. That and not breaking older userspace
> running in containers or as part of a bisect or whatever.
> 
> There's also the question of what e.g. gbm_bo_get_modifier() should
> return. Again, if we were starting from scratch, most restrictive
> would make sense. But we're not, so I think it has to return LINEAR
> for maximum compatibility (because modifiers can't be morphed into
> other ones for fun), which further cements that we're not removing
> LINEAR.
> 
> And how should allocators determine what to go for? Given that, I
> think the only sensible semantics are, when only LINEAR has been
> passed, to pick the most restrictive set possible; when LINEAR
> variants have been passed as well as LINEAR, to act as if LINEAR were
> not passed at all.

Yeah I think this makes sense, and we'd need to add that to the kerneldoc
about how drivers/apps/frameworks need to work with variants of LINEAR.

Just deprecating LINEAR does indeed not work. The same way it was really
hard slow crawl (and we're still not there everywhere, if you include
stuff like bare metal Xorg) trying to retire the implied modifier. Maybe,
in an extremely bright future were all relevant drivers advertise a full
set of LINEAR variants, and all frameworks understand them, we'll get
there. But if AMD is the one special case that really needs this I don't
think it's realistic to plan for that, and what Daniel describe above
looks like the future we're stuck to.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
