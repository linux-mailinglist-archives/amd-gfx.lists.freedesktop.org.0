Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 604A4414F86
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Sep 2021 20:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6A6E02D;
	Wed, 22 Sep 2021 18:00:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A776EC42
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Sep 2021 16:44:04 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0efa00329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:fa00:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C0821EC051E;
 Wed, 22 Sep 2021 18:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632329038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=gtI3K23I3DhUzNiqPHLOEAfHrx+nTcEGqXkTAZ9qlCU=;
 b=B78ccUbaTflJwSlp4crJv5l0xPOE0KEqw94W2kirQHTVZFGv3UN/IjnwkD4oraE9V/DVLt
 GaS1VJP2KkdG0htPx+7Vfx8V20x9GgNfs9zRr0ge+GZxjzQof8kLPV3kNhQ3FPRtuCowcW
 Lp5GQA9UIZk/+moBWADlWYbCaBg5CQs=
Date: Wed, 22 Sep 2021 18:43:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Joshi, Mukul" <Mukul.Joshi@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "Ghannam, Yazen" <Yazen.Ghannam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCHv2 1/2] x86/MCE/AMD: Export smca_get_bank_type symbol
Message-ID: <YUtdSO8QZWiPeYwr@zn.tnic>
References: <20210511152538.148084-2-nchatrad@amd.com>
 <20210913021311.12896-1-mukul.joshi@amd.com>
 <YUsUpkvP8zpz8yRz@zn.tnic>
 <BL1PR12MB51444DA94F2DE3D12BBF31D1F7A29@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL1PR12MB51444DA94F2DE3D12BBF31D1F7A29@BL1PR12MB5144.namprd12.prod.outlook.com>
X-Mailman-Approved-At: Wed, 22 Sep 2021 18:00:51 +0000
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

On Wed, Sep 22, 2021 at 04:27:34PM +0000, Deucher, Alexander wrote:
> > On Sun, Sep 12, 2021 at 10:13:10PM -0400, Mukul Joshi wrote:
> > > Export smca_get_bank_type for use in the AMD GPU driver to determine
> > > MCA bank while handling correctable and uncorrectable errors in GPU
> > > UMC.
> > >
> > > v1->v2:
> > > - Drop the function is_smca_umc_v2().
> > > - Drop the patch to introduce a new MCE priority (MCE_PRIO_ACEL)
> > >   for GPU/accelarator cards.
> > 
> > Patch changelog information goes...
> > 
> > >
> > > Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
> > > ---
> > 
> > ... under this line so that it gets automatically removed by git when applying
> > the patch.
> > 
> > Alex, how do you wanna handle this?
> > 
> > Want me to ACK this and you can carry it through your tree along with the
> > second patch?
> 
> That would be great.  Thanks!

Ok, with the above changelog removed:

Acked-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
