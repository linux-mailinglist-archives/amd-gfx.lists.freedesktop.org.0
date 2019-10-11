Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1335D4978
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 22:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6176EC99;
	Fri, 11 Oct 2019 20:51:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2FA6EC98
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 20:51:21 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-OG_3xN6MMMa3k_74ctordQ-1; Fri, 11 Oct 2019 16:51:18 -0400
Received: by mail-qk1-f198.google.com with SMTP id w7so10154139qkf.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+zuu7eYogEulpZPtegnHbQEtBXGwniTgDcVuXagVfdg=;
 b=Xq6du1hZs1CJzABWd6dCSrcrQnofd4Cuq67/bieZXsL4gJOoxbcbJXUb3UDmkd7dt1
 u9XRSMqYNPeBgfPb4ZiaXRi/jUw48pcua0AU2E0oOr1FlPSglrmYb0XiIlNkOvKooqES
 N/Iv6m8/uWSCiUeSXkDb127KbPp0N1U8MLiqjzHDNRDd2dp4zyhqoeIyjSVKwyabwFLj
 16yAXDeW4O8i+DkON147G1EprRs2yyHNJk5vmTH7GZPR8HXwTlVsaYqfXyL1k2hsxqaS
 y988iOZW/yq5CfSBMjU+t4gpWxnB5Tvj4Wqwl3ej7rO06l9yBmgao9fXRg2pop7robJf
 7EDQ==
X-Gm-Message-State: APjAAAXsfkQl2xInNO1SjXA0IK2HuMUrp9F/U2iydVo3tNTO2bibMrEj
 ACS038vKQKKr51E9rPzDy1uqbcgDUIamhxTz4L9BlFi5m0P+aNBCHvcVR446358MUAkkuAa+DwA
 rdY3D+1qWg4Pr1qWpCKS2Jd5GiA==
X-Received: by 2002:a37:e402:: with SMTP id y2mr18042914qkf.327.1570827077506; 
 Fri, 11 Oct 2019 13:51:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMuFWtg72ENPlm8d+3ToMm4o8BcOZE4MnLrCafgNV5fwjnZME1flLvapsRIKa2DLsEeUPY2w==
X-Received: by 2002:a37:e402:: with SMTP id y2mr18042892qkf.327.1570827077207; 
 Fri, 11 Oct 2019 13:51:17 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id e5sm5888785qtk.35.2019.10.11.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 13:51:16 -0700 (PDT)
Message-ID: <2d813b2fdf39756ebee087d97f9ee4b2965f4193.camel@redhat.com>
Subject: Re: [PATCH 5/6] drm/amdgpu/dm/mst: Report possible_crtcs
 incorrectly, for now
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Date: Fri, 11 Oct 2019 16:51:13 -0400
In-Reply-To: <20191009150155.GD16989@phenom.ffwll.local>
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-6-lyude@redhat.com>
 <20190927152741.GU218215@art_vandelay>
 <20191009150155.GD16989@phenom.ffwll.local>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: OG_3xN6MMMa3k_74ctordQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1570827080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuK6DATQ4V//HJO+1AZKISVwFlXejco5yABCuAYRLxo=;
 b=evLzAq6MlD8Yj/IRLMpyTmP9lWqLDaF0DLU9DAEDE3ZzKk4lfWUAcAzaNkryW1lPmieSL6
 G7qx511v+MPgdIU1eMpM0Eo0EpeUBb8bbT8HmExvyApV+o3wldx9R+F6UB4gltWbUf9p4+
 0PLgeLZxg4mFwPyz1vD3ZlpzU4+PqQI=
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
 Mario Kleiner <mario.kleiner.de@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YSBsaXR0bGUgbGF0ZSBidXQ6IGk5MTUgZG9lcyBoYXZlIHRoaXMgaGFjayAob3IgcmF0aGVyLXBv
