Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224320FAF
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 22:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803A89208;
	Thu, 16 May 2019 20:40:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038389208
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 20:40:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id y3so4916853wmm.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv6E+Y2zdzwfbL+kilwGZbD4tBE7UDiD/NSonOiHdGA=;
 b=h5Eb+a9MVF1pbPynHMCWnjQJxNRLrN3xo0mWmIUUqhsIUoL8dXo+kA65fVPqyuCrui
 Tfzzxs2B0QCxDYTdevBuqCjMUtocPxy4BpwYSkNlUZEcJ3iyN1OZ+Xj3R4+JHc7l0KLV
 rne0pxjaHUnzOQ+PXjrrodanMJED/N5/7gjNaW2nzTph64drVZv+pf+kf9n2XnDvPG9C
 7WRNDbT/AakxcfDlwmZ3FPreq7bvZyVGUd8eCrdx0G1rrkHSpdDeizzDoFEcFaKpOMT7
 TgVGIy6Dccl5aGYfOmw3/PhlpZkNrTtwpJ9y9ZS/j+qJCPk5qcI5US99Nr/DTNOCuvTv
 owYw==
X-Gm-Message-State: APjAAAXswnc72eNhbkqBpzKb1T5Iu6eW/ze3m/F+5je/7pxEgZC7QUyr
 RYJNTec+XcY1n5vDzi/eep4FCPaCSG/3cUjYkhU=
X-Google-Smtp-Source: APXvYqyxfOnM12p2bdnF3ekiBTiDBCvQakQxPBigYZMByjOcBjEmKkyD5dnDc6PRuPRWz0UXJ5mGIS8DO9HlAiEfeIc=
X-Received: by 2002:a1c:6c1a:: with SMTP id h26mr27547315wmc.89.1558039199222; 
 Thu, 16 May 2019 13:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-EccO1ue5hTtJ8m4utQp+8dSsWm60JFA5YOT1gCODnYcFUog@mail.gmail.com>
 <CADnq5_N=-cWz99T4ma_=6-_bu-Ty2twsFt=KGtzTdWn1hcDSrA@mail.gmail.com>
 <CAJ-EccOH2dXPD+XeHQcqZYD+xa2eB6SVp6oFk4AD0vy=H+9+0w@mail.gmail.com>
In-Reply-To: <CAJ-EccOH2dXPD+XeHQcqZYD+xa2eB6SVp6oFk4AD0vy=H+9+0w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2019 16:39:47 -0400
Message-ID: <CADnq5_OTk4nE4G6FHmSRmvNLNO4hJbVC9cuxAiGEZk1_b2C=9w@mail.gmail.com>
Subject: Re: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: Micah Morton <mortonm@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sv6E+Y2zdzwfbL+kilwGZbD4tBE7UDiD/NSonOiHdGA=;
 b=fMqXvuxmx0Tsfv8pWepFUoMdhu6+5of0SJAdu4D0+isbYhxU9NJ7BEK2TEhFrYxmod
 c81fr5cGpduLhzOM/oBl2AWcslcZsneGFuNaZCNVCQ3pzGdhxQUOWY2jmFBaQB874anq
 /9T0HtrFFpinKXcsGPVnquTM8nNFtR14LfKx153IWUO0ehSoVJ/Wqlnmksj3h49rmGKk
 Vb3m/fSdawuwGrDhuYZlhW5o/9HRlny07EMFikROfUClgAT883EunGJAPezQOEZ+1eXU
 nFVFj8TJ6aEJPaXsSS9yNV/sRsM58Dec415sBRfN9alNqPILNt8FSORVG8rpFMdcRb9s
 1D9g==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgNDowNyBQTSBNaWNhaCBNb3J0b24gPG1vcnRvbm1AY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDc6MTkgUE0gQWxl
eCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
TWF5IDE1LCAyMDE5IGF0IDI6MjYgUE0gTWljYWggTW9ydG9uIDxtb3J0b25tQGNocm9taXVtLm9y
Zz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIGZvbGtzLAo+ID4gPgo+ID4gPiBJJ20gaW50ZXJlc3Rl
ZCBpbiBydW5uaW5nIGEgVk0gb24gYSBzeXN0ZW0gd2l0aCBhbiBpbnRlZ3JhdGVkIFN0b25leQo+
ID4gPiBbUmFkZW9uIFIyL1IzL1I0L1I1IEdyYXBoaWNzXSBjYXJkIGFuZCBwYXNzaW5nIHRocm91
Z2ggdGhlIGdyYXBoaWNzCj4gPiA+IGNhcmQgdG8gdGhlIFZNIHVzaW5nIHRoZSBJT01NVS4gSSdt
IHdvbmRlcmluZyB3aGV0aGVyIHRoaXMgaXMgZmVhc2libGUKPiA+ID4gYW5kIHN1cHBvc2VkIHRv
IGJlIGRvYWJsZSB3aXRoIHRoZSByaWdodCBzZXR1cCAoYXMgb3Bwb3NlZCB0byBwYXNzaW5nCj4g
PiA+IGEgZGlzY3JldGUgR1BVIHRvIHRoZSBWTSwgd2hpY2ggSSB0aGluayBpcyBkZWZpbml0ZWx5
IGRvYWJsZT8pLgo+ID4gPgo+ID4gPiBTbyBmYXIsIEkgY2FuIGRvIGFsbCB0aGUgcWVtdS9rdm0v
dmZpby9pb21tdSBzdHVmZiB0byBydW4gdGhlIFZNIGFuZAo+ID4gPiBwYXNzIHRoZSBpbnRlZ3Jh
dGVkIEdQVSB0byBpdCwgYnV0IHRoZSBkcm0gZHJpdmVyIGluIHRoZSBWTSBmYWlscwo+ID4gPiBk
dXJpbmcgYW1kZ3B1X2RldmljZV9pbml0KCkuIFNwZWNpZmljYWxseSwgdGhlIGxvZ3Mgc2hvdyB0
aGUgU01VIGJlaW5nCj4gPiA+IHVucmVzcG9uc2l2ZSwgd2hpY2ggbGVhZHMgdG8gYSAnU01VIGZp
cm13YXJlIGxvYWQgZmFpbGVkJyBlcnJvcgo+ID4gPiBtZXNzYWdlIGFuZCBrZXJuZWwgcGFuaWMu
IEkgY2FuIHNoYXJlIFZNIGxvZ3MgYW5kIHRoZSBpbnZvY2F0aW9uIG9mCj4gPiA+IHFlbXUgYW5k
IHN1Y2ggaWYgaGVscGZ1bCwgYnV0IGZpcnN0IHdhbnRlZCB0byBrbm93IGF0IGEgaGlnaCBsZXZl
bCBpZgo+ID4gPiB0aGlzIHNob3VsZCBiZSBmZWFzaWJsZT8KPiA+ID4KPiA+ID4gUC5TLjogSSdt
IG5vdCBpbml0aWFsaXppbmcgdGhlIEdQVSBpbiB0aGUgaG9zdCBiaW9zIG9yIGhvc3Qga2VybmVs
IGF0Cj4gPiA+IGFsbCwgc28gSSBzaG91bGQgYmUgcGFzc2luZyBhIGZyZXNoIEdQVSB0byB0aGUg
Vk0uIEFsc28sIEknbSBwcmV0dHkKPiA+ID4gc3VyZSBJJ20gcnVubmluZyB0aGUgY29ycmVjdCBW
R0EgYmlvcyBmb3IgdGhpcyBHUFUgaW4gdGhlIGd1ZXN0IFZNCj4gPiA+IGJpb3MgYmVmb3JlIGd1
ZXN0IGJvb3QuCj4gPiA+Cj4gPiA+IEFueSBjb21tZW50cy9zdWdnZXN0aW9ucyB3b3VsZCBiZSBh
cHByZWNpYXRlZCEKPiA+Cj4gPiBJdCBzaG91bGQgd29yayBpbiBhdCBsZWFzdCBvbmNlIGFzIGxv
bmcgYXMgeW91ciB2bSBpcyBwcm9wZXJseSBzZXQgdXAuCj4KPiBJcyB0aGVyZSBhbnkgcmVhc29u
IHJ1bm5pbmcgY29yZWJvb3QgdnMgVUVGSSBhdCBob3N0IGJvb3Qgd291bGQgbWFrZSBhCj4gZGlm
ZmVyZW5jZT8gSSB3YXMgcnVubmluZyBhIG1vZGlmaWVkIHZlcnNpb24gb2YgY29yZWJvb3QgdGhh
dCBhdm9pZHMKPiBkb2luZyBhbnkgR1BVIGluaXRpYWxpemF0aW9uIGluIGZpcm13YXJlIC0tIHNv
IHRoZSBmaXJzdCBQT1NUIGhhcHBlbnMKPiBpbnNpZGUgdGhlIGd1ZXN0LgoKVGhlIEdQVSBvbiBB
UFVzIHNoYXJlcyBhIGJ1bmNoIG9mIHJlc291cmNlcyB3aXRoIHRoZSBDUFUuICBUaGVyZSBhcmUg
YQpidW5jaCBvZiBibG9ja3Mgd2hpY2ggYXJlIHNoYXJlZCBhbmQgbmVlZCB0byBiZSBpbml0aWFs
aXplZCBvbiBib3RoCmZvciBldmVyeXRoaW5nIHRvIHdvcmsgcHJvcGVybHkuCgo+Cj4gPiBOb3Rl
IHRoYXQgdGhlIGRyaXZlciBuZWVkcyBhY2Nlc3MgdG8gdGhlIHZiaW9zIGltYWdlIGluIHRoZSBn
dWVzdCB0bwo+ID4gZ2V0IGRldmljZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIGRldGFpbHMgKGNs
b2NrcywgZGlzcGxheSBjb25uZWN0b3IKPiA+IGNvbmZpZ3VyYXRpb24sIGV0Yy4pLgo+Cj4gSXMg
dGhlcmUgYW55dGhpbmcgSSBuZWVkIHRvIGRvIHRvIGVuc3VyZSB0aGlzIGJlc2lkZXMgcGFzc2lu
ZyAnLWRldmljZQo+IHZmaW8tcGNpLC4uLixyb21maWxlPS9wYXRoL3RvL3ZnYXJvbScgdG8gcWVt
dT8KCllvdSBuZWVkIHRoZSBhY3R1YWwgdmJpb3Mgcm9tIGltYWdlIGZyb20geW91ciBzeXN0ZW0u
ICBUaGUgaW1hZ2UgaXMKYm9hcmQgc3BlY2lmaWMuCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
