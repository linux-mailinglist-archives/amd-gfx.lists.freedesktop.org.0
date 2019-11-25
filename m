Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC3108822
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Nov 2019 06:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69FD89DC5;
	Mon, 25 Nov 2019 05:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3015C89DC5
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Nov 2019 05:18:11 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a137so9807289qkc.7
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 21:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rxoPFJpfdFPGzCh7S8c0UjDSOfZgv1geNk+cSpTg93A=;
 b=XpssgybF0Z9LSau0Uj+vaDYTFHlSlbtiJiGRUi61Ib+tKHNnh6MUWxiJ0685Rhl05k
 XSaPmNXcWW8FrJnpIRF5wDL6Ze3ZuLJATwDxT17nw2g5zrVblTxL4QBIPKJpyGdb8lL7
 ImIltOoDnXtcCQbdJJhF9R7A4tA65l6/qQQL4lJYJoBk2P+TQUGl3mVUSZJNOGPplErX
 hqynOh5cGi7c+QRzBp9TVZE3PqXM4OpXLR5oNE6+tm5CZIOctrfuTVnqboyTAi0cDn9F
 hxmaRvybZ0JnXiml+ABSJ5dthoN5LLa0pTu7Jg1kU/MB0fV42Ax+PtDzqzKkqqk3FgXc
 OTJQ==
X-Gm-Message-State: APjAAAXQhlquNWuk+iZQsvV1f948bL7HkL4k+8toekYpQ7OGRQ0MIRe+
 ZTvajrUvUeifBXdh/Ta9QCvyEDCcgYdT4lHqK52umQ==
X-Google-Smtp-Source: APXvYqw2AQtWJ1rxhi+gFVMKsY1xEeG7JlJZ3Dqg/h6yR8lXjZuzC8siyXYp8ipfy1+snxUBB+72udZxnRjiimvG71w=
X-Received: by 2002:a05:620a:12c3:: with SMTP id
 e3mr24416696qkl.14.1574659090155; 
 Sun, 24 Nov 2019 21:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20191015065002.18701-1-drake@endlessm.com>
 <CADnq5_M4Leu0raYS6M72MqTm1+PLg9BjHCHLAYuB2-dEVP56_A@mail.gmail.com>
 <CAD8Lp443ZhPEo0PJRxbTSB9DY9x92OvWBeH29m9Ehpyhg+2n5A@mail.gmail.com>
 <CADnq5_OaATVESAY9E2mtd7PoV2VjG=WLS56LCHVpieSHDTas0A@mail.gmail.com>
In-Reply-To: <CADnq5_OaATVESAY9E2mtd7PoV2VjG=WLS56LCHVpieSHDTas0A@mail.gmail.com>
From: Daniel Drake <drake@endlessm.com>
Date: Mon, 25 Nov 2019 13:17:59 +0800
Message-ID: <CAD8Lp46f9LR_VJ26BGfOGvj8sTjKZowkbjLNv6R4CsVMfRZQ=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: always reset asic when going into suspend
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rxoPFJpfdFPGzCh7S8c0UjDSOfZgv1geNk+cSpTg93A=;
 b=qqwQ83fEGtuJ/caSJw10t/dKGcP2GbkM+PF1XwPrvLYUOABioklJPjXq74oG7P2q3w
 iDzgrv0a97x3WS2G/BLl6W0qqEPfzXtnranE777UVyXyxql9KKMDn2uzJyjMNNAx4thu
 YoyL6NTJ+xnt4zxCXEOGZziIQmhxzn98rYkKrtkTkGw9BHdkOHBl+5fq84UvXU+xkUIw
 YeZiX33IWfkpmKSPUjalajkDuqump5K1H0wckc3AJ/nxf4FDe1QiXwdU2Lial+6LTaQs
 1SvwINb9oS0DlRiLdljff/m3Yv9fyObdtYS3aGWTjHPQF1gtZLki8mSiIXd8t4AF1C3A
 JPsA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MzIgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+IHdyb3RlOgo+IERvIHRoZXNlIHBhdGNoZXMgaGVscD8KPiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzQxNzc1Lwo+IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNDE5NjgvCgpVbmZvcnR1bmF0ZWx5IG5vdC4gVGhlIG9y
aWdpbmFsIGlzc3VlIHN0aWxsIGV4aXN0cyAoZGVhZCBnZnggYWZ0ZXIKcmVzdW1lIGZyb20gczJp
ZGxlKSBhbmQgYWxzbyB3aGVuIEkgdHJpZ2dlciBleGVjdXRpb24gb2YgdGhlIHN1c3BlbmQKb3Ig
cnVudGltZSBzdXNwZW5kIHJvdXRpbmVzIHRoZSBwb3dlciB1c2FnZSBpbmNyZWFzZXMgYXJvdW5k
IDEuNVcgYXMKYmVmb3JlLgoKSGF2ZSB5b3UgY29uZmlybWVkIHRoYXQgYW1kZ3B1IHMyaWRsZSBp
cyB3b3JraW5nIG9uIHBsYXRmb3JtcyB5b3UgaGF2ZSBpbiBoYW5kPwoKVGhhbmtzCkRhbmllbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
