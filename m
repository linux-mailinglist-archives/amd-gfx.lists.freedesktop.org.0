Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF965141267
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Jan 2020 21:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0929D6E040;
	Fri, 17 Jan 2020 20:43:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F073A6F913
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 20:43:54 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id v15so22371391iln.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 12:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Bedva7uR9RCxWnglqLnOetZ7iPOlTbuJ7vu8I/S3FI=;
 b=B0d5YRbWLVMYdXdrXgUgamVBrvj9IQb0JlhV/eIhDfFAddKa/n1TwR1/ASeYIROtCb
 NtdDLnJmWH4BP8iQ+2tW8qMvjOhYcsNWzqPHrigsBUrpEfjXA6ATv/OKtr6yR0xb9ifF
 3tXAllbEjk5sTldU6B+Km/1pQi5s2qKa0NmZ4mra7ieRwTwp+2olTluhQ2N6ULRztoUv
 GkXVxWc60OTSECDFjQ7d6PE6aXYoa8Y5/0d2EVsR8OUg/FDqzf8jieCRwcPLr/IIFtrz
 Q0FmleFHlai1mx8uIdRHZ24/Il5cslf6kD+YxzfcwY+7GVkcmrg4cEibsIo6z4lgAQRM
 U51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Bedva7uR9RCxWnglqLnOetZ7iPOlTbuJ7vu8I/S3FI=;
 b=JkNEy9Fd02VxXTFFejesq+fDLgzytphiv54YeZz6ZRq9bW8xhZXPUOqjOgMUN4ToQB
 eqxL5FxQj1f9tY/vvedOyRkL4Zwz7SmNk6Bq1yEA1wZLY2IRbfxDAqa7VMf8muNdbsDK
 9wgJ2wSx1WNp/qyIPl1srFnfjyOL/VayIBlfKkpiuaPD8FIsfS/e90ZIa/CTwfYNqIpk
 2i/o99VQCqkr9vlg1734I5qpwRRtBSNe+DHKXLqmcKc4w9R39/xi3Tx8bEopBW+f0+7P
 7zmDy6cRLFyTZMxAvAtA26i/4szFr1+Ti3QiZp4jkkcdyr4Go6q6RjP/8rZ9fg+pDBEc
 jJ7Q==
X-Gm-Message-State: APjAAAXI6X29fOgOrAv5dgx7kVkkTb0ZQhAkx2XkQftE2QhETMVoZaYD
 S7Fxyz3Zimn9VgOe0xzEUisdbbuMSvUfoE6OC2EUcg==
X-Google-Smtp-Source: APXvYqzvNMYw6bQh4ZpYpE3e0JCVyRjqeCJDQOiElcrPWk6yW5BITe9gYwxXa8hsS7KDL/Jw3vVatm7410trYoNTVUg=
X-Received: by 2002:a05:6e02:102c:: with SMTP id
 o12mr319100ilj.165.1579293834244; 
 Fri, 17 Jan 2020 12:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
 <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
In-Reply-To: <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 15:43:17 -0500
Message-ID: <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
To: Lyude Paul <lyude@redhat.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 3:27 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Fri, 2020-01-17 at 11:19 -0500, Sean Paul wrote:
> > On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Lyude Paul <lyude@redhat.com>
> > > > Sent: Saturday, December 7, 2019 3:57 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > > > amd-gfx@lists.freedesktop.org
> > > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> > > > stable@vger.kernel.org
> > > > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology
> > > > mgr
> > > >
> > > > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > >
> > > > > I'll go ahead and push this to drm-misc-next-fixes right now, thanks!
> > > >
> > > > Whoops-meant to say drm-misc-next here, anyway, pushed!
> > > Thanks for your time!
> > >
> >
> > I'm getting the following warning on unplug with this patch:
> >

\snip

>
> I think I've got a better fix for this that should avoid that problem, I'll
> write up a patch and send it out in a bit

Thanks Lyude! Should we revert this patch for the time being?

> >
> --
> Cheers,
>         Lyude Paul
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
