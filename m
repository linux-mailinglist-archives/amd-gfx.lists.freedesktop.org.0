Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF13BF11
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 00:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D01D891AD;
	Mon, 10 Jun 2019 22:02:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7AE891AC;
 Mon, 10 Jun 2019 22:02:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4539D80444;
 Tue, 11 Jun 2019 00:02:46 +0200 (CEST)
Date: Tue, 11 Jun 2019 00:02:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v1 0/10] drm/amd: drop use of drmP.h
Message-ID: <20190610220239.GA13919@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <CADnq5_PtU+-FrTcOF9hkFYbqsSjAKmJkWReu-91pQH6mWoHtgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PtU+-FrTcOF9hkFYbqsSjAKmJkWReu-91pQH6mWoHtgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=4rQba6vv1pEM1esrLPkA:9 a=CjuIK1q_8ugA:10
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleC4KCj4gCj4gU2VyaWVzIGlzOgo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gSSdtIGZpbmUgdG8gaGF2ZSB0aGlzIGdvIHRocm91
Z2ggZWl0aGVyIGRybS1taXNjIG9yIG15IHRyZWUuClRoYW5rcywgcHVzaGVkIHRvIGRybS1taXNj
LW5leHQuCkkgZW5kZWQgdXAgd2l0aCBhIG1lcmdlIGVycm9yIGluIGRybS10aXAgdGhhdCBJIGR1
bm5vIGhvdyB0byB3b3JrIHdpdGguCkhlbHAgd291bGQgYmUgYXBwcmVjaWF0ZWQuCihJIGFsc28g
d3JvdGUgdGhpcyBvbiBpcmMpCgpJdCBpcyBnZXR0aW5nIGxhdGUgaGVyZSwgSSBob3BlIHNvbWVv
bmUgaGFzIGZpeGVkIGl0IHRvbW9ycm93IG1vcm5pbmcuCgoJU2FtCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
