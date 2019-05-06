Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AEB14971
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 14:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392E8945B;
	Mon,  6 May 2019 12:20:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2778945B
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 12:20:56 +0000 (UTC)
Received: by mail-it1-x12b.google.com with SMTP id t200so19482881itf.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 05:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SdVHcjIv5zQ/cOQO9FPfxvFQqwE36P9W4RxkanaU2AQ=;
 b=nh9m5c0q2xOcWVT5/Ho10JtMg7BvVBgZVqP0BZAy1xfd4FNA8aiTsedvui2Gk/bV2W
 mQppWovmnT/Be4ghhEtaffEqWBUZgf8AdR2fY1Pv1Lvm8vmb/sHx0vti/esy+UNPk/iw
 Rod9+IQqekkEf+O0xVwbV+dEC8YTkWF7fQmqKH5NTpYaZWv4FUMRTUpSWyJeuP6Zw7/U
 LPfQsM1kkfWDH68XgILIUlJx/+YQgeYhmtqQDWsnNMOVS87PCdxXsxPHQjihjGiZBDvs
 ARnW/r1epav1edWlTcfv6ckwY4GhVPA56fqEk8Vua+SxdzBTso8tcUD490uJYsOWDSbO
 9KEw==
X-Gm-Message-State: APjAAAXG7QzGzYaExo/QTUmgWT8RqykSONMvEqXAoZJuibEY5K8n5ak4
 4OFzx5ct4+/TRcyS5z1ANhv56DYN2OnkkIyZOP6qCw2GZVs=
X-Google-Smtp-Source: APXvYqzMJkTenSrBx8fOpga6M7XOWeshBNa/cJXCnO0SZlbgpVYGs+hpJshhOjFl4W1NYzEjS9EePmIoYF5av0vzZ/8=
X-Received: by 2002:a05:660c:78a:: with SMTP id
 h10mr19318980itk.157.1557145255976; 
 Mon, 06 May 2019 05:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
 <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
 <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
 <58827d68-cc9a-4a37-f078-7aec9b6a98cd@gmail.com>
In-Reply-To: <58827d68-cc9a-4a37-f078-7aec9b6a98cd@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 6 May 2019 17:20:45 +0500
Message-ID: <CABXGCsPcfyvHqhhGYAgnA-FoQ5zRovu7NP7GMiGBvrqwoe5ahA@mail.gmail.com>
Subject: Re: How to dump gfx and waves after GPU reset happened?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SdVHcjIv5zQ/cOQO9FPfxvFQqwE36P9W4RxkanaU2AQ=;
 b=a3acDEuxKEOtGUEIz/fe0cifuV0s/gWGAel+28RgHAS8b7sly3PWaoMv7tXAjNCDof
 fO6+LzTvYFbXtJc4lFg7dtQlRISc5+vUODEffpgAYndyM4FzfD95pB+K5lkSf3kX5KJ5
 wWlxJs0csJf2u/YYHWiUAySNVEpRCQSWgKRIwG99ZGsdqJ9vpe4/jscnD8cQhPc7sMEQ
 YV/rBU+3g0zbBoropSYvo/0iDnPhBwO8XlW3TvkAgwvOVkmgQ8aLMmE/+wClw5kiIMth
 CE+gsNcAte+ob0j5fH1lbLHWND1JkOU8IGeQybAoDZHrb2AuIhi3FdKr+iyDqvqpZNgK
 +8EA==
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
Cc: Tom St Denis <tom.stdenis@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCA1IE1heSAyMDE5IGF0IDE1OjE4LCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBZZWFoLCBidXQgZm9yIG1vc3QgZW5k
IHVzZXJzIHdlIG5lZWQgdG8gZ2V0IHRoZSBHUFUgd29ya2luZyBhcyBmYXN0IGFzCj4gcG9zc2li
bGUgb24gYSBsb2NrdXAuCj4KPiBTYXZpbmcgYWxsIHRoZSBzdGF0ZSAod2hpY2ggYWN0dWFsbHkg
Y2FuIGJlIGEgY291cGxlIG9mIGdpZ2FieXRlcyBpZiB5b3UKPiBpbmNsdWRlIGFsbCB0ZXh0dXJl
cyBldGMuLikgaXMgbm90IHJlYWxseSBhbiBvcHRpb24gdGhlbi4KPgo+IFdoYXQgd2UgY291bGQg
cHJvYmFibHkgZG8gcmF0aGVyIGVhc2lseSBpcyB0byBhZGQgYSBmdW5jdGlvbiB0byBydW4gYQo+
IHNjcmlwdCBpbnN0ZWFkIG9mIGEgR1BVIHJlc2V0IG9uIGxvY2t1cCBkZXRlY3Rpb24uCj4KClRo
aXMgd291bGQgYmUgdXNlZnVsIGlmIHRoaXMgc2NyaXB0IHdvdWxkIHJ1biBub3QgaW5zdGVhZCBH
UFUgcmVzZXQKYW5kIGJlZm9yZSBHUFUgcmVzZXQuCgotLQpCZXN0IFJlZ2FyZHMsCk1pa2UgR2F2
cmlsb3YuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
