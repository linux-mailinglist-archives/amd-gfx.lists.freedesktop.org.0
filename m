Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CEB82DBFF
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jan 2024 16:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F2A10E2F3;
	Mon, 15 Jan 2024 15:01:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357FB10E2B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jan 2024 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705330906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZzHnpfGGCeoj1X9NKSYhE70cUGpZAspvvuSojm3bTE=;
 b=A2abZRDbOjdp+eA7sG56PTdSSX/lFEd/K6IIn4z1m1IzBTf4u64A/x1bhb75f409zaI8Z1
 g7jZ1Vm5f+Qz+Ngg1Bz0WiODWDdy4ID8e65uGFl0gXg4ibpO0BlIA17SmkFBYeSxXANYsk
 9S3NI1KxMyDKWKztJ/suUqkK3yUGvDg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-q6oRcIHOMlyfN-MFgqCEcw-1; Mon, 15 Jan 2024 10:01:43 -0500
X-MC-Unique: q6oRcIHOMlyfN-MFgqCEcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e5332f6e4so46824105e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jan 2024 07:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330903; x=1705935703;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZzHnpfGGCeoj1X9NKSYhE70cUGpZAspvvuSojm3bTE=;
 b=Ghkb9nC3FeZAk7EuSpz2nGYm4hzuxteiqBy6XslxcIAoX02X0LtakwxwsNISxKTpu9
 zhGeN5mzNG1e+CiPXAFC439aTHtGfxcmoELkv+MyxOsIaecNOifUAMcsjNT8wSBOv1bN
 QD/eCluQSdRyi5ZsFwDe+WFPFRtX5KJzHu19V2pmD/QrreSmuhxm4NbuJsLAyLOPERRm
 7iBy6+G8DbL7YgE/R8AQqDpRg8jy3GEA59a558vrppW7dIYIfjILGS48VQD/FiaeaxxC
 wrhSqI7xT2JR/7mWKoAOAvoUDbA26BY/YagCoWQrdMt/myUK2NQoo7nwT6wATVc5/m58
 bBOA==
X-Gm-Message-State: AOJu0YyEyaIxyYhcNYaCyhJ5vXUCss5pBFWY0bbGAMrGImjv4dJD+gQt
 L4R8hoDCuG3d8vTpJLReOOvQAHz9R6/PZUL7TzYoVqCzi8AZhdSU9/wmEeD0UIgggtkwUYFKG0N
 oldQUryOtLyawZbnImMm1N8O/uDL6Sr1HAA==
X-Received: by 2002:a05:600c:4315:b0:40e:8020:6d5e with SMTP id
 p21-20020a05600c431500b0040e80206d5emr149754wme.70.1705330902628; 
 Mon, 15 Jan 2024 07:01:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/7fGXupNBht5E+PnvxRdM6nCxA+FJyyzrPZ+F54w/p9lzG8dlWP6meDOfojAuC2YDoHnCBA==
X-Received: by 2002:a05:600c:4315:b0:40e:8020:6d5e with SMTP id
 p21-20020a05600c431500b0040e80206d5emr149739wme.70.1705330902214; 
 Mon, 15 Jan 2024 07:01:42 -0800 (PST)
Received: from toolbox ([2001:9e8:8996:a800:5fa3:a411:5e47:8fe5])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b0040d772030c2sm16106519wms.44.2024.01.15.07.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:01:41 -0800 (PST)
Date: Mon, 15 Jan 2024 16:01:40 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
Message-ID: <20240115150140.GB160656@toolbox>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
 <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
 <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
 <ZZ509L_kmVC4IUBW@phenom.ffwll.local>
 <CAPj87rOiS8F=oDW3iE=bgFyfeJnYhy8kPF2v-uYOq3xgYtVPAg@mail.gmail.com>
 <CAFNQBQwjeJaX6B4oewpgASMUd5_nxZYMxUfdOG294CTVGBTd1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFNQBQwjeJaX6B4oewpgASMUd5_nxZYMxUfdOG294CTVGBTd1w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Werner Sembach <wse@tuxedocomputers.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Stone <daniel@fooishbar.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 05:17:46PM +0000, Andri Yngvason wrote:
> mi�., 10. jan. 2024 kl. 13:26 skrifa�i Daniel Stone <daniel@fooishbar.org>:
> > >
> > > This thing here works entirely differently, and I think we need somewhat
> > > new semantics for this:
> > >
> > > - I agree it should be read-only for userspace, so immutable sounds right.
> > >
> > > - But I also agree with Daniel Stone that this should be tied more
> > >   directly to the modeset state.
> > >
> > > So I think the better approach would be to put the output type into
> > > drm_connector_state, require that drivers compute it in their
> > > ->atomic_check code (which in the future would allow us to report it out
> > > for TEST_ONLY commits too), and so guarantee that the value is updated
> > > right after the kms ioctl returns (and not somewhen later for non-blocking
> > > commits).
> >
> > That's exactly the point. Whether userspace gets an explicit
> > notification or it has to 'know' when to read isn't much of an issue -
> > just as long as it's well defined. I think the suggestion of 'do it in
> > atomic_check and then it's guaranteed to be readable when the commit
> > completes' is a good one.
> >
> > I do still have some reservations - for instance, why do we have the
> > fallback to auto when userspace has explicitly requested a certain
> > type? - but they may have been covered previously.
> >
> 
> We discussed this further on IRC and this is summary of that discussion:
> 
> Sima proposed a new type of property that can be used to git feedback to
> userspace after atomic ioctl. The user supplies a list of output properties
> that they want to query and the kernel fills it in before returning from the
> ioctl. This would help to get some information about why things failed
> during TEST_ONLY.
> 
> Emersion raised the point that you might not know how much memory is needed
> beforehand for the returned properties, to which sima replied: blob
> property. There was some discussion about how that makes it possible to leak
> kernel memory, especially if userspace does not know about a new property
> blob. Emersion pointed out that userspace should only request properties
> that it understands and pq agreed.
> 
> Emersion asked how the user should inform the kernel that it's done with the
> blob, to which sima replied: DRM_IOCTL_MODE_DESTROYPROPBLOB. Sima also
> mentioned using some sort of weak reference garbage collection scheme for
> properties and there was some further discussion, but I'm not sure there was
> any conclusion.
> 
> I asked if it made sense to add color format capabilities to the mode info
> struct, but the conclusion was that it wouldn't really be useful because we
> need TEST_ONLY anyway to see if the color format setting is compatible with
> other settings.
> 
> I asked again if we should drop the "active color format" property as it
> seems to be more trouble than it's worth for now. pq mentioned that there
> are 2 separate use cases (in his words):
> - People playing with setting UI would like to know what "auto" would result
>   in, but that's just nice to have
> - The other use case is the flicker-free boot into known configuration He
>   went on to point out that the main problem with "auto" is that any modeset
>   could make the driver decide differently. This means that we cannot fully
>   rely on the previously set property.
> 
> However, leaving out "active color property" did not put us in a worse
> situation than before, so the conclusion was that we should leave it out for
> now. For GUI selectors, the current TEST_ONLY should be good enough, and all
> the fancy stuff discussed previously isn't needed for now.
> 
> To summarise the summary: this means that we will drop the "active
> color format" property and rename the "preferred color format"
> property to "force color format" or just "color format" and failing to
> satisfy that constraint will fail the modeset rather than falling back
> to the "auto" behaviour.

That's a good idea.

Anything else won't work with the new color pipeline API anyways because
user space will be responsible for setting up the color pipeline API in
a way so that the monitor will receive the correctly encoded data.

> Cheers,
> Andri
> 

