Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6045C3F
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 14:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4734E89612;
	Fri, 14 Jun 2019 12:11:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5AF895F5;
 Fri, 14 Jun 2019 12:11:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c6so2104096wml.0;
 Fri, 14 Jun 2019 05:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MAhv9nudW2m8PDxSaq1u+DjYjgWH05syh9sufVHXCgs=;
 b=EkMunlQ6pOQxgl+K/hho8zorZppjuaAFrN4BNIah7W1YyMm7Q0FfqiWv4es6ugyUIF
 iJIIfroqtergi9gI6n+LRNbl0axfbEpeFzaqhfSFU5pr6YDKaUS+3yI7nhtZeX993w50
 dH69zzp9rOwmMkVNntNUDK4PCDI2m25ErFelipiqqwnFXW6Z9Gf9qaJmfJMMnEyfL1q/
 7GcVvQ6+qSZCIlGr/7XI/JZMpfczNlClZldUZgpZFcUI0ZRwiMDHlsloE2WDvjlHHO0g
 Bw432h0KP4QfolsfJ2kI6LwpeFpqLomIZsiasfmCx4gZg5hweHVLdlW6jR8rsVMLp52i
 qt1Q==
X-Gm-Message-State: APjAAAUSLNAe0sXri1yxpPNlwzHnQg/DnaTKjHlILU3bjhAJ29TtyZMz
 GfC8dFQkfWqxFXq8quZNP2uJmLyB
X-Google-Smtp-Source: APXvYqy2WYRt2T7eQCBT2Gz667qLc8vRgFstGn5LFNWtp+LcKcLGasuyKh/AiST7G1btpx7q7aYkbQ==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr7241958wml.37.1560514284990; 
 Fri, 14 Jun 2019 05:11:24 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id j189sm4709407wmb.48.2019.06.14.05.11.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 05:11:23 -0700 (PDT)
Date: Fri, 14 Jun 2019 13:09:27 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190614120927.GA32412@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527081741.14235-1-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=MAhv9nudW2m8PDxSaq1u+DjYjgWH05syh9sufVHXCgs=;
 b=uKlBQSDmMyh8ZYAtpU/nIZjJdL73WnClHcBE8jiBjPVatvL0D8cQPMaECaG42OTh4c
 gnZ+2Bs/F0Pskhlurf4BoF2e7jprOXGTdD/iHO8AyD6jWmvMKpGj6FnbpZvYr78IpjdZ
 8xrNmKkw+HgJUyVAcUleIBvoHmxapoUXNhITgOtkDtXCsvu7g9r4zBgVXcLXnmlAiVv5
 I6Q119iaWtC1am3cXGRL3Kzzul4M44Ebrl0a0x+NKk71OlsRYBmlu0UK6jlAebQ8Ty05
 jFRiDBe9RYcnGozuE0BNYdjazF7z1Jq56mpxFBwg2nofgS6GInafKAuYM5vRVzlglUPG
 8QcA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gQ3VycmVudGx5IG9uZSBjYW4gY2lyY3Vt
