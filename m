Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D932F3CC
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Mar 2021 20:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C886EC28;
	Fri,  5 Mar 2021 19:26:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CED66EC28;
 Fri,  5 Mar 2021 19:26:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AACEB64EE1;
 Fri,  5 Mar 2021 19:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614972380;
 bh=kzXYKMiq9Kkvuj6hwxwweKjjTNV2kJilH9HJ4zHWnII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhjy/umtZMGPHhww/Toccm83mrAVBcsEC6FjiUGG8RyIGnrlIpxIG2lDDjtPap7T2
 xHray4YZm9AXCC9ISMPa7+arUPGPB52+IZyMYQAj/k2bg3iU6m3BmFfRCT5OuuF725
 EWTA6MdhMWh/e+OZBIUaeUOcq9zvINyKyOugSMkslEnqr8wwd1L9ttRkuaUCeg2Ywp
 6o844vPD9q7Ow8b6cIWVtUbg2z0sw9ppKigy9BZMwPYPcv/r6hMlSwcN6eFn+qlWX+
 7ooRMGVipKLvZ4/A7mVIqIXkV/L5+r7YIdyhlH1Vw7CorhDfX9e8q32LE6kjXrvFt2
 KAqToyS7hzrIw==
Date: Fri, 5 Mar 2021 13:26:17 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH][next] drm/radeon/si_dpm: Replace one-element array with
 flexible-array in struct SISLANDS_SMC_SWSTATE
Message-ID: <20210305192617.GA152661@embeddedor>
References: <20210303190458.GA16321@embeddedor>
 <CADnq5_M3dSMnKQMRv3SVaK6-w5ebJxX6w2-oy8v7+2muw3S3vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_M3dSMnKQMRv3SVaK6-w5ebJxX6w2-oy8v7+2muw3S3vg@mail.gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 02:10:44PM -0500, Alex Deucher wrote:
> Applied.  Thanks!

Awesome. :)

Thanks, Alex.
--
Gustavo
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
