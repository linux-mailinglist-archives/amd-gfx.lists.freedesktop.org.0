Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157322FB78
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Jul 2020 23:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8F76E051;
	Mon, 27 Jul 2020 21:32:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986036E05D
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Jul 2020 21:32:15 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id v6so2631213ota.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Jul 2020 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OEiABl8b8tMlt/Qjct9uHQEISrUoWRGPs6oS3G8P/Sg=;
 b=VUrZPynJWuf9eFzr9X2aORsn/uGDuxjcZXWBOXdYq4G1h1/6Yc73v20NP/NyvHN/ny
 Lx9PgDSPOL9caa27MAeNHFVTdqcwU5WOn8+asUuheUEAyvS2o0YU2kcyyO4tHqXB7tCp
 j1lDA9ekpawR45YUdOfqCj34e+FHiq5cHqBUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OEiABl8b8tMlt/Qjct9uHQEISrUoWRGPs6oS3G8P/Sg=;
 b=X6TverScKP7HpvG9Sv3oTUIsUjMcOen4CuaDukgLBu3sesFtKwDbGUb78xeLvITbDL
 T+3msNR0P+np6y0PrDXplfv4LJJbsnXKZei7jZGLxKmH+CgSztFhiL2TQRbTOSSlgc26
 uIt5rLoo3vJgWvAvbXt+tkIoUmTMqT6sQbjrxBCsXnDmEG7YZ7nY71irgKVW7emihLBQ
 Zs+Jt+h2TaP00dtcJlkxkME2NAmYXzyA2WSehTonYbNd9Dzorsic658wg6cwFM0gQ/vV
 B6ofJJ8lG8jy7lb7Q4QUnq8lhaiGNvYWjB6oEGiHQI4ZG4oKLKeqs+4zixG4Ww+yZksn
 CLQQ==
X-Gm-Message-State: AOAM530Gntuf2dR6brxhRd/SNmEv5eKvxumngWT87sZ31kGiPAW84FQu
 DAZjAn/zBWNO2boMkjGqpJkPDixka6X6KNb2JUG+RQ==
X-Google-Smtp-Source: ABdhPJytl09X4a3cc8s/p1HxizemA6EhYEyZ4hdPIc9TNvGDyslLQ5lFiLoPZFNsA8h2/+W0Ii5y1F+lPL4rDpPTDdU=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr21092624otr.303.1595885534733; 
 Mon, 27 Jul 2020 14:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
 <ba078fb0-0dbc-df06-cfe9-f9537883f82a@amd.com>
 <e2f55480-c24f-6c85-08d3-21131a22d0bf@amd.com>
 <3b7e3e50-2ff7-eff3-2ffc-abaa4b36ce7f@amd.com>
 <CAKMK7uHCu02P4tvhF4LQbtYeNciU61ONC9EZRmQ-0wEGFPzZgg@mail.gmail.com>
 <Fnx2lsAReNccvQbyMYBgghvef4ekiQ_ZWL0m5BwF-2h48gvnNLghI4zkIWhQwy-H6CiytTXaxEtZ83dYRlzAXeKHujBRLc_tffmcJVWjwuo=@protonmail.com>