dmVudCBEUk1fQVVUSCwgd2hlbiB0aGUgaW9jdGwgaXMgZXhwb3NlZCB2aWEgdGhlCj4gcmVuZGVy
IG5vZGUuIEEgc2VlbWluZ2x5IGRlbGliZXJhdGUgZGVzaWduIGRlY2lzaW9uLgo+IAo+IEhlbmNl
IHdlIGNhbiBkcm9wIHRoZSBEUk1fQVVUSCBhbGwgdG9nZXRoZXIgKGRldGFpbHMgaW4gZm9sbG93
LXVwIHBhdGNoKQo+IHlldCBub3QgYWxsIHVzZXJzcGFjZSBjaGVja3MgaWYgaXQncyBhdXRoZW50
aWNhdGVkLCBidXQgaW5zdGVhZCB1c2VzCj4gdW5jb21tb24gYXNzdW1wdGlvbnMuCj4gCj4gQWZ0
ZXIgZGF5cyBvZiBkaWdnaW5nIHRocm91Z2ggZ2l0IGxvZyBhbmQgdGVzdGluZywgb25seSBhIHNp
bmdsZSAoYWIpdXNlCj4gd2FzIHNwb3R0ZWQgLSB0aGUgTWVzYSBSQURWIGRyaXZlciwgdXNpbmcg
dGhlIEFNREdQVV9JTkZPIGlvY3RsIGFuZAo+IGFzc3VtaW5nIHRoYXQgZmFpbHVyZSBpbXBsaWVz
IGxhY2sgb2YgYXV0aGVudGljYXRpb24uCj4gCj4gQWZmZWN0ZWQgdmVyc2lvbnMgYXJlOgo+ICAt
IHRoZSB3aG9sZSAxOC4yLnggc2VyaWVzLCB3aGljaCBpcyBFT0wKPiAgLSB0aGUgd2hvbGUgMTgu
My54IHNlcmllcywgd2hpY2ggaXMgRU9MCj4gIC0gdGhlIDE5LjAueCBzZXJpZXMsIHByaW9yIHRv
IDE5LjAuNAo+IAo+IEFkZCBhIHNwZWNpYWwgcXVpcmsgZm9yIHRoYXQgY2FzZSwgdGh1cyB3ZSBj
YW4gZHJvcCBEUk1fQVVUSCBiaXRzIGFzCj4gbWVudGlvbmVkIGVhcmxpZXIuCj4gCj4gU2luY2Ug
YWxsIHRoZSBhZmZlY3RlZCB1c2Vyc3BhY2UgaXMgRU9MLCB3ZSBhbHNvIGFkZCBhIGtjb25maWcg
b3B0aW9uCj4gdG8gZGlzYWJsZSB0aGlzIHF1aXJrLgo+IAo+IFRoZSB3aG9sZSBhcHByb2FjaCBp
cyBpbnNwaXJlZCBieSBEUklWRVJfS01TX0xFR0FDWV9DT05URVhUCj4gCj4gQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9LY29uZmlnICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyB8IDEyICsrKysrKysrKysrLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2lvY3RsLmMgICAgICAgICAgICAgfCAgNSArKysrKwo+ICBpbmNsdWRlL2RybS9k
cm1faW9jdGwuaCAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+ICA0IGZp
bGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKCkhpIENocmlz
dGlhbiwKCgpJbiB0aGUgZm9sbG93aW5nLCBJIHdvdWxkIGxpa2UgdG8gc3VtbWFyaXNlIGFuZCBl
bXBoYXNpemUgdGhlIG5lZWQgZm9yCkRSTV9BVVRIIHJlbW92YWwuIEkgd291bGQga2luZGx5IGFz
ayB5b3UgdG8gc3BlbmQgYSBjb3VwbGUgb2YgbWludXRlcwpleHRyYSByZWFkaW5nIGl0LgoKClRv
ZGF5IERSTSBkcml2ZXJzKiBkbyBub3QgbWFrZSBhbnkgZGlzdGluY3Rpb24gYmV0d2VlbiBwcmlt
YXJ5IGFuZApyZW5kZXIgbm9kZSBjbGllbnRzLiBUaHVzIGZvciBhIHJlbmRlciBjYXBhYmxlIGRy
aXZlciwgYW55IHByZW1pc2Ugb2YKc2VwYXJhdGlvbiwgc2VjdXJpdHkgb3Igb3RoZXJ3aXNlIGlt
cG9zZWQgdmlhIERSTV9BVVRIIGlzIGEgZmFsbGFjeS4KCkNvbnNpZGVyaW5nIHRoZSBleGFtcGxl
cyBvZiBmbGFreSBvciBvdXRyaWdodCBtaXNzaW5nIGRybUF1dGggaW4gcHJpbWUKb3Blbi1zb3Vy
Y2UgcHJvamVjdHMgKG1lc2EsIGttc2N1YmUsIGxpYnZhKSB3ZSBjYW4gcmVhc29uYWJseSBhc3N1
bWUKb3RoZXIgcHJvamVjdHMgZXhiaWJpdCB0aGUgc2FtZSBwcm9ibGVtLgoKRm9yIHRoZXNlIGFu
ZC9vciBvdGhlciByZWFzb25zLCB0d28gRFJNIGRyaXZlcnMgaGF2ZSBkcm9wcGVkIERSTV9BVVRI
CnNpbmNlIGRheSBvbmUuCgpTaW5jZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbiBwcm92aWRpbmcgY29u
c2lzdGVudCBhbmQgcHJlZGljdGFibGUKYmVoYXZpb3VyIHRvIHVzZXItc3BhY2UsIGRyb3BwaW5n
IERSTV9BVVRIIHNlZW1zIHRvIGJlIHRoZSBtb3N0CmVmZmVjdGl2ZSB3YXkgZm9yd2FyZC4KCk9m
IGNvdXJzZSwgSSdkIGJlIG1vcmUgdGhhbiBoYXBweSB0byBoZWFyIGZvciBhbnkgb3RoZXIgd2F5
IHRvIGFjaGlldmUKdGhlIGdvYWwgb3V0bGluZWQuCgpCYXNlZCBvbiB0aGUgc2VyaWVzLCBvdGhl
ciBtYWludGFpbmVycyBhZ3JlZSB3aXRoIHRoZSBpZGVhL2dvYWwgaGVyZS4KQW1kZ3B1IG5vdCBm
b2xsb3dpbmcgdGhlIHNhbWUgcGF0dGVybiB3b3VsZCBjb21wcm9taXNlIHByZWRpY3RhYmlsaXR5
CmFjcm9zcyBkcml2ZXJzIGFuZCBjb21wbGljYXRlIHVzZXJzcGFjZSwgc28gSSB3b3VsZCBraW5k
bHkgYXNrIHlvdSB0bwpyZWNvbnNpZGVyLgoKQWx0ZXJuYXRpdmVseSwgSSBzZWUgdHdvIHdheXMg
dG8gc3BlY2lhbCBjYXNlOgogLSBOZXcgZmxhZyBhbm5vdGF0aW5nIGFtZGdwdS9yYWRlb24gLSBh
a2luIHRvIHRoZSBvbmUgcHJvcG9zZWQgZWFybGllcgogLSBDaGVjayBmb3IgYW1kZ3B1L3JhZGVv
biBpbiBjb3JlIERSTQoKCgpOb3cgb24geW91ciBwYWluIHBvaW50IC0gbm90IGFsbG93aW5nIHJl
bmRlciBpb2N0cyB2aWEgdGhlIHByaW1hcnkgbm9kZSwKYW5kIGhvdyB0aGlzIHBhdGNoIGNvdWxk
IG1ha2UgaXQgaGFyZGVyIHRvIGFjaGlldmUgdGhhdCBnb2FsLgoKV2hpbGUgSSBsb3ZlIHRoZSBp
ZGVhLCB0aGVyZSBhcmUgbnVtYmVyIG9mIG9ic3RhY2xlcyB0aGF0IHByZXZlbnQgdXMKZnJvbSBk
b2luZyBzbyBhdCB0aGlzIHRpbWU6CiAtIEVuc3VyaW5nIGJvdGggb2xkIGFuZCBuZXcgdXNlcnNw
YWNlIGRvZXMgbm90IHJlZ3Jlc3MKIC0gRHJpdmVycyAoUVhMLCBvdGhlcnM/KSBkbyBub3QgZXhw
b3NlIGEgcmVuZGVyIG5vZGUKIC0gV2Ugd2FudCB0byBhdm9pZCBkcml2ZXIgc3BlY2lmaWMgYmVo
YXZpb3VyCgpUaGUgb25seSB3YXkgZm9yd2FyZCB0aGF0IEkgY2FuIHNlZSBpczoKIC0gQWRkcmVz
cyBRWEwvb3RoZXJzIHRvIGV4cG9zZSByZW5kZXIgbm9kZXMKIC0gQWRkIGEgS2NvbmZpZyB0b2dn
bGUgdG8gZGlzYWJsZSAhS01TIGlvY3RscyB2aWEgdGhlIHByaW1hcnkgbm9kZQogLSBKdW1wLXN0
YXJ0IF5eIHdpdGggZGlzdHJpYnV0aW9uIFgKIC0gRml4IHVzZXItc3BhY2UgZmFsbG91dHMKIC0g
WCBtb250aHMgZG93biB0aGUgbGluZSwgZmxpcCB0aGUgS2NvbmZpZwogLSBJbiBjYXNlIG9mIHJl
Z3Jlc3Npb25zIC0gcmV2ZXJ0IHRoZSBLQ29uZmlnLCBnb3RvIEZpeCB1c2VyLXNwYWNlLi4uCgoK
VGhhdCBzYWlkLCB0aGUgcHJvcG9zYWwgd2lsbCBub3QgY29uZmxpY3Qgd2l0aCB0aGUgRFJNX0FV
VEggcmVtb3ZhbC4gSWYKYW55dGhpbmcgaXQgaXMgc3RlcCAwLjUgb2YgdGhlIGdyYW5kIG1hc3Rl
ciBwbGFuLgoKClRsO0RyOiBSZW1vdmluZyBEUk1fQVVUSCBpcyBvcnRob2dvbmFsIHRvIG5vdCBh
bGxvd2luZyByZW5kZXIgaW9jdHMgdmlhCnRoZSBwcmltYXJ5IG5vZGUuIEhlcmUncyBhbiBpZGVh
IGhvdyB0byBhY2hpZXZlIHRoZSBsYXR0ZXIuCgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
