Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D46197F80
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2020 17:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A136E420;
	Mon, 30 Mar 2020 15:23:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869576E420
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2020 15:23:44 +0000 (UTC)
Date: Mon, 30 Mar 2020 15:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585581821;
 bh=tKBMkugl3vX9A1TDy1hfQkKXhq0ybrxTvrI+7Oovk9w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dlLmInzyp51kz5CCq10x0VSIU9yXhRC2vldKnPxk8qN1erwHdgSloPkIXqWNYs9fR
 O+eo3cC2x+Kms6PuAcXX3Fwi24Tx1jspKCqWWzq9UPiAIxmumwgP6xBVwTYMM/jt0L
 JSgDBh5Hibd7qTy2ozDBnDAKMR+F0jXYQOVV5yG8=
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd/display: add basic atomic check for cursor plane
Message-ID: <sH98Y7wEvM1nRrXdNsbASU7_TlNowslY4IBgUL__XkHcsm7Qaqzchb7WQTYotrlQ6JhI1J2jU0iACDF4RLCPdbOTDW-0-uJvjVzp9nbKukU=@emersion.fr>
In-Reply-To: <c35a8999-f46d-f410-729f-249646d1e36c@amd.com>
References: <67AgM0yylniATabNxt8ct_5KATDTAwvscoDJBJxA3cm0vb0LJvyUM9VAX4r6Ib5Vxykoy9AN0G1uyZO8q00_RvTwmaimmGNQ3hZYoWKXZAo=@emersion.fr>
 <83db678a-a5d2-cf64-65f0-8fece62b2fbd@amd.com>
 <7EkixViMkOWZ8AEOpjSPCtfus4Fq2LWBmsk71_0nAC00BVKDIg7iao_0I2PIQp9Z3_jrQ5cglhuYKkq5CQnuLRunzg4pirlkY6hH3At1gww=@emersion.fr>
 <8d67af72-a3c0-65a7-2115-5f068ccbfc23@amd.com>
 <B9sWqLzmtdeSGNQnGEhg8RkGpHRGD0eRxKboCjMgkhR5ZVtLdlEIzoKBWfFnnX0p4Dvl8Chdd68eKpXTtccnAA4a2xeHq2cnHHqg0sv6zGc=@emersion.fr>
 <c35a8999-f46d-f410-729f-249646d1e36c@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Roman Gilg <subdiff@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, March 30, 2020 5:18 PM, Kazlauskas, Nicholas <nicholas.kazlauskas@amd.com> wrote:

> On 2020-03-30 9:13 a.m., Simon Ser wrote:
>
> > On Monday, March 30, 2020 3:11 PM, Kazlauskas, Nicholas nicholas.kazlauskas@amd.com wrote:
> >
> > > On 2020-03-30 9:02 a.m., Simon Ser wrote:
> > >
> > > > On Monday, March 30, 2020 2:59 PM, Kazlauskas, Nicholas nicholas.kazlauskas@amd.com wrote:
> > > >
> > > > > We've been doing these checks for position before but I don't think we
> > > > > really need them. DC should be disabling the cursor when we ask for a
> > > > > position completely off the screen.
> > > > > I think that's better than rejecting the commit entirely at least.
> > > >
> > > > I agree DC should be disabling the cursor in this case, however that's
> > > > not yet implemented right? I think implementing this feature is
> > > > orthogonal and should be done in a separate patch.
> > > > This patch simply copies over the cursor checks in the atomic check
> > > > function.
> > >
> > > It's implemented on DCN but I don't remember if we're doing it on DCE.
> > > I guess the drop can be in a separate patch.
> > > Reviewed-by: Nicholas Kazlauskas nicholas.kazlauskas@amd.com
> >
> > Thanks for the review. I'll try to figure out whether we can drop this
> > check (from both the atomic check and the other existing check).
>
> Oh, this was actually the checks for crtc_w/crtc_h. Not the x/y, my bad.
>
> We probably can't drop this from here, but we can drop it from
> get_cursor_position after this patch - since it's now in the atomic check.

Hmm, sorry I think I missed something. This patch does copy over the
x/y checks. We need to keep the w/h checks right?

Yeah, we can probably drop get_cursor_position checks indeed.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