In-Reply-To: <Fnx2lsAReNccvQbyMYBgghvef4ekiQ_ZWL0m5BwF-2h48gvnNLghI4zkIWhQwy-H6CiytTXaxEtZ83dYRlzAXeKHujBRLc_tffmcJVWjwuo=@protonmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 Jul 2020 23:32:03 +0200
Message-ID: <CAKMK7uFAnedLTp6LJYum6gYj3xaWkuuXJr70UJ48Pxxr-4dA7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
To: Mazin Rezk <mnrzk@protonmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMTE6MTEgUE0gTWF6aW4gUmV6ayA8bW5yemtAcHJvdG9u
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uZGF5LCBKdWx5IDI3LCAyMDIwIDQ6MjkgUE0sIERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4KPiA+IE9uIE1vbiwgSnVsIDI3
LCAyMDIwIGF0IDk6MjggUE0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4gPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFtIDI3LjA3LjIwIHVtIDE2OjA1IHNjaHJpZWIg
S2F6bGF1c2thcywgTmljaG9sYXM6Cj4gPiA+ID4gT24gMjAyMC0wNy0yNyA5OjM5IGEubS4sIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4+IEFtIDI3LjA3LjIwIHVtIDA3OjQwIHNjaHJp
ZWIgTWF6aW4gUmV6azoKPiA+ID4gPj4+IFRoaXMgcGF0Y2ggZml4ZXMgYSByYWNlIGNvbmRpdGlv
biB0aGF0IGNhdXNlcyBhIHVzZS1hZnRlci1mcmVlIGR1cmluZwo+ID4gPiA+Pj4gYW1kZ3B1X2Rt
X2F0b21pY19jb21taXRfdGFpbC4gVGhpcyBjYW4gb2NjdXIgd2hlbiAyIG5vbi1ibG9ja2luZwo+
ID4gPiA+Pj4gY29tbWl0cwo+ID4gPiA+Pj4gYXJlIHJlcXVlc3RlZCBhbmQgdGhlIHNlY29uZCBv
bmUgZmluaXNoZXMgYmVmb3JlIHRoZSBmaXJzdC4KPiA+ID4gPj4+IEVzc2VudGlhbGx5LAo+ID4g
PiA+Pj4gdGhpcyBidWcgb2NjdXJzIHdoZW4gdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSBvZiBldmVu
dHMgaGFwcGVuczoKPiA+ID4gPj4+Cj4gPiA+ID4+PiAxLiBOb24tYmxvY2tpbmcgY29tbWl0ICMx
IGlzIHJlcXVlc3RlZCB3LyBhIG5ldyBkbV9zdGF0ZSAjMSBhbmQgaXMKPiA+ID4gPj4+IGRlZmVy
cmVkIHRvIHRoZSB3b3JrcXVldWUuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gMi4gTm9uLWJsb2NraW5n
IGNvbW1pdCAjMiBpcyByZXF1ZXN0ZWQgdy8gYSBuZXcgZG1fc3RhdGUgIzIgYW5kIGlzCj4gPiA+
ID4+PiBkZWZlcnJlZCB0byB0aGUgd29ya3F1ZXVlLgo+ID4gPiA+Pj4KPiA+ID4gPj4+IDMuIENv
bW1pdCAjMiBzdGFydHMgYmVmb3JlIGNvbW1pdCAjMSwgZG1fc3RhdGUgIzEgaXMgdXNlZCBpbiB0
aGUKPiA+ID4gPj4+IGNvbW1pdF90YWlsIGFuZCBjb21taXQgIzIgY29tcGxldGVzLCBmcmVlaW5n
IGRtX3N0YXRlICMxLgo+ID4gPiA+Pj4KPiA+ID4gPj4+IDQuIENvbW1pdCAjMSBzdGFydHMgYWZ0
ZXIgY29tbWl0ICMyIGNvbXBsZXRlcywgdXNlcyB0aGUgZnJlZWQgZG1fc3RhdGUKPiA+ID4gPj4+
IDEgYW5kIGRlcmVmZXJlbmNlcyBhIGZyZWVsaXN0IHBvaW50ZXIgd2hpbGUgc2V0dGluZyB0aGUg
Y29udGV4dC4KPiA+ID4gPj4KPiA+ID4gPj4gV2VsbCBJIG9ubHkgaGF2ZSBhIG9uZSBtaWxlIGhp
Z2ggdmlldyBvbiB0aGlzLCBidXQgd2h5IGRvbid0IHlvdSBsZXQKPiA+ID4gPj4gdGhlIHdvcmsg
aXRlbXMgZXhlY3V0ZSBpbiBvcmRlcj8KPiA+ID4gPj4KPiA+ID4gPj4gVGhhdCB3b3VsZCBiZSBi
ZXR0ZXIgYW55d2F5IGNhdXNlIHRoaXMgd2F5IHdlIGRvbid0IHRyaWdnZXIgYSBjYWNoZQo+ID4g
PiA+PiBsaW5lIHBpbmcgcG9uZyBiZXR3ZWVuIENQVXMuCj4gPiA+ID4+Cj4gPiA+ID4+IENocmlz
dGlhbi4KPiA+ID4gPgo+ID4gPiA+IFdlIHVzZSB0aGUgRFJNIGhlbHBlcnMgZm9yIG1hbmFnaW5n
IGRybV9hdG9taWNfY29tbWl0X3N0YXRlIGFuZCB0aG9zZQo+ID4gPiA+IGhlbHBlcnMgaW50ZXJu
YWxseSBwdXNoIG5vbi1ibG9ja2luZyBjb21taXQgd29yayBpbnRvIHRoZSBzeXN0ZW0KPiA+ID4g
PiB1bmJvdW5kIHdvcmsgcXVldWUuCj4gPiA+Cj4gPiA+IE1obSwgd2VsbCBpZiB5b3Ugc2VuZCB0
aG9zZSBoZWxwZXIgYXRvbWljIGNvbW1pdHMgaW4gdGhlIG9yZGVyIEEsQiBhbmQKPiA+ID4gdGhl
eSBleGVjdXRlIGl0IGluIHRoZSBvcmRlciBCLEEgSSB3b3VsZCBjYWxsIHRoYXQgYSBidWcgOikK
PiA+Cj4gPiBUaGUgd2F5IGl0IHdvcmtzIGlzIGl0IHB1c2hlcyBhbGwgY29tbWl0cyBpbnRvIHVu
Ym91bmQgd29yayBxdWV1ZSwgYnV0Cj4gPiB0aGVuIGZvcmNlcyBzZXJpYWxpemF0aW9uIGFzIG5l
ZWRlZC4gV2UgZG8gX25vdF8gd2FudCBlLmcuIHVwZGF0ZXMgb24KPiA+IGRpZmZlcmVudCBDUlRD
IHRvIGJlIHNlcmlhbGl6ZWQsIHRoYXQgd291bGQgcmVzdWx0IGluIGxvdHMgb2YganVkZGVyLgo+
ID4gQW5kIGh3IGlzIGZ1bm55IGVub3VnaCB0aGF0IHRoZXJlJ3MgYWxsIGtpbmRzIG9mIGRlcGVu
ZGVuY2llcy4KPiA+Cj4gPiBUaGUgd2F5IHlvdSBmb3JjZSBzeW5jaHJvbml6YXRpb24gaXMgYnkg
YWRkaW5nIG90aGVyIENSVEMgc3RhdGUKPiA+IG9iamVjdHMuIFNvIGlmIERDIGlzIGJ1c3RlZCBh
bmQgY2FuIG9ubHkgaGFuZGxlIGEgc2luZ2xlIHVwZGF0ZSBwZXIKPiA+IHdvcmsgaXRlbSwgdGhl
biBJIGd1ZXNzIHlvdSBhbHdheXMgbmVlZCBhbGwgQ1JUQyBzdGF0ZXMgYW5kIGV2ZXJ5dGhpbmcK
PiA+IHdpbGwgYmUgcnVuIGluIG9yZGVyLiBCdXQgdGhhdCBhbHNvIHRvdGFsbHkga2lsbHMgbW9k
ZXJuIG11bHRpLXNjcmVlbgo+ID4gY29tcG9zaXRvcnMuIFhvcmcgaXNuJ3QgbW9kZXJuLCBqdXN0
IGluIGNhc2UgdGhhdCdzIG5vdCBjbGVhciA6LSkKPiA+Cj4gPiBMdWNraW5nIGF0IHRoZSBjb2Rl
IGl0IHNlZW1zIGxpa2UgeW91IGluZGVlZCBoYXZlIG9ubHkgYSBzaW5nbGUgZG0KPiA+IHN0YXRl
LCBzbyB5ZWFoIGdsb2JhbCBzeW5jIGlzIHdoYXQgeW91J2xsIG5lZWQgYXMgaW1tZWRpYXRlIGZp
eCwgYW5kCj4gPiB0aGVuIG1heWJlIGZpeCB1cCBETSB0byBub3QgYmUgcXVpdGUgc28gc2lsbHkg
Li4uIG9yIGF0IGxlYXN0IG9ubHkgZG8KPiA+IHRoZSBkbSBzdGF0ZSBzdHVmZiB3aGVuIHJlYWxs
eSBuZWVkZWQuCj4gPgo+ID4gV2UgY291bGQgYWxzbyBzcHJpbmtsZSB0aGUgZHJtX2NydGNfY29t
bWl0IHN0cnVjdHVyZSBhcm91bmQgYSBiaXQKPiA+IChpdCdzIHRoZSBnbHVlIHRoYXQgcHJvdmlk
ZXMgdGhlIHN5bmNocm9uaXphdGlvbiBhY3Jvc3MgY29tbWl0cyksIGJ1dAo+ID4gc2luY2UgeW91
ciBkbSBzdGF0ZSBpcyBnbG9iYWwganVzdCBncmFiYmluZyBhbGwgY3J0YyBzdGF0ZXMKPiA+IHVu
Y29uZGl0aW9uYWxseSBhcyBwYXJ0IG9mIHRoYXQgaXMgcHJvYmFibHkgYmVzdC4KPiA+Cj4gPiA+
ID4gV2hpbGUgd2UgY291bGQgZHVwbGljYXRlIGEgY29weSBvZiB0aGF0IGNvZGUgd2l0aCBub3Ro
aW5nIGJ1dCB0aGUKPiA+ID4gPiB3b3JrcXVldWUgY2hhbmdlZCB0aGF0IGlzbid0IHNvbWV0aGlu
ZyBJJ2QgcmVhbGx5IGxpa2UgdG8gbWFpbnRhaW4KPiA+ID4gPiBnb2luZyBmb3J3YXJkLgo+ID4g
Pgo+ID4gPiBJJ20gbm90IHRhbGtpbmcgYWJvdXQgZHVwbGljYXRpbmcgdGhlIGNvZGUsIEknbSB0
YWxraW5nIGFib3V0IGZpeGluZyB0aGUKPiA+ID4gaGVscGVycy4gSSBkb24ndCBrbm93IHRoYXQg
Y29kZSB3ZWxsLCBidXQgZnJvbSB0aGUgb3V0c2lkZSBpdCBzb3VuZHMKPiA+ID4gbGlrZSBhIGJ1
ZyB0aGVyZS4KPiA+ID4KPiA+ID4gQW5kIGV4ZWN1dGluZyB3b3JrIGl0ZW1zIGluIHRoZSBvcmRl
ciB0aGV5IGFyZSBzdWJtaXR0ZWQgaXMgdHJpdmlhbC4KPiA+ID4KPiA+ID4gSGFkIGFueWJvZHkg
cGluZ2VkIERhbmllbCBvciBvdGhlciBwZW9wbGUgZmFtaWxpYXIgd2l0aCB0aGUgaGVscGVyIGNv
ZGUKPiA+ID4gYWJvdXQgaXQ/Cj4gPgo+ID4gWWVhaCBzb21ldGhpbmcgaXMgd3JvbmcgaGVyZSwg
YW5kIHRoZSBmaXggbG9va3MgaG9ycmlibGUgOi0pCj4gPgo+ID4gQXNpZGUsIEkndmUgYWxzbyBz
ZWVuIHNvbWUgcmVjZW50IGRpc2N1c3Npb24gZmxhcmUgdXAgYWJvdXQKPiA+IGRybV9hdG9taWNf
c3RhdGVfZ2V0L3B1dCB1c2VkIHRvIHBhcGVyIG92ZXIgc29tZSBvdGhlciB1c2UtYWZ0ZXItZnJl
ZSwKPiA+IGJ1dCB0aGlzIHRpbWUgcmVsYXRlZCB0byBpbnRlcnJ1cHQgaGFuZGxlcnMuIE1heWJl
IGEgZmV3IHJ1bGVzIGFib3V0Cj4gPiB0aGF0Ogo+ID4gLSBkb250Cj4gPiAtIGVzcGVjaWFsbHkg
bm90IHdoZW4gaXQncyBpbnRlcnJ1cHQgaGFuZGxlcnMsIGJlY2F1c2UgeW91IGNhbid0IGNhbGwK
PiA+IGRybV9hdG9taWNfc3RhdGVfcHV0IGZyb20gaW50ZXJydXB0IGhhbmRsZXJzLgo+ID4KPiA+
IEluc3RlYWQgaGF2ZSBhbiBzcGluX2xvY2tfaXJxIHRvIHByb3RlY3QgdGhlIHNoYXJlZCBkYXRl
IHdpdGggeW91cgo+ID4gaW50ZXJydXB0IGhhbmRsZXIsIGFuZCBfY29weV8gdGhlIGRhdGUgb3Zl
ci4gVGhpcyBpcyBlLmcuIHdoYXQKPiA+IGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQgZG9lcy4K
Pgo+IE5pY2hvbGFzIHdyb3RlIGEgcGF0Y2ggdGhhdCBhdHRlbXB0ZWQgdG8gcmVzb2x2ZSB0aGUg
aXNzdWUgYnkgYWRkaW5nIGV2ZXJ5Cj4gQ1JUQyBpbnRvIHRoZSBjb21taXQgdG8gdXNlIHVzZSB0
aGUgc3RhbGwgY2hlY2tzLiBbMV0gV2hpbGUgdGhpcyBmb3JjZXMKPiBzeW5jaHJvbmlzYXRpb24g
b24gY29tbWl0cywgaXQncyBraW5kIG9mIGEgaGFja3kgbWV0aG9kIHRoYXQgbWF5IHRha2UgYQo+
IHRvbGwgb24gcGVyZm9ybWFuY2UuCj4KPiBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIGEgRFJNIGhl
bHBlciB0aGF0IGZvcmNlcyBzeW5jaHJvbmlzYXRpb24gb24gc29tZQo+IGNvbW1pdHMgd2l0aG91
dCBoYXZpbmcgdG8gYWRkIGV2ZXJ5IENSVEMgaW50byB0aGUgY29tbWl0Pwo+Cj4gQWxzbywgaXMg
c3luY2hyb25pc2F0aW9uIHJlYWxseSBuZWNlc3NhcnkgZm9yIGZhc3QgdXBkYXRlcyBpbiBhbWRn
cHU/Cj4gSSdsbCBhZG1pdCwgdGhlIGlkZWEgb2YgZWxpbWluYXRpbmcgdGhlIHVzZS1hZnRlci1m
cmVlIGJ1ZyBieSBlbGltaW5hdGluZwo+IHRoZSB1c2UgZW50aXJlbHkgZG9lc24ndCBzZWVtIGlk
ZWFsOyBidXQgaXMgZm9yY2luZyBzeW5jaHJvbmlzYXRpb24gb24KPiB0aGVzZSB1cGRhdGVzIHRo
YXQgbXVjaCBiZXR0ZXI/CgpXZWxsIGNsZWFyaW5nIHRoZSBkY19zdGF0ZSBwb2ludGVyIGhlcmUg
YW5kIHRoZW4gYWxsb2NhdGluZyBhbm90aGVyCm9uZSBpbiBhdG9taWNfY29tbWl0X3RhaWwgYWxz
byBsb29rcyBmaXNoeS4gVGhlIHByb3BlciBmaXggaXMgcHJvYmFibHkKYSBsb3QgbW9yZSBpbnZv
bHZlZCwgYnV0IHllYWggaW50ZXJpbSBmaXggaXMgdG8gZ3JhYiBhbGwgY3J0YyBzdGF0ZXMKaWZm
IHlvdSBhbHNvIGdyYWJiZWQgdGhlIGRtX2F0b21pY19zdGF0ZSBzdHJ1Y3R1cmUuIFJlYWwgZml4
IGlzIHRvCm9ubHkgZG8gdGhpcyB3aGVuIG5lY2Vzc2FyeSwgd2hpY2ggcHJldHR5IG11Y2ggbWVh
bnMgdGhlIGRjX3N0YXRlCm5lZWRzIHRvIGJlIHNvbWVob3cgc3BsaXQgdXAsIG9yIHRoZXJlIG5l
ZWRzIHRvIGJlIHNvbWUgZ3VhcmFudGVlcwphYm91dCB3aGVuIGl0J3MgbmVjZXNzYXJ5IGFuZCB3
aGVuIG5vdC4gT3RoZXJ3aXNlIHBhcmFsbGVsIGNvbW1pdHMgb24KZGlmZmVyZW50IENSVEMgYXJl
IG5vdCBwb3NzaWJsZSB3aXRoIHRoZSBjdXJyZW50IGRjIGJhY2tlbmQgY29kZS4KClNlZSBhbHNv
IG15IGRtYS1mZW5jZSBhbm5vdGF0aW9uIGZpeHVwIHBhdGNoLCB0aGVyZSBkY19zdGF0ZSBhbHNv
IGdldHMKaW4gdGhlIHdheToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIw
MDcwNzIwMTIyOS40NzI4MzQtMjEtZGFuaWVsLnZldHRlckBmZndsbC5jaC8KCk5pY2hvbGFzLCBi
dHcgSSdtIHN0aWxsIHdhaXRpbmcgZm9yIHNvbWUgZGMgZmVlZGJhY2sgb24gdGhhdCBlbnRpcmUK
c2VyaWVzLCBhbmQgd2hhdC9pZiB0aGVyZSdzIHBsYW5zIHRvIGZpeCB0aGVzZSBpc3N1ZXMgcHJv
cGVybHkuCgpNYXliZSBldmVuIGdvaW5nIGJhY2sgdG8gdGhlIHN1YmNsYXNzZWQgZHJtX2F0b21p
Y19zdGF0ZSBtaWdodCBiZQpiZXR0ZXIgdGhhbiB3aGF0IHdlIGN1cnJlbnRseSBoYXZlLgotRGFu
aWVsCj4KPiBbMV0gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MDczODMjYzk2Cj4KPiBUaGFua3MsCj4gTWF6aW4gUmV6awo+Cj4gPgo+ID4gQ2hlZXJzLCBEYW5p
ZWwKPiA+Cj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IENocmlzdGlhbi4KPiA+ID4KPiA+ID4g
Pgo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gTmljaG9sYXMgS2F6bGF1c2thcwo+ID4gPiA+Cj4g
PiA+ID4+Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gU2luY2UgdGhpcyBidWcgaGFzIG9ubHkgYmVlbiBz
cG90dGVkIHdpdGggZmFzdCBjb21taXRzLCB0aGlzIHBhdGNoCj4gPiA+ID4+PiBmaXhlcwo+ID4g
PiA+Pj4gdGhlIGJ1ZyBieSBjbGVhcmluZyB0aGUgZG1fc3RhdGUgaW5zdGVhZCBvZiB1c2luZyB0
aGUgb2xkIGRjX3N0YXRlIGZvcgo+ID4gPiA+Pj4gZmFzdCB1cGRhdGVzLiBJbiBhZGRpdGlvbiwg
c2luY2UgZG1fc3RhdGUgaXMgb25seSB1c2VkIGZvciBpdHMgZGNfc3RhdGUKPiA+ID4gPj4+IGFu
ZCBhbWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsIHdpbGwgcmV0YWluIHRoZSBkY19zdGF0ZSBp
ZiBub25lIGlzCj4gPiA+ID4+PiBmb3VuZCwKPiA+ID4gPj4+IHJlbW92aW5nIHRoZSBkbV9zdGF0
ZSBzaG91bGQgbm90IGhhdmUgYW55IGNvbnNlcXVlbmNlcyBpbiBmYXN0IHVwZGF0ZXMuCj4gPiA+
ID4+Pgo+ID4gPiA+Pj4gVGhpcyB1c2UtYWZ0ZXItZnJlZSBidWcgaGFzIGV4aXN0ZWQgZm9yIGEg
d2hpbGUgbm93LCBidXQgb25seSBjYXVzZWQgYQo+ID4gPiA+Pj4gbm90aWNlYWJsZSBpc3N1ZSBz
dGFydGluZyBmcm9tIDUuNy1yYzEgZHVlIHRvIDMyMDJmYTYyZiAoInNsdWI6Cj4gPiA+ID4+PiBy
ZWxvY2F0ZQo+ID4gPiA+Pj4gZnJlZWxpc3QgcG9pbnRlciB0byBtaWRkbGUgb2Ygb2JqZWN0Iikg
bW92aW5nIHRoZSBmcmVlbGlzdCBwb2ludGVyIGZyb20KPiA+ID4gPj4+IGRtX3N0YXRlLT5iYXNl
ICh3aGljaCB3YXMgdW51c2VkKSB0byBkbV9zdGF0ZS0+Y29udGV4dCAod2hpY2ggaXMKPiA+ID4g
Pj4+IGRlcmVmZXJlbmNlZCkuCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gQnVnemlsbGE6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA3MzgzCj4gPiA+ID4+PiBGaXhl
czogYmQyMDBkMTkwZjQ1ICgiZHJtL2FtZC9kaXNwbGF5OiBEb24ndCByZXBsYWNlIHRoZSBkY19z
dGF0ZQo+ID4gPiA+Pj4gZm9yIGZhc3QgdXBkYXRlcyIpCj4gPiA+ID4+PiBSZXBvcnRlZC1ieTog
RHVuY2FuIDwxaTV0NS5kdW5jYW5AY294Lm5ldD4KPiA+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IE1h
emluIFJlemsgPG1ucnprQHByb3Rvbm1haWwuY29tPgo+ID4gPiA+Pj4gLS0tCj4gPiA+ID4+PiAg
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDM2Cj4gPiA+
ID4+PiArKysrKysrKysrKysrKy0tLS0tCj4gPiA+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+Pj4KPiA+ID4gPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4g
PiA+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPiA+ID4gPj4+IGluZGV4IDg2ZmZhMGMyODgwZi4uNzEwZWRjNzBlMzdlIDEwMDY0NAo+ID4g
PiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+ID4gPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwo+ID4gPiA+Pj4gQEAgLTg3MTcsMjAgKzg3MTcsMzggQEAgc3RhdGljIGlu
dCBhbWRncHVfZG1fYXRvbWljX2NoZWNrKHN0cnVjdAo+ID4gPiA+Pj4gZHJtX2RldmljZSAqZGV2
LAo+ID4gPiA+Pj4gICAgICAgICAgICAqIHRoZSBzYW1lIHJlc291cmNlLiBJZiB3ZSBoYXZlIGEg
bmV3IERDIGNvbnRleHQgYXMgcGFydCBvZgo+ID4gPiA+Pj4gICAgICAgICAgICAqIHRoZSBETSBh
dG9taWMgc3RhdGUgZnJvbSB2YWxpZGF0aW9uIHdlIG5lZWQgdG8gZnJlZSBpdCBhbmQKPiA+ID4g
Pj4+ICAgICAgICAgICAgKiByZXRhaW4gdGhlIGV4aXN0aW5nIG9uZSBpbnN0ZWFkLgo+ID4gPiA+
Pj4gKyAgICAgICAgICoKPiA+ID4gPj4+ICsgICAgICAgICAqIEZ1cnRoZXJtb3JlLCBzaW5jZSB0
aGUgRE0gYXRvbWljIHN0YXRlIG9ubHkgY29udGFpbnMgdGhlIERDCj4gPiA+ID4+PiArICAgICAg
ICAgKiBjb250ZXh0IGFuZCBjYW4gc2FmZWx5IGJlIGFubnVsbGVkLCB3ZSBjYW4gZnJlZSB0aGUg
c3RhdGUKPiA+ID4gPj4+ICsgICAgICAgICAqIGFuZCBjbGVhciB0aGUgYXNzb2NpYXRlZCBwcml2
YXRlIG9iamVjdCBub3cgdG8gZnJlZQo+ID4gPiA+Pj4gKyAgICAgICAgICogc29tZSBtZW1vcnkg
YW5kIGF2b2lkIGEgcG9zc2libGUgdXNlLWFmdGVyLWZyZWUgbGF0ZXIuCj4gPiA+ID4+PiAgICAg
ICAgICAgICovCj4gPiA+ID4+PiAtICAgICAgICBzdHJ1Y3QgZG1fYXRvbWljX3N0YXRlICpuZXdf
ZG1fc3RhdGUsICpvbGRfZG1fc3RhdGU7Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gLSAgICAgICAgbmV3
X2RtX3N0YXRlID0gZG1fYXRvbWljX2dldF9uZXdfc3RhdGUoc3RhdGUpOwo+ID4gPiA+Pj4gLSAg
ICAgICAgb2xkX2RtX3N0YXRlID0gZG1fYXRvbWljX2dldF9vbGRfc3RhdGUoc3RhdGUpOwo+ID4g
PiA+Pj4gKyAgICAgICAgZm9yIChpID0gMDsgaSA8IHN0YXRlLT5udW1fcHJpdmF0ZV9vYmpzOyBp
KyspIHsKPiA+ID4gPj4+ICsgICAgICAgICAgICBzdHJ1Y3QgZHJtX3ByaXZhdGVfb2JqICpvYmog
PSBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2ldLnB0cjsKPiA+ID4gPj4+Cj4gPiA+ID4+PiAtICAgICAg
ICBpZiAobmV3X2RtX3N0YXRlICYmIG9sZF9kbV9zdGF0ZSkgewo+ID4gPiA+Pj4gLSAgICAgICAg
ICAgIGlmIChuZXdfZG1fc3RhdGUtPmNvbnRleHQpCj4gPiA+ID4+PiAtICAgICAgICAgICAgICAg
IGRjX3JlbGVhc2Vfc3RhdGUobmV3X2RtX3N0YXRlLT5jb250ZXh0KTsKPiA+ID4gPj4+ICsgICAg
ICAgICAgICBpZiAob2JqLT5mdW5jcyA9PSBhZGV2LT5kbS5hdG9taWNfb2JqLmZ1bmNzKSB7Cj4g
PiA+ID4+PiArICAgICAgICAgICAgICAgIGludCBqID0gc3RhdGUtPm51bV9wcml2YXRlX29ianMt
MTsKPiA+ID4gPj4+Cj4gPiA+ID4+PiAtICAgICAgICAgICAgbmV3X2RtX3N0YXRlLT5jb250ZXh0
ID0gb2xkX2RtX3N0YXRlLT5jb250ZXh0Owo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICBkbV9h
dG9taWNfZGVzdHJveV9zdGF0ZShvYmosCj4gPiA+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdGUtPnByaXZhdGVfb2Jqc1tpXS5zdGF0ZSk7Cj4gPiA+ID4+PiArCj4gPiA+ID4+PiAr
ICAgICAgICAgICAgICAgIC8qIElmIGkgaXMgbm90IGF0IHRoZSBlbmQgb2YgdGhlIGFycmF5IHRo
ZW4gdGhlCj4gPiA+ID4+PiArICAgICAgICAgICAgICAgICAqIGxhc3QgZWxlbWVudCBuZWVkcyB0
byBiZSBtb3ZlZCB0byB3aGVyZSBpIHdhcwo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgKiBi
ZWZvcmUgdGhlIGFycmF5IGNhbiBzYWZlbHkgYmUgdHJ1bmNhdGVkLgo+ID4gPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgKi8KPiA+ID4gPj4+ICsgICAgICAgICAgICAgICAgaWYgKGkgIT0gaikKPiA+
ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgIHN0YXRlLT5wcml2YXRlX29ianNbaV0gPQo+ID4g
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRlLT5wcml2YXRlX29ianNbal07Cj4g
PiA+ID4+Pgo+ID4gPiA+Pj4gLSAgICAgICAgICAgIGlmIChvbGRfZG1fc3RhdGUtPmNvbnRleHQp
Cj4gPiA+ID4+PiAtICAgICAgICAgICAgICAgIGRjX3JldGFpbl9zdGF0ZShvbGRfZG1fc3RhdGUt
PmNvbnRleHQpOwo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICBzdGF0ZS0+cHJpdmF0ZV9vYmpz
W2pdLnB0ciA9IE5VTEw7Cj4gPiA+ID4+PiArICAgICAgICAgICAgICAgIHN0YXRlLT5wcml2YXRl
X29ianNbal0uc3RhdGUgPSBOVUxMOwo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICBzdGF0ZS0+
cHJpdmF0ZV9vYmpzW2pdLm9sZF9zdGF0ZSA9IE5VTEw7Cj4gPiA+ID4+PiArICAgICAgICAgICAg
ICAgIHN0YXRlLT5wcml2YXRlX29ianNbal0ubmV3X3N0YXRlID0gTlVMTDsKPiA+ID4gPj4+ICsK
PiA+ID4gPj4+ICsgICAgICAgICAgICAgICAgc3RhdGUtPm51bV9wcml2YXRlX29ianMgPSBqOwo+
ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPj4+ICsgICAgICAgICAgICB9
Cj4gPiA+ID4+PiAgICAgICAgICAgfQo+ID4gPiA+Pj4gICAgICAgfQo+ID4gPiA+Pj4KPiA+ID4g
Pj4+IC0tCj4gPiA+ID4+PiAyLjI3LjAKPiA+ID4gPj4+Cj4gPiA+ID4+Cj4gPiA+ID4KPiA+ID4K
PiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gRGFuaWVsIFZldHRlcgo+ID4gU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gPiBodHRwOi8vYmxvZy5mZndsbC5j
aAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cg==
