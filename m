Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950242E573
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 21:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53E6E0C8;
	Wed, 29 May 2019 19:36:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0516E0B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 19:36:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id n17so5467853edb.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 12:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ppBQ8BBcsrs19CgDW0jBP7VifaHbICNJbOpiAtMdZ7w=;
 b=QsncU/Uj91NOluUqNv7tN5RS7N4DSmuUPheYzXkXi8SiO4JKmvkRFzB1DVt6Icar/U
 N4WP1LhnB9h9hiaVe2mkmJXkx9x14G1UJZwebhTzMSg9ptMtvTnrZJBGdvFKWO0JdGM9
 BK6eggcqB/A7eVwcuaUZ9Ql1YQWZ2uzxQ7IjYVpZ0r4HUHCc4BVVU+qvbLDpEypqwEYC
 pz+GWKWlNbuLB6VlUFs0ixGx6xoaVYy7vyKFgtuP4ykCV6y3fMteXicu/7bSaHM/+kU5
 /jfOXiC9+nPXSEp5uRrMYohxA/dUSjPrGWx3sXynJ2RGTLQOYIVRcbW+AJNOtu5du13S
 +J3Q==
X-Gm-Message-State: APjAAAXEraaXfWOXe+N/pug8UDLRXF13GclLFNL6B3qss9Nmlbb3S7Ve
 3QpB/whk3HJteGadzZi+7DceiQ==
X-Google-Smtp-Source: APXvYqy42LzV7wkvIdQ9rMMGXEouc1WQAXid5A+DmtTamhBjbJlmsKcxNeFYyjC5F9qLtJ4OaASSdw==
X-Received: by 2002:a50:be03:: with SMTP id a3mr137947461edi.5.1559158578464; 
 Wed, 29 May 2019 12:36:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s11sm97833edx.41.2019.05.29.12.36.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 12:36:17 -0700 (PDT)
Date: Wed, 29 May 2019 21:36:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Message-ID: <20190529193615.GX21222@phenom.ffwll.local>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
 <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ppBQ8BBcsrs19CgDW0jBP7VifaHbICNJbOpiAtMdZ7w=;
 b=WDwtLHMiOc10n7rwrhTBuPSDqATt8jX3q1eQuffINMFPYBxrzkE3xFVs+jFXwl20+U
 CP+NISpaEy7ruPpQ1iIBHkjcPRVZqk7Bw+qwbBuXv+p+gP6OsZ9IkYm5u7yLWO8zWPcf
 /UBnGJnyArEdy1puYjg+vFFBhvYvPpcG6lgxw=
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
Cc: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDQ6NDM6NDVQTSArMDAwMCwgR3JvZHpvdnNreSwgQW5k
cmV5IHdyb3RlOgo+IEkgZG9uJ3QsIHNvcnJ5LgoKU2hvdWxkIHdlIGZpeCB0aGF0PyBTZWVtcyBs
aWtlIHlvdSBkbyBwbGVudHkgb2Ygc2NoZWR1bGVyIHN0dWZmLCBzbyB3b3VsZAptYWtlIHNlbnNl
IEkgZ3Vlc3MgLi4uCi1EYW5pZWwKCj4gCj4gQW5kcmV5Cj4gCj4gT24gNS8yOS8xOSAxMjo0MiBQ
TSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6Mjkg
QU0gQW5kcmV5IEdyb2R6b3Zza3kKPiA+IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPiB3cm90
ZToKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Cj4gPgo+ID4gSSdsbCBwdXNoIGl0IHRvIGRybS1taXNjIGluIGEgbWludXRl
IHVubGVzcyB5b3UgaGF2ZSBjb21taXQgcmlnaHRzLgo+ID4KPiA+IEFsZXgKPiA+Cj4gPj4gLS0t
Cj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDIgKysKPiA+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gPj4gaW5kZXggNDllN2QwNy4uYzEwNThlZSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gPj4gQEAgLTM1
Myw2ICszNTMsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSk7Cj4g
Pj4gICAgKiBkcm1fc2NoZWRfc3RvcCAtIHN0b3AgdGhlIHNjaGVkdWxlcgo+ID4+ICAgICoKPiA+
PiAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3RhbmNlCj4gPj4gKyAqIEBiYWQ6IGpvYiB3aGlj
aCBjYXVzZWQgdGhlIHRpbWUgb3V0Cj4gPj4gICAgKgo+ID4+ICAgICogU3RvcCB0aGUgc2NoZWR1
bGVyIGFuZCBhbHNvIHJlbW92ZXMgYW5kIGZyZWVzIGFsbCBjb21wbGV0ZWQgam9icy4KPiA+PiAg
ICAqIE5vdGU6IGJhZCBqb2Igd2lsbCBub3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBs
YXRlciBhbmQgc28gaXQncwo+ID4+IEBAIC00MjIsNiArNDIzLDcgQEAgRVhQT1JUX1NZTUJPTChk
cm1fc2NoZWRfc3RvcCk7Cj4gPj4gICAgKiBkcm1fc2NoZWRfam9iX3JlY292ZXJ5IC0gcmVjb3Zl
ciBqb2JzIGFmdGVyIGEgcmVzZXQKPiA+PiAgICAqCj4gPj4gICAgKiBAc2NoZWQ6IHNjaGVkdWxl
ciBpbnN0YW5jZQo+ID4+ICsgKiBAZnVsbF9yZWNvdmVyeTogcHJvY2VlZCB3aXRoIGNvbXBsZXRl
IHNjaGVkIHJlc3RhcnQKPiA+PiAgICAqCj4gPj4gICAgKi8KPiA+PiAgIHZvaWQgZHJtX3NjaGVk
X3N0YXJ0KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVy
eSkKPiA+PiAtLQo+ID4+IDIuNy40Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
