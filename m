Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93231349CE
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2020 18:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3AB6E223;
	Wed,  8 Jan 2020 17:52:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070166E131
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2020 17:39:30 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q8so1973386pfh.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jan 2020 09:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bKjvwLoHlC29TnvYqxLfJzXQCusKrCOIAaFwwH7cSJ0=;
 b=GTNCpgnTvYnInEtO3QFpRZVybeL6CBYzJJx27ePUFw0/SafUvNxEYcOYQfvASQ6xqX
 6j+5vDN0aFTy3n2vQk6NkoWpkjjM2jUwkxQaSbL/wj3TBgA2VXvX2hZcLRoUwLWwSopL
 JoZOKKbVLSYcz5PbBGPmd9fCF6ZxmqIR6YilM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bKjvwLoHlC29TnvYqxLfJzXQCusKrCOIAaFwwH7cSJ0=;
 b=fa0IMVt25TGuoCqDgvIOnsxsXs+LQj8EA5sc6kCj4oj5JIzPhrpK7bGvO8neIUweot
 A1bwsNLW+MmaHYbGu6Qze7SMlS4r8xFNDY5It8CUZ4SioQ6QfrOYTAIinNCwM/NbpcTG
 WH1CbnAoQbuveg1W+cFChOzMRG8+i1G4iYdjXbMmN7ox87+V65BT5ABYZ8kexsEiBIdh
 T9/gxBwzqTtDghGbUF06lTvPJoLLevXCT9VgRgbkRiXMIdWFDWW74keFVGrzkh6PEWS0
 OUbgVCM7ixISpCap9GKA8bCUNYLY9b/LdwCh0SMRhxNn0SyCFpFzrYSJEHZCrUSTYYpF
 JIdQ==
X-Gm-Message-State: APjAAAVUsLuwVTNyI0GnEh06bQAYpt8GHst9FPqT+rF2yJnxQkUFotij
 dh4wRJ44TRthrHAUkj5/JKBYXA==
X-Google-Smtp-Source: APXvYqxdgwKREsz1YZeH4VDxSzla/QubcfkdDOAeGwicuj/jBB+4Si/iUY0qR/AhKo7jBTllsOCHfg==
X-Received: by 2002:a65:63ce:: with SMTP id n14mr6602246pgv.282.1578505169677; 
 Wed, 08 Jan 2020 09:39:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l8sm3901278pjy.24.2020.01.08.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 09:39:28 -0800 (PST)
Date: Wed, 8 Jan 2020 09:39:27 -0800
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check
 the return value
Message-ID: <202001080936.A36005F1@keescook>
References: <20200107192555.20606-1-tli@digitalocean.com>
 <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
X-Mailman-Approved-At: Wed, 08 Jan 2020 17:52:02 +0000
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
Cc: David1.Zhou@amd.com, kernel-hardening@lists.openwall.com,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Tianlin Li <tli@digitalocean.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 01:56:47PM +0100, Christian K=F6nig wrote:
> Am 07.01.20 um 20:25 schrieb Tianlin Li:
> > Right now several architectures allow their set_memory_*() family of
> > functions to fail, but callers may not be checking the return values.
> > If set_memory_*() returns with an error, call-site assumptions may be
> > infact wrong to assume that it would either succeed or not succeed at
> > all. Ideally, the failure of set_memory_*() should be passed up the
> > call stack, and callers should examine the failure and deal with it.
> > =

> > Need to fix the callers and add the __must_check attribute. They also
> > may not provide any level of atomicity, in the sense that the memory
> > protections may be left incomplete on failure. This issue likely has a
> > few steps on effects architectures:
> > 1)Have all callers of set_memory_*() helpers check the return value.
> > 2)Add __must_check to all set_memory_*() helpers so that new uses do
> > not ignore the return value.
> > 3)Add atomicity to the calls so that the memory protections aren't left
> > in a partial state.
> > =

> > This series is part of step 1. Make drm/radeon check the return value of
> > set_memory_*().
> =

> I'm a little hesitate merge that. This hardware is >15 years old and nobo=
dy
> of the developers have any system left to test this change on.

If that's true it should be removed from the tree. We need to be able to
correctly make these kinds of changes in the kernel.

> Would it be to much of a problem to just add something like: r =3D
> set_memory_*(); (void)r; /* Intentionally ignored */.

This seems like a bad idea -- we shouldn't be papering over failures
like this when there is logic available to deal with it.

> Apart from that certainly a good idea to add __must_check to the function=
s.

Agreed!

-Kees

-- =

Kees Cook
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