c3NpYmxlX2NydGNzIHdpdGggTVNUCmluIGk5MTUgaGFzIGJlZW4gYnJva2VuIGZvciBhIHdoaWxl
IGFuZCBnb3QgZml4ZWQsIGJ1dCBoYWQgdG8gZ2V0IHJldmVydGVkCmJlY2F1c2Ugb2YgdGhpcyBp
c3N1ZSksIGl0J3Mgd2hlcmUgdGhpcyBvcmlnaW5hbGx5IGNhbWUgZnJvbS4KCk9uIFdlZCwgMjAx
OS0xMC0wOSBhdCAxNzowMSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIFNl
cCAyNywgMjAxOSBhdCAxMToyNzo0MUFNIC0wNDAwLCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiBPbiBU
aHUsIFNlcCAyNiwgMjAxOSBhdCAwNjo1MTowN1BNIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+
ID4gPiBUaGlzIGNvbW1pdCBpcyBzZXBlcmF0ZSBmcm9tIHRoZSBwcmV2aW91cyBvbmUgdG8gbWFr
ZSBpdCBlYXNpZXIgdG8KPiA+ID4gcmV2ZXJ0IGluIHRoZSBmdXR1cmUuIEJhc2ljYWxseSwgdGhl
cmUncyBtdWx0aXBsZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zCj4gPiA+IHRoYXQgaW50ZXJwcmV0
IHBvc3NpYmxlX2NydGNzIHZlcnkgd3Jvbmc6Cj4gPiA+IAo+ID4gPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzI3Nwo+ID4gPiBodHRw
czovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyL2lzc3Vlcy83NTkKPiA+ID4gCj4gPiA+
IFdoaWxlIHdvcmsgaXMgb25nb2luZyB0byBmaXggdGhlc2UgaXNzdWVzIGluIHVzZXJzcGFjZSwg
d2UgbmVlZCB0bwo+ID4gPiByZXBvcnQgLT5wb3NzaWJsZV9jcnRjcyBpbmNvcnJlY3RseSBmb3Ig
bm93IGluIG9yZGVyIHRvIGF2b2lkCj4gPiA+IGludHJvZHVjaW5nIGEgcmVncmVzc2lvbiBpbiBp
biB1c2Vyc3BhY2UuIE9uY2UgdGhlc2UgaXNzdWVzIGdldCBmaXhlZCwKPiA+ID4gdGhpcyBjb21t
aXQgc2hvdWxkIGJlIHJldmVydGVkLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDExICsrKysrKysrKysrCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiA+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4g
PiA+IGluZGV4IGI0MDRmMWFlNmRmNy4uZmU4YWM4MDFkN2E1IDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiA+
ID4gQEAgLTQ4MDcsNiArNDgwNywxNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9jcnRjX2luaXQo
c3RydWN0Cj4gPiA+IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAo+ID4gPiAgCWlmICghYWNy
dGMtPm1zdF9lbmNvZGVyKQo+ID4gPiAgCQlnb3RvIGZhaWw7Cj4gPiA+ICAKPiA+ID4gKwkvKgo+
ID4gPiArCSAqIEZJWE1FOiBUaGlzIGlzIGEgaGFjayB0byB3b3JrYXJvdW5kIHRoZSBmb2xsb3dp
bmcgaXNzdWVzOgo+ID4gPiArCSAqCj4gPiA+ICsJICogaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL211dHRlci9pc3N1ZXMvNzU5Cj4gPiA+ICsJICogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1ZXN0cy8yNzcKPiA+ID4gKwkgKgo+ID4g
PiArCSAqIE9uZSB0aGVzZSBpc3N1ZXMgYXJlIGNsb3NlZCwgdGhpcyBzaG91bGQgYmUgcmVtb3Zl
ZAo+ID4gCj4gPiBFdmVuIHdoZW4gdGhlc2UgaXNzdWVzIGFyZSBjbG9zZWQsIHdlJ2xsIHN0aWxs
IGJlIGludHJvZHVjaW5nIGEgcmVncmVzc2lvbgo+ID4gaWYgd2UKPiA+IHJldmVydCB0aGlzIGNo
YW5nZS4gVGltZSBmb3IgYWN0dWFsbHlfcG9zc2libGVfY3J0Y3M/IDopCj4gPiAKPiA+IFlvdSBh
bHNvIG1pZ2h0IHdhbnQgdG8gYnJpZWZseSBleHBsYWluIHRoZSB1L3MgYnVnIGluIGNhc2UgdGhl
IGxpbmtzIGdvCj4gPiBzb3VyLgo+ID4gCj4gPiA+ICsJICovCj4gPiA+ICsJYWNydGMtPm1zdF9l
bmNvZGVyLT5iYXNlLnBvc3NpYmxlX2NydGNzID0KPiA+ID4gKwkJYW1kZ3B1X2RtX2dldF9lbmNv
ZGVyX2NydGNfbWFzayhkbS0+YWRldik7Cj4gPiAKPiA+IFdoeSBkb24ndCB3ZSBwdXQgdGhpcyBo
YWNrIGluIGFtZGdwdV9kbV9kcF9jcmVhdGVfZmFrZV9tc3RfZW5jb2RlcigpPwo+IAo+IElmIHdl
IGRvbid0IGhhdmUgdGhlIHNhbWUgaGFjayBmb3IgaTkxNSBtc3QgSSB0aGluayB3ZSBzaG91bGRu
J3QgbWVyZ2UKPiB0aGlzIC4uLiBicm9rZW4gdXNlcnNwYWNlIGlzIGJyb2tlbi4KPiAtRGFuaWVs
Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
