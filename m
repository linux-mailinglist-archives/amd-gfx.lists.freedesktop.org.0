Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74768A319
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Feb 2023 20:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCCA10E8BE;
	Fri,  3 Feb 2023 19:34:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D7F10E8BD;
 Fri,  3 Feb 2023 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675452888; x=1706988888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1aVJdMi778Ee9DjdymmyQts0WuR3pQ7A6HmY7ThgiEk=;
 b=mKfp1v6GBIfIIcaCsmimL05vHwfSI1/PRyemnJROyny5wtuEy9jL4C36
 o1j1OMN8UIstUF8cVEEumeJmJMOaIjV1mndJC+csEdmOt33T/VfNoAjhK
 RkJwiCbWWSLK7ciI6BKA+ArBJOv4V+KTG8zz79LZuOeJSW17WbbvGraG3
 tJHBSYAGBEEqPSBzlSbtmbh8SugsamyO3JpSDW0ogmXBrfOJbDzJkf0TJ
 cv+H7j2Pr6ArVeZwYoSLk3/MzLztQ1zRfFyWeYr9FbW5mfGHrtoJpysvJ
 Ym2cpAbBsFkhedNev5eRRAXolzbpHKd7PZz6BcjiZqe6Q90mvO+uSRTpi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309171055"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="309171055"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 11:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="698182841"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="698182841"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 03 Feb 2023 11:34:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 21:34:32 +0200
Date: Fri, 3 Feb 2023 21:34:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Y91hyNAplv4nuW5Y@intel.com>
References: <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
 <Y91Y98jyOimabC3O@intel.com> <Y91fsmgAx65koWI5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y91fsmgAx65koWI5@intel.com>
X-Patchwork-Hint: comment
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 09:25:38PM +0200, Ville Syrj�l� wrote:
> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrj�l� wrote:
> > On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
> > > 
> > > 
> > > On 2/3/23 11:00, Ville Syrj�l� wrote:
> > > > On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
> > > >>
> > > >>
> > > >> On 2/3/23 10:19, Ville Syrj�l� wrote:
> > > >>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
> > > >>>>
> > > >>>>
> > > >>>> On 2/3/23 07:59, Sebastian Wick wrote:
> > > >>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj�l�
> > > >>>>> <ville.syrjala@linux.intel.com> wrote:
> > > >>>>>>
> > > >>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > > >>>>>>> Userspace has no way of controlling or knowing the pixel encoding
> > > >>>>>>> currently, so there is no way for it to ever get the right values here.
> > > >>>>>>
> > > >>>>>> That applies to a lot of the other values as well (they are
> > > >>>>>> explicitly RGB or YCC). The idea was that this property sets the
> > > >>>>>> infoframe/MSA/SDP value exactly, and other properties should be
> > > >>>>>> added to for use userspace to control the pixel encoding/colorspace
> > > >>>>>> conversion(if desired, or userspace just makes sure to
> > > >>>>>> directly feed in correct kind of data).
> > > >>>>>
> > > >>>>> I'm all for getting userspace control over pixel encoding but even
> > > >>>>> then the kernel always knows which pixel encoding is selected and
> > > >>>>> which InfoFrame has to be sent. Is there a reason why userspace would
> > > >>>>> want to control the variant explicitly to the wrong value?
> > > >>>>>
> > > >>>>
> > > >>>> I've asked this before but haven't seen an answer: Is there an existing
> > > >>>> upstream userspace project that makes use of this property (other than
> > > >>>> what Joshua is working on in gamescope right now)? That would help us
> > > >>>> understand the intent better.
> > > >>>
> > > >>> The intent was to control the infoframe colorimetry bits,
> > > >>> nothing more. No idea what real userspace there was, if any.
> > > >>>
> > > >>>>
> > > >>>> I don't think giving userspace explicit control over the exact infoframe
> > > >>>> values is the right thing to do.
> > > >>>
> > > >>> Only userspace knows what kind of data it's stuffing into
> > > >>> the pixels (and/or how it configures the csc units/etc.) to
> > > >>> generate them.
> > > >>>
> > > >>
> > > >> Yes, but userspace doesn't control or know whether we drive
> > > >> RGB or YCbCr on the wire. In fact, in some cases our driver
> > > >> needs to fallback to YCbCr420 for bandwidth reasons. There
> > > >> is currently no way for userspace to know that and I don't
> > > >> think it makes sense.
> > > > 
> > > > People want that control as well for whatever reason. We've
> > > > been asked to allow YCbCr 4:4:4 output many times.
> > > > 
> > > > The automagic 4:2:0 fallback I think is rather fundementally
> > > > incompatible with fancy color management. How would we even
> > > > know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> > > > that stuff is just always BT.709 limited range, no questions
> > > > asked.
> > > > 
> > > 
> > > We use what we're telling the display, i.e., the value in the
> > > colorspace property. That way we know whether to use a BT.2020
> > > or BT.709 matrix.
> > 
> > And given how these things have gone in the past I think
> > that is likey to bite someone at in the future. Also not
> > what this property was meant to do nor does on any other
> > driver AFAIK.
> > 
> > > I don't see how it's fundamentally incompatible with fancy
> > > color management stuff.
> > > 
> > > If we start forbidding drivers from falling back to YCbCr
> > > (whether 4:4:4 or 4:2:0) we will break existing behavior on
> > > amdgpu and will see bug reports.
> > 
> > The compositors could deal with that if/when they start doing
> > the full color management stuff. The current stuff only really
> > works when the kernel is allowed to do whatever it wants.
> > 
> > > 
> > > > So I think if userspace wants real color management it's
> > > > going to have to set up the whole pipeline. And for that
> > > > we need at least one new property to control the RGB->YCbCr
> > > > conversion (or to explicitly avoid it).
> > > > 
> > > > And given that the proposed patch just swept all the
> > > > non-BT.2020 issues under the rug makes me think no
> > > > one has actually come up with any kind of consistent
> > > > plan for anything else really.
> > > > 
> > > 
> > > Does anyone actually use the non-BT.2020 colorspace stuff?
> > 
> > No idea if anyone is using any of it. It's a bit hard to do
> > right now outside the full passthrough case since we have no
> > properties to control how the hardware will convert stuff.
> > 
> > Anyways, sounds like what you're basically proposing is
> > getting rid of this property and starting from scratch.
> 
> Hmm. I guess one option would be to add that property to
> control the output encoding, but include a few extra
> "automagic" values to it which would retain the kernel's
> freedom to select whether to do the RGB->YCbCr conversion
> or not.
> 
> enum output_encoding {
> 	auto rgb=default/nodata,ycbcr=bt601
> 	auto rgb=default/nodata,ycbcr=bt709
> 	auto rgb=bt2020,ycbcr=bt2020
> 	passthrough,
> 	rgb->ycbcr bt601,
> 	rgb->ycbcr bt709,
> 	rgb->ycbcr bt2020,
> }

In fact there should perhaps be a lot more of the explicit
options to get all subsamlings and quantizations ranges
coverted. That might actually be really nice for an igt
to get more full test coverage.

-- 
Ville Syrj�l�
Intel
