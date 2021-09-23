Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07CA416151
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Sep 2021 16:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411356ED64;
	Thu, 23 Sep 2021 14:44:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91996ED64
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Sep 2021 14:37:21 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d6800d4c5e0e0616b3501.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:6800:d4c5:e0e0:616b:3501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 309CD1EC056B;
 Thu, 23 Sep 2021 16:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632407836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HfoPwsxKHCcbtGaxkHIOM1bQ75QFFghWL979CqRbrFw=;
 b=Rx5O0nY0jYGcwQF/bSZi8maFoS15Mo0LtUhi5e0YG9Q+Yq8Ck3sI3RsyTcaBFSB3oH0EmV
 Yld3Ju3Dx5hg8HjdqY8dj0ZSLpHYHfhhZLc+WCOKEOhwNOGpMwoQ699jFogBTuB3ZCer5w
 /QVZE3GiP4L7x3fZ39Cl8wHquNRAnf0=
Date: Thu, 23 Sep 2021 16:37:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mukul Joshi <mukul.joshi@amd.com>, linux-edac@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 mchehab@kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCHv3 2/2] drm/amdgpu: Register MCE notifier for Aldebaran RAS
Message-ID: <YUyRFl3oc2CwFxZz@zn.tnic>
References: <20210913021311.12896-2-mukul.joshi@amd.com>
 <20210922193620.15925-1-mukul.joshi@amd.com>
 <YUyPM7VfYFG/PJmu@yaz-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUyPM7VfYFG/PJmu@yaz-ubuntu>
X-Mailman-Approved-At: Thu, 23 Sep 2021 14:44:14 +0000
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

On Thu, Sep 23, 2021 at 02:29:07PM +0000, Yazen Ghannam wrote:
> > +	/*
> > +	 * If the error was generated in UMC_V2, which belongs to GPU UMCs,
> > +	 * and error occurred in DramECC (Extended error code = 0) then only
> > +	 * process the error, else bail out.
> > +	 */
> > +	if (!m || !((smca_get_bank_type(m->bank) == SMCA_UMC_V2) &&
> > +		    (XEC(m->status, 0x1f) == 0x0)))
> 
> The MCA_STATUS[ErrorCodeExt] field is bits [21:16], so the mask should be
> 0x3f.
> 
> > +		return NOTIFY_DONE;
> > +
> > +	/*
> > +	 * If it is correctable error, return.
> > +	 */
> > +	if (mce_is_correctable(m))
> > +		return NOTIFY_OK;
> 
> Shouldn't this be "NOTIFY_DONE" if "don't care" about this error?

I think the logic here is to stop calling any further consumers on the
notify chain because this is a GPU correctable error and they can't do
anything about it anyway, right?

Or am I misreading it?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
